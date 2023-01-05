Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83565F29B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMe-0001JX-Gg; Thu, 05 Jan 2023 11:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM2-0000bu-R7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM0-0007PM-TI
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1731199wmk.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8xqm51ez6F8zTWVDgAKbMhiEiLQ8CI6XG2qRGoTrIzY=;
 b=j7Mu7TqoMZf1Y2rF8XQ2qf/CO0xUezfljd2jk/1Z4jtW4HiGRzf9+BJry361mc3sdP
 5JJn8yz24wSPLEhmtSJs+Gdp9nvGWWgmIrrBv6OAuSTzgtP0Ijw1vjd8FwPOV4tVf8M5
 QDDu61nS2+J4hfqepkcbkW1eXZMizVjrOLJFvV9jQv5jkpo9OdsAYlJSgwOB4Z1KR+Zt
 YIj+eKDwKcOxwjLGFsww8KnucdEQs8GZzNXJJWF9m63e2AH/jIN8rUerBrYs9wAiWhZk
 TBfh8kQXs/ZBIGhQRo+2LwBDbn1JwBviV0Uttjv1KTmei6ASfwmcfejWpfWrCW9DesqF
 SZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xqm51ez6F8zTWVDgAKbMhiEiLQ8CI6XG2qRGoTrIzY=;
 b=HfGvN3KjrSGl0dIQxnzG+ZDtVa7w1BJQpeYQIglV7xj8P4qhhXfXVy2M+wPgDY6cJx
 UOoRm/ww7bvlTS90kKIuAE9gHM12buIOF4agWVb83TAFJVM2rSw3hovyadkQ0A2MX6tw
 ZKN1a/Yf46lR9bJdSnEN2K+LN1SfQXyGfkuLYMPbMY+tjCQmNp7nHUGI0st2f4a6Gdn/
 siDTH+Bk4xK7GO0UUBEV8gOrz39RY1CieOjJCgN07Z7Zf05eEsgupXq4L604n4qtFvqP
 c7i43X8mTugYF0oc+QIHylmTf96EeuREm6nUU4FRcqob3vS47RRCCl+HvmeHDz0mQWGz
 qjIw==
X-Gm-Message-State: AFqh2kouKsbZHLEBnt9nyaiTgBo6QP1ZPYGOCep0u81FcAjxugNvnIQ+
 pS2/64N2vfdD6ZPhFA/apdyY+ZY5ps+QSUCt
X-Google-Smtp-Source: AMrXdXu0Zeoh8kVad/3wTx6F107rgM9KrX6/geBkflC7d/RQ43rRWkjLKjn+EztDLQ8XH72tzGZpBg==
X-Received: by 2002:a05:600c:5399:b0:3d9:c6f5:c63d with SMTP id
 hg25-20020a05600c539900b003d9c6f5c63dmr5659371wmb.28.1672937071474; 
 Thu, 05 Jan 2023 08:44:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/34] hw/timer/imx_epit: factor out register write handlers
Date: Thu,  5 Jan 2023 16:43:58 +0000
Message-Id: <20230105164417.3994639-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 215 ++++++++++++++++++++++++--------------------
 1 file changed, 117 insertions(+), 98 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 39f47222d05..e04427542ff 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -191,129 +191,148 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
     }
 }
 
