Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1554E866
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:10:00 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1t0J-0002AI-8v
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1sof-00055c-1c
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1sod-0001zX-J2
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QDERLfTcWADCC/Tw5RYIQ7BgyR90N+w75V09HD/D2Lc=;
 b=YKb5fZY01ZJ+th+d/qan3ndZ6U2b8Q3/b7f8e+JAsL6UjhhiOpiS2mecFXsGoxfSvlAc8T
 a9ilz0wYL3AP8k4IF/lstGi5/4QCRMyxHOROwT3WgIvz/+fq6loxwpjO5ONTEF4usYB8T2
 AjWP9/m2eCAiv5nGxGMeqHTSYys+DJg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-D97jUcCRPxmixeSesqtUvw-1; Thu, 16 Jun 2022 12:57:53 -0400
X-MC-Unique: D97jUcCRPxmixeSesqtUvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so1134962wms.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QDERLfTcWADCC/Tw5RYIQ7BgyR90N+w75V09HD/D2Lc=;
 b=1JXV0YVvd1mfLaRq7o0mJw6W/dHzYFE3dO2JxvQY2f2zAVglPG7YeCxhjyVy8EZ08z
 Z/flWE9VgvjR+dTbl3JtT3+dgralssh1BVIeKBobM2kqhFpsKByiDYiOQTFM9hoyaVg7
 dYeU6/YRo5z67teQeKjAIwfznx3CnIgSrWt+qcXTRuYbT10gs7LPhfD2iwypVNFmAaos
 fbMfxJmEaWO8ltbSXkkq5N58MxzEkG/oXqhURPYMZB/d4MVVMDxqBCRKNBVbUUzh3KZz
 O3qnCcLE4JUQP85Ca7ii0NufSsGKw+eSawgmRptafxyBxbIx14guQsvYsJhYzdqCnJ7i
 tnUw==
X-Gm-Message-State: AOAM5320yJQqCLm4/UCT1d8twlsXHRaTCfXBKw0zk6FP/XEkCbfYhh07
 tXoQYwQKv6Q7grEFRxlUlpBiqBNTIbks8WDcoroTJaQsNuc7nnpyxLvhlo0Y1t99V0YNG4zeAt8
 U0B1OQKhtMkVs+WVWBcz+myZliFxwLMQzirrDHJXmP4iPkoYXs7kY8+dbosMT
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr16773785wmr.206.1655398671655; 
 Thu, 16 Jun 2022 09:57:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPHYshYi0XNxs+UPqG6qppXHFOzntm2No37rcdKcdWBHwkR0Y/N0yKmVNQOEhHzYyJ0e88uQ==
X-Received: by 2002:a05:600c:3794:b0:39c:61f6:d0f1 with SMTP id
 o20-20020a05600c379400b0039c61f6d0f1mr16773769wmr.206.1655398671408; 
 Thu, 16 Jun 2022 09:57:51 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 i188-20020a1c3bc5000000b0039ee52c1345sm1191wma.4.2022.06.16.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:50 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ni Xun <richardni@tencent.com>, Zhigang Lu <tonnylu@tencent.com>
Subject: [PULL 09/10] vhost: also check queue state in the vhost_dev_set_log
 error routine
Message-ID: <20220616165703.42226-10-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ni Xun <richardni@tencent.com>

When check queue state in the vhost_dev_set_log routine, it miss the error
routine check, this patch also check queue state in error case.

Fixes: 1e5a050f5798 ("check queue state in the vhost_dev_set_log routine")
Signed-off-by: Ni Xun <richardni@tencent.com>
Reviewed-by: Zhigang Lu <tonnylu@tencent.com>
Message-Id: <OS0PR01MB57139163F3F3955960675B52EAA79@OS0PR01MB5713.jpnprd01.prod.outlook.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index dd3263df56..6c41fa13e3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -886,6 +886,10 @@ static int vhost_dev_set_log(struct vhost_dev *dev, bool enable_log)
 err_vq:
     for (; i >= 0; --i) {
         idx = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + i);
+        addr = virtio_queue_get_desc_addr(dev->vdev, idx);
+        if (!addr) {
+            continue;
+        }
         vhost_virtqueue_set_addr(dev, dev->vqs + i, idx,
                                  dev->log_enabled);
     }
-- 
MST


