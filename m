Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2F6EE8B0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:53:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOQm-0003eQ-Km; Tue, 25 Apr 2023 15:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQg-0003WL-CU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:23 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQP-0004iG-5F
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:22 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8eb8db083so60780171fa.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451243; x=1685043243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=R/zlNyC8qxd196HlYiCC9/vwJTwepJoGZsPEFWSQ5HQyVKdlmNGasKcgnbJvBFvx0E
 b2l6ViMUKHLPU2tLs/+Z+eXPdMcmyC9k+hqYZci9ytdQhscf7dimLEks12eqeDkAc6IU
 sgkZ10yN276J6NamTcDCiBq+mOurj+GbPX7MwwBIPVV+vJOoGNUxQRBKT+YNgyUMvEtu
 5Az8E6sHM0fIAH28J5E0ExKaeia2uBLBQU5HgykUOd47xn/EU79RFxSc3qgNwgGnKO/A
 JjtyiaTrvuIPauaTG2H+IfZTHr9mjyO0h6q70FaVI6pB+J5ns78czZxjtDZWX7piLDWS
 zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451243; x=1685043243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=VHrucjfpTm4tOkAOlfP/Cq+q+Qm14m1FGWpCjVutUIXsB0N1Gi7uzC/8Ye6coordTI
 Gd11T1ZeDbVBYDhErBlTnjh2zaFpkF4sUksgwN7+uwDH3DFYeE4EPcEvwYvbI3/FfwOv
 yZuGsvST3Jknx6Me3UdQzborhB3t4jpSPqLxgcVz8NNt3TahEO9QZnFVuitPYGYjC0y2
 shQnNXbcEp8hdF6so/AKTu2mTCguGVRVsHbrYtL916eklWrhbRXnad2GQ7KMsMC+AoUp
 OgQr+63KaGmW1u5zv9n0UgqZaRDVeC+A9UPjN7WelsS4rTwyei9lmxZaFDZGCvtxj+nC
 yS9Q==
X-Gm-Message-State: AAQBX9ei7EP5ltbmMJMeudqejobSJ4mhvwgTW5I8a8Slfv9JrDzxmFx0
 lYycsDWKyYVV+l9sctL2cvCxe7scXTzKq4gRDRUP9g==
X-Google-Smtp-Source: AKy350ZjGenJSyBD1St7Fa1m9xuH6kNldFSv2h12Ijgk08P89v4WgZkZw/ifBp46rVPuH/tqrYI6TA==
X-Received: by 2002:a05:651c:40e:b0:2a7:a779:eae4 with SMTP id
 14-20020a05651c040e00b002a7a779eae4mr3738988lja.9.1682451243658; 
 Tue, 25 Apr 2023 12:34:03 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 17/57] tcg/aarch64: Detect have_lse, have_lse2 for linux
Date: Tue, 25 Apr 2023 20:31:06 +0100
Message-Id: <20230425193146.2106111-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Notice when the host has additional atomic instructions.
The new variables will also be used in generated code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +++
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index c0b0f614ba..3c0b0d312d 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -57,6 +57,9 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+extern bool have_lse;
+extern bool have_lse2;
+
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e6636c1f8b..fc551a3d10 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -13,6 +13,9 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#ifdef __linux__
+#include <asm/hwcap.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -71,6 +74,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
+bool have_lse;
+bool have_lse2;
+
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
 
@@ -2899,6 +2905,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
+#ifdef __linux__
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    have_lse = hwcap & HWCAP_ATOMICS;
+    have_lse2 = hwcap & HWCAP_USCAT;
+#endif
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
-- 
2.34.1


