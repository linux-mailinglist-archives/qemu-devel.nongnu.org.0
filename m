Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2373B1A4B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:37:13 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw280-00026D-IK
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lw25M-0008Cs-Mu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from mail07.asahi-net.or.jp ([202.224.55.47]:40176)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lw25K-0000rz-I6
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail07.asahi-net.or.jp (Postfix) with ESMTPA id E796EC1C90;
 Wed, 23 Jun 2021 21:34:22 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id 6A18E1C0698;
 Wed, 23 Jun 2021 21:34:22 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/rx: rx62n switch renesas_timer.
Date: Wed, 23 Jun 2021 21:34:15 +0900
Message-Id: <20210623123416.60038-3-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623123416.60038-1-ysato@users.sourceforge.jp>
References: <20210623123416.60038-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.47;
 envelope-from=ysato@users.sourceforge.jp; helo=mail07.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/rx/rx62n.h | 4 ++--
 hw/rx/Kconfig         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 3ed80dba0d..c35bf3998c 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -27,7 +27,7 @@
 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
 #include "hw/timer/renesas_tmr.h"
-#include "hw/timer/renesas_cmt.h"
+#include "hw/timer/renesas_timer.h"
 #include "hw/char/renesas_sci.h"
 #include "qemu/units.h"
 #include "qom/object.h"
@@ -56,7 +56,7 @@ struct RX62NState {
     RXCPU cpu;
     RXICUState icu;
     RTMRState tmr[RX62N_NR_TMR];
-    RCMTState cmt[RX62N_NR_CMT];
+    RenesasCMTState cmt[RX62N_NR_CMT];
     RSCIState sci[RX62N_NR_SCI];
 
     MemoryRegion *sysmem;
diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
index 2b297c5a6a..f9cb892633 100644
--- a/hw/rx/Kconfig
+++ b/hw/rx/Kconfig
@@ -2,7 +2,7 @@ config RX62N_MCU
     bool
     select RX_ICU
     select RENESAS_TMR
-    select RENESAS_CMT
+    select RENESAS_TIMER
     select RENESAS_SCI
 
 config RX_GDBSIM
-- 
2.20.1


