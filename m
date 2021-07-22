Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5543D26D9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:38:53 +0200 (CEST)
Received: from localhost ([::1]:52064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ami-0003Q2-KF
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akL-0000e3-Ie
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akH-0002ku-Id
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id v1so7321045edt.6
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5PjpK8bbyx5zYtsFg2O3bVbBdfEVzuimKehuk+bGaA=;
 b=kAAHbWgNjGx//LCfd4y6Wg0MMQ7ZhDU7pmaUK9cziH0mMyqKOb8LVJUub1WfliAqwY
 V9NkU3Cflq4vRy1M+hpE1smhQw/FXnPy/t+laEaQgBUxJIaInDh0ZbCD0BnkfFUcJaNo
 hcQePamfzAhOzNmsoVQBbR76chV5tDZTuWECljulx4LfZC83Cs0fNfqQEr3vFEFj8/9b
 DaJF0CmHVEZSo7O1tqzNMV2btQOnQag0bsZobOH+FbEHygpDvFPEg39d7VKmx2LNWlRn
 eptoV2TUm5bz160Cp2pfebsv16psgmnb86M19/GswavtH7rMhdGZ9Httd9J8kp2Mhkyx
 IMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x5PjpK8bbyx5zYtsFg2O3bVbBdfEVzuimKehuk+bGaA=;
 b=Ulal1mq028UHOpQLyl7MyFXOLUv7ZYovDCPVBdCXo06MhsCwt0VZquNsFG+MYbzLOu
 9ibx+GG3XyEr/QilflG8hgjTEG5gmikf15UU8bcm/9c9cgjE6wh5kh97CZ95Pp2xC0Qp
 EXVDHKxoKUo4YJk8uGcKX4uHYqm1PonHX8Zs7YJDWzX1GjivDD0hXLF5OaT4ZVvAVVvC
 ZjkTSZOT2n8XonZ0hLO1G9gpdmq+DkFhN5CfuksjhYMrsbzHsyd0cYYXWdtQ8lHEUHP7
 PdxqIYotTO66OBTS8OCslmJ3LXd4S4XWHWqqzd92wGnvIcFpWIAMNY2NKiyEd1dnuWMx
 JX/A==
X-Gm-Message-State: AOAM533+N8WayKs2KQHsOM8LJPDuL+n/hzgMlw99PwIEcYRrmBCg4i1m
 a5PgK2hPRCyf7tz8UEGz6EpBuAPzK8ZoQw==
X-Google-Smtp-Source: ABdhPJyCNOF92czukjSCdwllKBvqaUggwcoWBTKoirtJRnIqtnWBaM0NkjlCCnmljz+9LoK1q611lA==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr285579edw.112.1626968180275;
 Thu, 22 Jul 2021 08:36:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] target/i386: Added consistency checks for EFER
Date: Thu, 22 Jul 2021 17:36:06 +0200
Message-Id: <20210722153612.955537-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

EFER.SVME has to be set, and EFER reserved bits must
be zero.
In addition the combinations
 * EFER.LMA or EFER.LME is non-zero and the processor does not support LM
 * non-zero EFER.LME and CR0.PG and zero CR4.PAE
 * non-zero EFER.LME and CR0.PG and zero CR0.PE
 * non-zero EFER.LME, CR0.PG, CR4.PAE, CS.L and CS.D
are all invalid.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210721152651.14683-3-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                   |  5 ++++
 target/i386/tcg/sysemu/svm_helper.c | 39 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1f7e8d7f0a..6c50d3ab4f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -475,6 +475,11 @@ typedef enum X86Seg {
 #define MSR_EFER_SVME  (1 << 12)
 #define MSR_EFER_FFXSR (1 << 14)
 
+#define MSR_EFER_RESERVED\
+        (~(target_ulong)(MSR_EFER_SCE | MSR_EFER_LME\
+            | MSR_EFER_LMA | MSR_EFER_NXE | MSR_EFER_SVME\
+            | MSR_EFER_FFXSR))
+
 #define MSR_STAR                        0xc0000081
 #define MSR_LSTAR                       0xc0000082
 #define MSR_CSTAR                       0xc0000083
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index d7d7a86aa9..4d64ec378e 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -75,6 +75,41 @@ static inline bool ctl_has_irq(uint32_t int_ctl)
     return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
+static inline bool is_efer_invalid_state (CPUX86State *env)
+{
+    if (!(env->efer & MSR_EFER_SVME)) {
+        return true;
+    }
+
+    if (env->efer & MSR_EFER_RESERVED) {
+        return true;
+    }
+
+    if ((env->efer & (MSR_EFER_LMA | MSR_EFER_LME)) &&
+            !(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && !(env->cr[4] & CR4_PAE_MASK)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && !(env->cr[0] & CR0_PE_MASK)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && (env->cr[4] & CR4_PAE_MASK)
+                                && (env->segs[R_CS].flags & DESC_L_MASK)
+                                && (env->segs[R_CS].flags & DESC_B_MASK)) {
+        return true;
+    }
+
+    return false;
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -291,6 +326,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     }
 #endif
 
+    if (is_efer_invalid_state(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
     switch (x86_ldub_phys(cs,
                       env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
     case TLB_CONTROL_DO_NOTHING:
-- 
2.31.1



