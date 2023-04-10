Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF76DC7B8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:14:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsHB-00010z-LY; Mon, 10 Apr 2023 10:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsHA-00010k-LK
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:44 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsH9-0000PA-1y
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:44 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a645fd0c6dso706495ad.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136021; x=1683728021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH0AYtZChXLjtc/B2h6+ykXauiAegX1zwBOxtyoSOKs=;
 b=nlz3SDbWLZ/KQtmzM1lIcBW5QjWXuXxOvGzuBMHWX0B3tJxDT9wQweYcwylCoIED/d
 ZPVgMcrmFx96kGAnKo8OQ18HJX4sLM3Fg+fxzfn54TjkjAuUM/73YfQY9AUxFzKdNRc+
 aZhEcBGuQiXrJf22qXLIYZRhrOGRw85tCvnGvGEJV+R56vCBr6b3XXh0SYvs4ufIoSyR
 3kSvZFl67X/sn5HoBEUgzVzue02gfloPf5d70Rfx2iOvS3QmT+j+upU4VO9IZeKQWbMo
 4F3aQtvpDP8avBud2keG6wTj1tOavoYV5FopIImxU7+ditw//D98h9ZuPsXnSpHxpaaY
 7nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136021; x=1683728021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GH0AYtZChXLjtc/B2h6+ykXauiAegX1zwBOxtyoSOKs=;
 b=UCgdGn2KrKOCqNO8c76tyiDnbBAwCyFdRtedgcSOXcdIHgsXzFJicmaPLKtdZsBWDr
 Je2v/V54IrfyDvV3aQz/5x8lThdzrZat+UZksg0qjhLR/Seg2vvKnGtJ5tatMpebk1yz
 H0+pkoBZIF60X7p+DGeXDx1vGsUfGMyVWxFbb6375ON6yP5oQkXL7eXkS5MUbt+LVT9z
 qePYllXVjPDg9Ez8gKMPZ6AUQzwNdVipBwbM/NE47gSspTip7m1Bvjn2oGrebIy2e0q5
 z+Pcey8szc+Pmn8rqFwtqQOa5preR4G+4KTKNNOOqKvNBA13daTdyddGtG2WfPqFfQs0
 fSJg==
X-Gm-Message-State: AAQBX9fBzi95htZiIAQlRhG1tXvomY0aS+P3TrT1J4s0RDWZEyo1IGd9
 qAJDYfhIeLFqmWv3y2mClZwHKYScz8K3fpeG25Zvcw==
X-Google-Smtp-Source: AKy350bSdGbiJCz+ly3EiCJWIAWpLT54F3GafVW0efcX09LkhvYnj5roOnY7LrX8PPtK24FgvVOJfw==
X-Received: by 2002:a62:384c:0:b0:636:a399:e81a with SMTP id
 f73-20020a62384c000000b00636a399e81amr4210261pfa.6.1681136021424; 
 Mon, 10 Apr 2023 07:13:41 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:41 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
Date: Mon, 10 Apr 2023 19:43:15 +0530
Message-Id: <20230410141316.3317474-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141316.3317474-1-mchitale@ventanamicro.com>
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

If misa.F and smstateen_fcsr_ok flag are clear then all the floating
point instructions must generate an appropriate exception.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 052408f45c..6173dace46 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,27 @@
             return false; \
 } while (0)
 
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx->cfg_ptr->ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+#ifndef CONFIG_USER_ONLY
+#define smstateen_fcsr_check(ctx) do { \
+    if (!ctx->smstateen_fcsr_ok) { \
+        if (ctx->virt_enabled) { \
+            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT); \
+        } else { \
+            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
+        } \
+        return true; \
+    } \
+} while (0)
+#else
+#define smstateen_fcsr_check(ctx)
+#endif
+
+#define REQUIRE_ZFINX_OR_F(ctx) do { \
+    if (!has_ext(ctx, RVF)) { \
+        if (!ctx->cfg_ptr->ext_zfinx) { \
+            return false; \
+        } \
+        smstateen_fcsr_check(ctx); \
     } \
 } while (0)
 
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 74dde37ff7..304bee1002 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -20,24 +20,28 @@
     if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
+    smstateen_fcsr_check(ctx); \
 } while (0)
 
 #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
     if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
         return false;                  \
     }                                  \
+    smstateen_fcsr_check(ctx); \
 } while (0)
 
 #define REQUIRE_ZFHMIN(ctx) do {              \
     if (!ctx->cfg_ptr->ext_zfhmin) {          \
         return false;                         \
     }                                         \
+    smstateen_fcsr_check(ctx); \
 } while (0)
 
 #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
     if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
         return false;                                        \
     }                                                        \
+    smstateen_fcsr_check(ctx); \
 } while (0)
 
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
-- 
2.34.1


