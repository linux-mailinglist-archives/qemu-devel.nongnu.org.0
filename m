Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A665E77A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDML5-0001gG-UD; Thu, 05 Jan 2023 04:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML2-0001bv-Kz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML0-0006qE-MA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhzPSfS8UKaxweeDnvuPzNZ/m8zZG2cgk4Ut2Omo5ps=;
 b=fKh2/lvqfKQmOg6jItmq3Ba8dGZK5yJhW7np9GWnPeVlSGrMWnQa0qLOMWhdpBTeai6aaq
 mm/k+K+IkkkktBi9a8jQYxLT8o1xKuFdfhhbcEb6JdfqxwPRdg2t7GFNFFwKW5vh8WLy8W
 /gO0EsxGmxtwnPhhGzmSglUl/2MGEcg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-0JhCCEuCPB-7C2CWx3OM6A-1; Thu, 05 Jan 2023 04:15:01 -0500
X-MC-Unique: 0JhCCEuCPB-7C2CWx3OM6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso725570wmb.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhzPSfS8UKaxweeDnvuPzNZ/m8zZG2cgk4Ut2Omo5ps=;
 b=zY6Mc3eFJj8Es1nSVv4w1KQ8gtzvjxN1OKFaEwASUIav+E2FZGpjkh2YClfiVx12C4
 DReHzkhR7btwc6CG2WusLY3lJ9yG+LAUyipqPSghF7pzugrsSRV9E7XyiKPSgcREtI3Q
 CQR7iHGf7S3BJK74jJ79binAfHhRtodyfS12OHUcxLQRshGWhSnbtlC+2Rv55rIXzM3J
 kYC0K+Jo5MDoWcoLDP6J1nBBKZ/Mxda13HO2VKwHLEwgIET3iEVCdY4Sg3eqyPLxSge4
 zlhTPxiOdn6ycxN+rssY2O+zGlcy5ryYkWNQhVCuQiPb34ZXaQRw8HDwBOllFoP8MG9P
 JcdQ==
X-Gm-Message-State: AFqh2krEzuaL1qi6LCeKYBc/HLO35ZUkNc3Vgz8Oi3jVhzl/lQZ7lUKs
 Bz2l8op8Vobl8OkG5AesST3AXVotILTe++ZECjmcv9N2MWeCyAW7vOyVt1EhiIqD1mRaXAbNTtu
 uVeOcdStu+A5SPyeh6dSaV4gEXmQbuWf9A0e9aGwJRsoOuxiSTu+IPKCwfNor
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id
 12-20020a05600c22cc00b003d1bd81b1b1mr34719155wmg.18.1672910098863; 
 Thu, 05 Jan 2023 01:14:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuBcQUInVC2kqqvsZQd03U5O48+3rVNf4cij4IFCtWz+o6eGvKHniwmiN7PtSop00Z5HJ6pYg==
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id
 12-20020a05600c22cc00b003d1bd81b1b1mr34719142wmg.18.1672910098597; 
 Thu, 05 Jan 2023 01:14:58 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 x26-20020a1c7c1a000000b003d9d23ab449sm1638984wmc.29.2023.01.05.01.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:58 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hyman =?utf-8?B?SHVhbmco6buE5YuHKQ==?= <huangy81@chinatelecom.cn>,
 Guoyi Tu <tugy@chinatelecom.cn>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 12/51] vhost-user: Refactor vhost acked features saving
Message-ID: <20230105091310.263867-13-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Abstract vhost acked features saving into
vhost_user_save_acked_features, export it as util function.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Message-Id: <50dc9b09b0635e3052551efcc1046c2a85332fcb.1671627406.git.huangy81@chinatelecom.cn>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost-user.h |  1 +
 net/vhost-user.c         | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
index 5bcd8a6285..35bf619709 100644
--- a/include/net/vhost-user.h
+++ b/include/net/vhost-user.h
@@ -14,5 +14,6 @@
 struct vhost_net;
 struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
 uint64_t vhost_user_get_acked_features(NetClientState *nc);
+void vhost_user_save_acked_features(NetClientState *nc);
 
 #endif /* VHOST_USER_H */
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 3a6b90da86..f5cb095d5c 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -45,10 +45,23 @@ uint64_t vhost_user_get_acked_features(NetClientState *nc)
     return s->acked_features;
 }
 
-static void vhost_user_stop(int queues, NetClientState *ncs[])
+void vhost_user_save_acked_features(NetClientState *nc)
 {
     NetVhostUserState *s;
+
+    s = DO_UPCAST(NetVhostUserState, nc, nc);
+    if (s->vhost_net) {
+        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
+        if (features) {
+            s->acked_features = features;
+        }
+    }
+}
+
+static void vhost_user_stop(int queues, NetClientState *ncs[])
+{
     int i;
+    NetVhostUserState *s;
 
     for (i = 0; i < queues; i++) {
         assert(ncs[i]->info->type == NET_CLIENT_DRIVER_VHOST_USER);
@@ -56,11 +69,7 @@ static void vhost_user_stop(int queues, NetClientState *ncs[])
         s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
 
         if (s->vhost_net) {
-            /* save acked features */
-            uint64_t features = vhost_net_get_acked_features(s->vhost_net);
-            if (features) {
-                s->acked_features = features;
-            }
+            vhost_user_save_acked_features(ncs[i]);
             vhost_net_cleanup(s->vhost_net);
         }
     }
-- 
MST


