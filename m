Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5B48DED4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:23:05 +0100 (CET)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86ci-0005wi-C5
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:23:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n86ai-0003qB-2W
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:21:00 -0500
Received: from [2a00:1450:4864:20::12e] (port=35534
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n86af-0004JW-Qm
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:20:59 -0500
Received: by mail-lf1-x12e.google.com with SMTP id g11so23624611lfu.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgQ8Uu9yMk7B6VogfgIrR+ppQRO52043xJsktZc86SA=;
 b=qQ3iq5giEP1p2JRiEgLr6fVRGLVt8Bd76Mu8FaDzYdC+rlc3xX21WKsCG7kgaiBAa4
 cEcgcf/WdODoRB7va3vdThJ7wvirUGfoiDlwjQPWVyMm2bGyejLCAHORn2IcBPLiH47e
 7SQ10Vcs/e+neeqmyzjtj0iSK+9IFdW0jWibl1oOzFwJGvPCMQU8bZOWB9IuAvQB40QW
 aTQUpqDAzcULck0xyfCdKUmg9ivGhZ4KGu6p/oorDvKp8p9yTc2IpjaMbmTW6ZMAwn8u
 obRkT5ea/WLWpHh1XWQrvV6Ac0BahK50aw53q846Oz2yKaNwFN23G3Ae3P6wtx8JekyW
 KZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgQ8Uu9yMk7B6VogfgIrR+ppQRO52043xJsktZc86SA=;
 b=2agyVz9k/fkDoXC9zQB0Q2sETPlwfVD87yj3nYL1GZUYLTcUPJ6CyvLwEX167G1WQE
 tSc+Cuw6AeeObr4jGRf6iyE9iBJu231Xtgu0nUlMwAzVEzjWlhhJOrLoWSctoyinjOBs
 GkQKYNMdoDlsHrmcROCb9UZ+zzpFxPFx0IksIa1ACNW2nfYvlWA1yCvMkRSlkvmK9Mnf
 0F0gHpeLwjC11Vp6LfWNctGCEbgiRpTCq5aosdrgG4UeaizqpvZBpOk0spRwOfZpRo29
 e21fex2p6BQwP5qvG3C+G36n6XFHbEs0z2nPIcVB9WLIalydFrcDeURzdeo4EfEiX5cm
 CFOw==
X-Gm-Message-State: AOAM530qyYjW2uOzSIZApdzZSiqTfmWlX/VPnK/SEnQJ9fnLl2psBWXX
 R78lnH6FwHLP9QxYtJlQT5JBjO/0vqcjgNqu
X-Google-Smtp-Source: ABdhPJzNBAYr2rqpuEp23YYW3Dgxvr7d+5AOfgEuOmPHx7AHwV9gUfj/Twmujlu8ZfcAngPXHVuBvw==
X-Received: by 2002:a2e:8751:: with SMTP id q17mr1312462ljj.437.1642105244583; 
 Thu, 13 Jan 2022 12:20:44 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id h23sm371872ljk.9.2022.01.13.12.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 12:20:44 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] target/riscv: iterate over a table of decoders
Date: Thu, 13 Jan 2022 21:20:32 +0100
Message-Id: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Greg Favor <gfavor@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To split up the decoder into multiple functions (both to support
vendor-specific opcodes in separate files and to simplify maintenance
of orthogonal extensions), this changes decode_op to iterate over a
table of decoders predicated on guard functions.

This commit only adds the new structure and the table, allowing for
the easy addition of additional decoders in the future.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

Changes in v2:
- (new patch) iterate over a table of guarded decoder functions

 target/riscv/translate.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..2cbf9cbb6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -116,6 +116,12 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa_ext & ext;
 }
 
+static inline bool always_true_p(CPURISCVState *env  __attribute__((__unused__)),
+                                 DisasContext *ctx  __attribute__((__unused__)))
+{
+    return true;
+}
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -844,16 +850,28 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
-    /* check for compressed insn */
+    /* If not handled, we'll raise an illegal instruction exception */
+    bool handled = false;
+
+    /*
+     * A table with predicate (i.e., guard) functions and decoder functions
+     * that are tested in-order until a decoder matches onto the opcode.
+     */
+    const struct {
+        bool (*guard_func)(CPURISCVState *, DisasContext *);
+        bool (*decode_func)(DisasContext *, uint32_t);
+    } decoders[] = {
+        { always_true_p,  decode_insn32 },
+    };
+
+    /* Check for compressed insn */
     if (extract16(opcode, 0, 2) != 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
             ctx->opcode = opcode;
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
-                gen_exception_illegal(ctx);
-            }
+            handled = decode_insn16(ctx, opcode);
         }
     } else {
         uint32_t opcode32 = opcode;
@@ -862,10 +880,18 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
                                              ctx->base.pc_next + 2));
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, opcode32)) {
-            gen_exception_illegal(ctx);
+
+        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
+            if (!decoders[i].guard_func(env, ctx))
+                continue;
+
+            if ((handled = decoders[i].decode_func(ctx, opcode32)))
+                break;
         }
     }
+
+    if (!handled)
+        gen_exception_illegal(ctx);
 }
 
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.33.1


