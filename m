Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD3425A17
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:56:31 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXd8-0002iH-Cy
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUV-00043f-6n
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUR-0006uB-Re
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so5696184pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H87ppfQkVyn08RbjkKfsggea9i4sKXYDOxyW8HmfWE8=;
 b=fV0kqIUDiKSKvCiP1Ww839PeyZJXTJJg5selSPtXja45mDHsH5F1LaJvvmNZJQc+b5
 l9V7hgQ2fE6v0drMW+0i+i8h0ikxEOGerm7PoRTGse2ldigbTNpwiPc2rfzclf9wlmNc
 kKPf5FdtL1+Q0ROw6QZQRZW09JeKdlrcD61J/wfvvIfYL7g5naoWU7MkCqES3TecEjFW
 Y3/2YV4QJ1wg0xRA6qaBPZRWcG0z4478xlVXBtjmZPtFNQh5uzWBZnxeH82d01rKIapd
 33TnOyMrTajAurHWy4JSvdIX9u7kc0XvP/5rrLG+Cgop5r3e9SoU5XmtsbV2z9Ygwmwf
 pjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H87ppfQkVyn08RbjkKfsggea9i4sKXYDOxyW8HmfWE8=;
 b=kXpk4xNQLSMxstDY8LpqXm0OOgn2osTJ7CJ3MK0Nbm/QNmu6Y7HCvVMRfaBl1eMpea
 sLoXOLWc+av67S6iLjCuRGYfaeoxb0efX/WycmcTiwiRi3NBY/NvPAD2aHxVpQw2QdbC
 ul5Uc3wUK/rUoxGPckblzQjvm1ElUktu1OMoyfz6MLtXF/LfDfOC7cwMlnF6p+oKTRgW
 jF1UuQtOxmr7nisLu/wToISlOdA/r9WudHIqMYxIfPYFxQzuiqrWW45dNeUT6qNJBXzv
 X9AbAtwQPFUxbyt/xh6q3p/5qAWbGU7XixuU2bov1E28GKCI50mQm34g2JzwigSnKtso
 bcJQ==
X-Gm-Message-State: AOAM531mj51MNILf0nkOZuGznQeEpJCdnIzOx40vidGSxtW0oSK7dupz
 jea7oGNTyv00RlttTL6x/oYvESRn3CLeYQ==
X-Google-Smtp-Source: ABdhPJyLiWsAzmw1BQ/RA13bBFx2+qZOwE2IIg1HmNkC/wh3xKAwlZEb4tlG11YGiuCgAEu3dCy9Hw==
X-Received: by 2002:a17:90b:4f4b:: with SMTP id
 pj11mr6456275pjb.4.1633628850162; 
 Thu, 07 Oct 2021 10:47:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Thu,  7 Oct 2021 10:47:17 -0700
Message-Id: <20211007174722.929993-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for RV128, replace a simple predicate
with a more versatile test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7e7bb67d15..5724a62bb0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -91,16 +91,18 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 }
 
 #ifdef TARGET_RISCV32
-# define is_32bit(ctx)  true
+#define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
-# define is_32bit(ctx)  false
+#define get_xl(ctx)    MXL_RV64
 #else
-static inline bool is_32bit(DisasContext *ctx)
-{
-    return ctx->xl == MXL_RV32;
-}
+#define get_xl(ctx)    ((ctx)->xl)
 #endif
 
+static inline int get_xlen(DisasContext *ctx)
+{
+    return 16 << get_xl(ctx);
+}
+
 /* The word size for this operation. */
 static inline int oper_len(DisasContext *ctx)
 {
@@ -282,7 +284,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
 
     if (ctx->mstatus_fs != MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -341,16 +343,16 @@ EX_SH(12)
     }                              \
 } while (0)
 
-#define REQUIRE_32BIT(ctx) do { \
-    if (!is_32bit(ctx)) {       \
-        return false;           \
-    }                           \
+#define REQUIRE_32BIT(ctx) do {    \
+    if (get_xl(ctx) != MXL_RV32) { \
+        return false;              \
+    }                              \
 } while (0)
 
-#define REQUIRE_64BIT(ctx) do { \
-    if (is_32bit(ctx)) {        \
-        return false;           \
-    }                           \
+#define REQUIRE_64BIT(ctx) do {    \
+    if (get_xl(ctx) < MXL_RV64) {  \
+        return false;              \
+    }                              \
 } while (0)
 
 static int ex_rvc_register(DisasContext *ctx, int reg)
-- 
2.25.1


