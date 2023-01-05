Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06265E7C6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:27:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMj-0003hc-Lh; Thu, 05 Jan 2023 04:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMi-0003gW-5c
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMg-0007eF-PV
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lntb2rpWAHBlL8xXgDvi/s6siK86I3wdWk8O24n8Mw=;
 b=Vp1CMkicz3KIjAOMrKgudhR87k/J4wGZzI55ArNeaCTdSyYB+sSDQ8lbMHx8utAiKwuo11
 5H3ZxyZHnqDCtlQUwShpKiB6bX2WP+xQ5g6I1ko+PKJBaUOT11auQVGPe9NRLyJtteQHJx
 ZRQCbq9629jZ79Ryh3tR5s+zFcJ0WZI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-nbg9Ao5JOumLXGZ0HJelFA-1; Thu, 05 Jan 2023 04:16:44 -0500
X-MC-Unique: nbg9Ao5JOumLXGZ0HJelFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so17813900wmb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lntb2rpWAHBlL8xXgDvi/s6siK86I3wdWk8O24n8Mw=;
 b=LcQCgJl+qxwqQpp1GVAA9fnthgucjCBmPvz4tQmUg6MVP9GwkmUGpXhdTyF/R8rFa4
 pD7q0hVLspSk9XYoYjKdQFfbixO55/dGZvZlH3GRE6g8ZWsmHj3fbPFYLISOOEVwsVxr
 jr01VW9ZSWGwpboqc8hs7/g25dHEEU9KErR4A8HPa6s4+94JmcUP2+/ZqKUwbSVos/Zp
 oZJu1HZHoYGdl1fgQx6s3OfOlo4bkzaQxKd3/YVWU3vAAM22wroshXw1FfmbMbJrDBYm
 EjgAleJAMsAPNCoS8HU4KHZE0anfiqv5KdW6HGblGFvWXQX82Zu/XWNnwtAi14Nszp1f
 w3+Q==
X-Gm-Message-State: AFqh2koA+5FLU8TdPXi61V3kFZRKGx16RounRags891U8TYMReD5WkWz
 Gpme0rZQDRJQOb7BezDT+VB0+BgVjaQHo+RAZ5B6/XTqUI+H5U5DOLvJhp4P3cM69jII0VaBnAl
 pFLQTu1ELCrxx597KOpen+21TFDMEOZ3DTqOsBhI6f7xzUmfDK9njqqST26AF
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id
 fl18-20020a05600c0b9200b003d9779e9788mr26759559wmb.37.1672910203290; 
 Thu, 05 Jan 2023 01:16:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXusrzLXpmdAreX46nS3rUB4p2GVtSvZOL19Vjd7CuliYw+/Vu69F/eJCpdVoDPF5Iyq1SkhaA==
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id
 fl18-20020a05600c0b9200b003d9779e9788mr26759544wmb.37.1672910203025; 
 Thu, 05 Jan 2023 01:16:43 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003d1f3e9df3csm1843956wmo.7.2023.01.05.01.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:42 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 leixiang <leixiang@kylinos.cn>, Zeng Chi <zengchi@kylinos.cn>,
 Xie Ming <xieming@kylinos.cn>
Subject: [PULL 43/51] virtio-pci: fix proxy->vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Message-ID: <20230105091310.263867-44-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: leixiang <leixiang@kylinos.cn>

proxy->vector_irqfd did not free when kvm_virtio_pci_vector_use or
msix_set_vector_notifiers failed in virtio_pci_set_guest_notifiers.

Fixes: 7d37d351

Signed-off-by: Lei Xiang <leixiang@kylinos.cn>
Tested-by: Zeng Chi <zengchi@kylinos.cn>
Suggested-by: Xie Ming <xieming@kylinos.cn>
Message-Id: <20221227081604.806415-1-leixiang@kylinos.cn>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7bc60fcf94..247325c193 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1291,6 +1291,8 @@ assign_error:
     while (--n >= 0) {
         virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
     }
+    g_free(proxy->vector_irqfd);
+    proxy->vector_irqfd = NULL;
     return r;
 }
 
-- 
MST


