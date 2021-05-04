Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3A83725A0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:56:44 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo31-0007Dd-Bo
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzp-00057k-EN; Tue, 04 May 2021 01:53:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38887 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzn-0004a2-J6; Tue, 04 May 2021 01:53:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK01nQz9sW1; Tue,  4 May 2021 15:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=Twg3ixSosYubY2S6kfpWfV4IThjGfpdxnG0ofrjJl5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wey+sXsWMpXtdyngiL5nCJRjXigGzkg59MtvR79TfxhMUiYwngHSPunLEMkLBc9RY
 477Q+iSWgE7KZuDOU/XPjtlKvmI4YvdfGM6+/d4UOQqI9M1VcbTbKzHYHM6LFzg+H5
 W173M41ZUFjqCgD3iJPgsoxg6LdNsKjMnYFQLLAo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/46] target/ppc: Move 601 hflags adjustment to
 hreg_compute_hflags
Date: Tue,  4 May 2021 15:52:29 +1000
Message-Id: <20210504055312.306823-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Keep all hflags computation in one place, as this will be
especially important later.

Introduce a new POWERPC_FLAG_HID0_LE bit to indicate when
LE should be taken from HID0.  This appears to be set if
and only if POWERPC_FLAG_RTC_CLK is set, but we're not
short of bits and having both names will avoid confusion.

Note that this was the only user of hflags_nmsr, so we can
perform a straight assignment rather than mask and set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210315184615.1985590-3-richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


