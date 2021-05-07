Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DA376CED
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 00:49:56 +0200 (CEST)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf9IC-0002if-05
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 18:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lf9Gf-0000QU-Tc; Fri, 07 May 2021 18:48:21 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:59898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@remexre.xyz>)
 id 1lf9Ge-0005ZP-DX; Fri, 07 May 2021 18:48:21 -0400
Date: Fri, 07 May 2021 22:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=remexre.xyz;
 s=protonmail3; t=1620427698;
 bh=Bh85YnUPln4SIL2SaK2pYqfWEZl4TSPuEHaEyCVygRM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=TyUpLhwQEinlOaWodnEi00MkFLn3pQIWfwS4itwzeK/c009yY7gsaBCDhZ0HDnzMl
 OiOEzVJB/M3RPslvLujYEHO8EUIGjIf8/xgC5nDtqFnonJokLGGQ04oc27HZbZnwIz
 PP4uTn7TSHe3mXdlkALgPJ3alC4FaXlzHH7MoD2Qd0VK8shNinW8XbzRwMC+5k8fBt
 iHG6H6KF+da2IgyYRZ4G0F0yuH98RN5gfL2rIpO9eGo2YNqY0/aMy4bQT4PYlvX0kt
 YWuukuxSnY49Po56SL2iXFmyHRCvKjx0uvtY6M4GYiVqzGTDKu1bBKsBmODV/wGtlF
 c/G/I14i7CRjg==
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Nathan Ringo <nathan@remexre.xyz>
Subject: [PATCH v2] This makes it easier to figure out whether a particular
 instruction was actually translated.
Message-ID: <FITkUaiC5DeyCU3e1T6EisgkkQ8Fnrwf2WZTBGE@cp4-web-031.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.133; envelope-from=nathan@remexre.xyz;
 helo=mail-40133.protonmail.ch
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 FROM_SUSPICIOUS_NTLD_FP=1.999, PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Reply-To: Nathan Ringo <nathan@remexre.xyz>
Cc: Nathan Ringo <nathan@remexre.xyz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index b12d0898d0..2c70eec777 100644
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



