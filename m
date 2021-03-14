Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900033A740
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:03:55 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLV5l-0004Wd-Qt
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1Q-0002AM-TI
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:27 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1E-00027L-Pf
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:21 -0400
Received: by mail-qt1-x830.google.com with SMTP id g24so7648015qts.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8V/dpCgOxiVauvo1HWnH9SJMMk44GHfb0bI5oWyk9l8=;
 b=YV2ys1/XOmBjHplHbHMIT/G4mvsq//yroYsxC5weFxgCd2+bGkP6xc/WBEafSwS/bi
 uwjIzQk5v9U/NZUpT7l+/i5krbYj9cHQN3EVsfGAhlr1k7+/0riNh9NUyj6PBqwMLIyG
 pv+GARQ0vyguYvGyIfzNHcoDdjByvqoIJHAsiJdRQxubWvd08B4dGh5XK8m5YyNgrud3
 ZcD/s8sC1x2RmG75CaX9zhL7F+NpiMksRvs+qSrnZFPky0O3GbIuGlTFfHOg6xV5qzS+
 8Rh37EhK23plWFY44tlL0GwAFtgvOXjEaP6jzh28RI5JzEBAF8/EUw9FgshPsLTNNvAH
 7cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8V/dpCgOxiVauvo1HWnH9SJMMk44GHfb0bI5oWyk9l8=;
 b=NXwRud8rw+kQ+wcsjDjqPx4sJXeaF2ZGW++gLvfCVl4zBOQiGZBEM1DENuRHK1Xmc8
 Nzz4MLEJUnPwJIwe5QbqbTu2m6KoPWN9ol1pygVjl0ibJjF7uGUwZiN2fnHMQiMc2lsK
 1/VufEF9X8Sljoxv9sL1eqTvnurhN2r8xuRlo5qoM4jnbn/JJJaFI5/dpNG5mTdExIbk
 6TBPpm//OZprGXt9pUYLMr4FuAEoMTIy6vtFzNNoLSRTabzHeRfJh54CFyGB5RISEaoi
 0iMZeF0Bm1TrCu8FNGGA1k+f11j85tpc2Kr1oT1pov/6tGxQdsBZ9qdRoo66rS8H1WIl
 FVLQ==
X-Gm-Message-State: AOAM533NGvXCrA92UoueSuJ0G9qOhFOqoAP+ee1WsdAgnhgaFi3taPCC
 Kh/YNRHVSicCO4mFU73DSl0ESPLCmpvnh4j6
X-Google-Smtp-Source: ABdhPJyPWDDhGzRaIFJd4jdYLaoF6zjbiEFnuujLQMkMnVr7I1FaqrRs9k2wTtFh9dOWkaQpFlrxOw==
X-Received: by 2002:ac8:4750:: with SMTP id k16mr19265216qtp.239.1615744751648; 
 Sun, 14 Mar 2021 10:59:11 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/16] target/ppc: Move 601 hflags adjustment to
 hreg_compute_hflags
Date: Sun, 14 Mar 2021 11:58:52 -0600
Message-Id: <20210314175906.1733746-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep all hflags computation in one place, as this will be
especially important later.

Introduce a new POWERPC_FLAG_HID0_LE bit to indicate when
LE should be taken from HID0.  This appears to be set if
and only if POWERPC_FLAG_RTC_CLK is set, but we're not
short of bits and having both names will avoid confusion.

Note that this was the only user of hflags_nmsr, so we can
perform a straight assignment rather than mask and set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h                |  2 ++
 target/ppc/helper_regs.c        | 13 +++++++++++--
 target/ppc/misc_helper.c        |  8 +++-----
 target/ppc/translate_init.c.inc |  4 ++--
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..061d2eed1b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -581,6 +581,8 @@ enum {
     POWERPC_FLAG_TM       = 0x00100000,
     /* Has SCV (ISA 3.00)                                                    */
     POWERPC_FLAG_SCV      = 0x00200000,
+    /* Has HID0 for LE bit (601)                                             */
+    POWERPC_FLAG_HID0_LE  = 0x00400000,
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 5e18232b84..95b9aca61f 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -96,8 +96,17 @@ void hreg_compute_hflags(CPUPPCState *env)
     hflags_mask |= (1ULL << MSR_CM) | (1ULL << MSR_SF) | MSR_HVB;
     hreg_compute_mem_idx(env);
     env->hflags = env->msr & hflags_mask;
-    /* Merge with hflags coming from other registers */
-    env->hflags |= env->hflags_nmsr;
+
+    if (env->flags & POWERPC_FLAG_HID0_LE) {
+        /*
+         * Note that MSR_LE is not set in env->msr_mask for this cpu,
+         * and so will never be set in msr or hflags at this point.
+         */
+        uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
+        env->hflags |= le << MSR_LE;
+        /* Retain for backward compatibility with migration. */
+        env->hflags_nmsr = le << MSR_LE;
+    }
 }
 
 void cpu_interrupt_exittb(CPUState *cs)
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 5d6e0de396..63e3147eb4 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -194,16 +194,14 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
     target_ulong hid0;
 
     hid0 = env->spr[SPR_HID0];
+    env->spr[SPR_HID0] = (uint32_t)val;
+
     if ((val ^ hid0) & 0x00000008) {
         /* Change current endianness */
-        env->hflags &= ~(1 << MSR_LE);
-        env->hflags_nmsr &= ~(1 << MSR_LE);
-        env->hflags_nmsr |= (1 << MSR_LE) & (((val >> 3) & 1) << MSR_LE);
-        env->hflags |= env->hflags_nmsr;
+        hreg_compute_hflags(env);
         qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
                  val & 0x8 ? 'l' : 'b', env->hflags);
     }
-    env->spr[SPR_HID0] = (uint32_t)val;
 }
 
 void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..049d76cfd1 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -5441,7 +5441,7 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
     pcc->excp_model = POWERPC_EXCP_601;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
 }
 
 #define POWERPC_MSRR_601v    (0x0000000000001040ULL)
@@ -5485,7 +5485,7 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
 #endif
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
 }
 
 static void init_proc_602(CPUPPCState *env)
-- 
2.25.1


