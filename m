Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD442CC73
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:01:21 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malNI-0006LP-KE
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDh-0007cY-56
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDZ-00089n-38
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id y4so2686255plb.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H87ppfQkVyn08RbjkKfsggea9i4sKXYDOxyW8HmfWE8=;
 b=Gz6YhoNNp+oMZOFD2hQPsHJx7jxxKYWbE/7zKZe8Y4BjimllvOKwsWkVsgaBUZG2wA
 UskH1uDWSJHosUjEegPXLiZ83E+1R+5ThjakcVbwqr7/TEe1obLLyN2ExIg+0XwwIUop
 ElqISCAtN8xyQ5OVpUaYftvWgBqYYE9KDnC1CCJCEcwehSoj76p5hHXoI+aBK5pWfCtq
 92Hg5N4MzNEl4rzVHZMvgh4rP4i2cvXL4esP4mFiipd77eP8sOtRdHGTGT5q13PWiki8
 Sq1uTHkrnCTc4Gyw0a1OTSYW52U8WPPdoARZAdb234bG2v3oZ9P1Xwf+4cOu8VxBX2yf
 Kg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H87ppfQkVyn08RbjkKfsggea9i4sKXYDOxyW8HmfWE8=;
 b=EYO5i3X6pXZCGH9qhPr/HF2mC0uO2uou5Y2zU6Ck86eRt3rprxI5FwIACd5TbYtU5l
 MHF6Edm/wnKUoZC/O2OD+T4FdbKviSkoMLJo1XmgUyn4ZjANhDdUHbfYWrCcVgUGlpTb
 Jhkqqtg9O7JXubaOFB7wAt40iTRps0n7UyIgYPvxAQGtxqPKmQ9cKRgKzwBgTq2h4XBQ
 SFVAUXelItKOKXxdd8ycrHy26N53YZPQ+ah1lnDDlI5O3p6Ydp/3AUmnf9ZBr9C3LO2f
 YrYGlu+yId5wbaK3FsEDMeNIlVYZdbOgaxQBJVebgWA6l9cSIivGavLMAXoizpPOAVW0
 C8Lg==
X-Gm-Message-State: AOAM530YG6f6FvFfJ+nF0QzWp34RXNK8OT1Y673c9NmE84R4xEDb/tCd
 fRjcccbM1x6GtLk7XpazI669ezDkG8dUYQ==
X-Google-Smtp-Source: ABdhPJzyftLiqWABagjtNd/OgEXl2PS5JctbBlDiNugr19rfJMF/KgyCNr5f8hyuZ+qOlf5/ZQ/Qyg==
X-Received: by 2002:a17:90b:4b48:: with SMTP id
 mi8mr1692920pjb.26.1634158274424; 
 Wed, 13 Oct 2021 13:51:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] target/riscv: Replace is_32bit with get_xl/get_xlen
Date: Wed, 13 Oct 2021 13:50:59 -0700
Message-Id: <20211013205104.1031679-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
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


