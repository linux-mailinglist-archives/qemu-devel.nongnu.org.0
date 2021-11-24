Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1A45CDE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 21:21:38 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpylt-00035k-0G
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 15:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpykW-0002C7-QF
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 15:20:12 -0500
Received: from [2a00:1450:4864:20::433] (port=44734
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpykU-0005s1-9x
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 15:20:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id l16so6502985wrp.11
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iY3zkci67KDhAgVHHsM976TrmI5TaYyabwOsKa3QFw0=;
 b=MSWIXsTsU62FeZg0ctFu1/cC9L3JIFmQmN18rEJ6+JY4sCUMnYkwzCGhtd9nw4+TRY
 +ChscKmC9BiWABUiPj5p4u6hyo4loQ80Dgl+zZrKYE5jE6JjqDszad4LkouwuTId8hBk
 2+mz6mR7haXAyUzlOUmQ2+Vihe32+HzPNF1Q8iQ3FH7sYnsVwtfAjydQh63YdwY77XyP
 vjxOi6QAtkAMDWjfnlw/eZOsTiOXjf+Y8IDbOxNLVohGiw4mYyHRgxMrYUGuAFSJrkR2
 M7Pl1eUGCiUlrKzsV7aWvr7ua+ru1LzSCMmADAenLmZTuQ0+buA8ABhK5kCFzwC5csjo
 qLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iY3zkci67KDhAgVHHsM976TrmI5TaYyabwOsKa3QFw0=;
 b=4PwT1NdDVSU+B67xkePgpJCA0qHJ89rYxLY2A7PVCHiFoFZQRcqtxOKIWFedZh8tqA
 k5D5CLQOdF2XfXKuzL+z76aojIbBt55Q5YfFb4iriQI46gAeT9LW6JwF4drTEBejdErQ
 8aq349jiJBTLAQQ/7fhAou5/aeqsrZ+pf8AKkOuq/iliakeU3N9v2Gq+FZgdQokfaHfX
 C50OcrCgxgOH20xRhaQskAKMSoENuNOwwwG1IwHaL3aSTG/oos5IPuEQeiprYtFLPIOk
 2e3ugnoXSGt/vzSRU76SNQkrDIc5LfNqxovdkPUfITXAJGbksqWmK5UV8hFQjE/rME2F
 wi0g==
X-Gm-Message-State: AOAM5316XLjAygZlEJ6dh7MLtTuBNcBrKeCYCIJG8thlSXXJq8Hfl8rl
 YOlh85Q1jBR6EyNy49Pl0lZfrA==
X-Google-Smtp-Source: ABdhPJzbfoElgxemVSe5I041jyck63e+vQ7OZSiZ1GkCPI29oLet+TPFZ/vbk6ayGjedIwPy67BQ1Q==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr22262927wrq.44.1637785207894; 
 Wed, 24 Nov 2021 12:20:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b10sm793944wrt.36.2021.11.24.12.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 12:20:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI state
 changes
Date: Wed, 24 Nov 2021 20:20:05 +0000
Message-Id: <20211124202005.989935-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic of gicv3_redist_update() is as follows:
 * it must be called in any code path that changes the state of
   (only) redistributor interrupts
 * if it finds a redistributor interrupt that is (now) higher
   priority than the previous highest-priority pending interrupt,
   then this must be the new highest-priority pending interrupt
 * if it does *not* find a better redistributor interrupt, then:
    - if the previous state was "no interrupts pending" then
      the new state is still "no interrupts pending"
    - if the previous best interrupt was not a redistributor
      interrupt then that remains the best interrupt
    - if the previous best interrupt *was* a redistributor interrupt,
      then the new best interrupt must be some non-redistributor
      interrupt, but we don't know which so must do a full scan

In commit 17fb5e36aabd4b2c125 we effectively added the LPI interrupts
as a kind of "redistributor interrupt" for this purpose, by adding
cs->hpplpi to the set of things that gicv3_redist_update() considers
before it gives up and decides to do a full scan of distributor
interrupts. However we didn't quite get this right:
 * the condition check for "was the previous best interrupt a
   redistributor interrupt" must be updated to include LPIs
   in what it considers to be redistributor interrupts
 * every code path which updates the LPI state which
   gicv3_redist_update() checks must also call gicv3_redist_update():
   this is cs->hpplpi and the GICR_CTLR ENABLE_LPIS bit

This commit fixes this by:
 * correcting the test on cs->hppi.irq in gicv3_redist_update()
 * making gicv3_redist_update_lpi() always call gicv3_redist_update()
 * introducing a new gicv3_redist_update_lpi_only() for the one
   callsite (the post-load hook) which must not call
   gicv3_redist_update()
 * making gicv3_redist_lpi_pending() always call gicv3_redist_update(),
   either directly or via gicv3_redist_update_lpi()
 * removing a couple of now-unnecessary calls to gicv3_redist_update()
   from some callers of those two functions
 * calling gicv3_redist_update() when the GICR_CTLR ENABLE_LPIS
   bit is cleared

(This means that the not-file-local gicv3_redist_* LPI related
functions now all take care of the updates of internally cached
GICv3 information, in the same way the older functions
gicv3_redist_set_irq() and gicv3_redist_send_sgi() do.)

The visible effect of this bug was that when the guest acknowledged
an LPI by reading ICC_IAR1_EL1, we marked it as not pending in the
LPI data structure but still left it in cs->hppi so we would offer it
to the guest again.  In particular for setups using an emulated GICv3
and ITS and using devices which use LPIs (ie PCI devices) a Linux
guest would complain "irq 54: nobody cared" and then hang.  (The hang
was intermittent, presumably depending on the timing between
different interrupts arriving and being completed.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think this is now a proper fix for the problem. Testing
definitely welcomed... The commit message makes it sound like a bit
of a "several things in one patch" change, but it isn't really IMHO:
I just erred on the side of being very verbose in the description...
---
 hw/intc/gicv3_internal.h   | 17 +++++++++++++++++
 hw/intc/arm_gicv3.c        |  6 ++++--
 hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index a0369dace7b..70f34ee4955 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -463,7 +463,24 @@ void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+/**
+ * gicv3_redist_update_lpi:
+ * @cs: GICv3CPUState
+ *
+ * Scan the LPI pending table and recalculate the highest priority
+ * pending LPI and also the overall highest priority pending interrupt.
+ */
 void gicv3_redist_update_lpi(GICv3CPUState *cs);
+/**
+ * gicv3_redist_update_lpi_only:
+ * @cs: GICv3CPUState
+ *
+ * Scan the LPI pending table and recalculate cs->hpplpi only,
+ * without calling gicv3_redist_update() to recalculate the overall
+ * highest priority pending interrupt. This should be called after
+ * an incoming migration has loaded new state.
+ */
+void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index c6282984b1e..9f5f815db9b 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -186,7 +186,9 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
      * interrupt has reduced in priority and any other interrupt could
      * now be the new best one).
      */
-    if (!seenbetter && cs->hppi.prio != 0xff && cs->hppi.irq < GIC_INTERNAL) {
+    if (!seenbetter && cs->hppi.prio != 0xff &&
+        (cs->hppi.irq < GIC_INTERNAL ||
+         cs->hppi.irq >= GICV3_LPI_INTID_START)) {
         gicv3_full_update_noirqset(cs->gic);
     }
 }
@@ -354,7 +356,7 @@ static void arm_gicv3_post_load(GICv3State *s)
      * pending interrupt, but don't set IRQ or FIQ lines.
      */
     for (i = 0; i < s->num_cpu; i++) {
-        gicv3_redist_update_lpi(&s->cpu[i]);
+        gicv3_redist_update_lpi_only(&s->cpu[i]);
     }
     gicv3_full_update_noirqset(s);
     /* Repopulate the cache of GICv3CPUState pointers for target CPUs */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 424e7e28a86..c8ff3eca085 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -256,9 +256,10 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
                 /* Check for any pending interr in pending table */
                 gicv3_redist_update_lpi(cs);
-                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+                /* cs->hppi might have been an LPI; recalculate */
+                gicv3_redist_update(cs);
             }
         }
         return MEMTX_OK;
@@ -571,7 +572,7 @@ static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
     }
 }
 
-void gicv3_redist_update_lpi(GICv3CPUState *cs)
+void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
 {
     /*
      * This function scans the LPI pending table and for each pending
@@ -614,6 +615,12 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs)
     }
 }
 
+void gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    gicv3_redist_update_lpi_only(cs);
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
 {
     /*
@@ -651,6 +658,7 @@ void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
      */
     if (level) {
         gicv3_redist_check_lpi_priority(cs, irq);
+        gicv3_redist_update(cs);
     } else {
         if (irq == cs->hpplpi.irq) {
             gicv3_redist_update_lpi(cs);
@@ -673,8 +681,6 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
 
     /* set/clear the pending bit for this irq */
     gicv3_redist_lpi_pending(cs, irq, level);
-
-    gicv3_redist_update(cs);
 }
 
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
-- 
2.25.1


