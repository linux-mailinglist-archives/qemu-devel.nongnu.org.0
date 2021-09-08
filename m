Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338A403787
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:07:20 +0200 (CEST)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuUB-0000pd-EZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRg-0006K0-Oh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRe-0002sg-Hc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g16so2419411wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8CXdZuaVrNzRFWLPIhtZbQOhTCypBHZ9xL86lrreCQ=;
 b=OtX/xTITrC5XdlLqAU6izsKSYa9xbjUv/i6H4vnVSoJj4ZN5NiaTLTrUFwkCJBX/2R
 VrCexvvO+B48qZD8k5CKDFqiclmYkkO3AIsF0TtrClgyfOVoji+qQuiVPzSm9z5NiWoA
 cwqkNss8LAg12zKmihEvHaHP8oklEXfi1xomxl8hZrpGtuc7eXJ59t3Hs5UJdrDm+kN1
 7RaszYBBgWUudR9Kk+giWG+s+5iCQyWwwlSE7ChU5oQtNX5ZtropANdIeMv183UGDY7z
 i2CHOLqrv872GVpdh9OhmocTSXB0UBbIbHhwEX/YhIrOVIX2CygKlINFfCb0WrSMHRBC
 tFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/8CXdZuaVrNzRFWLPIhtZbQOhTCypBHZ9xL86lrreCQ=;
 b=4QwQn87EzOXq9GIcIv7LtjiLSilN1ujw7uBsjPzfXKVE3bSMLsWOVFSKoCXpTPe/6D
 UGPk3d1rYpQk6BxP0rutqgSMxaE7GkE14reCamfJYyJtxcz0aFnp60PiY3+/b0QgRBIn
 E5LJOkB+kjSeqNd2OqCUvOT9rCOd7QytbupvpJB1leaum/Kzb9TYO0LLL6vI04do/uX/
 vyuDZwPCHQfiAe8WCRg6QpyzFn8K2+VGFYl1qmc9Robl22e1AJLiWvtsqO6qXFaUDXne
 AbWhFi1JqynQsdVeEe4grSZVDSSqoI018t0rb0ZXyXKjjBwpmMY3Rdp2TqEwBhbjKDS9
 dvGg==
X-Gm-Message-State: AOAM531Fz/QCcuzeHuyo0X7mm1xg5stvXeTsywVxasMiprsYYDx+DD5Z
 R8o/+75EOuPItqo1jPLHEuL6huQiX14=
X-Google-Smtp-Source: ABdhPJwD5y0H7Skd5Z4xfRiduDUh8cLc3xCBpOVNZ8zmwlbnHOH/4YHrhDjOUs/UTrvP+NcHTvltNw==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2384088wrq.359.1631095480879; 
 Wed, 08 Sep 2021 03:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 07/43] target/i386: Added changed priority check for VIRQ
Date: Wed,  8 Sep 2021 12:03:50 +0200
Message-Id: <20210908100426.264356-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



