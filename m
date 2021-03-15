Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CA33C657
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:06:06 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsXV-0007au-RL
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEm-0007cO-EL
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:46 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEf-0001ik-Ox
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:40 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w125so6923751oib.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GP7KN1O/N4US4bdn1IcXHif9taZ0y5n50rRX2Q2HUDY=;
 b=F620gfJeeuRvpaXMgCyk4HU0DyPD3V72S6urrgqtn6fW2hISBxlNweQbnC08tD+/so
 PjgRn0lQDg/Irn3W6N5wfkKXVTaY0mIOiv90yGBJS87GSn4R8DQKyEnz5WLush3m2AJE
 lafL2pxKIvR2ifoGLrrnNz3hVm2jU+ZfuYc8gmdMy0nraL7vROji4BV9sq4jVoEIQM8A
 hL55FRf9MjLy6fI88o1zCi8tSxLiCHsPIwTIc1P1T/OiHfB0gShUl5o7gQumWkYXWb1m
 cet872Q539CqlebKahWi2HWA/jCtmYojqlWlVlXsi3Gg39EQdTRasHXef5NNKQMziqEK
 mMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GP7KN1O/N4US4bdn1IcXHif9taZ0y5n50rRX2Q2HUDY=;
 b=NheHuH7eoYB05VM5ztUUtwy5rJdKWuMewx5QOjqVp/uQjiO8R6d6homUaI64oaUaly
 JFWUUlPwTJSFM2T8UIS4upwmkBJuhJJHP/7+GxwS93S9dfMDijsKVyGbFmY/Ks3J7qTm
 x6+wGHWn4f+8eAveAqaOqA2hHMHMDfDV6dPz03Ke8dYmM+Dsnpo9KRi4nroKiLWNskfg
 Y1to7/LYOYZMjygUhA8mmBqCAhwkfpL1vywAWBID+HvZdgowD2vBpn0+qmcRehChpsxk
 A52nR3DVyUf1oPn2fnBbVMa8hyOf6zHPx4dFr9XsQ0VV7yAw7JBHPh6E5RmswrY50avN
 smIQ==
X-Gm-Message-State: AOAM5323uR5QDNXjuyfCbOYS4tCjTRxUc6uEcxkBE+euDEIQA9OuzQpF
 HywB8knJmymH8uoEFK+EEtyJx2da0ZUjTyxk
X-Google-Smtp-Source: ABdhPJxPGyWoDqLEBHZdHXhUNJVdVpQ4stdOICkUeT2zt5O0GNxzJY2nbMcv/2Zc5TwQUYTXXyDu3A==
X-Received: by 2002:aca:4785:: with SMTP id u127mr338807oia.163.1615833996787; 
 Mon, 15 Mar 2021 11:46:36 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/17] linux-user/ppc: Fix msr updates for signal handling
Date: Mon, 15 Mar 2021 12:46:14 -0600
Message-Id: <20210315184615.1985590-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


