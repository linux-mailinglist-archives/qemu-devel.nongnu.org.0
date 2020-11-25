Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C232C37E6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:10:02 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khm81-00008L-Gu
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm53-0004wX-6n
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:57 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm51-00064B-G1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:56 -0500
Received: by mail-pf1-x443.google.com with SMTP id 131so1082279pfb.9
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlXlRdc0Ps4lTbxrXVpBLYGv+DVDYQ5KsE5wMhxDQbM=;
 b=NNRKuJv7HLZcC5szZ1uyUbuBzCZmY4Q1NklB4u8+mYUaKrlbadAHYSZZY55YHXdFfk
 irt4OI52mFuRR6gEjsxlOPG9GozlmHhGIKSM4OavI29Y38fdPGkJ+3drRIeE0QZYoojp
 DvEAwrfG8FK13p68DDvikQklLZA3/G6aOoGQqfopLEAU/nkHHezgC7sgDJBVR56JkAFA
 CmmQjGohxTsuYD0agAjAL2f36vDLctFYa3Gm4Fj8dfc7HUWGAaYhD1sPMblpVQIPrEdi
 uGg49K3wb7s3uD6Dua3QsAvd456Dp+aCTiuCARZ64P6pe8SpE/H3pPIEJsTsIEZA0ZXW
 kmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlXlRdc0Ps4lTbxrXVpBLYGv+DVDYQ5KsE5wMhxDQbM=;
 b=gksaH4st4zLjgT+dX6ydMrHowJzeK02EC3cpWlvRau1lHkj6dlXQjLF/oM5ub1+avE
 +SEBs7Hbo4DoZZeuoUAMk7tlnKwT/fYHp13phpS3YRy9jngz9nlNoVKeSq9dJMj9f6zC
 c0VhA4e3OX6p//zQZMAtOEpIwIkpr+kGAGQ8itXA3eUerXR7taGkYZ8Atg0yc6cBpHpl
 OWedePdY7RrSl7rZyn51RhWgyqfxavHTvlIPMh0RBRyyKWtQHW1AJd6oO0L2cRJEsrGn
 Qd1j55BrsNaHaMEBC9cud42TaSZy4fEmuuMW11aQsW+kQRtuAuST0ZBNv5ggJzF8tTuv
 08kw==
X-Gm-Message-State: AOAM532eIr953A47qpOxxYxQTcSgG0udHw2xBD04Li6E4r7UQanarTPO
 KhpvajpRcp2kt+eXLRq4lXQP9N5roniNhA==
X-Google-Smtp-Source: ABdhPJxMMV1/J6reZ5p3WIKZjSi2t9CbtvDiwfeNMmMh6yPRkJcJ+zKnPM51Ur2T6TIZTePMkdbGsA==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr1838625pjb.128.1606277213961; 
 Tue, 24 Nov 2020 20:06:53 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/arm: Enforce alignment for VLDR/VSTR
Date: Tue, 24 Nov 2020 20:06:38 -0800
Message-Id: <20201125040642.2339476-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 58b31ecc3f..51e85c2767 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -926,11 +926,13 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UW | MO_ALIGN | s->be_data);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UW | MO_ALIGN | s->be_data);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -960,11 +962,13 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                        MO_UL | MO_ALIGN | s->be_data);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1001,11 +1005,13 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s),
+                        MO_Q | MO_ALIGN_4 | s->be_data);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s),
+                        MO_Q | MO_ALIGN_4 | s->be_data);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1


