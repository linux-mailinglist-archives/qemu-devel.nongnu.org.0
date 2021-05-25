Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9838F7D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:01:53 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMOG-0005bj-O3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYQ-0000el-Ti
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00047Q-7c
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso10496655pjb.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=al5zygwWXlZnBczeihpPgLL//CCdS4mSvx1LWn5XSaU=;
 b=UsNI/+8DVAFvY9wJZM7qJshQpJXVup3a39IYJALxHwmrFsEJ1FK1/biEduebSZGRjd
 R40HvDxyIxPaG82zMtu3RT1eRbanJsQ0vpE0VFHuJzozq97cm+Qvhd/rQdes9Xly5yKF
 UORJPny/Fs/vDk6FMxtl/iFBmgpDpxaLNfeIJ1QXsKQ7udn45ddMBB+pKhMNPTDTy2W1
 FEmprUX9yg6m9JbKtyKxOWQ7r/DckyBUgONtIRDLYZWa4hq07k0gEIFWuK0aLG+URwn4
 xzAJwNJ0x1yRL5ukFK0ky5ovjGi2zwxl/dvvrli1Uz1VhgMhpNgNpidkld3Z18HkQNoR
 y3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=al5zygwWXlZnBczeihpPgLL//CCdS4mSvx1LWn5XSaU=;
 b=hq1H6Slx/sVwLwVDTk+QNZcfWTHBl0aucbeBIL+MVYcd+RrmY4puCUkEcBmZ22Y/mF
 RH5/SVvmQXf4LqXcKVfTt7mBNaluAGEm8AGRZPyVb5f3+hUuFCk9c3+a+sKhXYHUjGnG
 BXk0We6lzOJzoynKN5jr0SAiurEptDI+rOgRcOIBrGsS8+Iu2Y9/z0+tor6zWkl0fDfz
 OIIfxO2w5Pp3cCb9lOZwGGdw/1/DccFPnwfcAzTPEB7IpZFx1+yT/CjRhSqHbwTOmim0
 DG2tJk5lEaG2oXFZPK5sQ3/msAvExp0oWWfCUhbpjga3rxRt2JmWcrEp48kMWouEAsMM
 Jozg==
X-Gm-Message-State: AOAM533TqxhRswHMGsBtx27dH1hPGEi6wuqWSkklbPfgGMG9KG3e/Tv+
 JXfSG8+qB42RHjgDZPeagcPKfL91D3lsag==
X-Google-Smtp-Source: ABdhPJw5OfkS1BLG0wDeLNhVh86dER6ctLdzcFPkh858/Z3WU4XXpMp5zUNahYN+Hcf4Sw4ywzpL/w==
X-Received: by 2002:a17:90a:ab8c:: with SMTP id
 n12mr1929359pjq.201.1621904862713; 
 Mon, 24 May 2021 18:07:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 70/92] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Mon, 24 May 2021 18:03:36 -0700
Message-Id: <20210525010358.152808-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 384c92eebb..c75601b221 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 46ebb5e2f8..051a6399ac 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1571,3 +1571,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3b977b2462..2136a41094 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8197,3 +8197,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1


