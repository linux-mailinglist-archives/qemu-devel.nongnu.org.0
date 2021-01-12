Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C072F2DDE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:27:25 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHpc-0000Bn-EN
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHBV-0003w5-OS; Tue, 12 Jan 2021 05:45:57 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56720
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHBQ-0003Su-VH; Tue, 12 Jan 2021 05:45:56 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id A087B60604;
 Tue, 12 Jan 2021 11:45:15 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 16/19] target/arm: revector to run-time pick target EL
Date: Tue, 12 Jan 2021 12:45:08 +0200
Message-Id: <20210112104511.36576-16-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

On ARMv8-A, accesses by 32-bit secure EL1 to monitor registers trap to
the upper (64-bit) EL. With Secure EL2 support, we can no longer assume
that that is always EL3, so make room for the value to be computed at
run-time.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76..8b6b7355c9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1094,6 +1094,22 @@ static void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
+static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
+                             TCGv_i32 tcg_el)
+{
+    TCGv_i32 tcg_excp;
+    TCGv_i32 tcg_syn;
+
+    gen_set_condexec(s);
+    gen_set_pc_im(s, s->pc_curr);
+    tcg_excp = tcg_const_i32(excp);
+    tcg_syn = tcg_const_i32(syn);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
+    tcg_temp_free_i32(tcg_syn);
+    tcg_temp_free_i32(tcg_excp);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -2818,8 +2834,11 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
              * then accesses to Mon registers trap to EL3
              */
-            exc_target = 3;
-            goto undef;
+            TCGv_i32 tcg_el = tcg_const_i32(3);
+
+            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            tcg_temp_free_i32(tcg_el);
+            return false;
         }
         break;
     case ARM_CPU_MODE_HYP:
-- 
2.30.0


