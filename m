Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84DDEEF9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 16:12:33 +0200 (CEST)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMYQB-0000MW-Sw
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 10:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMYOU-0007Zr-5d
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMYOS-0003zp-Og
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:10:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMYOS-0003zF-ER
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:10:44 -0400
Received: by mail-wr1-x442.google.com with SMTP id q13so9201743wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z7+hfJklYjk2jKatwzbiHbly9fCbMxtArXfoBZjya8Q=;
 b=SggkvzFBjELMzsGUEwMaLO8jftWtQqDcdPoOAPDAjAUEuTeAZXQv/Nw5ZtF5etmo2d
 +YQp9zI0/VbXPI2foSNqxlarsaYlGrO1rhsKkwLkTqpxpTxprvYnRqG6C9PKp71WO0C0
 BqRNLEoswji3x9RrVuyF2YYyk/7vd4txfqd7O1F4vD2redxgL/LFv+T2ZnTzHGtUZG6X
 /WP/D/mDhDmuT1citwAp2t8gpzHVCEsjDenT0REGq6O71E9/8/PfwhxS7qQx2WaqUn9p
 JfZyulEER4hdqn+l7rWI6cHL5cyTThW6RIuzNifZCJS8SC89Xx67KskuQ8JLJ2fKXIL3
 dHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z7+hfJklYjk2jKatwzbiHbly9fCbMxtArXfoBZjya8Q=;
 b=GqFPEtg25/IdIdl1j9E76qKUlqrYBkt2noqmtT6I8rdoee2pc7aiVH4xUZLemuRgs0
 FQRyp6D86CwfCZ+94ijEY5cx2rQPKZFUe5AmE3G21iThGd3DAk8a50QIzx5RvZhVT1KW
 wbLxdjt3lhjDOZeFAR+QeMIX41m9BQtEba8KNWV5dcO5A9Z9QLn+QS8SRuNZBVJengsi
 hs1Kyr5XG3OMhREWaPXbM5CxRdj7p2BxX40AC0J7sAx7hqMovMelChU4RHaPEcMnda69
 0sb1NW8ZFk+y03akVavRS7zSGL7m3RH2/zz+dAF+NgkNCbimWlFFOhv0v58/iX1d3q6I
 x3rA==
X-Gm-Message-State: APjAAAXhZDL7oGgOE46EjogHDPPeR0PBJqvJtWNulyI5ck25NBgSSthp
 KmcCBAWEDjAc3w0vStO0UIriwnCSIM4=
X-Google-Smtp-Source: APXvYqzEzYLn2+NIdYnAM4OSAxrc5/wE7frCw7V/rwG9DEShUU4QKVHGIlsyvvGjbKs8/XyomgcRZw==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr10440930wrj.216.1571667042587; 
 Mon, 21 Oct 2019 07:10:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g17sm14515155wrq.58.2019.10.21.07.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:10:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/watchdog/milkymist-sysctl.c: Switch to
 transaction-based ptimer API
Date: Mon, 21 Oct 2019 15:10:40 +0100
Message-Id: <20191021141040.11007-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the milkymist-sysctl code away from bottom-half based
ptimers to the new transaction-based ptimer API.  This just requires
adding begin/commit calls around the various places that modify the
ptimer state, and using the new ptimer_init() function to create the
timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Changes v1->v2: begin/commit s->ptimer1 in the code for
writes to R_TIMER1_CONTROL, not s->ptimer0...

I'm not resending the whole of the v1 8-patch series as
only a couple of patches had issues, they're all
independent changes, and I'm planning to take the patches
through my tree anyway.
---
 hw/timer/milkymist-sysctl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 5193c038501..7a62e212c35 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -31,7 +31,6 @@
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 
 enum {
@@ -71,8 +70,6 @@ struct MilkymistSysctlState {
 
     MemoryRegion regs_region;
 
-    QEMUBH *bh0;
-    QEMUBH *bh1;
     ptimer_state *ptimer0;
     ptimer_state *ptimer1;
 
@@ -161,14 +158,19 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
         s->regs[addr] = value;
         break;
     case R_TIMER0_COMPARE:
+        ptimer_transaction_begin(s->ptimer0);
         ptimer_set_limit(s->ptimer0, value, 0);
         s->regs[addr] = value;
+        ptimer_transaction_commit(s->ptimer0);
         break;
     case R_TIMER1_COMPARE:
+        ptimer_transaction_begin(s->ptimer1);
         ptimer_set_limit(s->ptimer1, value, 0);
         s->regs[addr] = value;
+        ptimer_transaction_commit(s->ptimer1);
         break;
     case R_TIMER0_CONTROL:
+        ptimer_transaction_begin(s->ptimer0);
         s->regs[addr] = value;
         if (s->regs[R_TIMER0_CONTROL] & CTRL_ENABLE) {
             trace_milkymist_sysctl_start_timer0();
@@ -179,8 +181,10 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
             trace_milkymist_sysctl_stop_timer0();
             ptimer_stop(s->ptimer0);
         }
+        ptimer_transaction_commit(s->ptimer0);
         break;
     case R_TIMER1_CONTROL:
+        ptimer_transaction_begin(s->ptimer1);
         s->regs[addr] = value;
         if (s->regs[R_TIMER1_CONTROL] & CTRL_ENABLE) {
             trace_milkymist_sysctl_start_timer1();
@@ -191,6 +195,7 @@ static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
             trace_milkymist_sysctl_stop_timer1();
             ptimer_stop(s->ptimer1);
         }
+        ptimer_transaction_commit(s->ptimer1);
         break;
     case R_ICAP:
         sysctl_icap_write(s, value);
@@ -263,8 +268,12 @@ static void milkymist_sysctl_reset(DeviceState *d)
         s->regs[i] = 0;
     }
 
+    ptimer_transaction_begin(s->ptimer0);
     ptimer_stop(s->ptimer0);
+    ptimer_transaction_commit(s->ptimer0);
+    ptimer_transaction_begin(s->ptimer1);
     ptimer_stop(s->ptimer1);
+    ptimer_transaction_commit(s->ptimer1);
 
     /* defaults */
     s->regs[R_ICAP] = ICAP_READY;
@@ -292,13 +301,15 @@ static void milkymist_sysctl_realize(DeviceState *dev, Error **errp)
 {
     MilkymistSysctlState *s = MILKYMIST_SYSCTL(dev);
 
-    s->bh0 = qemu_bh_new(timer0_hit, s);
-    s->bh1 = qemu_bh_new(timer1_hit, s);
-    s->ptimer0 = ptimer_init_with_bh(s->bh0, PTIMER_POLICY_DEFAULT);
-    s->ptimer1 = ptimer_init_with_bh(s->bh1, PTIMER_POLICY_DEFAULT);
+    s->ptimer0 = ptimer_init(timer0_hit, s, PTIMER_POLICY_DEFAULT);
+    s->ptimer1 = ptimer_init(timer1_hit, s, PTIMER_POLICY_DEFAULT);
 
+    ptimer_transaction_begin(s->ptimer0);
     ptimer_set_freq(s->ptimer0, s->freq_hz);
+    ptimer_transaction_commit(s->ptimer0);
+    ptimer_transaction_begin(s->ptimer1);
     ptimer_set_freq(s->ptimer1, s->freq_hz);
+    ptimer_transaction_commit(s->ptimer1);
 }
 
 static const VMStateDescription vmstate_milkymist_sysctl = {
-- 
2.20.1


