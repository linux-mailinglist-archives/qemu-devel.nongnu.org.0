Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FEE3DC83C
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 22:54:56 +0200 (CEST)
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9w0U-0004uS-N1
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 16:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amdeniulari@protonmail.com>)
 id 1m9uJQ-0002eL-OF
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 15:06:21 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:35167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amdeniulari@protonmail.com>)
 id 1m9uJO-0000mK-42
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 15:06:20 -0400
Date: Sat, 31 Jul 2021 19:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1627758373;
 bh=PdQyjeN9YnuFZNjyfqTN693QZi497zdonTwqBtONZRs=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=oFaqm+CQVS1rBxTyVTjIO3ZRhCdtAWLmWe86BTByHUo9BLOm9ysOoI7guLGzg+2dY
 bs2eFNvtciISlLJmh0HHVQ5ceFSHnFeLIeo5ZROan4k3P0FYJbFgSD2rg2pHE/2pR2
 V8KRiqPpRE+ZyoyuU6D996OxLJ9ToqzbGJwanbIk=
To: qemu-devel@nongnu.org
From: yqwfh <amdeniulari@protonmail.com>
Cc: yqwfh <amdeniulari@protonmail.com>, Daniele Ahmed <ahmeddan@amazon.com>
Subject: [PATCH] target/i386: cmpxchg should not touch accumulator
Message-ID: <20210731190507.9007-1-amdeniulari@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.141;
 envelope-from=amdeniulari@protonmail.com; helo=mail-40141.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 31 Jul 2021 16:53:47 -0400
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
Reply-To: yqwfh <amdeniulari@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniele Ahmed <ahmeddan@amazon.com>
---
 target/i386/tcg/translate.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aacb605..41386dd 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5366,7 +5366,6 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                                           s->mem_index, ot | MO_LE);
-                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
             } else {
                 if (mod =3D=3D 3) {
                     rm =3D (modrm & 7) | REX_B(s);
@@ -5381,15 +5380,7 @@ static target_ulong disas_insn(DisasContext *s, CPUS=
tate *cpu)
                 /* store value =3D (old =3D=3D cmp ? new : old);  */
                 tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, ol=
dv);
                 if (mod =3D=3D 3) {
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
                     gen_op_mov_reg_v(s, ot, rm, newv);
-                } else {
-                    /* Perform an unconditional store cycle like physical =
cpu;
-                       must be before changing accumulator to ensure
-                       idempotency if the store faults and the instruction
-                       is restarted */
-                    gen_op_st_v(s, ot, newv, s->A0);
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
                 }
             }
             tcg_gen_mov_tl(cpu_cc_src, oldv);
--=20
2.26.3



