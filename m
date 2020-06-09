Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E51F4111
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:37:55 +0200 (CEST)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jihG6-0008Kl-Av
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7F-0005xZ-M9
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7E-00017E-Le
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c3so21991970wru.12
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dfCeaqITGsnWlGdBOBw3AZ0RLQTDRMeG08FAQqk/jUE=;
 b=phuULrsIv27MuqLY+TRGVFDrOWgQr+/j4y0W/TABLr7oCImvy+5c5kmYtSXzXOLjso
 XTyPC6pL/VTRtGU+ncy9QcuqbDQtLjVIUg/2O2xuVT3foLmSu1Mhth/dmOBNRYa8fuws
 dPc/4FX0/5dlGqSrOlpNfAReYTfS7xkl/F2hId7E21eDj6UK20is5a6kxH8tfvpu2Yii
 BRsVgEMTseWfKfgdgVoi3W4doxIEKA3YgOM2e9FlhrkxvTe47SbknId2u+ZNHL2hP3bo
 /vfrtiv5432X7BrQI2mnT0ZNObbomSqCPfu/S6TE3uLY6S5QhKriZ5SLARcD3XUMPIN6
 nzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dfCeaqITGsnWlGdBOBw3AZ0RLQTDRMeG08FAQqk/jUE=;
 b=Y2M9jMnDA/jNoZoyEChWkK5XRyWQ/X7QZHSwNliiMboj53ClgMFTiZfaxmgJi4O4yG
 9CgOy32PQcyZZA9FrsH+/McGxybzsg+iPgYJN4ckrQvwDkqDf26SbusoSYIJod5hB7Js
 sZYWGxkAKz/U+oD9f5kr5tDKc+NW+XvSmvr/XeQeCBy8Q0jZFbYoy2Pwamdpg6mh4700
 UnrNz4cpGR3LbaSxB0TxvFS6qim3JcbRomwkaIZiXWS5zWy1J1efD3saXuK+eOWJLNYh
 iRKmBavEWbCZmREQQI4Z3B0XYZtaIukWtVFsyUeo3JPMX/SHubB39HLiCEPIu04spo7n
 1UbQ==
X-Gm-Message-State: AOAM531HsBZRChpi43CE7tKAtbBQ7bEGDwKqizzY9msx+CdqUTt2n7Hg
 MitVQFh7vtBnkHFws+nSXyDxzDAs
X-Google-Smtp-Source: ABdhPJxnNe3roJ5xel9rtxIkoQgGk7Sr7ohWJEDipnXJJOTjrpw+lXGmk74OsVZi5Zp7e9XY44wj3A==
X-Received: by 2002:adf:e4d1:: with SMTP id v17mr5318471wrm.224.1591720122541; 
 Tue, 09 Jun 2020 09:28:42 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 23sm3643598wmo.18.2020.06.09.09.28.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:28:42 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 04/20] target/mips: fpu: Demacro SUB.<D|S|PS>
Date: Tue,  9 Jun 2020 18:28:22 +0200
Message-Id: <1591720118-7378-5-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x42a.google.com
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
Message-Id: <20200518200920.17344-3-aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 984f3f4..715a872 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1208,7 +1208,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
     return ((uint64_t)wth2 << 32) | wt2;                           \
 }
 
-FLOAT_BINOP(sub)
 FLOAT_BINOP(mul)
 FLOAT_BINOP(div)
 #undef FLOAT_BINOP
@@ -1249,6 +1248,42 @@ uint64_t helper_float_add_ps(CPUMIPSState *env,
     return ((uint64_t)wth2 << 32) | wtl2;
 }
 
+uint64_t helper_float_sub_d(CPUMIPSState *env,
+                            uint64_t fdt0, uint64_t fdt1)
+{
+    uint64_t dt2;
+
+    dt2 = float64_sub(fdt0, fdt1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_sub_s(CPUMIPSState *env,
+                            uint32_t fst0, uint32_t fst1)
+{
+    uint32_t wt2;
+
+    wt2 = float32_sub(fst0, fst1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_sub_ps(CPUMIPSState *env,
+                             uint64_t fdt0, uint64_t fdt1)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t wtl2;
+    uint32_t wth2;
+
+    wtl2 = float32_sub(fstl0, fstl1, &env->active_fpu.fp_status);
+    wth2 = float32_sub(fsth0, fsth1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)wth2 << 32) | wtl2;
+}
+
 
 /* MIPS specific binary operations */
 uint64_t helper_float_recip2_d(CPUMIPSState *env, uint64_t fdt0, uint64_t fdt2)
-- 
2.7.4


