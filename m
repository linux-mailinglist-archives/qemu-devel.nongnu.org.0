Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6411F0F4C
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 21:54:37 +0200 (CEST)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ji1NM-0004Cw-8l
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 15:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ji1Fa-0003sZ-Qx
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:46:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ji1FZ-0004lg-RC
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:46:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l26so13290363wme.3
 for <qemu-devel@nongnu.org>; Sun, 07 Jun 2020 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0BZ4x4anBfvXpjdOs8Rd0q5VGAIXWA6JFuqow7ewRvE=;
 b=PppYBpbwgQJMPyrr4U5PMfHr1GK3suIgp5ChHHwDClUXJ+dO5QBPPKEafY+mqA+7OR
 Sb2LMbxAwjbOa5+4Kh9rXx5HjUZphQAmvyB+nXULXWEYD6l9ZTEDEwtYMGQzY1KSVlHU
 drNBjSzqCz+cHAFg8zz+38bwkWm96NMgmmn7RNPL7L2uGlpppJV7xHkthsbFCzZ1qXOI
 7wpjEAyljphwIwVNkDWK6Ew5nUBqgUHtd3e9w0b2ro4Wf58YFyJ7BHE0tI2fLyK4Orof
 tQOa0s6NRvDNkGutFxZo3WOyBNs9hboL8OtbSI9ozSN3GI9q67iKd0y7oKUGcwe8BkF7
 2OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0BZ4x4anBfvXpjdOs8Rd0q5VGAIXWA6JFuqow7ewRvE=;
 b=f4v5sso6yARyvgY5YjZncbcmO5wOiJPJ6mSEp6QxgIW+/uE70IXyAliAuCEc3R7baB
 2QDH6ZZNgDx+cu3mTM842STyS4iZpjffMXb+RuaGL8ejPP993Y83+hGgkAU1YjYHGZ5Y
 azeDM+RKqwcWmyblICME5pdRjPb4CzsjYwiRYK7KDiCjMtuhFjUqxNDW/HP4TSYRyvp4
 OrNnfiFxKgvXSDwBej7x2kDTWmat29ujj/U646jFnDK9noL63kJy84g8m3XR+0rYIEmn
 oYOvMrM2LuhAnHUNUtRtLiTUq5qXeHLVEBQ56LzwIJCTX4/MIdh6hVHuYOhXHDBWwVYY
 B6Jw==
X-Gm-Message-State: AOAM533mpH5Fj7w5en4dPGO7diAx1plLP+FFMWpRXaRpIV7+30p0d9of
 KN2N71y+BJWsvO1BXYsZhOgtiJnK
X-Google-Smtp-Source: ABdhPJzG26CQnpeQF9OQ3jBMuEmPwMRcK+awi1VMbuKSkO9mzA6nsN7OvT6BAKIcuefv+rffDZeqsA==
X-Received: by 2002:a1c:f301:: with SMTP id q1mr13173529wmq.110.1591559192309; 
 Sun, 07 Jun 2020 12:46:32 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id u130sm21091339wmg.32.2020.06.07.12.46.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 12:46:31 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/21] target/mips: fpu: Demacro MADD.<D|S|PS>
Date: Sun,  7 Jun 2020 21:46:12 +0200
Message-Id: <1591559185-31287-9-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591559185-31287-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591559185-31287-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200518200920.17344-7-aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index a3a3968..c070081 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1495,12 +1495,51 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,             \
     update_fcr31(env, GETPC());                                      \
     return ((uint64_t)fsth0 << 32) | fst0;                           \
 }
-FLOAT_FMA(madd, 0)
 FLOAT_FMA(msub, float_muladd_negate_c)
 FLOAT_FMA(nmadd, float_muladd_negate_result)
 FLOAT_FMA(nmsub, float_muladd_negate_result | float_muladd_negate_c)
 #undef FLOAT_FMA
 
+uint64_t helper_float_madd_d(CPUMIPSState *env, uint64_t fst0,
+                             uint64_t fst1, uint64_t fst2)
+{
+    fst0 = float64_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float64_add(fst0, fst2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint32_t helper_float_madd_s(CPUMIPSState *env, uint32_t fst0,
+                             uint32_t fst1, uint32_t fst2)
+{
+    fst0 = float32_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float32_add(fst0, fst2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint64_t helper_float_madd_ps(CPUMIPSState *env, uint64_t fdt0,
+                              uint64_t fdt1, uint64_t fdt2)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t fstl2 = fdt2 & 0XFFFFFFFF;
+    uint32_t fsth2 = fdt2 >> 32;
+
+    fstl0 = float32_mul(fstl0, fstl1, &env->active_fpu.fp_status);
+    fstl0 = float32_add(fstl0, fstl2, &env->active_fpu.fp_status);
+    fsth0 = float32_mul(fsth0, fsth1, &env->active_fpu.fp_status);
+    fsth0 = float32_add(fsth0, fsth2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return ((uint64_t)fsth0 << 32) | fstl0;
+}
+
+
 #define FLOAT_FMADDSUB(name, bits, muladd_arg)                          \
 uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,             \
                                          uint ## bits ## _t fs,         \
-- 
2.7.4


