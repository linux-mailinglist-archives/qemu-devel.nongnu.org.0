Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF165536C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 19:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8mLd-00084c-0f; Fri, 23 Dec 2022 13:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLO-000804-Hl
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:34 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLM-0003J3-KX
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:30 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m21so8011695edc.3
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbPanwmGEsyNpcg5/8zNRyZ+NK1B8wFxHo3TiD41hqk=;
 b=baght61UtW1+eN+1HvjAjhM1eNX9o+GkahZJVXXoHKsiOoSVJvgdZUAmiVZjUOMr52
 ZeW13CZ3DRTwWlXk9X16T/KYOEANkyMDo+k2MuBSCt1zr1MIalhp5guzoPaJMMOS6Ftf
 kfrTGcnt9fnKHND0WQUqAuuTcKG378Bqf7jvQ9CPZkkc6oEKQttRQHDizYosaQiiRua9
 J5igf48w020jVixv0bK+JdwT01uWj8GiwaMKLwXYw4fbU6G+QzvqAN6zopTJkBKcOcH8
 vLuyK6ecc9I8Ur7e3vZJG+dK04pJQNwonAzvU+Km7uet9faykoxELYQyQ7PZ8tSL/VaO
 zxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbPanwmGEsyNpcg5/8zNRyZ+NK1B8wFxHo3TiD41hqk=;
 b=LBWmeeJCbNyG/XAVAOrJ6k3J+I3T+lSPzuQqdGhjC9zo5y+P+dS88Ug6kSXJSuQQj6
 L0+3uzekmGJ8tQMGi8GIpJPIG/OgIbSM2nino+2peQY1IhertGO3YL4TOaooyn6xcMb4
 Gr6SkiB6/ecDFzVyh8FkjHPz1t53F1hfaCN2B/1RaUwaHe2m2yiCt3pVlucsgh2Ud/u9
 YOly9DB1Y5VpQ3qVkCInVI0raMn+XDopcXqlR+cd7Y+i4ROLo8n83zDqLmx246heCaIt
 +2GKEPIl5wat23rHlYii0P3t07+ukOeKHPEEnMYHxQTFspxyOvNfOCCr/3LVugQsd5/t
 teSw==
X-Gm-Message-State: AFqh2kpO25QXKTaI+FdCL6FAc4jhmlDZZjejwCGUu1R2flxdCpUt5jC4
 3VcFQNgG0bQOMRX7R4AScyX+Tw==
X-Google-Smtp-Source: AMrXdXvhQ9QQ4TBhigTXpq6nlPsXK0JCSam0vzNC1RuB2bVDNl+Dp7RjdH7lfnQyyf3DDiPRSG53OA==
X-Received: by 2002:a50:fd07:0:b0:47c:5a78:da9 with SMTP id
 i7-20020a50fd07000000b0047c5a780da9mr8724074eds.22.1671818426954; 
 Fri, 23 Dec 2022 10:00:26 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:26 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 05/15] RISC-V: Adding XTheadBs ISA extension
Date: Fri, 23 Dec 2022 19:00:05 +0100
Message-Id: <20221223180016.2068508-6-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBs ISA extension.
The patch uses the T-Head specific decoder and translation.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Split XtheadB* extension into individual commits
- Use single decoder for XThead extensions

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 ++
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 15 +++++++++++++++
 target/riscv/translate.c                   |  3 ++-
 target/riscv/xthead.decode                 |  3 +++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b5285fb7a7..17273425a8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
+    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1066,6 +1067,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
+    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0ac1d3f5ef..5f68cb1e1e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -467,6 +467,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
     bool ext_xtheadbb;
+    bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index a55d1491fa..fb1f2c5731 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -28,6 +28,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADBS(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadbs) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -191,6 +197,15 @@ static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
     return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
 }
 
+/* XTheadBs */
+
+/* th.tst is an alternate encoding for bexti (from Zbs) */
+static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
+{
+    REQUIRE_XTHEADBS(ctx);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
+}
+
 /* XTheadCmo */
 
 static inline int priv_level(DisasContext *ctx)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8439ff0bf4..fc326e0a79 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -128,7 +128,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
-           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8cd140891b..8494805611 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -58,6 +58,9 @@ th_rev           1000001 00000 ..... 001 ..... 0001011 @r2
 th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
 th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
 
+# XTheadBs
+th_tst           100010 ...... ..... 001 ..... 0001011 @sh6
+
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
 th_dcache_ciall  0000000 00011 00000 000 00000 0001011
-- 
2.38.1


