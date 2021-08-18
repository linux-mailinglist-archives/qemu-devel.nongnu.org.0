Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B813F098B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOje-0003HC-DX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfF-0003j6-B1
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfD-00048E-G8
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v4so4437980wro.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yy2E72RJ9xmGSy1LibXCwKjozBFE9JRVIWHpHyn6OVc=;
 b=KTTGpLrJj+Z8eYdgGoSHWwf15H6hQevCG0WOHiPdRnF/dPUnPtn1c/y/ufeTpw2KM3
 64f/5XwDkehrDjIj7iw8xuKA/rsOf+QinBhWV53xeAj5v3d0Dc3PMBjqm8kcrOU0YEtU
 kLGCFphVkTYAfj9bq1j9FbQk6fUUyBDDHdIwMd4AOYFHAuubColujHuZNxwEWuM9tRsU
 DMdKrf1IBmHMnnaZR2RZgCmf6ZdM0wv+seCRt3Zxo1E1RBE+3iRR4sRlqKFAQM8sIqVH
 dagwPy6XqmBukzPOVd2rEB49Oq80FoR0qd0zxyQFXXauGlzYPipRp9jXZVpq+fDnXxtE
 qKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yy2E72RJ9xmGSy1LibXCwKjozBFE9JRVIWHpHyn6OVc=;
 b=lY+4qcx4N4EcMsVExTLm2UrzLFNN/KSc5c1nzL31Pp5xmXXH/LYN0Il0ovp0WXA0aZ
 Gr1kcrKhUALh0qdCcQK8nqgkqTMkQ45i/HYGksz9PzzF/kR7qun/tdBLdO5CY/N5LEbe
 UMGgTGGV7X4OcdQnfR6610L5UfUk4etJsADZgkkGwomA8rpkxH6yfl5tmqF+I/DVI5U4
 7Am/8Hb6TLcJI8C7m6penFJHSS9dG6NwAyfDtvFV1yCRlo3FmXEvdxJCB2uPUIpPUplZ
 HlpyIGa5BlKlkyT/hS86P2O9InemEznJt4d9pLTqXUs7qm2YMA969e0mn4hu15svMM1A
 AC2Q==
X-Gm-Message-State: AOAM531kMZFHrCyS9drNsSZghMjeiSsuKB2UYJ69R2CyG7or4cw/ebkI
 XSUxzrPzBmve/FjyQUU+E8+BwTfzUcU=
X-Google-Smtp-Source: ABdhPJxqtJRhwlKoG3IUaMLiLQPcwfE4wY2aCYCthli+a2fDwukJf9nOMBmL41WE+1J+9MABJ19whQ==
X-Received: by 2002:adf:f352:: with SMTP id e18mr11567250wrp.160.1629305017794; 
 Wed, 18 Aug 2021 09:43:37 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b12sm369445wrx.72.2021.08.18.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/mips: Replace GET_LMASK64() macro by get_lmask(64)
 function
Date: Wed, 18 Aug 2021 18:43:19 +0200
Message-Id: <20210818164321.2474534-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818164321.2474534-1-f4bug@amsat.org>
References: <20210818164321.2474534-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove another use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 888578c0b9c..01b3dc5bee0 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -128,48 +128,43 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
  * "half" load and stores.  We must do the memory access inline,
  * or fault handling won't work.
  */
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK64(v) ((v) & 7)
-#else
-#define GET_LMASK64(v) (((v) & 7) ^ 7)
-#endif
 
 void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
 
-    if (GET_LMASK64(arg2) <= 6) {
+    if (get_lmask(env, arg2, 64) <= 6) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1), (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 5) {
+    if (get_lmask(env, arg2, 64) <= 5) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2), (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 4) {
+    if (get_lmask(env, arg2, 64) <= 4) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 3), (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 3) {
+    if (get_lmask(env, arg2, 64) <= 3) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 4), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 2) {
+    if (get_lmask(env, arg2, 64) <= 2) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 5), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 1) {
+    if (get_lmask(env, arg2, 64) <= 1) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 6), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 0) {
+    if (get_lmask(env, arg2, 64) <= 0) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 7), (uint8_t)arg1,
                           mem_idx, GETPC());
     }
@@ -180,37 +175,37 @@ void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 {
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
-    if (GET_LMASK64(arg2) >= 1) {
+    if (get_lmask(env, arg2, 64) >= 1) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -1), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 2) {
+    if (get_lmask(env, arg2, 64) >= 2) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -2), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 3) {
+    if (get_lmask(env, arg2, 64) >= 3) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -3), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 4) {
+    if (get_lmask(env, arg2, 64) >= 4) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -4), (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 5) {
+    if (get_lmask(env, arg2, 64) >= 5) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -5), (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 6) {
+    if (get_lmask(env, arg2, 64) >= 6) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -6), (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) == 7) {
+    if (get_lmask(env, arg2, 64) == 7) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -7), (uint8_t)(arg1 >> 56),
                           mem_idx, GETPC());
     }
-- 
2.31.1


