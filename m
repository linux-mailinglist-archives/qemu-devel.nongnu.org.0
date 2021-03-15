Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA233C63A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:57:34 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsPF-0004sN-2c
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsES-00072M-Fc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:24 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEP-0001Y2-9O
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:24 -0400
Received: by mail-oi1-x231.google.com with SMTP id w125so6922949oib.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8V/dpCgOxiVauvo1HWnH9SJMMk44GHfb0bI5oWyk9l8=;
 b=FeWIng7OznLt8jxHJbocn9n1Y78GTPAQ0iS7l/9xG6w21MeJser2mLMIWaJH8Xijbs
 e2Gq44MESqNFEDTox+L/M+vHjLHj3wK/BWki8aoYT54f8sQ6zBhWR0cGuZCB0qUfcG59
 1STCPWycryKXnf7jzWLMTknfVvINgQO8xvmL9aZVA9g8/wEmIAiExlpF8VpPqTkvWSvn
 s1F3XtL1dVLa3t1HE2RJDxJ78U+cEaZx/BrTiqHRuDmu4enjoKKQXeeTBZh8xO7dzOH7
 KiOtt7ck/RqYF8BmNufQzp1mQvfK6UXKElEWHSEMlVJdbptdrBTWwzhQDM7SH+DvPHxt
 UbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8V/dpCgOxiVauvo1HWnH9SJMMk44GHfb0bI5oWyk9l8=;
 b=BZ46/CvIIv68t5QaLB/O9tktiW0TEXRnA1V1ke4ucWWWi5jb8Ge7cNKOsaKNX2Cy4w
 /lJN/uDTtKJIwZ0+lOpVkQpUVYPqpRF5TQTUjp8C5lSiU1gZ5EoJwJwDqZiDM0DKcpYO
 i9uPqVZL9yrwmXHaGQJ0NighObfxe3ZOB/k51DAKxnDkGnOuhL4OEBpxldnaRrpm03oS
 UPCk5s2nIdBftRogcUPe2Lye2I132H4Q/kKcCc/68HD7jopxaWkeiNfkXFPLLfkP5i99
 jVYrqVWoayZmGcnoSB3ktfJOa/P63cF6cEgbAP4+nMlwT7tKL8nawznN/eL5OmGo1PZ/
 RmLw==
X-Gm-Message-State: AOAM532M9LkqQVLOErzZpLOHBVn57Vi3FEPEEheXHZG/DMYLUrBqujS7
 LjmsFSa+Kh0KNnkJmuTk+BIoGFRpZ3nBBWMS
X-Google-Smtp-Source: ABdhPJz0b+xIkDiBpsinybPhViIA6A+pXAnxnZhDMtscNuUdBG2Bvtl/U/XghsGkgMm93rgRLD/GCA==
X-Received: by 2002:aca:1904:: with SMTP id l4mr346489oii.159.1615833980127;
 Mon, 15 Mar 2021 11:46:20 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/17] target/ppc: Move 601 hflags adjustment to
 hreg_compute_hflags
Date: Mon, 15 Mar 2021 12:46:00 -0600
Message-Id: <20210315184615.1985590-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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


