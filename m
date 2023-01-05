Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F289965F24D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMN-0000qn-Bu; Thu, 05 Jan 2023 11:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM3-0000bw-Ck
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM1-0007Pb-Kk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m3so19555663wmq.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ew4ZuCC9yg58vS2TrdlpWSuLYwEQS/rH4g7G61S6lm4=;
 b=cRVGz2tlUd6kSkrs0sSHiv7DF2yujPfDZvZo+ICl0qxrd6bpJacTaeW6oai9+OxR8r
 r7GRqo8zbZJ4M3waK8elRZoFIxraEeqFn383Wnrlm69/4pqHMZBR0lUXPryDPCo1Zx4B
 TSk2QFCo5lM7DQPr4Mwj+Rw4XeXyfRa4SU852/vKI/IUsucCndhIer0+jr8nDl6y4Qn/
 sNxUxIH/Dc/N5ZRLqnMLUjNFzS8YBXd/zhqjMWklBvQMFXToWqGcaIUFW8UykZvPrrmZ
 uOwK8i1WzY8cIXaReOt5QV8O75EI2N5kPysvfBlGz1ALikFtvcvUkO7tao5LqKS5M/cH
 6LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ew4ZuCC9yg58vS2TrdlpWSuLYwEQS/rH4g7G61S6lm4=;
 b=6KdIpAFLdVUWWnxjJUeW5xZvjB275UJy7OaDuG71wfXwec+864YkP7BonSYH8bJXFO
 e9BAzX2KcU5Va5hHcdlzfK5PpzVZmObJmJwuYweiGuc8HZZ4/Eai2aABT/4tMmtO9rPx
 gFiwIk3UtleGN7uhCqx4gxRIkE5DvDflEQgDsCzCwwKVKNdj64O3YJhh6gEQHqutFYbL
 BM4TK6qziHlBLB0G+JxWsqHm7Q0P50SVImIoy0CYEKkgxGnv3cITDvQeVlFWRZzI63jj
 44dLzyAOejjAArErU/71tGgprBMgmmCsPBGuy1yNQlrSWXBoVapue/0wzQIqp7O7bPh+
 vocA==
X-Gm-Message-State: AFqh2kpbW9EETFlZEQR1kaaUy91NEd8V2INgmJHTe2jjyKODb1QZcUCi
 TMjt3en8NhCvSUbn1kYQ5I49u54AjUdZNk/J
X-Google-Smtp-Source: AMrXdXuPeHJxHeCx8vG0uz/js9DCUhK0L5chzd2qQcJrMKfJXdeSxTdkZcXVqj3Q+x4DoM4kPo27lw==
X-Received: by 2002:a05:600c:1d0e:b0:3cf:7c8b:a7c7 with SMTP id
 l14-20020a05600c1d0e00b003cf7c8ba7c7mr36564875wms.39.1672937072403; 
 Thu, 05 Jan 2023 08:44:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/34] hw/timer/imx_epit: remove explicit fields cnt and freq
Date: Thu,  5 Jan 2023 16:43:59 +0000
Message-Id: <20230105164417.3994639-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Axel Heider <axel.heider@hensoldt.net>

The CNT register is a read-only register. There is no need to
store it's value, it can be calculated on demand.
The calculated frequency is needed temporarily only.

Note that this is a migration compatibility break for all boards
types that use the EPIT peripheral.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/imx_epit.h |  2 -
 hw/timer/imx_epit.c         | 73 ++++++++++++++-----------------------
 2 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 783eaf0c3a6..79aff0cec20 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -74,9 +74,7 @@ struct IMXEPITState {
     uint32_t sr;
     uint32_t lr;
     uint32_t cmp;
-    uint32_t cnt;
 
-    uint32_t freq;
     qemu_irq irq;
 };
 
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index e04427542ff..cf134961650 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -73,27 +73,14 @@ static void imx_epit_update_int(IMXEPITState *s)
     }
 }
 
