Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D886203C1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxR-00022E-G9; Mon, 07 Nov 2022 17:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxG-0001q9-Qe
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxD-0003zI-Hw
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYfzEellLB7Ub3sC9NitrDHoiYLGqGmIPtZ/cckbwMc=;
 b=Dt/ACVvn5hefXUdUq2q71+szEeM46K/jAxX6XelNUkXArHa9ZvMydeuHjxyzgWEqoGnVMH
 Co/A+f+7ytZSvK5GzeW5zr1Cp5QDiLRYPqftiOtn0uZGsrrDEaZe7cWWkFd6M2UTLp17BE
 T5UwmFJ6Fo59FXejgRFIO201utOKJ/s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-e1983XGSN5S4JcjBZ8ohuQ-1; Mon, 07 Nov 2022 17:50:52 -0500
X-MC-Unique: e1983XGSN5S4JcjBZ8ohuQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 y8-20020ac87088000000b003a528a5b844so9046930qto.18
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYfzEellLB7Ub3sC9NitrDHoiYLGqGmIPtZ/cckbwMc=;
 b=IDYYg343NmYTZ7VSmMXu21t6hVjmpmviozXM8D69vsZHnSq5jLZGh11aqoNfPxmfLT
 0iTLA6kblEXPx3m62sHW0iXndcT8J6Ro3emX2vn+7gufmS2moWL4eV+eC/Zw3XBNxJ8S
 CC/OXgg/9XuZz7s/FKTY2mPGa4Y2YQP0BAlVjvG6DjBC2EmSvKRPrUo/i+9PcqTKVsLu
 RhZeL4Qnf1itY0DnXx9sMxegbsZ7VwI9BCtJdIhLjfIskuPVY5kgzjJB3VwuqFdIOAuy
 Xbei/09GhTEMkKVOwkB4EzBnRi052LbvmoAV6weao8QJBLuTtBUkT43kkg7/Bm7ozf1O
 TPAA==
X-Gm-Message-State: ANoB5pk8qHkGtV+IG0SXF6GH5tGmUKRVsTMIHWnFXFGZdtpqN21cnswf
 F1W9y5aHzUFTb+B4VneHMLoelvsgLpcA/MMCR3XaTEq58XARSCLVywo0kEv/cHQN4hXHU/26nip
 uCXqwj5Q9zlvZ8pXYuEVKV8x5F62MRsfvQGGgXJiOomDwcNhoqF7jmWlkI81j
X-Received: by 2002:ac8:5fd1:0:b0:3a5:8399:bc0a with SMTP id
 k17-20020ac85fd1000000b003a58399bc0amr7534042qta.281.1667861451767; 
 Mon, 07 Nov 2022 14:50:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7X8m6XzGokyDwJY7ONito/19o1FUCfLEO7lqi2IBXXdZAHqJfrZpQBuVacQS26qdruziz5Hw==
X-Received: by 2002:ac8:5fd1:0:b0:3a5:8399:bc0a with SMTP id
 k17-20020ac85fd1000000b003a58399bc0amr7534029qta.281.1667861451473; 
 Mon, 07 Nov 2022 14:50:51 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05620a289300b006b949afa980sm7871734qkp.56.2022.11.07.14.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:51 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 40/83] vhost: vhost-kernel: enable vq reset feature
Message-ID: <20221107224600.934080-41-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Add virtqueue reset feature for vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-15-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d2926e2ed6..53b2fac4f6 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -47,6 +47,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
MST


