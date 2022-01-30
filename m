Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852514A3C0C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:02:19 +0100 (CET)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEK9C-0008T7-KQ
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5F-0005b1-31
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:14 -0500
Received: from [2a00:1450:4864:20::133] (port=42851
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5C-0006ux-QM
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:12 -0500
Received: by mail-lf1-x133.google.com with SMTP id y15so23294403lfa.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PAKPKd9mIj3l4gs0yTZnhJcKa8QzklN44QVvVZe5SU=;
 b=TDO7Ee2xTFzatzz1Gsp9SBZEWKN+Q0l4XOaqk+lXlSaWulCqRbQbzyfWry6iPUQptt
 L0TkLxwKj4FzDDpjnm1tPlRIHq8COsyPTo9pZQpgd1QfZixkmMbfeQfu2NBe43DGyX0N
 7VTwpE7hPvbypXM0DN5iNfI2oJ+RVOO+RYYP6u8v90LWfeRAejc0a9guuOmTiNGMDIFy
 QQSHWFSYct1IToRP+8sUv0Xs21UJJWpRnu5HSo7mE811Dr/4wp4v6nDvU07FdP0EnaSA
 5Ou1M4zmEIo+QNuFcZ/0R3N+x91V8GXPKggIYC4drSMvUqeAcOrKlZE/PvXiQ2kWccZU
 9ybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PAKPKd9mIj3l4gs0yTZnhJcKa8QzklN44QVvVZe5SU=;
 b=diI6ykV4/tje2iihi3xZrvzFjg7BKI0whzqRyuUN4QJ8d6wIQY2e1lX5UQwBVY+zsm
 2U5jVAA9vmJJGEyaRwI0/LJ+1T5jI+zsaxcmglG1Uoz7edpNpSfkwzD/JT0gSDDXTUFR
 OdGkslV9NkFv6z3wNGwkCTkeXmmjimsCRwHTlf9QKLZ5jwWoGQr/OKPvzcrWNymg02sX
 CuAQLTR7yGrbSohGBVFEI3kacEwZKYreOSpZa8/J2RLnzWqyuFUkSy/DZBYZBKz04+yf
 fuJ9Q/IzeueldF9X9/3rMOOdNqi3TccOzvQvahTSA6ImBLfYRQ1NamhajzBjZoiazngD
 kAig==
X-Gm-Message-State: AOAM532DBfMBv1d5LdilzFaE/+pL02rb09S987vEh89HZDyWAEZJaFTU
 luHzfOI7mC4Ooh7WT70ffhyLpwgtGl2PDX/l
X-Google-Smtp-Source: ABdhPJxLrd0SlAYeju33FTNrcPHvwD/6dPQ1Nj+dJV/vxhUrGwqfi4tVRt0dWmpqRz7dkpEM2Eln7w==
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr8348304lfr.405.1643587087480; 
 Sun, 30 Jan 2022 15:58:07 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:07 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] target/riscv: iterate over a table of decoders
Date: Mon, 31 Jan 2022 00:57:57 +0100
Message-Id: <20220130235759.1378871-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
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

Changes in v4:
- add braces to comply with coding standard (as suggested by Richard)
- merge the two if-statements to reduce clutter after (now that the
  braces have been added)

Changes in v3:
- expose only the DisasContext* to predicate functions
- mark the table of decoder functions as static
- drop the inline from always_true_p, until the need arises (i.e.,
  someone finds a use for it and calls it directly)
- rewrite to drop the 'handled' temporary in iterating over the
  decoder table, removing the assignment in the condition of the if

Changes in v2:
- (new patch) iterate over a table of guarded decoder functions

 target/riscv/translate.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 441690846c..2742c32f1c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -111,6 +111,11 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa_ext & ext;
 }
 
+static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
+{
+    return true;
+}
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -855,15 +860,26 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
-    /* check for compressed insn */
+    /*
+     * A table with predicate (i.e., guard) functions and decoder functions
+     * that are tested in-order until a decoder matches onto the opcode.
+     */
+    static const struct {
+        bool (*guard_func)(DisasContext *);
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
+            if (decode_insn16(ctx, opcode)) {
+                return;
             }
         }
     } else {
@@ -873,10 +889,16 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
                                              ctx->base.pc_next + 2));
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, opcode32)) {
-            gen_exception_illegal(ctx);
+
+        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
+            if (decoders[i].guard_func(ctx) &&
+                decoders[i].decode_func(ctx, opcode32)) {
+                return;
+            }
         }
     }
+
+    gen_exception_illegal(ctx);
 }
 
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.33.1


