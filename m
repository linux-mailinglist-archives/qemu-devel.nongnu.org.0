Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E043FD7F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:45:46 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNkW-0004NY-N7
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc9-0006lc-55
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:05 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc6-0005e9-Am
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1569980wms.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7mTQUcJGT6UFVXbJpvXZ1T20jSlBRZTOds7w3SMrgYQ=;
 b=pENUcH9Krk15VERU8CJ0cufUf9enjtt5+m3/chVjE3VyfCpSQuYagB0pN9N2OGVHW5
 KYPXEDbJGnn6x2npRlm2IoU0uPwZThyQOyoksdBLRHF5GnmQ+tLE6jMCvg2AQ/HkTIha
 ZLNTUvOv7qcnBGJA+DV8i4ZX9oUk1LfjtlT461CnV2RewY/DOIMt3b3BIrAN/Sb+CV1E
 taiU2zYPk8CT/LLnHOBarYnzo/V3i3lQTNCt2nxWJvrcTuc3/5DhZpax5KktZo/KrMay
 t3MdOomFhuQ3c5YwM3ruytcINo4AcOK9gpkZ6dS62RtOxMrc0nR4ZWhXtCL6s19ENbLF
 OrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mTQUcJGT6UFVXbJpvXZ1T20jSlBRZTOds7w3SMrgYQ=;
 b=EG1E25bUsIzyh8lTZIFV751wN86vi1qwsnoLF8O9GGSmbGS/8ecu+kb7TUDHSukDao
 PMLtamurAdZ+X1NmKy3sbPzbYQu8Z6yNp4MkSrcyafIbmNsYVlx4mDv2PsKmzO8Am432
 pujkBcz1Njy0sCPl4tpZTJDA0ZpWbBAsj51FwZCEQ5WWx+dbOpq1KP89Uoyj1VCZBwQC
 BbO0EvmixIaoLtBOccH6bH5dA5PrBDkbzKrqimgLo2mDUM0KqSXHi8NBbjCHKsW3Jtx9
 DtJRb9YyhLHPDISAoKmR3NckVotGE733DpeKgM4lvsz0KY+EjPh1/3r6qkdyqFX1IHVa
 nuWA==
X-Gm-Message-State: AOAM532tYfwRqZWtpD43Tez7yHRavfYEiBmtaZVlJAvFK4SxFpF7OcDs
 dzgn2/cCDDYIbvgjj4L7GXjzSTvVCTHVIA==
X-Google-Smtp-Source: ABdhPJxLjOTN7g40jGmMyfa6A35QMfkMdDRFD5xF00WUwupF8J8JAgVFlCdfFSEdcLZyI/aRjCOJrw==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr9066465wme.34.1630492620928; 
 Wed, 01 Sep 2021 03:37:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/51] target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM,
 VMINNM
Date: Wed,  1 Sep 2021 11:36:09 +0100
Message-Id: <20210901103653.13435-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Implement more simple 2-operand floating point MVE insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 15 +++++++++++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c |  5 +++++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 32fd2e1f9be..370876d7934 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -413,6 +413,21 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfsubs, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmuls, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfabdh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfabds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e211cb016c6..cdbfaa4245b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -625,3 +625,9 @@ VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
 
 # 2-operand FP
 VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VSUB_fp           1110 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VMUL_fp           1111 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 1 ... 0 @2op_fp
+VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+
+VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index abca7c0b2ab..d6bc686c985 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2838,3 +2838,19 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
     DO_2OP_FP(OP##s, 4, float32, float32_##FN)
 
 DO_2OP_FP_ALL(vfadd, add)
+DO_2OP_FP_ALL(vfsub, sub)
+DO_2OP_FP_ALL(vfmul, mul)
+
+static inline float16 float16_abd(float16 a, float16 b, float_status *s)
+{
+    return float16_abs(float16_sub(a, b, s));
+}
+
+static inline float32 float32_abd(float32 a, float32 b, float_status *s)
+{
+    return float32_abs(float32_sub(a, b, s));
+}
+
+DO_2OP_FP_ALL(vfabd, abd)
+DO_2OP_FP_ALL(vmaxnm, maxnum)
+DO_2OP_FP_ALL(vminnm, minnum)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d2c40ede564..98282335820 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -847,6 +847,11 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     }
 
 DO_2OP_FP(VADD_fp, vfadd)
+DO_2OP_FP(VSUB_fp, vfsub)
+DO_2OP_FP(VMUL_fp, vfmul)
+DO_2OP_FP(VABD_fp, vfabd)
+DO_2OP_FP(VMAXNM, vmaxnm)
+DO_2OP_FP(VMINNM, vminnm)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


