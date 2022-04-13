Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AB4FEBF4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 02:37:57 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neR1A-0000MM-0t
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 20:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1neQzy-00085x-F0
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 20:36:42 -0400
Received: from mxhk.zte.com.cn ([63.216.63.35]:56226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1neQzw-0003WW-0K
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 20:36:42 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4KdNv507lqz5B13Z
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 08:36:33 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
 by mse-fl1.zte.com.cn with SMTP id 23D0aPkX036833
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 08:36:25 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-cloudhost8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Wed, 13 Apr 2022 08:36:25 +0800
X-Zmail-TransId: 3e8162561b08009-013a1
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] net/vhost-user: Save ack_features to net_clients during
 vhost_user_start
Date: Wed, 13 Apr 2022 16:17:56 +0800
Message-Id: <20220413081756.52983-1-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 2.33.0.rc0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 23D0aPkX036833
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 62561B11.000 by FangMail milter!
X-FangMail-Envelope: 1649810193/4KdNv507lqz5B13Z/62561B11.000/10.30.14.238/[10.30.14.238]/mse-fl1.zte.com.cn/<wang.yi59@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 62561B11.000/4KdNv507lqz5B13Z
Received-SPF: pass client-ip=63.216.63.35; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: wang.yi59@zte.com.cn, wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn,
 Liu Xiangyu <liu.xiangyu2@zte.com.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Xiangyu <liu.xiangyu2@zte.com.cn>

During vhost_user_start, if openvswitch.service restart, cause the final features
not expected. Because qemu not save the ack_features promptly.

Signed-off-by: Liu Xiangyu <liu.xiangyu2@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
---
 net/vhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index b1a0247..ce9dcb6 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -92,6 +92,10 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
             goto err;
         }
 
+        if (s->vhost_net) {
+            s->acked_features = vhost_net_get_acked_features(net);
+        }
+
         if (i == 0) {
             max_queues = vhost_net_get_max_queues(net);
             if (queues > max_queues) {
-- 
1.8.3.1

