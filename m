Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF316A11D0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIz0-0000BX-LO; Thu, 23 Feb 2023 16:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pVIyx-0000Ab-UZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:18:27 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pVIyt-0007y9-Rs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:18:27 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 78A1C11EF54;
 Thu, 23 Feb 2023 21:18:22 +0000 (UTC)
From: ~vilenka <vilenka@git.sr.ht>
Date: Fri, 24 Feb 2023 00:13:27 +0300
Subject: [PATCH qemu 1/1] target/i386: Fix gen_shift_rm_T1,
 wrong eflags calculation
Message-ID: <167718710208.23058.11278141733696221981-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167718710208.23058.11278141733696221981-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~vilenka <vilen.kamalov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vilen Kamalov <vilen.kamalov@gmail.com>

gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation uses tmp4=
 at target/i386/tcg/translate.c, line 5488
`tcg_gen_mov_tl(cpu_cc_src, s->tmp4);`

QEMU fails to pass int3 in next sample, vs real cpu
-------------
push rcx
mov dword ptr [rsp], 010000000h
mov rcx, 01eh
sar dword ptr [rsp], cl
jnc pass1
int 3
pass1:
mov dword ptr [rsp], 0ffffffffh
mov rcx, 01eh
sar dword ptr [rsp], cl
jc pass2
int 3
pass2:
pop rcx
-------------

Signed-off-by: Vilen Kamalov <vilen.kamalov@gmail.com>
---
 target/i386/tcg/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9d9392b009..9048e22868 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1686,27 +1686,27 @@ static void gen_shift_rm_T1(DisasContext *s, MemOp ot=
, int op1,
     }
=20
     tcg_gen_andi_tl(s->T1, s->T1, mask);
-    tcg_gen_subi_tl(s->tmp0, s->T1, 1);
+    tcg_gen_subi_tl(s->tmp4, s->T1, 1);
=20
     if (is_right) {
         if (is_arith) {
             gen_exts(ot, s->T0);
-            tcg_gen_sar_tl(s->tmp0, s->T0, s->tmp0);
+            tcg_gen_sar_tl(s->tmp4, s->T0, s->tmp4);
             tcg_gen_sar_tl(s->T0, s->T0, s->T1);
         } else {
             gen_extu(ot, s->T0);
-            tcg_gen_shr_tl(s->tmp0, s->T0, s->tmp0);
+            tcg_gen_shr_tl(s->tmp4, s->T0, s->tmp4);
             tcg_gen_shr_tl(s->T0, s->T0, s->T1);
         }
     } else {
-        tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
+        tcg_gen_shl_tl(s->tmp4, s->T0, s->tmp4);
         tcg_gen_shl_tl(s->T0, s->T0, s->T1);
     }
=20
     /* store */
     gen_op_st_rm_T0_A0(s, ot, op1);
=20
-    gen_shift_flags(s, ot, s->T0, s->tmp0, s->T1, is_right);
+    gen_shift_flags(s, ot, s->T0, s->tmp4, s->T1, is_right);
 }
=20
 static void gen_shift_rm_im(DisasContext *s, MemOp ot, int op1, int op2,
--=20
2.34.7

