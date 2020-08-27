Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CD254537
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 14:45:46 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBHHl-0002nr-9F
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 08:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1kBHBT-000825-GT
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:39:15 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:47889)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1kBHBO-0005vN-BQ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:39:15 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 5E1B41086BE;
 Thu, 27 Aug 2020 21:39:07 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 36E431C0696;
 Thu, 27 Aug 2020 21:39:07 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] hw/rx: Convert to renesas_timer
Date: Thu, 27 Aug 2020 21:38:49 +0900
Message-Id: <20200827123859.81793-11-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827123859.81793-1-ysato@users.sourceforge.jp>
References: <20200827123859.81793-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.13;
 envelope-from=ysato@users.sourceforge.jp; helo=mail01.asahi-net.or.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 08:39:06
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
index 75945bae50..1182ca24de 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -27,7 +27,7 @@
 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
 #include "hw/timer/renesas_tmr8.h"
-#include "hw/timer/renesas_cmt.h"
+#include "hw/timer/renesas_timer.h"
 #include "hw/char/renesas_sci.h"
 #include "hw/rx/rx62n-cpg.h"
 #include "qemu/units.h"
@@ -69,7 +69,7 @@ typedef struct RX62NState {
     RXCPU cpu;
     RXICUState icu;
     RenesasTMR8State tmr[RX62N_NR_TMR];
-    RCMTState cmt[RX62N_NR_CMT];
+    RenesasCMTState cmt[RX62N_NR_CMT];
     RSCIState sci[RX62N_NR_SCI];
     RX62NCPGState cpg;
 
diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
index 0406f27bee..d1812870ea 100644
--- a/hw/rx/Kconfig
+++ b/hw/rx/Kconfig
@@ -2,7 +2,7 @@ config RX62N_MCU
     bool
     select RX_ICU
     select RENESAS_TMR8
-    select RENESAS_CMT
+    select RENESAS_TIMER
     select RENESAS_SCI
 
 config RX_GDBSIM
-- 
2.20.1