+static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
+{
+    uint32_t oldcr = s->cr;
+
+    s->cr = value & 0x03ffffff;
+
+    if (s->cr & CR_SWR) {
+        /* handle the reset */
+        imx_epit_reset(s, false);
+    }
+
+    /*
+     * The interrupt state can change due to:
+     * - reset clears both SR.OCIF and CR.OCIE
+     * - write to CR.EN or CR.OCIE
+     */
+    imx_epit_update_int(s);
+
+    /*
+     * TODO: could we 'break' here for reset? following operations appear
+     * to duplicate the work imx_epit_reset() already did.
+     */
+
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
+
+    /* Update the frequency. Has been done already in case of a reset. */
+    if (!(s->cr & CR_SWR)) {
+        imx_epit_set_freq(s);
+    }
+
+    if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+        if (s->cr & CR_ENMOD) {
+            if (s->cr & CR_RLD) {
+                ptimer_set_limit(s->timer_reload, s->lr, 1);
+                ptimer_set_limit(s->timer_cmp, s->lr, 1);
+            } else {
+                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
+            }
+        }
+
+        imx_epit_reload_compare_timer(s);
+        ptimer_run(s->timer_reload, 0);
+        if (s->cr & CR_OCIEN) {
+            ptimer_run(s->timer_cmp, 0);
+        } else {
+            ptimer_stop(s->timer_cmp);
+        }
+    } else if (!(s->cr & CR_EN)) {
+        /* stop both timers */
+        ptimer_stop(s->timer_reload);
+        ptimer_stop(s->timer_cmp);
+    } else  if (s->cr & CR_OCIEN) {
+        if (!(oldcr & CR_OCIEN)) {
+            imx_epit_reload_compare_timer(s);
+            ptimer_run(s->timer_cmp, 0);
+        }
+    } else {
+        ptimer_stop(s->timer_cmp);
+    }
+
+    ptimer_transaction_commit(s->timer_cmp);
+    ptimer_transaction_commit(s->timer_reload);
+}
+
+static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
+{
+    /* writing 1 to SR.OCIF clears this bit and turns the interrupt off */
+    if (value & SR_OCIF) {
+        s->sr = 0; /* SR.OCIF is the only bit in this register anyway */
+        imx_epit_update_int(s);
+    }
+}
+
+static void imx_epit_write_lr(IMXEPITState *s, uint32_t value)
+{
+    s->lr = value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
+    if (s->cr & CR_RLD) {
+        /* Also set the limit if the LRD bit is set */
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
+        ptimer_set_limit(s->timer_cmp, s->lr, 0);
+    } else if (s->cr & CR_IOVW) {
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_count(s->timer_reload, s->lr);
+    }
+    /*
+     * Commit the change to s->timer_reload, so it can propagate. Otherwise
+     * the timer interrupt may not fire properly. The commit must happen
+     * before calling imx_epit_reload_compare_timer(), which reads
+     * s->timer_reload internally again.
+     */
+    ptimer_transaction_commit(s->timer_reload);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
+
+static void imx_epit_write_cmp(IMXEPITState *s, uint32_t value)
+{
+    s->cmp = value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
+
 static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
 {
     IMXEPITState *s = IMX_EPIT(opaque);
-    uint64_t oldcr;
 
     DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
             (uint32_t)value);
 
     switch (offset >> 2) {
     case 0: /* CR */
-
-        oldcr = s->cr;
-        s->cr = value & 0x03ffffff;
-        if (s->cr & CR_SWR) {
-            /* handle the reset */
-            imx_epit_reset(s, false);
-        }
-
-        /*
-         * The interrupt state can change due to:
-         * - reset clears both SR.OCIF and CR.OCIE
-         * - write to CR.EN or CR.OCIE
-         */
-        imx_epit_update_int(s);
-
-        /*
-         * TODO: could we 'break' here for reset? following operations appear
-         * to duplicate the work imx_epit_reset() already did.
-         */
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-
-        /* Update the frequency. Has been done already in case of a reset. */
-        if (!(s->cr & CR_SWR)) {
-            imx_epit_set_freq(s);
-        }
-
-        if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-            if (s->cr & CR_ENMOD) {
-                if (s->cr & CR_RLD) {
-                    ptimer_set_limit(s->timer_reload, s->lr, 1);
-                    ptimer_set_limit(s->timer_cmp, s->lr, 1);
-                } else {
-                    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-                }
-            }
-
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_reload, 0);
-            if (s->cr & CR_OCIEN) {
-                ptimer_run(s->timer_cmp, 0);
-            } else {
-                ptimer_stop(s->timer_cmp);
-            }
-        } else if (!(s->cr & CR_EN)) {
-            /* stop both timers */
-            ptimer_stop(s->timer_reload);
-            ptimer_stop(s->timer_cmp);
-        } else  if (s->cr & CR_OCIEN) {
-            if (!(oldcr & CR_OCIEN)) {
-                imx_epit_reload_compare_timer(s);
-                ptimer_run(s->timer_cmp, 0);
-            }
-        } else {
-            ptimer_stop(s->timer_cmp);
-        }
-
-        ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
+        imx_epit_write_cr(s, (uint32_t)value);
         break;
 
-    case 1: /* SR - ACK*/
-        /* writing 1 to SR.OCIF clears this bit and turns the interrupt off */
-        if (value & SR_OCIF) {
-            s->sr = 0; /* SR.OCIF is the only bit in this register anyway */
-            imx_epit_update_int(s);
-        }
+    case 1: /* SR */
+        imx_epit_write_sr(s, (uint32_t)value);
         break;
 
-    case 2: /* LR - set ticks */
-        s->lr = value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-        if (s->cr & CR_RLD) {
-            /* Also set the limit if the LRD bit is set */
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
-            ptimer_set_limit(s->timer_cmp, s->lr, 0);
-        } else if (s->cr & CR_IOVW) {
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_count(s->timer_reload, s->lr);
-        }
-        /*
-         * Commit the change to s->timer_reload, so it can propagate. Otherwise
-         * the timer interrupt may not fire properly. The commit must happen
-         * before calling imx_epit_reload_compare_timer(), which reads
-         * s->timer_reload internally again.
-         */
-        ptimer_transaction_commit(s->timer_reload);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
+    case 2: /* LR */
+        imx_epit_write_lr(s, (uint32_t)value);
         break;
 
     case 3: /* CMP */
-        s->cmp = value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
-
+        imx_epit_write_cmp(s, (uint32_t)value);
         break;
 
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
                       HWADDR_PRIx "\n", TYPE_IMX_EPIT, __func__, offset);
-
         break;
     }
 }
+
 static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s = IMX_EPIT(opaque);
-- 
2.25.1


