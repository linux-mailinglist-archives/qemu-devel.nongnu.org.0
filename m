Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2C344A71
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:06:41 +0100 (CET)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lON4i-00045b-To
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjj-0004yG-W7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMji-0006yh-Bc
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJdnuz4O5jTyvKH1AcU41+VrJbgX4Tt2CgNqnbi0l3s=;
 b=hBYm1vnoDrawAbqIyXfh7cgaQInt67SV5UyQg2Sr+eDwRExLfyPlC93jQ/4xcQdquZv1eQ
 NdhVoy5Jx1/FOCH7QWcpOWtMU91ZT7sHwip/S9gsQPd8/MJR9oOZ4dbnGA7SFwefeN0eii
 f6ojfumpnfBfHAdt2KhoMjdJY9KquZk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Rim0LtjmPFiPb1tohkeeMA-1; Mon, 22 Mar 2021 11:44:55 -0400
X-MC-Unique: Rim0LtjmPFiPb1tohkeeMA-1
Received: by mail-wm1-f69.google.com with SMTP id l16so12810wmc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJdnuz4O5jTyvKH1AcU41+VrJbgX4Tt2CgNqnbi0l3s=;
 b=m1FMhPGH+H8XK6B38334ClG7L0z7FpQibAxLdQCqHEFEp13JIInc6LuxEat5P2RhT+
 5M1LWUZgY6araxCrUaPIDJr0Vdd84fkCOsWLIqAFk3mT4M+BGormljM3gWT+SkDY/h5e
 yowNmLLMmax303ctf6gRxfF53X2QcoYGUX2LVL2GBYe6HDnXKWDSPavTS8kL8dO4LcgG
 1vrYw/TKvD/yznRUNapLmNF+SnNH9Gul8nsaLoEq2V0uF8Vbgt6X9IM/N2d8S3abSgvY
 PaiWodIa446FPBeDlo2eMp5weJ0yTQdeFCs5G9lvggzgDOG70TcxfEmDIhofW0RwAigI
 whdQ==
X-Gm-Message-State: AOAM532uVArEMJxFbHFwnXa8S5uHJ0EnLaH92p8O2ra+4k2s4FOTnmcN
 0vb2xgJkFQ51mFUTQ+5yQB/RKX+ljh6hRZNnamtp99RDuCgjl9OeGOQdUepR36kMdT44L1s3RP4
 Hm1eb93ZchqTZ/i86rS0XNFhWEU6WrYPuDgsF8+B6sPMv+5QU8rUevFVESwNx
X-Received: by 2002:a1c:bad6:: with SMTP id k205mr449088wmf.16.1616427894237; 
 Mon, 22 Mar 2021 08:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSZwk8xgZLWx5/xUzksbvD6zPJCVWdElfC4xZL/27KcIQou2J0/E/XEeyNki/hUptn+YzoGw==
X-Received: by 2002:a1c:bad6:: with SMTP id k205mr449067wmf.16.1616427894091; 
 Mon, 22 Mar 2021 08:44:54 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id s16sm20034949wru.91.2021.03.22.08.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:53 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] virtio-pmem: fix virtio_pmem_resp assign problem
Message-ID: <20210322154417.524229-9-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wang Liang <wangliangzz@inspur.com>, David Hildenbrand <david@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wang Liang <wangliangzz@inspur.com>

ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
using virtio_stl_p.

The kernel side driver does not guarantee virtio_pmem_resp to be initialized
to zero in advance, So sometimes the flush operation will fail.

Signed-off-by: Wang Liang <wangliangzz@inspur.com>
Message-Id: <20210317024145.271212-1-wangliangzz@126.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index a3e0688a89..d1aeb90a31 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -47,7 +47,7 @@ static int worker_cb(void *opaque)
         err = 1;
     }
 
-    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
+    virtio_stl_p(req_data->vdev, &req_data->resp.ret, err);
 
     return 0;
 }
-- 
MST


