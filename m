Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062136E27E7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:03:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLtC-0002LF-78; Fri, 14 Apr 2023 12:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLt2-00020t-R9
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:02:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsu-0007IC-9g
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:02:51 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1842cddca49so22636671fac.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681488166; x=1684080166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcIjP4leyqTCDqA3jCQ9aon4GwK6cfhvsVFfSZZr4Ss=;
 b=jXaul5JtLsf7B5ZYXyf2ViGMBF16dUHBxAOOKu3hCRfWF/yrAZkyY6dMNR/IuVEjt+
 z+70I6oG2T38e6xLbySKsZXei8YIX3743xk616S+KlbFwvG3NtJKe7Jp2zpU89w4oKjd
 lC5JRM3Y1zVPycAUgwKYJ57VUn45wjB4mzwnx437Ths0FMCTvVqQ16mPzXt+cE97Px0Y
 iWPrnX/Mj13w0rEXlVwVypV3HBBQ93dvBft0vbBu7M15A1zjZIOwxSeQ9jcqZdya7Xn3
 DXWmyMcBijpoPJjdNnhLh6X6rFYygeCD/4Ban4NTXYLv0uGDp2b+ja9rw8SNbZG2CWOD
 LMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488166; x=1684080166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcIjP4leyqTCDqA3jCQ9aon4GwK6cfhvsVFfSZZr4Ss=;
 b=hTa4OCdgIMwMUVoT+R/XtyzUx1YrMy6/eAd8VM/ZBxpiaAt91sP/Nyr3W5dgQyVEFy
 BzwH4OoVron0ojrlgDUpaPa3V5BbnQYgmcYYFHGox2fpW2nNdUdvonm+kfvRZdvh5ieH
 GhMTwq3pBAg7EjcxxZrCluTRA8tkOYX6tdn9zqILebYLJ6crIeKBX+cJZevE6d9fqtot
 q8vZl+RSaxdNWbSELI5AXVzNnB+rAZIky3QcA9gWkKAEVMRvNsbdY5t49MFnw0vmFifZ
 sAikrt7FgVEf28CJhxNN9+1dd8R17QZ+uZl5zo2X1FGpDVaH9bG1BmSKXd2HjkD11vSY
 T2Gg==
X-Gm-Message-State: AAQBX9d02rwjNzM4FLmpjuDG6nus3iB53vVahFsTm6kgO1uVwK3VFFPK
 fi8Pqkr9h8DxXm/FnudIU82iBeFSx1lz2FSk3txorg==
X-Google-Smtp-Source: AKy350ZERZCPkelQkCvgwaxSZ4+yEE5TSh6jSwAV7hyNBw5ZzVQjV0gxYLr6vD7tY3jx+tjcIw0Slg==
X-Received: by 2002:a05:6870:a448:b0:187:8537:e432 with SMTP id
 n8-20020a056870a44800b001878537e432mr4104531oal.54.1681488166260; 
 Fri, 14 Apr 2023 09:02:46 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a4a5706000000b00524fe20aee5sm1794323ooa.34.2023.04.14.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:02:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 3/4] target/riscv: check smstateen fcsr flag
Date: Fri, 14 Apr 2023 21:32:01 +0530
Message-Id: <20230414160202.1298242-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160202.1298242-1-mchitale@ventanamicro.com>
References: <20230414160202.1298242-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

If misa.F and smstateen_fcsr_ok flag are clear then all the floating
point instructions must generate an appropriate exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++++----
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++----
 target/riscv/insn_trans/trans_rvzfh.c.inc | 18 ++++++++++++++---
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 2c51e01c40..d9e0cf116f 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -18,10 +18,15 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ZDINX_OR_D(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zdinx) { \
-        REQUIRE_EXT(ctx, RVD); \
-    } \
+#define REQUIRE_ZDINX_OR_D(ctx) do {           \
+    if (!has_ext(ctx, RVD)) {                  \
+        if (!ctx->cfg_ptr->ext_zdinx) {        \
+            return false;                      \
+        }                                      \
+        if (!smstateen_fcsr_check(ctx)) {      \
+            return false;                      \
+        }                                      \
+    }                                          \
 } while (0)
 
 #define REQUIRE_EVEN(ctx, reg) do { \
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 9e9fa2087a..6bf6fe16be 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,10 +24,26 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
-    } \
+static inline bool smstateen_fcsr_check(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    if (!has_ext(ctx, RVF) && !ctx->smstateen_fcsr_ok) {
+        ctx->virt_inst_excp = ctx->virt_enabled;
+        return false;
+    }
+#endif
+    return true;
+}
+
+#define REQUIRE_ZFINX_OR_F(ctx) do {           \
+    if (!has_ext(ctx, RVF)) {                  \
+        if (!ctx->cfg_ptr->ext_zfinx) {        \
+            return false;                      \
+        }                                      \
+        if (!smstateen_fcsr_check(ctx)) {      \
+            return false;                      \
+        }                                      \
+    }                                          \
 } while (0)
 
 #define REQUIRE_ZCF(ctx) do {                  \
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 74dde37ff7..74a125e4c0 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -16,28 +16,40 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ZFH(ctx) do { \
+#define REQUIRE_ZFH(ctx) do {          \
     if (!ctx->cfg_ptr->ext_zfh) {      \
-        return false;         \
-    }                         \
+        return false;                  \
+    }                                  \
+    if (!smstateen_fcsr_check(ctx)) {  \
+        return false;                  \
+    }                                  \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
+    if (!smstateen_fcsr_check(ctx)) {  \
+        return false;                  \
+    }                                  \
 } while (0)
 
 #define REQUIRE_ZFHMIN(ctx) do {              \
     if (!ctx->cfg_ptr->ext_zfhmin) {          \
         return false;                         \
     }                                         \
+    if (!smstateen_fcsr_check(ctx)) {         \
+        return false;                         \
+    }                                         \
 } while (0)
 
 #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
     if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
         return false;                                        \
     }                                                        \
+    if (!smstateen_fcsr_check(ctx)) {                        \
+        return false;                                        \
+    }                                                        \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.34.1


