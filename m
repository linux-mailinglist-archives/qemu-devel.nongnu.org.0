Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E027261182
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:41:48 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcwV-0008FF-F8
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1kFcvY-0007Or-2n
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:40:48 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1kFcvW-0000wQ-Ec
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:40:47 -0400
Received: by mail-ed1-x544.google.com with SMTP id n22so15849781edt.4
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1g3oKVzWdmlYD9vf8mBq95tsayfNUOlsZ6AfVzlFnBs=;
 b=LFTrkCF3Chp/ijzFRla/+FQYtrDKltghItgp/y2JRrjipv++zIbVlQOR7Vo/S3O5vn
 SUU0TKrKXnZXwiK63kYLIfFQ3K8uRq2szA2PMqcSWVdw/L41fZ7jlXlyurU+rITwrjxB
 e3o3deiQDG9bHI5UyuuR3EpbEfNg5nlQguMr/9MU/JW+7iyH6yIkQoDkRxlRYU9eOqbj
 IUrbGp5lujHfhrDd0GmFcc/8EKxxusQyjaDIb9eOZUCiQa4Ji0wCmLwkl+3G+Ic4vOUi
 BlwYWbiHydfTdM4zKCnSe7lozv0GnDHGgvJsheMvwJ1ej7YwLlz7xU+bs8gxQbIm01yf
 0bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1g3oKVzWdmlYD9vf8mBq95tsayfNUOlsZ6AfVzlFnBs=;
 b=ThuLd2gBKAjptug+Sh2aZEoKhcOzpxY0551b1c2OOZUDsj5eqv85VZiEEX49VJkJb3
 vFVUpjQcBAqGaWCLvTh+6ZH/HEEbzzS+bPFaH8lgqepiQDXu7MoTOQXjxoEfbAQCfRFI
 uJ94yeiiYLUg5Lp61UYObU9+9TXgIk3MCgzntCfNMNqpZpMx1QtjZ/floh2fuK2nj0jm
 REGj8vLdhvSIci0CFNYtZe0fkQ0mkFC+hkBCssLEB0DDmYKAVMyHQQZFO/r+FbQ9Zniz
 hHem/VlkGgZy/HVrbcXHjiDIjMpL16y+N4xXIIuPCmRe2RrMLHzFm8I5lDCiymdUVvz3
 mhUA==
X-Gm-Message-State: AOAM5308xw026zISEDu5EjfcYDAAJ7ZdDDiF2wR9i+FnGnGWX64qIsd6
 INnQnls6ds5NsW5IyBYMyksQ311pBlc=
X-Google-Smtp-Source: ABdhPJwvWoI23HP/WK0EI598l5re6HjhTS/5FAcibwOLhOjQ9h49v9pK1PkLtNqiabP0Q/XOFK9xcA==
X-Received: by 2002:aa7:c70a:: with SMTP id i10mr27165445edq.218.1599568844347; 
 Tue, 08 Sep 2020 05:40:44 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id q26sm1612813ejr.97.2020.09.08.05.40.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 05:40:44 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/mips: Demacro helpers for <ABS|CHS>.<D|S|PS>
Date: Tue,  8 Sep 2020 14:40:10 +0200
Message-Id: <1599568813-9626-2-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599568813-9626-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1599568813-9626-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove function definitions via macros to achieve better code clarity.

Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 61 ++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 7a3a61cab3..f89213947f 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -983,27 +983,46 @@ uint32_t helper_float_floor_2008_w_s(CPUMIPSState *env, uint32_t fst0)
 }
 
 /* unary operations, not modifying fp status  */
-#define FLOAT_UNOP(name)                                       \
-uint64_t helper_float_ ## name ## _d(uint64_t fdt0)                \
-{                                                              \
-    return float64_ ## name(fdt0);                             \
-}                                                              \
-uint32_t helper_float_ ## name ## _s(uint32_t fst0)                \
-{                                                              \
-    return float32_ ## name(fst0);                             \
-}                                                              \
-uint64_t helper_float_ ## name ## _ps(uint64_t fdt0)               \
-{                                                              \
-    uint32_t wt0;                                              \
-    uint32_t wth0;                                             \
-                                                               \
-    wt0 = float32_ ## name(fdt0 & 0XFFFFFFFF);                 \
-    wth0 = float32_ ## name(fdt0 >> 32);                       \
-    return ((uint64_t)wth0 << 32) | wt0;                       \
-}
-FLOAT_UNOP(abs)
-FLOAT_UNOP(chs)
-#undef FLOAT_UNOP
+
+uint64_t helper_float_abs_d(uint64_t fdt0)
+{
+   return float64_abs(fdt0);
+}
+
+uint32_t helper_float_abs_s(uint32_t fst0)
+{
+    return float32_abs(fst0);
+}
+
+uint64_t helper_float_abs_ps(uint64_t fdt0)
+{
+    uint32_t wt0;
+    uint32_t wth0;
+
+    wt0 = float32_abs(fdt0 & 0XFFFFFFFF);
+    wth0 = float32_abs(fdt0 >> 32);
+    return ((uint64_t)wth0 << 32) | wt0;
+}
+
+uint64_t helper_float_chs_d(uint64_t fdt0)
+{
+   return float64_chs(fdt0);
+}
+
+uint32_t helper_float_chs_s(uint32_t fst0)
+{
+    return float32_chs(fst0);
+}
+
+uint64_t helper_float_chs_ps(uint64_t fdt0)
+{
+    uint32_t wt0;
+    uint32_t wth0;
+
+    wt0 = float32_chs(fdt0 & 0XFFFFFFFF);
+    wth0 = float32_chs(fdt0 >> 32);
+    return ((uint64_t)wth0 << 32) | wt0;
+}
 
 /* MIPS specific unary operations */
 uint64_t helper_float_recip_d(CPUMIPSState *env, uint64_t fdt0)
-- 
2.20.1


