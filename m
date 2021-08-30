Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D793FB71E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:42:42 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhYf-0005XP-Hd
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangyuwei.9149@bytedance.com>)
 id 1mKg5X-0001bu-FF
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:08:31 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangyuwei.9149@bytedance.com>)
 id 1mKg5T-0006DE-6r
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 08:08:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id c17so13266663pgc.0
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 05:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ct5RJc01HaK8EgOL3LHOcTfGuS/g9iYfsuhyr6npBYs=;
 b=Wtkyh9Rw812I2hlaxBYvgIh9K14E59T+YJ2z/MteGE8v8hbmuS30gQRgnx85+n9Ukk
 /BiyHHh/weHiTnrPY4CM7gfZ0oV9raJ1wslmCxiQx88I5D0svuFBTykB+HqM13CIWMeh
 t20NyGwKLi0hM7V5yRViKF30jQFqPnkLqGnh0AKbDcfr3YIeNuS+LIi4tuJzO7Cw2hNu
 vT6oxaluxsTCH825YcpXPMjt3S0M0FWqCLiZtSOrkMAA41ALx/JtKUVDM5Q7hw/k0uAb
 oi3WBMtftfaNCpasr0dhvjd1JRAzYbPooEm4ZUy6u+B3hUGddjVt2mGeQ3tcksHN7sLd
 Y8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ct5RJc01HaK8EgOL3LHOcTfGuS/g9iYfsuhyr6npBYs=;
 b=PomKp8kKQEgwGPvLltQJ8R8MYWNYigeIfdn+T6iX1xv3bhyvDE4Ye/plKfb5A7tTb4
 1QkZOnGEimgOnXqu3ak3PoBmin8p90sb/WN/aUip/r2dnT5cDw47qRW3GFsZz2VLjYmu
 qU570tBShBmvddzIHcPB7M+fphWgI6AtnLQa9WaZk7QCSBthYV5DS8rDImT9MaxamDtv
 Kz0LIIJvASndN/1I4Yer8ZyoTpDCPf7sfeIZmxpgIMtSJG98OPSRp/NqCfggnjFsQjhN
 EnCjUhfjwvZfw8axEWclDCf3Vb9OPSPKGnRa5pV8OUwHHk/0aIZYIm+lSbu3Y9f9NdDf
 g99g==
X-Gm-Message-State: AOAM532yFFS3JXZmyirL6pvQC+l/IYI8UowcDHFutWb5dx0niu/p0+3Y
 juWZAmuGuZOSC03IGgsktv/JnndX4U9ZXA==
X-Google-Smtp-Source: ABdhPJxYHyQqF0EDkMVDrTO3WG6Pc+y/GzXNlRnETwuG6jYvFPy4HNT8Yvr41sEtsXspByB/wGnSAA==
X-Received: by 2002:a63:de01:: with SMTP id f1mr20959019pgg.377.1630325303559; 
 Mon, 30 Aug 2021 05:08:23 -0700 (PDT)
Received: from C02FR03AMD6V.bytedance.net ([139.177.225.229])
 by smtp.gmail.com with ESMTPSA id x14sm14388649pfa.127.2021.08.30.05.08.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Aug 2021 05:08:22 -0700 (PDT)
From: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio: fix crash on kill then start vhost backend
Date: Mon, 30 Aug 2021 20:08:18 +0800
Message-Id: <20210830120818.40489-1-zhangyuwei.9149@bytedance.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=zhangyuwei.9149@bytedance.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:40:47 -0400
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
Cc: zhangyuwei.9149@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add flatview update in vhost_user_cleanup() to avoid access
unmapped memory which may cause a qemu crash.

Signed-off-by: Yuwei Zhang <zhangyuwei.9149@bytedance.com>
---
 hw/virtio/vhost-user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2407836fac..b6e76985b7 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2423,6 +2423,7 @@ void vhost_user_cleanup(VhostUserState *user)
         return;
     }
 
+    memory_region_transaction_begin();
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         if (user->notifier[i].addr) {
             object_unparent(OBJECT(&user->notifier[i].mr));
@@ -2430,6 +2431,7 @@ void vhost_user_cleanup(VhostUserState *user)
             user->notifier[i].addr = NULL;
         }
     }
+    memory_region_transaction_commit();
     user->chr = NULL;
 }
 
-- 
2.11.0


