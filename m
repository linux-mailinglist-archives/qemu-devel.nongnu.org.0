Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E51D6339
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 19:48:08 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ja0ut-0004ve-KA
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 13:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tO-0002rw-J0
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:34 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:33991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tN-0008MX-R4
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:34 -0400
Received: by mail-lj1-x241.google.com with SMTP id b6so5591178ljj.1
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 10:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hp/YCDbUF4k/Qi0Hzps0dHG39YUDYzBviudtOCIRUBo=;
 b=c5P97JwdkHH3fK+MdNkCtRR6/4XSKVlnosCYrHPJ3pgHkGxqzWPIq6UlbmCpTfxMva
 c9t7ft9plZnw3mD7+bBfYBimiwQxmAc9ho/d/iUep8fAGw2rxvB0XfJK4ByXa43XimzQ
 okFpLPRQjZejgVOILrObptla34wC9Go6TPMvhg1KQrAGlySwRtkk+SfFVQIAApUIVdGm
 xweiA79wUaL8GtncHpGZGu7AWtBeHBsoClQahZHY+jW8Uog53/SV/yHxI0EgIEp82YRD
 NXSuTZSQlkUG1DL5dUXHsy5kaalHNFYLMa2ZZ/pKTdrgRdhwqUMWnv7avyuhvz7g95ZC
 icKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hp/YCDbUF4k/Qi0Hzps0dHG39YUDYzBviudtOCIRUBo=;
 b=lP/yXnGQ/jvNPUkR32DwZTzxV/onVeykmg/Hr6nbnHnReZVf3iUvCc7KG3o3RJmLTN
 lGfWch5aqFaba+Nsd0jzO93Y22t3qksFwcci2IXyltrIPWzqauZ3GdfHag2iLXP7pOkU
 XJve7VZAMhldcCa9ZA9WWNW6bLmTHxVeFER4r7/Up4nLKkf3DhTaNhz6uDn15sDhG0zn
 cmHeHr5qhHiMK1DoRp/57yyyFLUbQK+ritFN+0RZrNVKLzA1bBYYjZiOP5kimL0bP3Ob
 N5ONBeJBLwjVs3IaEM3ehuvb4ydhdv6moaquBARw5gfQpE1XjCbnuglg7K7G+4aDUFTu
 gpfw==
X-Gm-Message-State: AOAM532lCZyaG8FprGP9joaXo/AoELs3AecMkdvKM+heRZuEAM99qIdO
 skI04vANz8jj5R3ibRm6jyJUFrYIwHM=
X-Google-Smtp-Source: ABdhPJxcPW9PuWQHyvSTLyU3AgHlXlyMeQbLhoc4vU799Ghov8UyGNGaXsbVdWDwU+cnj8z9q+sEaw==
X-Received: by 2002:a05:651c:1050:: with SMTP id
 x16mr5970697ljm.257.1589651192157; 
 Sat, 16 May 2020 10:46:32 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id i1sm3024759lja.3.2020.05.16.10.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 10:46:31 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/18] target/mips: fpu: Demacro MUL.<D|S|PS>
Date: Sat, 16 May 2020 19:45:33 +0200
Message-Id: <20200516174548.7631-4-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200516174548.7631-1-aleksandar.qemu.devel@gmail.com>
References: <20200516174548.7631-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.rikalo@rt-rk.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 715a872cae..449e945166 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1208,7 +1208,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
     return ((uint64_t)wth2 << 32) | wt2;                           \
 }
 
-FLOAT_BINOP(mul)
 FLOAT_BINOP(div)
 #undef FLOAT_BINOP
 
@@ -1284,6 +1283,42 @@ uint64_t helper_float_sub_ps(CPUMIPSState *env,
     return ((uint64_t)wth2 << 32) | wtl2;
 }
 
+uint64_t helper_float_mul_d(CPUMIPSState *env,
+                            uint64_t fdt0, uint64_t fdt1)
+{
+    uint64_t dt2;
+
+    dt2 = float64_mul(fdt0, fdt1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_mul_s(CPUMIPSState *env,
+                            uint32_t fst0, uint32_t fst1)
+{
+    uint32_t wt2;
+
+    wt2 = float32_mul(fst0, fst1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_mul_ps(CPUMIPSState *env,
+                             uint64_t fdt0, uint64_t fdt1)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t wtl2;
+    uint32_t wth2;
+
+    wtl2 = float32_mul(fstl0, fstl1, &env->active_fpu.fp_status);
+    wth2 = float32_mul(fsth0, fsth1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)wth2 << 32) | wtl2;
+}
+
 
 /* MIPS specific binary operations */
 uint64_t helper_float_recip2_d(CPUMIPSState *env, uint64_t fdt0, uint64_t fdt2)
-- 
2.20.1


