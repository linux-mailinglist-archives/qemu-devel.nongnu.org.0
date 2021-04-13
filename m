Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44935E3CA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:24:46 +0200 (CEST)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLqG-0000SK-SC
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaT-0006F3-RO
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaM-0006tn-OU
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id p19so9060751wmq.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EPKR+7Ln/JdgPQuKuo+DrQ9fLD+pJbsk48aZLHSdMSs=;
 b=BWRL8Z2B0r6EeF0eim2PaFy0/iE1ut59kkYoyZMm5e3pht5jmG1AUOvIQmNDedQd6F
 lhFdRRYtbVREmFA8sqkKm/cEHcs06LvM7IeZvACwmSaSyfJyN7poUNF9ROfFgVg9biSb
 GcsKcfIfPcs6BhqxUe5cLpJZ0tZOydx3l+3S9gMwc4tfGYU+xGe0cnDSSQcG/tIkv5pD
 4oykLZ55hPwpkosAFq7xOG6d172856jj5IA1PsrH7z1Ppu2sfdxboO0QmrZ4DBmXKahk
 QWmSZAoSgNh0mpIHAasYxySNTy9NfbySDn/TBVNidhqU+cz38+2cYenmpwZCVhnZJRVt
 PIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPKR+7Ln/JdgPQuKuo+DrQ9fLD+pJbsk48aZLHSdMSs=;
 b=f5atabf8y+Nt5LepRownGhR+NAgTAAc2F/fNGEhg2hyy+KgaJ3pA1q4rm818OiW4ZC
 KcwoKW0PQ8l5WsIAoTXXbvE/gTC8v52XH0kG79T/mAanWBmTTbyBQX9AWmqTredMpSiP
 AfyLVZJ4d5cL4LbosCtezLdV+XT4AOHnqtES5xw43seLXQpgiL6xZNZNyLdobyi0JhoP
 1wUS8MndrtDlOy8ez1ZK6EZVLXkdmfDgWJM45/vVw/BHOqkzNjgJF+TaOQT9JxbNwfEw
 U+CBQ5mm8A2yAdQ2tScQrw7gq/f/OJwGVFfiltF1YzkngHJE0O7Y5XGBH9/kJ2hlr+GE
 CPSw==
X-Gm-Message-State: AOAM531W/hpQ2yvP1yQJTgEBDrozSaNoryuUM7/HICmDR1+bioBADFvR
 YyZjVjNOoPAqhesWk29wH+LYIA==
X-Google-Smtp-Source: ABdhPJxMgvfwJ/jzP162dEZa1bIRfawn/eL+8RrLMBf5wVHcSUpw2qrymetyxIruGjoWXhgcRuZdLQ==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr687387wmm.153.1618330097371; 
 Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/arm: Move vfp_{load, store}_reg{32,
 64} to translate-vfp.c.inc
Date: Tue, 13 Apr 2021 17:07:52 +0100
Message-Id: <20210413160759.5917-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c         | 20 --------------------
 target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fd248b101f2..2daabb5fb6f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1103,26 +1103,6 @@ static long vfp_reg_offset(bool dp, unsigned reg)
     }
 }
 
-static inline void vfp_load_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_store_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_load_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
-static inline void vfp_store_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 16a730b7bdd..873a6237ea1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -30,6 +30,26 @@
 #include "decode-vfp.c.inc"
 #include "decode-vfp-uncond.c.inc"
 
+static inline void vfp_load_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_store_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_load_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
+static inline void vfp_store_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
 /*
  * The imm8 encodes the sign bit, enough bits to represent an exponent in
  * the range 01....1xx to 10....0xx, and the most significant 4 bits of
-- 
2.20.1


