Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C630B2D5A23
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:15:48 +0100 (CET)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKrL-0004bu-QA
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR9-0001iJ-Oc
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR0-000793-Bm
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id y17so5133943wrr.10
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J7TAdII+zoL9ZYUXkFl6fW/f+7IWQ2Rf6gIgGSvs/e8=;
 b=vd01gzaV9SPnOo56IPYIho20N5JDv3X0Ynm4sUsJ7F/SuQVQzxPRdkLIVG3JcDP17D
 uvMWCjFgTUvFwKFRryt4hV0Ta11QL9mx4MwMTkweGgIyKEb5oMo4QtsguxJxTsfV7eKB
 fQCauhFO5R4VRm4c5US00EvUl0WTpLKUSNDjvbgp2s6s9uFWBQcyBgWTgkASuv6ZRvr/
 SIqt+IZ5NoVUxWSqBEp7BSLpOIahbv2tE/IcVS0etWbxlApvltdq0FoOL2qf4Gfts/Jj
 590yAHCaUaD9YuKsiD9voixEZQjEH9UCqc/4/ihgN2JN8DTs6h9dmbMD1SjTLLHWJtOp
 188Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7TAdII+zoL9ZYUXkFl6fW/f+7IWQ2Rf6gIgGSvs/e8=;
 b=gtQvANBpAAwTUpYtbwjeBtFjovZx+ssjtEVPgUq/iDFn2868viKyS1nSSY4d2gmZ3p
 NZ9DPQp9/9IPl/xfNjgSKtH9MrDo6V9GLPIIw5rpPTmqaF6Y3NywUBITsPDucu3FhiGq
 66CIamJORVJHU6YuicVtFV57GKfX9VLNVW3Nje2fm+0z8RJ9P//UuPdLBn9aU16OHMWp
 UL83Zo0IgqzZcEAzx5Auneeo014c5jjp01IqCZkoduU4mrC9B5wZvsjV7m3uF+L973cu
 Ir6OdnLdf2cyCiVP/PWv8/R2m7j8N466kT56h/o0W2w3/b83/sv6ijc6gJc60G2v7KQl
 AWTQ==
X-Gm-Message-State: AOAM531K8VtWjJfk4DBCLtYL8kygy9Hcji2XcW7sdkEHarH305U4VlQF
 SXh0mDBPe1KRh1vAp7HWVNEgFmUCxpAvdA==
X-Google-Smtp-Source: ABdhPJzqlbevQuvklcHmJifaYvDnE1KTr+YQlKT2fZJh4JyytWP/9CEpNNIWPKDVnpBL4MjJC6F8AQ==
X-Received: by 2002:adf:efc5:: with SMTP id i5mr7629530wrp.377.1607600912876; 
 Thu, 10 Dec 2020 03:48:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] target/arm: Implement new v8.1M VLLDM and VLSTM encodings
Date: Thu, 10 Dec 2020 11:47:50 +0000
Message-Id: <20201210114756.16501-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

v8.1M adds new encodings of VLLDM and VLSTM (where bit 7 is set).
The only difference is that:
 * the old T1 encodings UNDEF if the implementation implements 32
   Dregs (this is currently architecturally impossible for M-profile)
 * the new T2 encodings have the implementation-defined option to
   read from memory (discarding the data) or write UNKNOWN values to
   memory for the stack slots that would be D16-D31

We choose not to make those accesses, so for us the two
instructions behave identically assuming they don't UNDEF.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-21-peter.maydell@linaro.org
---
 target/arm/m-nocp.decode       |  2 +-
 target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index ccd62e8739a..6699626d7cb 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -36,7 +36,7 @@
 
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
-  VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
+  VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 op:1 000 0000
   # VSCCLRM (new in v8.1M) is similar:
   VSCCLRM      1110 1100 1.01 1111 .... 1011 imm:7 0   vd=%vd_dp size=3
   VSCCLRM      1110 1100 1.01 1111 .... 1010 imm:8     vd=%vd_sp size=2
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 808b4077054..0db936084bd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3721,6 +3721,31 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
         !arm_dc_feature(s, ARM_FEATURE_V8)) {
         return false;
     }
+
+    if (a->op) {
+        /*
+         * T2 encoding ({D0-D31} reglist): v8.1M and up. We choose not
+         * to take the IMPDEF option to make memory accesses to the stack
+         * slots that correspond to the D16-D31 registers (discarding
+         * read data and writing UNKNOWN values), so for us the T2
+         * encoding behaves identically to the T1 encoding.
+         */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+    } else {
+        /*
+         * T1 encoding ({D0-D15} reglist); undef if we have 32 Dregs.
+         * This is currently architecturally impossible, but we add the
+         * check to stay in line with the pseudocode. Note that we must
+         * emit code for the UNDEF so it takes precedence over the NOCP.
+         */
+        if (dc_isar_feature(aa32_simd_r32, s)) {
+            unallocated_encoding(s);
+            return true;
+        }
+    }
+
     /*
      * If not secure, UNDEF. We must emit code for this
      * rather than returning false so that this takes
-- 
2.20.1


