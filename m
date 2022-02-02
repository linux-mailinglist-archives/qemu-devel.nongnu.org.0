Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A64A6995
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:22:01 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4LQ-0002RG-F8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tO-0000eM-1Q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:02 -0500
Received: from [2a00:1450:4864:20::12a] (port=44698
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tL-0003Dm-Tv
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:01 -0500
Received: by mail-lf1-x12a.google.com with SMTP id u14so37299431lfo.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tte2MYEQd98fRo66PuCnKQWyUmxblk2q700Ow1azkF0=;
 b=phM+y6v7WMLvyeEJHcTz0d/P5oE9UMIvAwWDu/D1eetVLaRHHruNimSHdxW9VkEWSF
 LkeEsn/PxvqCSOLv7nmPE9WITHjBmwM+6ifpQhm0XDKLtrly/J92WCA2AL4ksr9nUEbF
 Jqbxp+10lJkO3YYMFbeb67AuqCjdLcIWtV0dSb1p7v++0nJEdIxlrDBsHNIukdh4oZ/b
 es8jShKuVU5E3rSgPMZSQ02mdlhfdQQRS7vRqFN3kASxBLEMuRPP27viiyThU2h9R9zK
 QFxW9Xhv2zukQduInj+bH00w1Be5xRMGqa/hjw4OhxenO0gkDBsmndii5uPx2a2J/Brm
 MCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tte2MYEQd98fRo66PuCnKQWyUmxblk2q700Ow1azkF0=;
 b=7uCTQdrOBvbD/Vwz7E4ivlpq8rGpQJnCdkQyHhUmNl92njpYL/wJBKLkX80CuTKrML
 LbaQ7NAAx0NysDqMxjwh/LKCvDYkWp48YAWnQ+h9obq3+NNSEjIwCFKr/JbHrWxSldj+
 qJKhzQTFibrWArINwaxGPNxYuIY1Km8K+hqUfwIjT3JIeIPS95RnauzQD0tqQLX3krj8
 9udS0C7NgleVxCQ/kDCrEQVtNDAea8GtyfExnQtGvuhhoDPXLwJN6waE6FgtucjMU8zn
 hvkeCq3VA3yYOjTMZu2ggCVu3CPIbqIODr4dTKHAZYFNjoV0lsv7WXBE8G6ugSvBmwmn
 6tow==
X-Gm-Message-State: AOAM531XFKsJwm2FZI1ULYEF+Tajm2v8tCHxi0TgDyOOQMRiX34/eMwo
 pWmZgQCv0+2SbGjHc7yaZOwuxrcmMt/BedVF
X-Google-Smtp-Source: ABdhPJxwW9NXsc3cWPtMWVPEOxvqCXUBh6jmv6qCDEvsAhR6cyjOQctJJ80PANa7M6dgMM3QFNH7nQ==
X-Received: by 2002:a05:6512:12c4:: with SMTP id
 p4mr21397621lfg.39.1643763177926; 
 Tue, 01 Feb 2022 16:52:57 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:57 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/7] target/riscv: iterate over a table of decoders
Date: Wed,  2 Feb 2022 01:52:47 +0100
Message-Id: <20220202005249.3566542-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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


