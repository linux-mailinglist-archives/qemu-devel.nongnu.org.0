Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C535E3D6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:26:42 +0200 (CEST)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLs9-0002WK-Ft
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaV-0006K7-Uz
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006vo-1M
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so8515404wmg.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6kBII81aZuLJmqi4T7s/m8HPG70NUqDGFjy7vwjtQU0=;
 b=QRCUzrTv50P4yl2DWccnEi2XeSnfuiyvKZlrLJgXpu4uYQEaZEk9s24MlsJGMz7iIs
 noe94rzxSDUogELkw4SkYg+Nuc7tmer2mMQ+8DCl6H25GvPBQVtBuNizKZ8mkW4VKLHx
 SDHRc7pnBIwXrV1GL4JAfVnLhYGFelL898L5b9jLpKBCkxY9kCDN3KgnCbFUvkveTUoz
 7qCufuFAHl64qj+7HcH1+lbrwyQ+dOcnBR6+DiDa4wacqt3N9Cl+1f0/OBuGUw2ck/kI
 U+3e6dU0Ea88AE+tQ7D5DnPPBnv5D+VeOp+FwlmmmnJey8P9UK+CMVMyx/isPRivPgYq
 239g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kBII81aZuLJmqi4T7s/m8HPG70NUqDGFjy7vwjtQU0=;
 b=L9eCjwUbmf3CgqU2V4hfuSYlHqgJjSq2h52cRCEKJa8gC1KbIOtpeM5yD16QaRolD0
 dSkqSgkWiDIF2I1jwBbEtXPM1gB2cCqK366sMTgNYG7vrLtWxjIkAOkbQYH31H9vt0N8
 icdVQ42j2zfKs+nx35Pg+JIJtzfDeDUQ0X1l4XkU+ArwNVafzeSiBTHOn0s8/YC3isRp
 +OU9FhDXB6Jn0CJjVSfJDWXniuv9sgP3lyyqKsxZbqKc0w5Sn5TSOxCRF03jAOzn9d/h
 SY+J4QfOZ4Ij+O+tsCrDpsVircTAtoJTHBQqDSgtGpuYo9vQm/Bpul+HSMNA4HVepvbp
 PviQ==
X-Gm-Message-State: AOAM533mZLKGGXLFxp3Er8Yvq8GwNs3HRiTeYXvdFJO4051IskjgMsFh
 a4UBThqQWnHudneALx6Qk6QJiA==
X-Google-Smtp-Source: ABdhPJzzPC2P7cXfhMxxKaDUDv58U5IdYwyXCx2lV+hVsCG+PG6QpyfSM8SiMobWtnGWtOUk7xWObA==
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr720026wmq.115.1618330099558; 
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
Date: Tue, 13 Apr 2021 17:07:55 +0100
Message-Id: <20210413160759.5917-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function vfp_reg_ptr() is used only in translate-neon.c.inc;
move it there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c          | 7 -------
 target/arm/translate-neon.c.inc | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2ed02df05e0..5eece97584d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1158,13 +1158,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     }
 }
 
-static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
-    return ret;
-}
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the Neon decoder */
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab2..c6f8bc259a1 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -60,6 +60,13 @@ static inline int neon_3same_fp_size(DisasContext *s, int x)
 #include "decode-neon-ls.c.inc"
 #include "decode-neon-shared.c.inc"
 
+static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
+    return ret;
+}
+
 static void neon_load_element(TCGv_i32 var, int reg, int ele, MemOp mop)
 {
     long offset = neon_element_offset(reg, ele, mop & MO_SIZE);
-- 
2.20.1


