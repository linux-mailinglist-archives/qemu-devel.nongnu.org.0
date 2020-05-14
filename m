Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE951D3D64
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 21:26:36 +0200 (CEST)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZJV5-0006Jv-4V
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 15:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jZJQ2-0007E2-4z
 for qemu-devel@nongnu.org; Thu, 14 May 2020 15:21:22 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jZJPz-0007N2-2u
 for qemu-devel@nongnu.org; Thu, 14 May 2020 15:21:19 -0400
Received: by mail-lf1-x144.google.com with SMTP id h188so2872007lfd.7
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=kqAJKwN8wcN7zuYj2vk2ebivbGLIUISLDeoRR7guNSXsKj6K1LilTFGoIhrbv0ytYF
 JtWVS2uJHZl+MowvAVZLof3gK74RsvkyIBQrDuOWbpnXW8FSvP8h4GPDKGc5fd8zFqmX
 O/lwfPQjqafcfcd0n0yuB4G9NJ0Ao64R1/hLS+RheBO4qcRKJPqu79HGOLs4PoFHZkx9
 n7MfPDr/Koppwo1jdHSzmqDHKH7mFPtkukv/5YrqWEptA6kmAjbgeUHwmd/UvpxJGmLb
 Qrojz4Gh62oZmu3kz+6wDFRjEHYJyUGeJ/RK16c/sbCJ8klg/VSaB15tUAQARMOgZ3Ag
 KBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=DT7QUZZxFaf5mjzQ0oIoobcTe/R+mwYOYeIGCXwSe5JeIEU4Q8uSy7X74XzThm3jdj
 NkeLb/ZRvB2QNbTFNnikwUvQD7umOiIdtYCRrssBG9vycu7qK3nkXqnB8dOitbeOvt+M
 6B+iHeQnGf2G7gcRWRSJSqIdLU53JV3zTjc406qWQB9kVWy3A0SPBi07atcD3Gq+0K5O
 hk1I06IdusQZBceS7OX6XkFkBkIearKMl9yey5ck/SvlEAobtw+h2T6mk2wcIQsLzJRd
 e/3BNWqbLRccfQDDGXdnNeMjWLnfwAhJe+JkiqnY+HWWPd0fE+qdgn7sfIbWjlehK0g0
 DuDQ==
X-Gm-Message-State: AOAM530Rd9M4jH9rm/y0KIA26YU5H+ioE/QKY+lZaJomPyD+6GfmnZBE
 n/tWYrSYWOvFyhFm73QUkuqO5Ei8Nbo=
X-Google-Smtp-Source: ABdhPJxuQRQVR8TiI9B/nMy4QcRElvoJX6ZfeWV6AvzyADi8SIKVc7QohI+hoZ6c49VQ3bGrDVujVQ==
X-Received: by 2002:a19:70d:: with SMTP id 13mr3200424lfh.60.1589484077303;
 Thu, 14 May 2020 12:21:17 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id h3sm2427257lfk.3.2020.05.14.12.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:21:16 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] target/mips: fpu: Demacro MSUB.<D|S|PS>
Date: Thu, 14 May 2020 21:20:37 +0200
Message-Id: <20200514192047.5297-8-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514192047.5297-1-aleksandar.qemu.devel@gmail.com>
References: <20200514192047.5297-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lf1-x144.google.com
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
 target/mips/fpu_helper.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index c070081cbc..e37fc4075d 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1495,7 +1495,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,             \
     update_fcr31(env, GETPC());                                      \
     return ((uint64_t)fsth0 << 32) | fst0;                           \
 }
-FLOAT_FMA(msub, float_muladd_negate_c)
 FLOAT_FMA(nmadd, float_muladd_negate_result)
 FLOAT_FMA(nmsub, float_muladd_negate_result | float_muladd_negate_c)
 #undef FLOAT_FMA
@@ -1539,6 +1538,45 @@ uint64_t helper_float_madd_ps(CPUMIPSState *env, uint64_t fdt0,
     return ((uint64_t)fsth0 << 32) | fstl0;
 }
 
+uint64_t helper_float_msub_d(CPUMIPSState *env, uint64_t fst0,
+                             uint64_t fst1, uint64_t fst2)
+{
+    fst0 = float64_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float64_sub(fst0, fst2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint32_t helper_float_msub_s(CPUMIPSState *env, uint32_t fst0,
+                             uint32_t fst1, uint32_t fst2)
+{
+    fst0 = float32_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float32_sub(fst0, fst2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint64_t helper_float_msub_ps(CPUMIPSState *env, uint64_t fdt0,
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
+    fstl0 = float32_sub(fstl0, fstl2, &env->active_fpu.fp_status);
+    fsth0 = float32_mul(fsth0, fsth1, &env->active_fpu.fp_status);
+    fsth0 = float32_sub(fsth0, fsth2, &env->active_fpu.fp_status);
+
+    update_fcr31(env, GETPC());
+    return ((uint64_t)fsth0 << 32) | fstl0;
+}
+
 
 #define FLOAT_FMADDSUB(name, bits, muladd_arg)                          \
 uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,             \
-- 
2.20.1


