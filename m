Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5E62E248
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovi7d-00012O-5T; Thu, 17 Nov 2022 11:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ovi7U-0000sP-Hr
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:52:08 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ovi7R-0006vp-Mj
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:52:08 -0500
HMM_SOURCE_IP: 172.18.0.48:51864.42162454
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.159 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id F1E0A2800BD;
 Fri, 18 Nov 2022 00:51:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.40.159])
 by app0024 with ESMTP id dfbc156fe63642ebbcff8a86a867d2f9 for
 qemu-devel@nongnu.org; Fri, 18 Nov 2022 00:52:01 CST
X-Transaction-ID: dfbc156fe63642ebbcff8a86a867d2f9
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.40.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>, 
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: [PATCH v4 2/3] vhost-user: Refactor the chr_closed_bh
Date: Fri, 18 Nov 2022 00:51:44 +0800
Message-Id: <ca5818b1e1c8f763508bad9d00c2b5fbfdcb4890.1668702822.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1668702822.git.huangy81@chinatelecom.cn>
References: <cover.1668702822.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1668702822.git.huangy81@chinatelecom.cn>
References: <cover.1668702822.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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

Use vhost_user_save_acked_features to implemente acked features
saving.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
---
 net/vhost-user.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index f5cb095..5993e4a 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -260,11 +260,7 @@ static void chr_closed_bh(void *opaque)
     s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
 
     for (i = queues -1; i >= 0; i--) {
-        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
-
-        if (s->vhost_net) {
-            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
-        }
+        vhost_user_save_acked_features(ncs[i]);
     }
 
     qmp_set_link(name, false, &err);
-- 
1.8.3.1


