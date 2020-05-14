Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B171D3D60
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 21:24:40 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZJTD-00022e-Rp
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 15:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jZJPy-0007BY-Gx
 for qemu-devel@nongnu.org; Thu, 14 May 2020 15:21:20 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:43580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jZJPx-0007Me-JV
 for qemu-devel@nongnu.org; Thu, 14 May 2020 15:21:18 -0400
Received: by mail-lf1-x142.google.com with SMTP id 188so3595586lfa.10
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 12:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NfiyJnH8f+NZGQdRmwsMGxjYlt1H1kJMr2qydSKKkTI=;
 b=RlvaVJa8zy7bwSuxuHefwEiamOAIT/QjU9mZYhZwo1O5QXLyt+/Xi4Gr8k4f1OkFGO
 OUyU1pOtBy5oyrjl3jc3QrFsxVHs/Ub3j1EPRhGMnY2up1e33ssy/zJdjDc0HgUiSZ6o
 ym2ZCgndx+ACZcUcOtXpOCGqUFIkzWdh2lCxyN3WmWMN1tf8QGXuUBsEC97oXeZZBVJJ
 /dO2itk32VsRxOBbH9sgPi6/AAa9hMdiQlZgen33F3LoHoHRMn1AIqvK5zXvUGduguW+
 BJSPyfZuOw+Q/oXbmhKLFzvlqFeOxAA2ue93zr9MYL/2rx1rtkdyt6VDin72Zjew8Vfe
 /R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NfiyJnH8f+NZGQdRmwsMGxjYlt1H1kJMr2qydSKKkTI=;
 b=TeuC0m6ZdGUP5BLUyeevRP7XwehxuzWb5/9Rufmg0VzPboFbB2htAMIppI2IxuFlix
 32EoFf/vsod4a6FMkS8BIyalDElAW1w8UVV5AgzB931huGkmF+3K1lJoP+1WnA8LoB9o
 9iKIZGKaJEcKNkrIuCJy09j0aPlRNwpdQaCOUlRL+VhpcbcRpBa/Slclf3mREjc9IoKN
 wFbeQY+hoCkfhIDz6Yd7bMilfuk/5URk45qaSzOmbbjfW66c3Yy+jV1G3TzkArUNNGfg
 qllzew/V3gQPap57QDg0SFHfyaYvu+Q0o4dTmkaK+FHiQ4pe7j0v0hZc7Bjcbv4JKaJe
 +zXg==
X-Gm-Message-State: AOAM533gpZt0rWNiJ6GsIRKkrdqJLb/CgAJpQ7Il+bDdeU+m+gDwR5pb
 TyFMmW64jLM1Gx1ZSRfW6uX8+joZRlQ=
X-Google-Smtp-Source: ABdhPJxkV2cuIGIRWBGSN7BORhHxD0wmtp/W7cf4uhVXByeVFHZcCwSkRlxeKKp9X9GSPct6rTUecQ==
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr4352054lfr.77.1589484074675; 
 Thu, 14 May 2020 12:21:14 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id h3sm2427257lfk.3.2020.05.14.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:21:14 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/17] target/mips: fpu: Demacro MADD.<D|S|PS>
Date: Thu, 14 May 2020 21:20:36 +0200
Message-Id: <20200514192047.5297-7-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514192047.5297-1-aleksandar.qemu.devel@gmail.com>
References: <20200514192047.5297-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lf1-x142.google.com
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
 target/mips/fpu_helper.c | 41 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index a3a39681f8..c070081cbc 100644
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
2.20.1


