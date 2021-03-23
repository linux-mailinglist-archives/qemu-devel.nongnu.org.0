Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2B34691F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:32:39 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmla-0005M3-BW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm10-0008SV-6p
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:30 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0Y-0003jO-V1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:29 -0400
Received: by mail-oi1-x22f.google.com with SMTP id w70so18088485oie.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GP7KN1O/N4US4bdn1IcXHif9taZ0y5n50rRX2Q2HUDY=;
 b=Jc0b5pnPsD66YJ1iLem3ayxsEy4Pda2iAPPoZJUMpss1S5ugnuhaIAEeGWBB3aA4+F
 NG4ngBUNohuiM4cGcNTHgiMWY3ZD+1sNVYuEvAcQ067kyRd6Csu8Y0iUdwcWWrHRkuZu
 s2mao+zMMhYsn6u83wiPX31luUwD0tVB8K4XlDxAeN4GBJXeHAqfAO82U4DJ3e1oltK0
 sn7mvBxMg80bBwgT/zRNn/3k4TlgqUIU/PLNjabYMebIrQk4fV099Nwy4uAJOgPSeqHQ
 hr9jn5eUTKjZ8d4jd+jj3chE3EBivjF3HtSGIdMkUaRjrN7hy2ROx3/V9H1BeGVK7dTY
 RDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GP7KN1O/N4US4bdn1IcXHif9taZ0y5n50rRX2Q2HUDY=;
 b=s9SNzi8Zc8JXaxvaBujz9lAHQ1XU1QHnMfxW3sxzgIl2BzgqYWeVl8R8g5Tkx203do
 k6BMwr+1Ns3xdRfi3LxMXive2COfrbm1JXk4NWj5jtmZmsfP73SaeZMI31pMgALf0Q5t
 f7gw7ud7zyKb9CREzzt1i9cvpSO4k1ekTPcHpVeS7f3ZuHKxhhdgQ3LpsJ0VMq3TBPxo
 kiV/1fDtrbnDDlAJOh4bvzRMSQWT4BiMjk8m1NDEjcW4ZUxr3nEBs4DIrQraXI/XZvqw
 eHf4Qexgxg+HMs35KAE1d6oQsFMH8cYALgHZ7+LK1ORNkkVCfRR69ERPDXAE3qV3zEn9
 jOWw==
X-Gm-Message-State: AOAM532ZvN4oqVM3kKuGuachM6LwJ8hiEbPNRQ8taT1PrPESBFW9Gtkb
 4FqTWO/+OY8Adc66zVuwLB24r/mmPv9fdlEj
X-Google-Smtp-Source: ABdhPJw/RrcGw4S1CQqNJaChrBboZkuIGtg5n0mD+/NIIpvND3jjvLMkfaH+iEMxo+UXFk2KYw4seQ==
X-Received: by 2002:a05:6808:8d3:: with SMTP id
 k19mr4129748oij.67.1616525035721; 
 Tue, 23 Mar 2021 11:43:55 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/10] linux-user/ppc: Fix msr updates for signal handling
Date: Tue, 23 Mar 2021 12:43:39 -0600
Message-Id: <20210323184340.619757-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In save_user_regs, there are two bugs where we OR in a bit number
instead of the bit, clobbering the low bits of MSR.  However:

The MSR_VR and MSR_SPE bits control the availability of the insns.
If the bits were not already set in MSR, then any attempt to access
those registers would result in SIGILL.

For linux-user, we always initialize MSR to the capabilities
of the cpu.  We *could* add checks vs MSR where we currently
check insn_flags and insn_flags2, but we know they match.

Also, there's a stray cut-and-paste comment in restore.

Then, do not force little-endian binaries into big-endian mode.

Finally, use ppc_store_msr for the update to affect hflags.
Which is the reason none of these bugs were previously noticed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c |  5 +++--
 linux-user/ppc/signal.c   | 23 +++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index df71e15a25..4a0f6c8dc2 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -492,11 +492,12 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 #if defined(TARGET_PPC64)
     int flag = (env->insns_flags2 & PPC2_BOOKE206) ? MSR_CM : MSR_SF;
 #if defined(TARGET_ABI32)
-    env->msr &= ~((target_ulong)1 << flag);
+    ppc_store_msr(env, env->msr & ~((target_ulong)1 << flag));
 #else
-    env->msr |= (target_ulong)1 << flag;
+    ppc_store_msr(env, env->msr | (target_ulong)1 << flag);
 #endif
 #endif
+
     env->nip = regs->nip;
     for(i = 0; i < 32; i++) {
         env->gpr[i] = regs->gpr[i];
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index b78613f7c8..bad38f8ed9 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -261,9 +261,6 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
             __put_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
             __put_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
         }
-        /* Set MSR_VR in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
-        msr |= MSR_VR;
 #if defined(TARGET_PPC64)
         vrsave = (uint32_t *)&frame->mc_vregs.altivec[33];
         /* 64-bit needs to put a pointer to the vectors in the frame */
@@ -300,9 +297,6 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
         for (i = 0; i < ARRAY_SIZE(env->gprh); i++) {
             __put_user(env->gprh[i], &frame->mc_vregs.spe[i]);
         }
-        /* Set MSR_SPE in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
-        msr |= MSR_SPE;
         __put_user(env->spe_fscr, &frame->mc_vregs.spe[32]);
     }
 #endif
@@ -354,8 +348,10 @@ static void restore_user_regs(CPUPPCState *env,
     __get_user(msr, &frame->mc_gregs[TARGET_PT_MSR]);
 
     /* If doing signal return, restore the previous little-endian mode.  */
-    if (sig)
-        env->msr = (env->msr & ~(1ull << MSR_LE)) | (msr & (1ull << MSR_LE));
+    if (sig) {
+        ppc_store_msr(env, ((env->msr & ~(1ull << MSR_LE)) |
+                            (msr & (1ull << MSR_LE))));
+    }
 
     /* Restore Altivec registers if necessary.  */
     if (env->insns_flags & PPC_ALTIVEC) {
@@ -376,8 +372,6 @@ static void restore_user_regs(CPUPPCState *env,
             __get_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
             __get_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
         }
-        /* Set MSR_VEC in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
 #if defined(TARGET_PPC64)
         vrsave = (uint32_t *)&v_regs[33];
 #else
@@ -468,7 +462,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->nip = (target_ulong) ka->_sa_handler;
 
     /* Signal handlers are entered in big-endian mode.  */
-    env->msr &= ~(1ull << MSR_LE);
+    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -563,8 +557,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->nip = (target_ulong) ka->_sa_handler;
 #endif
 
+#ifdef TARGET_WORDS_BIGENDIAN
     /* Signal handlers are entered in big-endian mode.  */
-    env->msr &= ~(1ull << MSR_LE);
+    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
+#else
+    /* Signal handlers are entered in little-endian mode.  */
+    ppc_store_msr(env, env->msr | (1ull << MSR_LE));
+#endif
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return;
-- 
2.25.1


