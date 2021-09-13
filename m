Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87D408AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:05:05 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkhs-0003KP-Om
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkaz-0002pc-J8
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkay-0005rw-4g
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6747527wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8CXdZuaVrNzRFWLPIhtZbQOhTCypBHZ9xL86lrreCQ=;
 b=luSZmC/Va0DEB86SMqJLOjNRJYYuZG7vdzgQG2m1YWO2xCGSCWHjR4jeTQqK6g01Db
 059CmXwNoFx+A1VLIkxDNNAMH7mNEKqkHTFcOluGD7eCUJq6C8X+G2BBdFh8sR6Qcjs4
 Xbm9cSiIIuZZ1uJ1iwC0a/3BNzGTLsT2p0WhI+aidBoXsIR0o49AZJFlwNWvXEH6HPMI
 XM9SWE2pgmOcujzQixk82SvILunTR7uweY6FLpMNn23X47hlMEhsdgpQ4RRV3aqe1jmy
 yMpEGGVKrVJ52Vx14+6d0IY/cgnVyH71oHRM5t1u0EBh+89UOY75OQIgXdqXYeXuWZn7
 e4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/8CXdZuaVrNzRFWLPIhtZbQOhTCypBHZ9xL86lrreCQ=;
 b=kX65wFLxLP061ZZdk6o8n9xadifHkwUmgLhmHCxo2MTnaYcQF1IkIspOvxZmYOIJ6t
 odgt9SQHeAKk3ZQ0YxSNOChuN5sQoHIk50aLW6hAfOi2iRriOzOC14tDcZVz2oCY/lOO
 gPgOtiRz9gro9F4WPF9XsJjs4/KWL0O6KAGHfxxr28Y2opotQxB3S5MSwNmVYcWsLhvZ
 UORFwbaftNsEWVOtfYWiy2XOc8wOlZcKzsHVo5e4gdZH6+qhVABYNHxYJI/LFG7dY0Za
 GgcPVRG7l0Ng3nxctvITtGoJBUSt0iWp8Qv8Lyg7LkDhINSCEm8QAx+n/91hf3gU9Z2r
 o/Ug==
X-Gm-Message-State: AOAM531LkCq5QK/SecXUIveb4QxN8e5ee5qzAKiqkQ+c8C1hQK76Rh71
 j7QPtS+f+tNUN3Yk+UASftjxmHPv5+o=
X-Google-Smtp-Source: ABdhPJx2bxAjr0emGgvlE2d0n0lUV1sLT/KZ+NgyiqXejSiTA2pwlW/fqubLjPpCtXDlvznYvAN0PQ==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr10641066wml.23.1631534274867; 
 Mon, 13 Sep 2021 04:57:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] target/i386: Added changed priority check for VIRQ
Date: Mon, 13 Sep 2021 13:57:28 +0200
Message-Id: <20210913115742.533197-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index 24e8ec5273..6b09b8b62f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2246,6 +2246,21 @@ static inline uint64_t cr4_reserved_bits(CPUX86State *env)
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



