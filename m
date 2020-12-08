Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4C2D3585
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:48:58 +0100 (CET)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkqu-0007P9-VO
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjx-0004Iq-PK
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:42 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjw-0008IQ-8h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:41 -0500
Received: by mail-ed1-x544.google.com with SMTP id h16so7674454edt.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U37hHuN0OpgX2w1oBuujDMHXNpPVE7yqxkafsImH4gs=;
 b=bj8lpzDv0pcFa4lwf8fzlPbDhwJKyLj0xnGCc7jaSURxAxkxSMGoJaZsaF1DSog2kP
 wP7i0U2GW5wYsCkpZO5GJuxmcKWv9k+Wff94WGTdmb3lIbEkYWaIn3SN26Zw44LCYwSl
 Aq6mGLf5wJ+jPoFzfM88tosSrnN01aAUPcccJGmU1D57pAdrGVo0WlDn16OP5v9uPD5/
 N9CTADrrUp+Wvh82ZBzZdGGM+ekT+swU/lUA3Jnbsm6IitwGaboS/etx7AoGZza2zecV
 pxDB6vuFkNuh3Ucrkh0rM40zKLS/whxxxLHEk6MFAnS/PqWM/DGVhF9uOjvQlTUlkvap
 94BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U37hHuN0OpgX2w1oBuujDMHXNpPVE7yqxkafsImH4gs=;
 b=E6eEcM75stcwi2OuajlOhLrDsgPo9cOiCZ6GPGxGV0zCljS2Aj0zCeef3KwcMpxN80
 MEYrDln8FphlFdsE3gwR8B7J8rQnn6kudkE3GxwRbW+ELo7Y21cws/1AVXjsBb66FpWE
 2wZo6jwbomRLaDelmfrjFnzeKBWRDFGLC1v8YO4APt7OwzPHsN3li+FpU4HI/Dbmefdm
 uQhWtSs/Gwq6sBqW4YNIitaYORM+X2+8n92SqRtlD07p/4c3qymv4pCw6od1cQKCvheF
 BwtygSQHJWJ0CNyCBT96uWPmUb1mCKUu3W0cdwnadxXjTkN/RRaeDJUqErhspb5F8BWs
 U/3A==
X-Gm-Message-State: AOAM531QgNPntNmXv086MTRmUToiF8n/pzYbeEAaoC3OV20uJFlgy6j1
 VNkDnVScCVsqDmk1pE5EGzhYNB0tSxs=
X-Google-Smtp-Source: ABdhPJwwoNYw4ioAbqKJDPkJgG+YPom9F2fhkkkIAYnZdftHC1g3W46Z+N1oeH2OVmx1EvPzuXUMeA==
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr25886606eds.134.1607459858089; 
 Tue, 08 Dec 2020 12:37:38 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e14sm16214855ejh.62.2020.12.08.12.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/mips: Convert Rel6 Special2 opcode to decodetree
Date: Tue,  8 Dec 2020 21:36:57 +0100
Message-Id: <20201208203704.243704-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Special2 opcode have been removed from the Release 6.
Add a single decodetree entry for all the opcode class,
triggering Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode       | 2 ++
 target/mips/isa-mips_rel6_translate.c | 7 +++++++
 target/mips/translate.c               | 2 --
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index 027585ee042..259bac612ab 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -15,3 +15,5 @@
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
+REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
diff --git a/target/mips/isa-mips_rel6_translate.c b/target/mips/isa-mips_rel6_translate.c
index c77f3ed57e0..9ac906b1f33 100644
--- a/target/mips/isa-mips_rel6_translate.c
+++ b/target/mips/isa-mips_rel6_translate.c
@@ -20,6 +20,13 @@
 #include "decode-isa-mips64r6.c.inc"
 #endif /* TARGET_MIPS64 */
 
+bool trans_REMOVED(DisasContext *ctx, arg_REMOVED *a)
+{
+    gen_reserved_instruction(ctx);
+
+    return true;
+}
+
 static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
 {
     return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8f0a0a3830c..788b5112a80 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -27145,8 +27145,6 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     int rs, rt, rd;
     uint32_t op1;
 
-    check_insn_opc_removed(ctx, ISA_MIPS32R6);
-
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
     rd = (ctx->opcode >> 11) & 0x1f;
-- 
2.26.2


