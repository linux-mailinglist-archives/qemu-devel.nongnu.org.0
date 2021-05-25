Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BC390610
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:00:05 +0200 (CEST)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZTP-0005Wn-My
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYcF-0004si-QH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc9-00052J-Lf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z17so32611593wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QAn3KafRewAT+6oY159IFoj+GoSwUizIz7+bhsquq5s=;
 b=ezkJ4FlCrIW/j6Gv/ogbmMep+tS/uTfaIjgRiW4ydWmS9FxDNe/ATa6+Hk6YbimKZl
 BZx3CvCxVtqkS80awdBOKP7b9YS1vT7xJRyMVZWJgShvfvYYvpjVer3MrAxsYF8huJpb
 ZwfBaXR71gLmuefXx5Qasmu0YCQ4Jx0/B5ZjhpLdAaimeMp9G1ze8dy6TNJvKe77wCEv
 bSZLZ4n7O1JN3fbZ+MzqHz2xa5IX5XeLRQcAcxbzS63bCUvbtvP412QAHjY3CfWsvSrL
 jwZ6z4h/hq+po9PXJwPa81J8u/ZBD7CJ/sRPHBwwAttikosfFud5/cP+NVk8MACO6v/Q
 /T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAn3KafRewAT+6oY159IFoj+GoSwUizIz7+bhsquq5s=;
 b=j22PujkavhWFZMvMhntTSjA57NjRqX8iT7gGCoCck7nNNQuh5RSPzJqJqckFnUqDte
 eTYSzTN2Equh6oGAXQV8UEAlNeP5VwSlOmGmmqodr85y+ljB/YR8T6XnPPczBKmRCMln
 xbBHUHuuxgFNMNzBsRSCSKZjYnFHG7l0sFhB+wInWN0+nYwsLnrH8d14jHz2lxvr3CQT
 K90b56+Y1OEtCR5qiphoP06lbTc6TraBR1E+ye8VkzS/athCQAcUjnqq5QSwj6C8ajo6
 D3VCzi2R2dXrTEbRKmpAF0yn/M69sPid2XM2zcxQ2R+aa1YF/euLaNIDuo76lstc5iOy
 nFUA==
X-Gm-Message-State: AOAM531+PhF2UIQw4bDRgMJdHJ7KvNtNwPbtp0k8hZFtKv0a9CYO9AwG
 miroC+DFMW6oxPLHn3eN49yDF1zNt3ncQMAk
X-Google-Smtp-Source: ABdhPJzBLjNryFwyXw4pW0sF+51ZkAzvWQ9xzZd5Fsx0+Td0g8Ia8vg11h6WPEY86ANfrtTpxRlyRg==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr27289055wri.282.1621955099185; 
 Tue, 25 May 2021 08:04:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 092/114] target/arm: Implement SVE2 crypto constructive binary
 operations
Date: Tue, 25 May 2021 16:03:02 +0100
Message-Id: <20210525150324.32370-93-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-71-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e808e6ba408..55383cb0661 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4256,6 +4256,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index 46ebb5e2f8b..051a6399ac0 100644
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
index 3b977b24625..2136a410945 100644
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
2.20.1


