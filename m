Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E535C577F3B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:03:37 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNbE-0003BY-UR
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNZW-0001ZA-Di
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:01:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNZU-00054h-V5
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:01:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7467993wmb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LADKvz6NGwtTpJM5NpBVGy0mPvkc4sq8YRH/zAnJtNo=;
 b=sD30wY8bZN83brGu8oFmRrq+oAKISV2fydR2wdGzyxa1cxOXfvchvA4ZPYnelyjDjm
 GdWhwfQ9aeZHeJN6LMp63KwczQ+VM/3CtTq250ctTlXdyG8QAWK0utmVtPa1kapOseTP
 A29QeF7s7XGsMciBHaD2hd4f+dOANOOOzjvcpj12OfH2pZ4bZT8+ErDnpbV+bk7WQcYQ
 Sb06qv5DZNO+v7A/Ouzf57q5kXMBYI8UlYicPgcgaN10stMyBEr1bnhWmquz5ugVVTIH
 PfqDN8E8getvQjhS42kRszl+HTqf3gL4p5y1jtiP4FDWl6kcvKXCvpTYNj0eNH91Xqky
 tKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LADKvz6NGwtTpJM5NpBVGy0mPvkc4sq8YRH/zAnJtNo=;
 b=HsfBP5IQPL1UZ2+FM5q8Ssira5dzwb2/kv/lOV+L0fYpXQvzfl7w+04Ndh7waoHU7u
 ZLVsZtGyZxqSNmOB4LhJDl/T7j42ik3M5GrJh6AHxoCej8zmVzMGcFVYt3uQ6VkReHO6
 g7y2kcy6dy95Mj9wMUW0o0RVP0udO+WIvrWs5KnF4Ej6MBONYw30jDM2cT9RXJATO1av
 YV9fAtABWKcF9HlBP/ClfuCzisaKSviGF3WKflohRjfhmquQTu6nzWe0mu6qno+8u0y0
 ayvnLxtqqZAyiNTU6BdMU5dg3RBmpiaSsF8Oh4OwZPk5pAAXpd5kn8/s38QZshZ3uy9A
 xiZg==
X-Gm-Message-State: AJIora/6qFV5AO0aOZhwGs7QAmJXAr7MrRqlMZmckGz3/zmOLVy7ZLVp
 m/FlbjzxVTASFb4AwuvfUrqsNw==
X-Google-Smtp-Source: AGRyM1sHB/+U5G7AyGE2ARXDOsjdLNyY21U0yMAiMl4xOeDaS9i4g+eXgeuqFOQIj5H+bQ+KBoq/NA==
X-Received: by 2002:a05:600c:3b07:b0:3a3:1433:10b5 with SMTP id
 m7-20020a05600c3b0700b003a3143310b5mr8683144wms.129.1658138506135; 
 Mon, 18 Jul 2022 03:01:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b0021d6f03b524sm10251990wrp.48.2022.07.18.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 03:01:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Add MO_128 entry to pred_esz_masks[]
Date: Mon, 18 Jul 2022 11:01:44 +0100
Message-Id: <20220718100144.3248052-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 7390e0e9ab8475, we added support for SME loads and stores.
Unlike SVE loads and stores, these include handling of 128-bit
elements.  The SME load/store functions call down into the existing
sve_cont_ldst_elements() function, which uses the element size MO_*
value as an index into the pred_esz_masks[] array.  Because this code
path now has to handle MO_128, we need to add an extra element to the
array.

This bug was spotted by Coverity because it meant we were reading off
the end of the array.

Resolves: Coverity CID 1490539, 1490541, 1490543, 1490544, 1490545,
 1490546, 1490548, 1490549, 1490550, 1490551, 1490555, 1490557,
 1490558, 1490560, 1490561, 1490563
Fixes: 7390e0e9ab8475 ("target/arm: Implement SME LD1, ST1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 2 +-
 target/arm/translate-sve.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e36a839ee4..3123488014d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3374,7 +3374,7 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 }
 
 /* Shared between translate-sve.c and sve_helper.c.  */
-extern const uint64_t pred_esz_masks[4];
+extern const uint64_t pred_esz_masks[5];
 
 /* Helper for the macros below, validating the argument type. */
 static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 41f8b12259e..621a2abb22f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -529,9 +529,10 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 }
 
 /* For each element size, the bits within a predicate word that are active.  */
-const uint64_t pred_esz_masks[4] = {
+const uint64_t pred_esz_masks[5] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
-    0x1111111111111111ull, 0x0101010101010101ull
+    0x1111111111111111ull, 0x0101010101010101ull,
+    0x0001000100010001ull,
 };
 
 static bool trans_INVALID(DisasContext *s, arg_INVALID *a)
-- 
2.25.1


