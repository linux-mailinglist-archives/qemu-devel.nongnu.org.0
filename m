Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF935ABCB
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 10:12:04 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV8ip-0000Ap-Gp
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 04:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lV6Ij-0000Tn-Qo; Sat, 10 Apr 2021 01:36:57 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:60153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lV6Ig-00054c-VP; Sat, 10 Apr 2021 01:36:57 -0400
Date: Sat, 10 Apr 2021 05:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=remexre.xyz;
 s=protonmail3; t=1618033004;
 bh=CSOBzHagurCWgOotca1o2f4UcDvcSMotjz8T4z2waq0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=j3oVEWazaBFfXVSwNXFpJIvW0t8C/jdfeNfj1r6+KqaItEigEm57bjuWV3ACJPGKx
 aBBTiahY9VaaszsaKwj3LG3+IvBjUA31TIQN0gpU/C1oGhf98oTS25O8VU/o+st2HM
 5Gq5mSmdCR9O3hiCky4FamwLUYmVgOKmMj2B7BpHx65R/0eXcn06UmsFqT30lp1jzy
 c+p3CbxWqK+cKeip0lteFANoipH3vM7XoRaQtIZxs9apmpx+/pGkdRMG+8UxAWs3Dq
 VW9iNogOucR6FlVKxSt/uwwoZH1RJAZSwJ8RgExZ7eRLCRgdrr3KQhBbI0HhW524b9
 AjLTFDWkQK5DQ==
To: qemu-devel@nongnu.org
From: Nathan Ringo <nathan@remexre.xyz>
Subject: [PATCH] accel/tcg: Logs num_insns in translate_block trace events.
Message-ID: <JQndof8da1j2RNAOkDSCTIUvBdZVZMa7QEoyl1Os@cp7-web-042.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.133; envelope-from=nathan@remexre.xyz;
 helo=mail-40133.protonmail.ch
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 FROM_SUSPICIOUS_NTLD_FP=0.402, PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Apr 2021 04:10:02 -0400
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
Reply-To: Nathan Ringo <nathan@remexre.xyz>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nathan Ringo <nathan@remexre.xyz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it easier to figure out whether a particular instruction was
actually translated.

Signed-off-by: Nathan Ringo <nathan@remexre.xyz>
---
 accel/tcg/trace-events    | 2 +-
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 6eefb37f5d..c227e56248 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -7,4 +7,4 @@ exec_tb_nocache(void *tb, uintptr_t pc) "tb:%p pc=3D0x%"PRI=
xPTR
 exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=3D0x%x"
=20
 # translate-all.c
-translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x=
%"PRIxPTR", tb_code:%p"
+translate_block(void *tb, uintptr_t pc, int num_insns, const void *tb_code=
) "tb:%p, pc:0x%"PRIxPTR", num_insns:%d, tb_code:%p"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f32df8b240..d43936b9b4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1916,7 +1916,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_ctx->cpu =3D NULL;
     max_insns =3D tb->icount;
=20
-    trace_translate_block(tb, tb->pc, tb->tc.ptr);
+    trace_translate_block(tb, tb->pc, (int)tb->icount, tb->tc.ptr);
=20
     /* generate machine code */
     tb->jmp_reset_offset[0] =3D TB_JMP_RESET_OFFSET_INVALID;
--=20
2.26.3



