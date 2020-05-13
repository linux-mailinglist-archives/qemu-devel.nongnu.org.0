Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087241D1067
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:01:05 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYp8K-0002Rf-2M
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jYp1F-0000HR-9Q
 for qemu-devel@nongnu.org; Wed, 13 May 2020 06:53:45 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jYp1E-0000Pi-Gd
 for qemu-devel@nongnu.org; Wed, 13 May 2020 06:53:45 -0400
Received: by mail-lf1-x141.google.com with SMTP id v5so9135404lfp.13
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVn12E0T5JzktEFTA5pyhzwavRrRDjMRjIN9w81ZdKk=;
 b=hBVvNot8XokneP4qbhkg9hAWh9blvBSO1opWoURpIP/iH97Tb0cPxVGyMqvyv7272F
 EasrJ7TbNy6tS+x/FQnXyb3UWkYmjLOAPHoPCEZUCHTOBmVCxxmSGQE2RMZvy6Gy3JPm
 9OeX38OcTMkz2lz0HakZjmnib8eEYEi4jLwioYHPCxwIMn79uafkzvhI1kSLjrq5E3Gr
 DJ461dz9256Z5d5Q56tqayNIzG8k0/9yqJdUi024Qx9HZRRtzZLqbJzFc48M8bOmxwl6
 fnys5BkAORaszLGXGFz9cZD1OU0TQzCZxjs+TVLkyJzpTzUlMNdu2FgEkyOeoz5FUJZY
 Uf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVn12E0T5JzktEFTA5pyhzwavRrRDjMRjIN9w81ZdKk=;
 b=mSlq/zciLj+yRlsCksjfWPXAj5BSTMVaVrWVk1TE9Ufg3ZRnXvUmGAtD5aP7Fwtjxw
 PMvYkzT1LUPIGMHaXxDMhcJ5rsZwdadWm2kdwHd8762laR5CoW9xpUFMMOy97l+fxgRx
 /ptEm7y0N/Qv7BhvR4fIiAfH0hlboRfjwAVTiuzBVoO+c25Ss99ABcKz6RdGnts1uMRW
 pt3lQgMEEuEb8NYHpOXXZ/T25NZRJds7WJrkUp37jqBDZsEuZTuT8/HkCfynGLQ60LRn
 W4liBcLba1zo1cxQNViti/Ba3kYaGuMdYMPis0oF1TwVPjTJfn6/scdD1vsRJvfBdiEN
 B2sw==
X-Gm-Message-State: AOAM530KhvrtwzA0YGf4Y31FVadRAAhwBqVcENp+pkMd9yv48SZXJU4D
 qwl7xSqziNPiHhfNS8ZG7L+saDxPwo0=
X-Google-Smtp-Source: ABdhPJwUri2NNoFg+lzgo0pVvnjJA12o8EkMUQPrEWV7ref7aRvGlciM0aLI1LPtGz4Gdb0MHNWJFw==
X-Received: by 2002:ac2:5b41:: with SMTP id i1mr17334970lfp.16.1589367222771; 
 Wed, 13 May 2020 03:53:42 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id z64sm15749417lfa.50.2020.05.13.03.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 03:53:41 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] target/mips: fpu: Demacro NMADD.<D|S|PS>
Date: Wed, 13 May 2020 12:53:03 +0200
Message-Id: <20200513105307.22638-9-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513105307.22638-1-aleksandar.qemu.devel@gmail.com>
References: <20200513105307.22638-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lf1-x141.google.com
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
 target/mips/fpu_helper.c | 44 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index e37fc4075d..d4c065f281 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1495,7 +1495,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,             \
     update_fcr31(env, GETPC());                                      \
     return ((uint64_t)fsth0 << 32) | fst0;                           \
 }
-FLOAT_FMA(nmadd, float_muladd_negate_result)
 FLOAT_FMA(nmsub, float_muladd_negate_result | float_muladd_negate_c)
 #undef FLOAT_FMA
 
@@ -1577,6 +1576,49 @@ uint64_t helper_float_msub_ps(CPUMIPSState *env, uint64_t fdt0,
     return ((uint64_t)fsth0 << 32) | fstl0;
 }
 
+uint64_t helper_float_nmadd_d(CPUMIPSState *env, uint64_t fst0,
+                             uint64_t fst1, uint64_t fst2)
+{
+    fst0 = float64_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float64_add(fst0, fst2, &env->active_fpu.fp_status);
+    fst0 = float64_chs(fst0);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint32_t helper_float_nmadd_s(CPUMIPSState *env, uint32_t fst0,
+                             uint32_t fst1, uint32_t fst2)
+{
+    fst0 = float32_mul(fst0, fst1, &env->active_fpu.fp_status);
+    fst0 = float32_add(fst0, fst2, &env->active_fpu.fp_status);
+    fst0 = float32_chs(fst0);
+
+    update_fcr31(env, GETPC());
+    return fst0;
+}
+
+uint64_t helper_float_nmadd_ps(CPUMIPSState *env, uint64_t fdt0,
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
+    fstl0 = float32_chs(fstl0);
+    fsth0 = float32_mul(fsth0, fsth1, &env->active_fpu.fp_status);
+    fsth0 = float32_add(fsth0, fsth2, &env->active_fpu.fp_status);
+    fsth0 = float32_chs(fsth0);
+
+    update_fcr31(env, GETPC());
+    return ((uint64_t)fsth0 << 32) | fstl0;
+}
+
 
 #define FLOAT_FMADDSUB(name, bits, muladd_arg)                          \
 uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,             \
-- 
2.20.1


