Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67B1D6345
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 19:52:37 +0200 (CEST)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ja0zE-00046g-Dx
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 13:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tU-00035f-62
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:40 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tT-0008N4-Db
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:39 -0400
Received: by mail-lj1-x241.google.com with SMTP id u15so5579498ljd.3
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=oohv+YQ8i/aXQ3weakqSgCAN8UftX4y2AIs7m2UWvcpanAze5lTGJCRaUvfNpti0GE
 QjwL+GRYYm3huyckWYf5MuI1y7zZNv892BD1pWoeMGeBmNXzv1Pt6eiVDWCMWVnQblDR
 C8WVtRe42n1DD0HNtlvwQPzvrMhWY7i6wYbR4EXoh+/vRzKQKTPC+tIOzGPA0eINB5Vb
 eCyLlL81j4zLvVfaFO6LYpx9vZFe1Yx3Hq63X/PnNgN0AdP1MnyZ+hftmErsxnSK+0at
 +4+kflOL/jqtgXR/BAPd1aNZaSkVZPLwBtQ/6p1sdpIXei+ifPD4N7M1vC3PvMve2GY9
 Oeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbkkh7kOu27EfvNkT8gehafOtZOmXDYce6iol7ZHVX4=;
 b=lQVjUielKbKHElleGPJMudAW1xqx2tAxxwUOJb7OTNzpU5Vccqh+JsaCBNLJWwE8B4
 K0ftXy1DFQjPOIDdHXZiNFUae9oH7c0Lu4Ec/L8lG5Two10kzD5JOmlwj3mGAb0q0iPp
 P5vcXsFeMcCAHkUn6MFVXcvbWngzorfYpjvjOLoEBO87kPVK4GiJCQUdAsBpaa0T74NI
 RAiMv/8dx3HIHIdVKkmhAkulT5BunrNIVkLEZtL17iWBwekoKMex/HVYV13Jw1lz5zzc
 +NeNGnatcc/nPRfxEXaRyng4qIT0uMwEFnBDoalOhCgSmyQFZhoCEgZ8Ru9Y6eh1gvHI
 zDfg==
X-Gm-Message-State: AOAM533g8BKytikEy2WFx2sixNCJuaA+nYgby9tIeLFZ+/3PFzcmGFtB
 rp8BjuKQoshDaCcuApbDXjppz3tjYe8=
X-Google-Smtp-Source: ABdhPJyyPuH3F+wFWiLET/rPQnRXAPecomPmtylyQFZGfNdmQcialiVAKNmaJpa85lirVe6W6wmhLA==
X-Received: by 2002:a2e:8347:: with SMTP id l7mr6020720ljh.243.1589651197830; 
 Sat, 16 May 2020 10:46:37 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id i1sm3024759lja.3.2020.05.16.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 10:46:37 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/18] target/mips: fpu: Demacro MSUB.<D|S|PS>
Date: Sat, 16 May 2020 19:45:37 +0200
Message-Id: <20200516174548.7631-8-aleksandar.qemu.devel@gmail.com>
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


