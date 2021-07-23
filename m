Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C383D41A2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 22:35:58 +0200 (CEST)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71tl-0002Rq-0Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 16:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rk-00007E-Vu
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rj-0008CE-D0
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 hg12-20020a17090b300cb02901736d9d2218so5359655pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9uTWLvP9aAyzR+j1L+0x/gEwZ6THJXYrmtdZc8mvi8=;
 b=MoP1hGqPh8WiU+2HE5krsdbV73zUWJVZH4F2BL3WoM1MWP48isAHhjrN2Pfza+sTX0
 rOYKN9e8MwPyM3g6JajIxO/aMHpUCQB/ih+mWa8+NcRqbgtPRZS23j9n6fuTSyx0q2dE
 tp90UI3kPSXEscnOcGe/a4tx+qabgPiewOYqm+nn0/6wyTtPqo2sY8V9GAn4TEZlBw6c
 /wBPldMMK1C/wcb+FqKsibcDCdSVOhuPI5dY9QlcfsBlTi7Nx1pEZXORR90gHmTfHbWl
 M00lisyRkpsD25gO6FGLsve904zboEXI1WRRfz9HiAjDcx7Rga/7cGKoy7kJx8Dc7IYT
 +PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9uTWLvP9aAyzR+j1L+0x/gEwZ6THJXYrmtdZc8mvi8=;
 b=rNJpZDogVUTf0PLWIcFmndXEOJxVvaRjMx4DwWFoFcVWmJA8/vXfE+iUv93DPTPZ0H
 +Ja2I9aQpJjXdjSRKc2w103kUW+f78UHhl/3JqBPu5sgjkYTdwcI+MuTNGbTuRWaWg64
 MkfOlyN3ZNoNUGnJKbmDJGzmG5w/NGtO5Hlx5M6dJhMCYpQKC5lA+U9tpbWRDrWpkIUV
 pj3J0i7/VGgynlRnCJo42a+37eIlpW929JeEvwVEFkrqaHTogQI+6ZcN5Yf5WLhsGN+R
 XhrCElQ2RNBbjgsLanlGfzaXmwKH5i9Ig09B4MUynaZ8Jt7gNpNvhyKZuxcOQQov3doq
 wR5g==
X-Gm-Message-State: AOAM533/4LM5K0sEEPtpHujsN45xmjoUh40H4336JO+3XNqh8PWpPoen
 4wAPNqwJCZ0cY41jLC2qwE03ovmaVBYn9w==
X-Google-Smtp-Source: ABdhPJwQdqv9eZo1TISN91mwD+o8HaoBwPYLBanSQhrZ0S3/l18l3BRfHNqEUTJICKhJqwka2OxtCg==
X-Received: by 2002:a17:90a:f3d2:: with SMTP id
 ha18mr15442537pjb.92.1627072430025; 
 Fri, 23 Jul 2021 13:33:50 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v23sm6904754pje.33.2021.07.23.13.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Export aarch64_sve_zcr_get_valid_len
Date: Fri, 23 Jul 2021 10:33:43 -1000
Message-Id: <20210723203344.968563-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723203344.968563-1-richard.henderson@linaro.org>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename from sve_zcr_get_valid_len and make accessible
from outside of helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/helper.c    |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 11a72013f5..cd2ea8a388 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -177,6 +177,16 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
+/**
+ * aarch64_sve_zcr_get_valid_len:
+ * @cpu: cpu context
+ * @start_len: maximum len to consider
+ *
+ * Return the maximum supported sve vector length <= @start_len.
+ * Note that both @start_len and the return value are in units
+ * of ZCR_ELx.LEN, so the vector bit length is (x + 1) * 128.
+ */
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
 
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c1d8dbce3..155d8bf239 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6457,7 +6457,7 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
@@ -6489,7 +6489,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return sve_zcr_get_valid_len(cpu, zcr_len);
+    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


