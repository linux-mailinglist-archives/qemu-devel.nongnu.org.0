Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F04A3C15
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:06:34 +0100 (CET)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEKDJ-00054a-2J
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5E-0005aw-VL
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:14 -0500
Received: from [2a00:1450:4864:20::229] (port=42670
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5C-0006uf-7Z
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:12 -0500
Received: by mail-lj1-x229.google.com with SMTP id a25so17105891lji.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jp9WyqSf1WckgAj3qkPMRXcjEWLfdcDo/JAmTg3jigo=;
 b=POBK0KnVFpuSup9Kl7Pe0gT1dOkMrwExRwWrmawsxmjSxruSN8LE+6CnmzDjnqnoUU
 uo0AUg4NSAi1MrG/tM2jTXARcsrE0U7DBhb1XVNgeBWK14QyAsvhoqi3sLQe+y/LZn30
 i5n4CGdT+iQtM34qimxdN1AQJBfz4MNtYs1pBH5Ms40jA+2k44TlMNmFyOjpjvZZNnam
 sQkLH/+OV1deMMhzCAWic/ySYRNPHm8yYo59pV6djLRDajmKVu0CA+JYjNBDM20c3FPz
 D3aRqMQNLh/mQ1ngVdlz4mOgTxiolPpsuo8HNh0o2ESIyxhj01bk10pj1WgkDmLgA2nj
 kU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jp9WyqSf1WckgAj3qkPMRXcjEWLfdcDo/JAmTg3jigo=;
 b=pG1xEdMEZoCRbe5rO3GaDKwY7yKu8FcrzTXzvoBmHE/m7GF6Q0xTnR1auZ2GcgeHHT
 xOWQJvLFmeifgK2DCEbabYkIMHkyN+nbCZyoux7Dbi/FlXG8yvnOoyEhVNbbOiwOlJgt
 f/Tbc1mz8N0R2zGNnHJIC0LHmybDVUm+yqI7MKyGe3bJwrgSLfJaXLZmk8KVSc90XYmv
 DUgZ1MpeYsMem0UlvMIDIDnAhkzDzhR0wNBu2TYeZHw22mBP7hHsxWHUvgg2gaXwMjCO
 40jLaJCrFDWysYErD5ir89M3SwxqxWsLiwBj/66b4XR0avXDaiLUt48VwwMD5AbsLZIG
 mLnw==
X-Gm-Message-State: AOAM530sbW2CRShBj4lPgql3i17jZvMJMH722UL5EbUoj1KVd0sRIJOr
 eeKsCzhemEyqJxWM2uvxTVE0eLZsdsXafVIc
X-Google-Smtp-Source: ABdhPJzQ/aWv8Q0Tk3xradjQrb2q3QgBsxAubLNQoQp8UjEfTmGZ2Nx6JSfD9eHVVV4KNEN9XrM5PA==
X-Received: by 2002:a2e:b7d6:: with SMTP id p22mr12155587ljo.182.1643587086566; 
 Sun, 30 Jan 2022 15:58:06 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:06 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] target/riscv: access cfg structure through DisasContext
Date: Mon, 31 Jan 2022 00:57:56 +0100
Message-Id: <20220130235759.1378871-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x229.google.com
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

The Zb[abcs] support code still uses the RISCV_CPU macros to access
the configuration information (i.e., check whether an extension is
available/enabled).  Now that we provide this information directly
from DisasContext, we can access this directly via the cfg_ptr field.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v3)

Changes in v3:
- (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
  into DisasContext) instead of going throuhg RISCV_CPU

 target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 810431a1d6..f9bd3b7ec4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -19,25 +19,25 @@
  */
 
 #define REQUIRE_ZBA(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+    if (ctx->cfg_ptr->ext_zba) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBB(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+    if (ctx->cfg_ptr->ext_zbb) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBC(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+    if (ctx->cfg_ptr->ext_zbc) {                 \
         return false;                            \
     }                                            \
 } while (0)
 
 #define REQUIRE_ZBS(ctx) do {                    \
-    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+    if (ctx->cfg_ptr->ext_zbs) {                 \
         return false;                            \
     }                                            \
 } while (0)
-- 
2.33.1


