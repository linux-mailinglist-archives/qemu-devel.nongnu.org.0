Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC3650ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:37:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ES8-0002AF-7K; Mon, 19 Dec 2022 06:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p7ES5-00029J-Vx
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:37:02 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p7ES3-00046R-KS
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:37:01 -0500
HMM_SOURCE_IP: 172.18.0.188:50724.913608764
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.159 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 90B4E280090;
 Mon, 19 Dec 2022 19:36:48 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([171.223.98.159])
 by app0023 with ESMTP id 85bf7cffbb2943379d530262211b3d2e for
 qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:36:50 CST
X-Transaction-ID: 85bf7cffbb2943379d530262211b3d2e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 171.223.98.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: armbru@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 jasowang@redhat.com, lvivier@redhat.com, mst@redhat.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>, 
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH v5 1/3] vhost-user: Refactor vhost acked features saving
Date: Mon, 19 Dec 2022 06:36:40 -0500
Message-Id: <014fb6ea4baed1cb209e0ba2fb723a357bc4f259.1671449732.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1671448888.git.huangy81@chinatelecom.cn>
References: <cover.1671448888.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1671449732.git.huangy81@chinatelecom.cn>
References: <cover.1671449732.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
---
 include/net/vhost-user.h |  1 +
 net/vhost-user.c         | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
index 5bcd8a6..35bf619 100644
--- a/include/net/vhost-user.h
+++ b/include/net/vhost-user.h
@@ -14,5 +14,6 @@
 struct vhost_net;
 struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
 uint64_t vhost_user_get_acked_features(NetClientState *nc);
+void vhost_user_save_acked_features(NetClientState *nc);
 
 #endif /* VHOST_USER_H */
diff --git a/net/vhost-user.c b/net/vhost-user.c
index b1a0247..40a2fe8 100644
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
1.8.3.1


