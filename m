Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2325CCEB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 23:57:33 +0200 (CEST)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDxEa-0007Zj-6E
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 17:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kDxBI-00041c-0G
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 17:54:08 -0400
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:15294)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kDxBF-0005pN-Sb
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 17:54:07 -0400
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 083Lr4X5032152;
 Thu, 3 Sep 2020 23:53:04 +0200 (CEST)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 083Lr4oc026578; Thu, 3 Sep 2020 23:53:04 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 083Lr3ox026577;
 Thu, 3 Sep 2020 23:53:03 +0200
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 3/7] net/can: Add can_dlc2len and can_len2dlc for CAN FD.
Date: Thu,  3 Sep 2020 23:48:19 +0200
Message-Id: <6a97808de22470e4ea18224fcb6f0ca34f310a5a.1599168753.git.pisa@cmp.felk.cvut.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1599168753.git.pisa@cmp.felk.cvut.cz>
References: <cover.1599168753.git.pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 083Lr4X5032152
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.098, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1599774785.44982@yik3D8LALACQgp87AGA3wQ
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 17:39:24
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Marek Vasut <marex@denx.de>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jiri Novak <jnovak@fel.cvut.cz>, Stefan Hajnoczi <stefanha@gmail.com>,
 Deniz Eren <deniz.eren@icloud.com>, Markus Armbruster <armbru@redhat.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Konrad Frederic <frederic.konrad@adacore.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jan Charvat <charvj10@fel.cvut.cz>,
 Oliver Hartkopp <socketcan@hartkopp.net>, Ondrej Ille <ondrej.ille@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Charvat <charvj10@fel.cvut.cz>

Signed-off-by: Jan Charvat <charvj10@fel.cvut.cz>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Reviewed-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 include/net/can_emu.h |  4 ++++
 net/can/can_core.c    | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/net/can_emu.h b/include/net/can_emu.h
index 1547091ff4..8e59ac95ae 100644
--- a/include/net/can_emu.h
+++ b/include/net/can_emu.h
@@ -123,4 +123,8 @@ int can_bus_client_set_filters(CanBusClientState *,
                                const struct qemu_can_filter *filters,
                                size_t filters_cnt);
 
+uint8_t can_dlc2len(uint8_t can_dlc);
+
+uint8_t can_len2dlc(uint8_t len);
+
 #endif
diff --git a/net/can/can_core.c b/net/can/can_core.c
index 90f4d8576a..0115d78794 100644
--- a/net/can/can_core.c
+++ b/net/can/can_core.c
@@ -33,6 +33,42 @@
 #include "net/can_emu.h"
 #include "qom/object_interfaces.h"
 
+/* CAN DLC to real data length conversion helpers */
+
+static const uint8_t dlc2len[] = {
+    0, 1, 2, 3, 4, 5, 6, 7,
+    8, 12, 16, 20, 24, 32, 48, 64
+};
+
+/* get data length from can_dlc with sanitized can_dlc */
+uint8_t can_dlc2len(uint8_t can_dlc)
+{
+    return dlc2len[can_dlc & 0x0F];
+}
+
+static const uint8_t len2dlc[] = {
+    0, 1, 2, 3, 4, 5, 6, 7, 8,                              /* 0 - 8 */
+    9, 9, 9, 9,                                             /* 9 - 12 */
+    10, 10, 10, 10,                                         /* 13 - 16 */
+    11, 11, 11, 11,                                         /* 17 - 20 */
+    12, 12, 12, 12,                                         /* 21 - 24 */
+    13, 13, 13, 13, 13, 13, 13, 13,                         /* 25 - 32 */
+    14, 14, 14, 14, 14, 14, 14, 14,                         /* 33 - 40 */
+    14, 14, 14, 14, 14, 14, 14, 14,                         /* 41 - 48 */
+    15, 15, 15, 15, 15, 15, 15, 15,                         /* 49 - 56 */
+    15, 15, 15, 15, 15, 15, 15, 15                          /* 57 - 64 */
+};
+
+/* map the sanitized data length to an appropriate data length code */
+uint8_t can_len2dlc(uint8_t len)
+{
+    if (unlikely(len > 64)) {
+        return 0xF;
+    }
+
+    return len2dlc[len];
+}
+
 struct CanBusState {
     Object object;
 
-- 
2.20.1


