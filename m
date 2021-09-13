Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5301408AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:01:03 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkdy-0005oU-1P
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkay-0002pE-R4
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkav-0005pW-QX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t18so14311645wrb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rury9kyy7jESqyjutVRPw1Pj5BJEZzJk31MIDToIicI=;
 b=Q5p67lPN4qVsg666BTAe8mRSOXwI25RIM6RGZ5ZTLomVRy0+GM4ClM+paaOzOMNBR2
 4+BZ+LnHKP5a1ywUxsgwqXQwz2V6Bvf4pt4CMYDw1XNGczuegkh8itWy9jcMcTUMF0fh
 tKK5r4tTWzFlHyv2EFB//hdgYRVS+hJaDKsLKj5okaNTjvEJDWpO7zd7pDR4hxGXoZwU
 qbsjIIb5i2BwDc6yYHj/WmrA4cWmY4uP4ZPWSo8AaH1xilmuoCid1vME1FRPpvIrVmGk
 TZA0a5xzeY3CfdD6sQn0H+EBIWeL/j5zVhVYE5WsGTeSfA8u2DX6K5qJpr38a5ykW6kc
 escQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rury9kyy7jESqyjutVRPw1Pj5BJEZzJk31MIDToIicI=;
 b=CWKb53qqy4n3XhIQOQNZcAJr/XY+6uBmB//8qtedKKaADVt6vTuSL7UX6hXSmP98jI
 fMGPtPiEsDBYnCy91UmF6DeU8nTCi+UcA6yeZvqiIlfzoP8njQcIdLP37oy09v8u+Mj4
 SeYzd+tsW9n8g2VJoKZ0R4suPlgYbx6p4bXwbe/wCrLy8Ckpw+UrvJdtpp6pkYX5jd48
 6IxQUllIkxEtyenvgcy2du3qaSN5oApYr5Ls5Gp8DwX2NmO+2KEeq36MfdjNylhD9S75
 Cnd8UdxamQNDDkCP/r4tXoQIEA7gUL6T2gdkQD/2b2z6+GVgcj+VhA3GHfA+t6tgNUgZ
 9ImA==
X-Gm-Message-State: AOAM531Wn6aUt9gCrNTuMUhXu3EcjUI9/UlfymVKaGnb4SjwAN2Lh+ex
 WENeeN4htG2jYKIP/R3FTtmlOR5yerc=
X-Google-Smtp-Source: ABdhPJwIit+/AOstTaMWi3T3Z2/4sqEAr2qDcr8FNpEbbMhUz6f3KmI1TVkS+Iw6ApAvNA0OU62FoA==
X-Received: by 2002:a05:6000:1623:: with SMTP id
 v3mr12310578wrb.288.1631534272501; 
 Mon, 13 Sep 2021 04:57:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] target/i386: Added VGIF V_IRQ masking capability
Date: Mon, 13 Sep 2021 13:57:26 +0200
Message-Id: <20210913115742.533197-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
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

VGIF provides masking capability for when virtual interrupts
are taken. (APM2)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                   |  7 +++++--
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 12 ++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ddc3b63cb8..6b029f1bdf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5657,6 +5657,7 @@ static void x86_cpu_reset(DeviceState *dev)
     /* init to reset state */
     env->int_ctl = 0;
     env->hflags2 |= HF2_GIF_MASK;
+    env->hflags2 |= HF2_VGIF_MASK;
     env->hflags &= ~HF_GUEST_MASK;
 
     cpu_x86_update_cr0(env, 0x60000010);
@@ -6540,10 +6541,12 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
                       !(env->hflags & HF_INHIBIT_IRQ_MASK))))) {
             return CPU_INTERRUPT_HARD;
 #if !defined(CONFIG_USER_ONLY)
-        } else if ((interrupt_request & CPU_INTERRUPT_VIRQ) &&
+        } else if (env->hflags2 & HF2_VGIF_MASK) {
+            if((interrupt_request & CPU_INTERRUPT_VIRQ) &&
                    (env->eflags & IF_MASK) &&
                    !(env->hflags & HF_INHIBIT_IRQ_MASK)) {
-            return CPU_INTERRUPT_VIRQ;
+                        return CPU_INTERRUPT_VIRQ;
+            }
 #endif
         }
     }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 3dfe630d7e..24e8ec5273 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -203,6 +203,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_SHIFT         5 /* BNDCFGx.BNDPRESERVE */
 #define HF2_NPT_SHIFT            6 /* Nested Paging enabled */
 #define HF2_IGNNE_SHIFT          7 /* Ignore CR0.NE=0 */
+#define HF2_VGIF_SHIFT           8 /* Can take VIRQ*/
 
 #define HF2_GIF_MASK            (1 << HF2_GIF_SHIFT)
 #define HF2_HIF_MASK            (1 << HF2_HIF_SHIFT)
@@ -212,6 +213,7 @@ typedef enum X86Seg {
 #define HF2_MPX_PR_MASK         (1 << HF2_MPX_PR_SHIFT)
 #define HF2_NPT_MASK            (1 << HF2_NPT_SHIFT)
 #define HF2_IGNNE_MASK          (1 << HF2_IGNNE_SHIFT)
+#define HF2_VGIF_MASK           (1 << HF2_VGIF_SHIFT)
 
 #define CR0_PE_SHIFT 0
 #define CR0_MP_SHIFT 1
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 24c58b6a38..4612dae1ac 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -130,6 +130,11 @@ static inline bool virtual_gif_enabled(CPUX86State *env)
     return false;
 }
 
+static inline bool virtual_gif_set(CPUX86State *env)
+{
+    return !virtual_gif_enabled(env) || (env->int_ctl & V_GIF_MASK);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -364,6 +369,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
     }
 
+    if (virtual_gif_set(env)) {
+        env->hflags2 |= HF2_VGIF_MASK;
+    }
+
     /* maybe we need to inject an event */
     event_inj = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                  control.event_inj));
@@ -520,6 +529,7 @@ void helper_stgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl |= V_GIF_MASK;
+        env->hflags2 |= HF2_VGIF_MASK;
     } else {
         env->hflags2 |= HF2_GIF_MASK;
     }
@@ -531,6 +541,7 @@ void helper_clgi(CPUX86State *env)
 
     if (virtual_gif_enabled(env)) {
         env->int_ctl &= ~V_GIF_MASK;
+        env->hflags2 &= ~HF2_VGIF_MASK;
     } else {
         env->hflags2 &= ~HF2_GIF_MASK;
     }
@@ -812,6 +823,7 @@ void do_vmexit(CPUX86State *env)
              env->vm_vmcb + offsetof(struct vmcb, control.event_inj), 0);
 
     env->hflags2 &= ~HF2_GIF_MASK;
+    env->hflags2 &= ~HF2_VGIF_MASK;
     /* FIXME: Resets the current ASID register to zero (host ASID). */
 
     /* Clears the V_IRQ and V_INTR_MASKING bits inside the processor. */
-- 
2.31.1



