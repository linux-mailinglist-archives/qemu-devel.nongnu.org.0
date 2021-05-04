Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334733725B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:12:50 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoIb-0002qr-9G
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo00-0005Fn-RV; Tue, 04 May 2021 01:53:36 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45969 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzu-0004h3-PK; Tue, 04 May 2021 01:53:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK3TXjz9sWp; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=9Q0vDRcy2WGfG9TN8BUHQg8bYCUSstmE97i7Vbf7JZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EHtLWjbjww+dIgUQ9FjO/CFpUljMUlGIvKr4XZAVP0wpKd4J6Kz2P4HpO4+jmG88k
 dr2ZcGxJi9xSf51zEzKyBpp4hB9BSJqMbaLIRno3vAMgILqJrq1IzldCkRkhYq52Cr
 lLkeyGkcTaizVVXUshIld/2opdfOx+T0stLCsglI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/46] target/ppc: Reduce env->hflags to uint32_t
Date: Tue,  4 May 2021 15:52:38 +1000
Message-Id: <20210504055312.306823-13-david@gibson.dropbear.id.au>
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

It will be stored in tb->flags, which is also uint32_t,
so let's use the correct size.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-4-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 4 ++--
 target/ppc/misc_helper.c | 2 +-
 target/ppc/translate.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fe6c3f815d..d5f362506a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1129,8 +1129,8 @@ struct CPUPPCState {
     bool resume_as_sreset;
 #endif
 
-    /* These resources are used only in QEMU core */
-    target_ulong hflags;
+    /* These resources are used only in TCG */
+    uint32_t hflags;
     target_ulong hflags_compat_nmsr; /* for migration compatibility */
     int immu_idx;     /* precomputed MMU index to speed up insn accesses */
     int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 63e3147eb4..b04b4d7c6e 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
     if ((val ^ hid0) & 0x00000008) {
         /* Change current endianness */
         hreg_compute_hflags(env);
-        qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
+        qemu_log("%s: set endianness to %c => %08x\n", __func__,
                  val & 0x8 ? 'l' : 'b', env->hflags);
     }
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a9325a12e5..a85b890bb0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->nip, env->lr, env->ctr, cpu_read_xer(env),
                  cs->cpu_index);
     qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
-                 TARGET_FMT_lx " iidx %d didx %d\n",
+                 "%08x iidx %d didx %d\n",
                  env->msr, env->spr[SPR_HID0],
                  env->hflags, env->immu_idx, env->dmmu_idx);
 #if !defined(NO_TIMER_DUMP)
-- 
2.31.1


