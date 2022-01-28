Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D349FD02
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:43:33 +0100 (CET)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTPR-0002Ys-3I
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:43:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgI-0000CU-S1
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:54 -0500
Received: from [2a00:1450:4864:20::235] (port=44890
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgG-0000vM-Sp
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:54 -0500
Received: by mail-lj1-x235.google.com with SMTP id c15so9336998ljf.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TFlXHJhw+y0N03qSQu5XRUUUyDNRhlCyiaVHsCjinw=;
 b=klJ7U2IFQ92In1olWyiDz2vB5UXvfWwlBvY2PCQwuoIJ30DaRgHSjyH/hRtG9RyQ1d
 KVsj9AKVmUqTA7HOjMZf9tw4P6rM8tcV1Cagt4qgaoMNjwbN0P7q2poWpqEJSKfZlUQa
 xyCNe8FQ1pSgY4gT2yf8tqNG1d5h8Lau7SlaQBvsj6Gd64biUwyzgL9Qx7r9kX74yrhk
 /SxUePF3MhT4+uDwRYZrZlr9rJQXsuTcoYLGGWrcciK/zuS5nMdVZQ35FG3GeSC2Gh1m
 w9u3qegB7NT4WmHY1QxsbA0SK+P+2UpcKnYcMacwuoChtXGuX2M2RPSC2TEhD8DSPnF4
 od+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TFlXHJhw+y0N03qSQu5XRUUUyDNRhlCyiaVHsCjinw=;
 b=zrAbUkLd1WBloH/HHEJOOqnGgLH3/SNHVqMZkiFLhf4IRn5JbWhH2cc9+oPRiC74Kq
 tpWCvo73Ao9JJQgPtEV3g/xetNVifhQj0inrY3o6ZFjeYUah5R0Zc2PRDREvFprJ1Ua4
 TCQZXwvzMTRzUcGeHUnLhILapVnodf4TuZRMPl8ogP469Mx4k3lKMSRpu1oEu88yi6Rn
 sdMY2mnoS7yQ34kdN0k88eStQaqYk1XT0mYvGJi379+FqnZi2ONIUE0eqn19brvXKTdb
 ZvKvgTKNuzX7k/U+Qoq6jahD53SfihWXj7jjbbgKclkuwbcpPxOua4zSRgCOYbPfPvAI
 XXog==
X-Gm-Message-State: AOAM530DCpZ1Ni6fzkZH4jLYED8wY8XcRXpI2vS4CrcrFozNaIJ1Ys35
 jnA/XqOMh8lZTC1wYosZVEcVhQW4F5LIuVzm
X-Google-Smtp-Source: ABdhPJx1rQU+8gSziaIBMT8Nvi4VPI1xzcApH/weszliDw5Fx7AsKZd0HxFRRRuuLFpmj1JH/3mZBg==
X-Received: by 2002:a2e:b749:: with SMTP id k9mr6168696ljo.135.1643381811117; 
 Fri, 28 Jan 2022 06:56:51 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:50 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] target/riscv: iterate over a table of decoders
Date: Fri, 28 Jan 2022 15:56:40 +0100
Message-Id: <20220128145642.1305416-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x235.google.com
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
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
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
---

Changes in v3:
- expose only the DisasContext* to predicate functions
- mark the table of decoder functions as static
- drop the inline from always_true_p, until the need arises (i.e.,
  someone finds a use for it and calls it directly)
- rewrite to drop the 'handled' temporary in iterating over the
  decoder table, removing the assignment in the condition of the if

Changes in v2:
- (new patch) iterate over a table of guarded decoder functions

 target/riscv/translate.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 441690846c..38fdec2fd9 100644
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
@@ -855,16 +860,26 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 
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
-            }
+            if (decode_insn16(ctx, opcode))
+                return;
         }
     } else {
         uint32_t opcode32 = opcode;
@@ -873,10 +888,17 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
                                              ctx->base.pc_next + 2));
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        if (!decode_insn32(ctx, opcode32)) {
-            gen_exception_illegal(ctx);
+
+        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
+            if (!decoders[i].guard_func(ctx))
+                continue;
+
+            if (decoders[i].decode_func(ctx, opcode32))
+                return;
         }
     }
+
+    gen_exception_illegal(ctx);
 }
 
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.33.1


