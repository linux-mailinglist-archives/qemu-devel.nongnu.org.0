Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7C6B0FDA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx86-0004M9-RF; Wed, 08 Mar 2023 11:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx82-0004GA-Du; Wed, 08 Mar 2023 11:59:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-00041t-Nm; Wed, 08 Mar 2023 11:59:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2CB25400F4;
 Wed,  8 Mar 2023 19:58:22 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E2FC413A;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: (nullmailer pid 2098296 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 22/47] target/i386: Fix C flag for BLSI, BLSMSK, BLSR
Date: Wed,  8 Mar 2023 19:57:25 +0300
Message-Id: <20230308165815.2098148-22-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We forgot to set cc_src, which is used for computing C.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1370
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114180601.2993644-1-richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 99282098dc74c2055bde5652bde6cf0067d0c370)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/i386/tcg/emit.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 99f6ba6e19..4d7702c106 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1111,6 +1111,7 @@ static void gen_BLSI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_neg_tl(s->T1, s->T0);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1121,6 +1122,7 @@ static void gen_BLSMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_xor_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1131,6 +1133,7 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-- 
2.30.2


