Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0751D66E2
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 11:29:35 +0200 (CEST)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaFby-0006pI-UV
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 05:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFX2-0004HG-47
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:28 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFWz-0001nj-Mv
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:26 -0400
Received: by mail-lj1-x244.google.com with SMTP id h4so6610543ljg.12
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=i8DJFbzWxrrn+lIh+75LhT6KJzXlapoP33MNXxC4a0QJUN7xmu9/vvidVDC/X1WGsv
 B1ZLLoFLMeeNkGeg860MRovf30+WbH1iWSnqSC+NETCWwcuqtjIafuElQ5vt/FFEnTUM
 gsK6j7yzF7PHJNY0KJi+UjQxcpvvYxvnyOAr+uf4KxdbkLFYnb+fX/s0eJfwFZZPQkJB
 aidSCCczDsQhr4+mKPdD5VX6JsD+U2NYK67uCRIJmLzJSzXC5CBcb7BD1tMGisfDBCW0
 w5UYUW5sBEUhWv1HvIt/MJSmsMaIiWpcg0QcfMM179UtOWYvlyJRl6RR7fEk9vqGpDuB
 MTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=OxjQhi34QTAzQgvRK5vssvSLmjbAHyXz3vmlnacSrAI1qLRGf8YNedgUNVoQy7h6l6
 KS5Gpw4bkLQZ7Aaqg5PFH5N6GqBExfvCxjMc+ZpUzlTuX0nzkYwQIhX2Ed/ginyV4RK7
 zjiLYi2GZAuUQEruK/mQID2zKgobFFjxVHE+mjXdRQjRZlvqgBITjNDR5UVcZWg+R7g5
 FnkWtdjEFcIoPAXC92neCAi9R4ulxE/aMLccdXmvTodOTa36RD8Ucfu9+Oq+ftVjFYY9
 /WksBxqcFkx1UeLA4es41RpOY6MB5FUtG3jzqwTCgUIMWz1Mh++0P25WuCgUVVNa1Ker
 BynQ==
X-Gm-Message-State: AOAM5318N84YTmiBJpZfMWUwcxa85UNDXqxOZTkcz7O3NyTQXkXh3EiZ
 6YzqdNH0MjhuTuOMsT7BU04p5H/F4vA=
X-Google-Smtp-Source: ABdhPJye3hqu1UBcgzyTZ7jKrKMefGQGUlJuUBLay8ePFbPuy2De22YikekYl1jsSTHqIc2elkbMQw==
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr7418390ljq.221.1589707463461; 
 Sun, 17 May 2020 02:24:23 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id l2sm3872138ljg.89.2020.05.17.02.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 02:24:23 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/19] target/mips: fpu: Demacro MSUB.<D|S|PS>
Date: Sun, 17 May 2020 11:23:45 +0200
Message-Id: <20200517092357.1469-8-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
References: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x244.google.com
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
Cc: aleksandar.rikalo@syrmia.com,
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


