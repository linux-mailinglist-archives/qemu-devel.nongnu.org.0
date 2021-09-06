Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C4401C2E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:19:52 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEXP-0006kU-Jz
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP7-0000dY-CX
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP5-0007Oh-Cz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id m9so9823969wrb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdzMc2Qa2dzxAmaadJyujO8dISEZBk8lPX/iF4WaHKk=;
 b=BH9D0CJZ+U5AGNx0M7fNSqH+Yz6Drvn3W285f2q2tPKtcr+klF6+Is98tmvoM1dWEe
 r4HyxkgmFMQ0vfc6xwisu+NhksAHTZtWTWh98t4oIbb9NhagfLVAvtnb9GoMss2pKyU/
 EWs/OE8AktO2igBH6i5zO+EFyX+0jWXHf1mmcqpOqlS07hiSaAHujB6MVNrEyb7ZojiE
 GXyKJbRxdbGZGUkhKWd4Qas8Ccd/AjmHgCAviu+cIofo6Gy4oQaK6Tq2udMd718HY1Ni
 YSqC2DOgvGOvtcqOcbERSW8jDQZMur/Q1CqtjrfR5ygphr89Zx0XinmObcalhzdR0dIB
 Ixvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YdzMc2Qa2dzxAmaadJyujO8dISEZBk8lPX/iF4WaHKk=;
 b=UEzOE2xdbOyst6kna9QXBVbJuJFHEJBZ9x2QRtQEIfhx7k6queHI8czIU+sc8jWGiK
 BibE9ldIUP2N+vqm5WldTYMNU/l53iu06HV1JFmeiDX0Nj3Ei7Cnx1sf9WqQzx8kIN0O
 Svde5P3PH5j1Z1JrYsPW2kTjYK7CsSrMHQDUG61og4Y/y1ZGe9oXjEtTmh3sprXATyhi
 w4NTjx/hw6quE49c4CY55J8hasVG7phAJAiANVUlCgdFAMKRQO0nHsp0ZkmghGAo2K1n
 ib9ZE1zEwNo2hZDxlMVNfrxNJOCe2O+/cGxPcumqDLWDdaWHi/M1hNHhhczRavdKwRLb
 fiAw==
X-Gm-Message-State: AOAM530qqSJ9CUjn/BUHceZ+o+QzMnSHIvjw5eI5ieaA5BWd9vXCP+Mt
 iKthVYN/mZqlh3n99gQ+4CNtat9O/j8=
X-Google-Smtp-Source: ABdhPJz9532FNQoHM54MJBj8Nvz3ap1Vh5GQpIaxVcddXEK8D3aY7CD/ToKvApWq2JUCVoqn5FCK1A==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr13448839wrm.430.1630933874177; 
 Mon, 06 Sep 2021 06:11:14 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/36] target/i386: Added changed priority check for VIRQ
Date: Mon,  6 Sep 2021 15:10:29 +0200
Message-Id: <20210906131059.55234-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

Writes to cr8 affect v_tpr. This could set or unset an interrupt
request as the priority might have changed.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    | 15 +++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  7 +++++++
 target/i386/tcg/sysemu/svm_helper.c  | 15 ---------------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d26df6de6b..69e722253d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2245,6 +2245,21 @@ static inline uint64_t cr4_reserved_bits(CPUX86State *env)
     return reserved_bits;
 }
 
+static inline bool ctl_has_irq(CPUX86State *env)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
+    tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return (env->int_ctl & V_IRQ_MASK);
+    }
+
+    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 91b0fc916b..9ccaa054c4 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -122,6 +122,13 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
             qemu_mutex_unlock_iothread();
         }
         env->int_ctl = (env->int_ctl & ~V_TPR_MASK) | (t0 & V_TPR_MASK);
+
+        CPUState *cs = env_cpu(env);
+        if (ctl_has_irq(env)) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        }
         break;
     default:
         env->cr[reg] = t0;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index a35b79548a..7bbd3a18c9 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -76,21 +76,6 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
-static inline bool ctl_has_irq(CPUX86State *env)
-{
-    uint32_t int_prio;
-    uint32_t tpr;
-
-    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
-    tpr = env->int_ctl & V_TPR_MASK;
-
-    if (env->int_ctl & V_IGN_TPR_MASK) {
-        return env->int_ctl & V_IRQ_MASK;
-    }
-
-    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
-}
-
 static inline bool is_efer_invalid_state (CPUX86State *env)
 {
     if (!(env->efer & MSR_EFER_SVME)) {
-- 
2.31.1



