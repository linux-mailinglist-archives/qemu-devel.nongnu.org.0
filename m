Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B55BB801
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:34:38 +0200 (CEST)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZW5l-000596-CM
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVxB-00064h-C0
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVx9-0006tc-Q2
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NW4O2OYXHBJjZEKEQraf4GMwlYM5sfANUODCuhXnzvw=; b=hoqAXSu5oVY3Di3gyGnFGyvdI+
 TAMw3aO51K8ZfjNW1woma6GuarPwNuh32hWfEMba25K5fxvdIkpHd9orrW6qlWkJMT4Mz+v0fe4aw
 SsE1+w52IEYgymWBXYy9SFHn1Y5TSGIYwnVtni44dlLaNmq7gwiLSNmEL0JOLtWlyO2EDjj4GFI1g
 AkmeUua50h4yVqgYCLhxZLMvCUkt6FnUWBwi678f60F8qNnwRNi3qdhy6HSaJU1UjKmPI7+1DNG2/
 h8K9+LsdLG16VM+OtkGAQfzzKrB3UuZ6VnIAw1fFwUNrOcn+EvYhqH0cSqAEWqFZXccw3PrvBAPqx
 XjDcJtAErhxduBvl9pOShuKK5a+lXgMr0yUulBxwJIgp5XgUe3YrDcVfsjHzndx4gHwPhllFZk7I+
 emhtX7W8aFjugA6ZuQnEmn7G62+29apNlunLjSRBNCrRv3drpj7KT0uDFDTiy62WJAdi4yxHvWmRc
 xVIaJNXyq2x9Vg7LAx8+xqqm+jBfEnyHk6++oF58Lk5nWiIRvyhKAdmhu1Xk4vfbLgxF7g/o4z81q
 eMw8Tb8KJEcNWJF7woHNYRrqpytLXVq/T5CIzZtFFO4Ls4ZpvTQ5EyXxTb6z7TWqeEKNL1i/2CnRR
 Zchot2UCAsHWv8bKrg/D+7lLUBqTGUssi3WTDALF0=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVvR-000C7q-Bm; Sat, 17 Sep 2022 12:24:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sat, 17 Sep 2022 12:25:15 +0100
Message-Id: <20220917112515.83905-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/4] target/m68k: always call gen_exit_tb() after writes to SR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Any write to SR can change the security state so always call gen_exit_tb() when
this occurs. In particular MacOS makes use of andiw/oriw in a few places to
handle the switch between user and supervisor mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index be5561e1e9..892473d01f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2373,6 +2373,7 @@ DISAS_INSN(arith_im)
         tcg_gen_or_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -2382,6 +2383,7 @@ DISAS_INSN(arith_im)
         tcg_gen_and_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -2405,6 +2407,7 @@ DISAS_INSN(arith_im)
         tcg_gen_xor_i32(dest, src1, im);
         if (with_SR) {
             gen_set_sr(s, dest, opsize == OS_BYTE);
+            gen_exit_tb(s);
         } else {
             DEST_EA(env, insn, opsize, dest, &addr);
             gen_logic_cc(s, dest, opsize);
@@ -4592,6 +4595,7 @@ DISAS_INSN(strldsr)
     }
     gen_push(s, gen_get_sr(s));
     gen_set_sr_im(s, ext, 0);
+    gen_exit_tb(s);
 }
 
 DISAS_INSN(move_from_sr)
-- 
2.30.2


