Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF834A44F4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:35:58 +0100 (CET)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUyT-0004Ag-Eh
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURt-0001va-KW
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:17 -0500
Received: from [2a00:1450:4864:20::12e] (port=45870
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURn-00042j-Vn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:17 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o12so25964558lfg.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vi1Tgy/IbE0IvvHZZuVY5QrlYxeUvg3PBjevFW4of4Y=;
 b=tPQQVfDoC+Mho1i25LFTupK9rbbHxTBFVxo7AyIfESn/5WFilpf6UqmwjK33dgLoPV
 FJrS/B220UuzkyMM88fSq2w/KKRfRBxCXznkfNHPPOVluA0PWo8XIIOgOHGBKedsQcOi
 burUpUbWfjWKUW1GIdvLGd50uGsneke7GiHhOFKIHdfS/jaANZCm/4ZlKnPVDGI1c9OZ
 7qsKN6/lZg6Vdz/pd0X6ETRG5qjgFw/pHqsjFjymdrXJaYjf/w/GQhPbixkN5sDVEXE7
 92gYFAQfLd7EZNCuq1tzUkyB2qi+y/hOjQvsZLydbn9ndUifpadm0RYzIynw/izCCcFo
 3M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vi1Tgy/IbE0IvvHZZuVY5QrlYxeUvg3PBjevFW4of4Y=;
 b=6pgBMoDNXZFgauGXPWwO32cCZ0ykLX61irb+r/vh4qOiYR7nl1DfDJd2s55Fliy4iH
 5PMbIaYdU8SOwJ6uY3WiThUtGvCKn0zFX6j5AWqnAunCn2fjzzlNxBL97aQfkJyBZfiT
 ybcsTfiV2eNWr5adeKwAPoktY/1rcG94XLUn4JU31sBSznzU8eJ+SUP11MM5U7he45FD
 QDyJr1Q7pGTBNC9Pdx5oD554QSC5ukp72z9vM6xbqJ6YSFO3WUPIX8HPLisJfcmVFtwx
 cO+LzmOURrWUa3/2kPZA0ztiyPwddMH6pAKr3pmJx+CRQj0/cqlenSmRpL5uSU4jQdwV
 V0nw==
X-Gm-Message-State: AOAM5327bOHveKl3OndlZ1/B2qkCJAyjID+kbXlDFcm0CHGCxKz2RwhL
 qQdcMyIxn+Mhijg+TZED5+YlbFxfqbxb9wzt
X-Google-Smtp-Source: ABdhPJxpweDmbFgUecv63L8IcpR0z8HkpgMcWF0NKE9bujveH2DJw7TI6XZuZU2K+HpeovuPPuvlZg==
X-Received: by 2002:a05:6512:52b:: with SMTP id
 o11mr15062836lfc.267.1643626930055; 
 Mon, 31 Jan 2022 03:02:10 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:09 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/7] target/riscv: iterate over a table of decoders
Date: Mon, 31 Jan 2022 12:01:59 +0100
Message-Id: <20220131110201.2303275-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To split up the decoder into multiple functions (both to support
vendor-specific opcodes in separate files and to simplify maintenance
of orthogonal extensions), this changes decode_op to iterate over a
table of decoders predicated on guard functions.

This commit only adds the new structure and the table, allowing for
the easy addition of additional decoders in the future.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v4)

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
index f19d5cd0c0..30b1b68341 100644
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


