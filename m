Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82562378C56
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:37:35 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5AE-0002IO-Hb
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z1-0005gS-Hs
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yz-0003Bb-Mc
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s8so16431030wrw.10
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U9vKrM9bJI0jCQePxjhGf8sVA44g3YewHq3oiebDm8s=;
 b=Se1ER2SSWEapC9xPC5ew5OHUHeLunBBxDOyTxCO3bq5yjWQfn9jdAPbiqJastWKEPQ
 CbS7+sLynsBXMdrjQeJT9u1JqBdoS723B4mUa6vKflFDI3AUTIwLXs8uyaUyDik0sjz/
 7KgFwP/a7bKb9cjc+euhI6aJGGq0DPB4xpXVrPQb+vXGe74/5xxCBHnilow+CmWh/iNB
 hIVI4g6QWGgLFt8i71umNz+0lMod1Ow0bL3VaYuH7NaIoQWOQFeXN3wjrF33hpZz1bW8
 yu0liS1HRUVeEXtd2XVVxCeGKimaO5YAhumJSwAcaxW4UaOcic/TG6xCV6nEwei+sWDW
 FJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U9vKrM9bJI0jCQePxjhGf8sVA44g3YewHq3oiebDm8s=;
 b=EnatuDZCHjjeqnmX0YQU6uhQDPxVyTH+NUFBdwRiz1IowJIUefFyBH+ATMjnwZRUij
 ym3MJUfhsMG7/6y26qEJCC2NhZxE+0yFLUE59Nk+vVt2pZrmWk1EjhInMrh8UDyQfYrK
 wESHCC+B+gDoY7jk5d7ntjcHdHXLJ5ejaBUYqgqDvZ4fUxT0U+oyyEk5cnameAWInYm3
 J6rNXX3AnnNWSWyrjF6iU3khqoKJPOdAW/oFCRo0Qeyo3wSYt5Gubx64Ffm9m1mDDMu+
 AzN1EZ1wL7ILMtFLWHBKKKnBb9W13SXZnsTaBMBAqwSSTOoPgmVJpbE9afHwHNUFgHry
 tNdw==
X-Gm-Message-State: AOAM531mPiM/QD0mLZokaF4p1QHfcN1HDCHlqh6vSAelAN9JomoECt6V
 a12kZX1GD0KlMMIK32rEG6k0WM7G5nIgcw==
X-Google-Smtp-Source: ABdhPJyMCZyJY1Fk8X0lxONV7DePSZUsvoa9RHGs2gu+Kb7ub/Ta98RmdNL8+z85Z4QynCJZbZ7tQQ==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr29657970wrt.371.1620649556489; 
 Mon, 10 May 2021 05:25:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] target/arm: Move vfp_{load, store}_reg{32,
 64} to translate-vfp.c.inc
Date: Mon, 10 May 2021 13:25:31 +0100
Message-Id: <20210510122548.28638-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-7-peter.maydell@linaro.org
---
 target/arm/translate.c         | 20 --------------------
 target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5113cd2fea6..c8b9cedfcfd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1144,26 +1144,6 @@ static long vfp_reg_offset(bool dp, unsigned reg)
     }
 }
 
-static inline void vfp_load_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_store_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_load_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
-static inline void vfp_store_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 500492f02fb..1004d1fd095 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -30,6 +30,26 @@
 #include "decode-vfp.c.inc"
 #include "decode-vfp-uncond.c.inc"
 
+static inline void vfp_load_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_store_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_load_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
+static inline void vfp_store_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
 /*
  * The imm8 encodes the sign bit, enough bits to represent an exponent in
  * the range 01....1xx to 10....0xx, and the most significant 4 bits of
-- 
2.20.1