-/*
- * Must be called from within a ptimer_transaction_begin/commit block
- * for both s->timer_cmp and s->timer_reload.
- */
-static void imx_epit_set_freq(IMXEPITState *s)
+static uint32_t imx_epit_get_freq(IMXEPITState *s)
 {
-    uint32_t clksrc;
-    uint32_t prescaler;
-
-    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
-    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
-
-    s->freq = imx_ccm_get_clock_frequency(s->ccm,
-                                imx_epit_clocks[clksrc]) / prescaler;
-
-    DPRINTF("Setting ptimer frequency to %u\n", s->freq);
-
-    if (s->freq) {
-        ptimer_set_freq(s->timer_reload, s->freq);
-        ptimer_set_freq(s->timer_cmp, s->freq);
-    }
+    uint32_t clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    uint32_t prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
+    uint32_t f_in = imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[clksrc]);
+    uint32_t freq = f_in / prescaler;
+    DPRINTF("ptimer frequency is %u\n", freq);
+    return freq;
 }
 
 /*
@@ -110,32 +97,23 @@ static void imx_epit_reset(IMXEPITState *s, bool is_hard_reset)
     s->sr = 0;
     s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
-    s->cnt = 0;
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
-    /* stop both timers */
+
+    /*
+     * The reset switches off the input clock, so even if the CR.EN is still
+     * set, the timers are no longer running.
+     */
+    assert(imx_epit_get_freq(s) == 0);
     ptimer_stop(s->timer_cmp);
     ptimer_stop(s->timer_reload);
-    /* compute new frequency */
-    imx_epit_set_freq(s);
     /* init both timers to EPIT_TIMER_MAX */
     ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
     ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-    if (s->freq && (s->cr & CR_EN)) {
-        /* if the timer is still enabled, restart it */
-        ptimer_run(s->timer_reload, 0);
-    }
     ptimer_transaction_commit(s->timer_cmp);
     ptimer_transaction_commit(s->timer_reload);
 }
 
-static uint32_t imx_epit_update_count(IMXEPITState *s)
-{
-    s->cnt = ptimer_get_count(s->timer_reload);
-
-    return s->cnt;
-}
-
 static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
 {
     IMXEPITState *s = IMX_EPIT(opaque);
@@ -159,8 +137,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
         break;
 
     case 4: /* CNT */
-        imx_epit_update_count(s);
-        reg_value = s->cnt;
+        reg_value = ptimer_get_count(s->timer_reload);
         break;
 
     default:
@@ -179,7 +156,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
 {
     if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN))  {
         /* if the compare feature is on and timers are running */
-        uint32_t tmp = imx_epit_update_count(s);
+        uint32_t tmp = ptimer_get_count(s->timer_reload);
         uint64_t next;
         if (tmp > s->cmp) {
             /* It'll fire in this round of the timer */
@@ -193,6 +170,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
 
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
+    uint32_t freq = 0;
     uint32_t oldcr = s->cr;
 
     s->cr = value & 0x03ffffff;
@@ -217,12 +195,19 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
 
-    /* Update the frequency. Has been done already in case of a reset. */
+    /*
+     * Update the frequency. In case of a reset the input clock was
+     * switched off, so this can be skipped.
+     */
     if (!(s->cr & CR_SWR)) {
-        imx_epit_set_freq(s);
+        freq = imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
     }
 
-    if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
         if (s->cr & CR_ENMOD) {
             if (s->cr & CR_RLD) {
                 ptimer_set_limit(s->timer_reload, s->lr, 1);
@@ -356,15 +341,13 @@ static const MemoryRegionOps imx_epit_ops = {
 
 static const VMStateDescription vmstate_imx_timer_epit = {
     .name = TYPE_IMX_EPIT,
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(cr, IMXEPITState),
         VMSTATE_UINT32(sr, IMXEPITState),
         VMSTATE_UINT32(lr, IMXEPITState),
         VMSTATE_UINT32(cmp, IMXEPITState),
-        VMSTATE_UINT32(cnt, IMXEPITState),
-        VMSTATE_UINT32(freq, IMXEPITState),
         VMSTATE_PTIMER(timer_reload, IMXEPITState),
         VMSTATE_PTIMER(timer_cmp, IMXEPITState),
         VMSTATE_END_OF_LIST()
-- 
2.25.1


