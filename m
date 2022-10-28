Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CA611946
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 19:27:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooT7O-0000gC-GB; Fri, 28 Oct 2022 13:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ooT7I-0000cp-Ev
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:26:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ooT7F-0002qj-WD
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:26:00 -0400
HMM_SOURCE_IP: 172.18.0.188:46144.108533217
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.35 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id A6DC12800C3;
 Sat, 29 Oct 2022 01:25:51 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.42.35])
 by app0023 with ESMTP id 6bc0db2230444b21a819851b93e1cbe4 for
 qemu-devel@nongnu.org; Sat, 29 Oct 2022 01:25:53 CST
X-Transaction-ID: 6bc0db2230444b21a819851b93e1cbe4
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.42.35
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>, 
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH v2 1/2] vhost-user: Refactor vhost acked features saving
Date: Sat, 29 Oct 2022 01:25:44 +0800
Message-Id: <8f537f6a484cfdac236fd6307f796660ae562226.1666977755.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1666977755.git.huangy81@chinatelecom.cn>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1666977755.git.huangy81@chinatelecom.cn>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Abstract vhost acked features saving into
vhost_user_save_acked_features, export it as util function.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 include/net/vhost-user.h |  2 ++
 net/vhost-user.c         | 35 +++++++++++++++++++----------------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
index 5bcd8a6..00d4661 100644
--- a/include/net/vhost-user.h
+++ b/include/net/vhost-user.h
@@ -14,5 +14,7 @@
 struct vhost_net;
 struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
 uint64_t vhost_user_get_acked_features(NetClientState *nc);
+void vhost_user_save_acked_features(NetClientState *nc,
+                                    bool cleanup);
 
 #endif /* VHOST_USER_H */
diff --git a/net/vhost-user.c b/net/vhost-user.c
index b1a0247..c512cc9 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -45,24 +45,31 @@ uint64_t vhost_user_get_acked_features(NetClientState *nc)
     return s->acked_features;
 }
 
-static void vhost_user_stop(int queues, NetClientState *ncs[])
+void vhost_user_save_acked_features(NetClientState *nc, bool cleanup)
 {
     NetVhostUserState *s;
+
+    s = DO_UPCAST(NetVhostUserState, nc, nc);
+    if (s->vhost_net) {
+        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
+        if (features) {
+            s->acked_features = features;
+        }
+
+        if (cleanup) {
+            vhost_net_cleanup(s->vhost_net);
+        }
+    }
+}
+
+static void vhost_user_stop(int queues, NetClientState *ncs[])
+{
     int i;
 
     for (i = 0; i < queues; i++) {
         assert(ncs[i]->info->type == NET_CLIENT_DRIVER_VHOST_USER);
 
-        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
-
-        if (s->vhost_net) {
-            /* save acked features */
-            uint64_t features = vhost_net_get_acked_features(s->vhost_net);
-            if (features) {
-                s->acked_features = features;
-            }
-            vhost_net_cleanup(s->vhost_net);
-        }
+        vhost_user_save_acked_features(ncs[i], true);
     }
 }
 
@@ -251,11 +258,7 @@ static void chr_closed_bh(void *opaque)
     s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
 
     for (i = queues -1; i >= 0; i--) {
-        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
-
-        if (s->vhost_net) {
-            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
-        }
+        vhost_user_save_acked_features(ncs[i], false);
     }
 
     qmp_set_link(name, false, &err);
-- 
1.8.3.1


