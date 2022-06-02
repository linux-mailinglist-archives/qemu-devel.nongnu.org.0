Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C376153B8D5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:13:20 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjhX-0003vZ-RX
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTS-0000Uf-0W
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:46 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTQ-0001DC-6z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MacWq-1nLl1u2Qwc-00c8yo; Thu, 02
 Jun 2022 13:58:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/19] target/m68k: Raise the TRAPn exception with the correct
 pc
Date: Thu,  2 Jun 2022 13:58:21 +0200
Message-Id: <20220602115837.2013918-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ltkQRhIAjDRTaKjTXT+IRcKvQIyZQsLXbUR9bDbhZ79QlzA6Q4m
 gB0AQaMf/3s0NKG/VvSD6eANX2L/uUX+nvGLfPSfMQCOL4veC0hFuDi1buNZtS/Yz3vpI17
 u+YtGWIthZgFUkQzC1oorZRbXUkjj67P1B/0Pb2cpKd20IpwWRpgp+buOVk2j9snmb1OFhN
 0k3Gt9dVFf1evam+NG8pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rajuMxlQMPg=:COhWzAfA/M6RrO2jQH0iqv
 4jfxgAeixx48fK2tQ+hnyuLJQ34+AfafOT7LDYbk3Wlk2xKcgDVYckbHuJ/Xs3mmbNbfJ6HRK
 IHg+93U8VsVuD9MTCDXErkDseb+lnOIjMApBP96NOFRvIvxg2T8WqNhj34LofaYSUSIAqNqBM
 jt8IjCQmVY/+U19kieBAaou0IGJN5OB6fsEwnmDNXouiuQHcXBIFw6IuggwcYh63vA3J+SdHw
 HHMzxB9VfX3nLFYAFXjv31g5WrElk2Zc/jwMFxD0zxh1Jp84ABrR7rAwUVaGCuyasNYPasYMa
 vPLrOkVvrNtXkdi3WWT+4LNqfzkZi1CyzvYV5rf520n4p4cuWoaiphe9ic1Avly4mLSpiBtQH
 UQgpiQK11H+QxpB1uyiIfj3tmqG3BBwLF/Y6hdqFtigl4ckiFuLn+PGKpsnwYID4PotOAka8K
 aHr1qGqk8u1wQbLZoztl+i0HZkILDlGAobZGaDtuNYIaFZI3Gek2hJUrGbUG2U4HQWwHciH1P
 DFjm6OC+m2pgiJWhMtefTnGo/ucJBYvEHu8cFYR1V9TSZwdCd0q0vZ1N5CXg/aw5n1vztDF3s
 KdRJJTlEoOrWxggBvLPHA2emiciMqT8XYQG8UIRrl+Y0ODccTunCEYX/npWZToEGNon92sVeE
 9+CbvqLkfEFuxIz2jVWqbDrscSvg5SN1daFr3mHQko+o9IfLJf5H2f3nqxWyRBA+CkEOthFxW
 EqzPVkyV7LAp4Q7W+2PpGjXQRv2/bh3O3ytfjQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rather than adjust the PC in all of the consumers, raise
the exception with the correct PC in the first place.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/cpu_loop.c | 1 -
 target/m68k/op_helper.c    | 9 ---------
 target/m68k/translate.c    | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index d1bf8548b747..56417f7401dd 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -56,7 +56,6 @@ void cpu_loop(CPUM68KState *env)
             {
                 abi_long ret;
                 n = env->dregs[0];
-                env->pc += 2;
                 ret = do_syscall(env,
                                  n,
                                  env->dregs[1],
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 8decc612409c..d30f988ae089 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -217,11 +217,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cpu_loop_exit(cs);
             return;
         }
-        if (cs->exception_index >= EXCP_TRAP0
-            && cs->exception_index <= EXCP_TRAP15) {
-            /* Move the PC after the trap instruction.  */
-            retaddr += 2;
-        }
     }
 
     vector = cs->exception_index << 2;
@@ -304,10 +299,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
             /* Return from an exception.  */
             m68k_rte(env);
             return;
-        case EXCP_TRAP0 ...  EXCP_TRAP15:
-            /* Move the PC after the trap instruction.  */
-            retaddr += 2;
-            break;
         }
     }
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e4efd988d2db..22e5379d3c64 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4860,7 +4860,7 @@ DISAS_INSN(wdebug)
 
 DISAS_INSN(trap)
 {
-    gen_exception(s, s->base.pc_next, EXCP_TRAP0 + (insn & 0xf));
+    gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
-- 
2.36.1


