Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125361DC5E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:22:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqf-0000ck-Hf; Sat, 05 Nov 2022 13:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMno-0007A9-2j
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnj-0007a7-8d
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aYfzEellLB7Ub3sC9NitrDHoiYLGqGmIPtZ/cckbwMc=;
 b=Q9rUZtwz7u9sTRX9cFqxC9LvdNeWUYZahUVnnMMZKlSncFmjjPyj1KqPGoKtH9UYeOLAyw
 uzGS6RH/aCjDlCln8LBgkrQCjvKPvSe1WbS/iEzLJ7fOeLz5Qis5e0WXC8Q5exdeo4aYQf
 29mEFHv1zSfT2aBVXA59EEuVXOqQL4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219--_aQNzdZM-KLrX22WT44ww-1; Sat, 05 Nov 2022 13:17:42 -0400
X-MC-Unique: -_aQNzdZM-KLrX22WT44ww-1
Received: by mail-wm1-f70.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so3849860wmh.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYfzEellLB7Ub3sC9NitrDHoiYLGqGmIPtZ/cckbwMc=;
 b=KHygNpga4R280h6nwJVhIhjtrlY2GhicPGcVB8VSNc5PlJTTcvABBgAq7PP15/6cM2
 SBgX9S0BbT4e6RZdlVKYv1grZCrc2mRXlpJtlGJ8BsWuNESO0/5AtTKwiDGaFjikb1f8
 KC/B1wDyZMPMAgJoWw8BfWfCNvRCKfU+A018qLqMR73yVUgTu9VMajr5ZOjt5k/zAMbl
 7VQZCMSiN20QggLEc1ufLQtzprY2dF2fNnUPpUSPBIFetlFCj4ILNAZjcRP35XV4pah7
 lwwo/luyBVFsZp3U0OVV0a5vShHZQAHCwKjXgexk3uWkMGWZHe9qdpG6nsneVXozOYrA
 xAjA==
X-Gm-Message-State: ACrzQf3zslsvgv4qIXXBB+tQLhg0K3muMzMgAaa5WduvdlgVPjrOolyY
 c4lzNpDy2gMwLOb07snKNiHybW55Qi9dP5Jh8VSul736EzdeMPYe+PcPvF+MCIJVxJ3Esg2YjQO
 gI+42alk8S6AiF/LgJKh8dIj38Ee74T/oPYEy8makqLuyVZvGYdesSFur5iuB
X-Received: by 2002:a5d:59c5:0:b0:236:cc8a:59fd with SMTP id
 v5-20020a5d59c5000000b00236cc8a59fdmr20654128wry.426.1667668661291; 
 Sat, 05 Nov 2022 10:17:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49Y3JQkYltETeyAovTSBtn5AUBgdo2/50dSda1WWrd1BtMFwUptenCR00DFk54ROlzp5FAyQ==
X-Received: by 2002:a5d:59c5:0:b0:236:cc8a:59fd with SMTP id
 v5-20020a5d59c5000000b00236cc8a59fdmr20654118wry.426.1667668660993; 
 Sat, 05 Nov 2022 10:17:40 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 j5-20020adfe505000000b0023c8026841csm2658617wrm.23.2022.11.05.10.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:40 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 45/81] vhost: vhost-kernel: enable vq reset feature
Message-ID: <20221105171116.432921-46-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


