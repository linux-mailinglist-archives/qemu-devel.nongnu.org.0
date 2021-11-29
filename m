Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F34612C3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:44:07 +0100 (CET)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre8k-0001aC-A1
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre4B-0002Og-Hz
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: from [2a00:1450:4864:20::331] (port=43835
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre48-0004mt-FZ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so12065243wmc.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=soOOpqio2WocZa+HeBfIL2JcxO9H3bplg2Ge+Gko5Ck=;
 b=H/duAQSfwOVerec0MVyCQe/CuuHTvJuDNXDf/YpIrRA7SfNojxC4WaiiqLlko4LUip
 iV4vyyehqiA7Ce7MrT0RfeYXhdLzCEx/INct5Hr+Gkv7pzxX4agPN1EJRryb8QUR9vTw
 uH4Rd4JutwDCrshtnRJm2Slp8JnERdQ7xkQ1JiGTWGzKt8Iu25+ziy1qehpjJmm7Z2z6
 gMS10eQ90MDrfZq1jhYA51Ka/smumcY1KpAsepJvc5NaCMYTE6MX7D62R6Vo3qM35E3d
 WcZ4PD+z/EO2pYK0kQB+JBSfHneSaJfrTWxutVv9vWop+pTJs6iWDCXqoesWRri7EI87
 HTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soOOpqio2WocZa+HeBfIL2JcxO9H3bplg2Ge+Gko5Ck=;
 b=zciv7cjYTB9V8cHUXKcqaHqROhIBCARUiVGV8pZHfNmaBlPLzCLfmxO+QYa3qkk4r+
 4l4YWj/3vhQq9rx+MjJrXvMJ9D4oxQ1YvtmR7ZSu0f5eZc+HKmCohzNc2mUhpodJD2BV
 3oHTQUd/sSZ2tbAxR5EdOV4pbvBiHtenr3YDydTcbDC1Kvqr8n1EnO/hEd1qeORrHTlz
 Y0NQPNnp58wAmGwQCCcHjbEWiOmvKLJiL1hPSTrz0TO2eyYtO6J2VHUshE9jjaFwbs7k
 Nz6pjP2oeS5QM7hTxIzPg/nyM4OGUAi99hazmQ1qNOqjbAL0vMBT/OD/rqQ5+Qu8MVtE
 ZTyA==
X-Gm-Message-State: AOAM5334JMoHDoHjayDs/ForTQaQ6IiwukHuqZ/X9Ky0cYPzKA9+ip4L
 ay05+j08P9X1XhfGqsHtVckT+aRqPYMN9Q==
X-Google-Smtp-Source: ABdhPJxDIdhm+iFIk3iwOBsGVAOSDjlieL/7r3xm23/Zs3k3wydIsf3N3ScuwkpyAJ1AfE9+8dZVcQ==
X-Received: by 2002:a7b:c256:: with SMTP id b22mr9897827wmj.176.1638182359183; 
 Mon, 29 Nov 2021 02:39:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] hw/intc/arm_gicv3: Update cached state after LPI state
 changes
Date: Mon, 29 Nov 2021 10:39:13 +0000
Message-Id: <20211129103915.1162989-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20211124202005.989935-1-peter.maydell@linaro.org
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


