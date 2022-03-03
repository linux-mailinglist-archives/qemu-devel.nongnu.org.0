Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB184CC7AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:13:36 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPslT-0006bY-MR
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:13:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYP-0005qj-7w
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:05 -0500
Received: from [2607:f8b0:4864:20::1033] (port=53963
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYN-00045o-GS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id bx5so5698525pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cv8rekvHfXBD5FgVr8FJHUh95M1X519FeesHcglTBx4=;
 b=uzfPR0qpizS1A51wbNF03Sbn7UdEEGWLGH24UK6l6c+wF08lfZcIQcrlZso333Q6A+
 BUPk6qyTwQLNy8Fro6juhElwrj2PPg+GjD5h/qVu42VPVNvs96ItMaOZalc0ymZ9seEH
 aKKZv0ykeQkX3tbSHDYxIpXUo4B4s0BI0SRTuk4GM1aMN0M0Z9v5sWjVT7ZM1gnAR0ce
 WaPHlkMwNt4TFJV3MfXFSA62jkPStdI6eXdEH//ZHMWwJ6xRcUwHxnFwGsuMKRynrl/q
 Zz5CNsxfIUstRTLDiUZhZoloYjVP7i2h9uK5+TDRBcvNne9Lezxb2PLKNDCl/hZOYVUw
 mK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cv8rekvHfXBD5FgVr8FJHUh95M1X519FeesHcglTBx4=;
 b=n4M2OhMz/FjNy9PmJDdQ+zNc2gJ2mjVU6mAB7a6CR0zprhmFa5/odacOlZ3ySS/iXV
 rX97b5CDEtu40NolQac/DJvxdbquP5q0+GHVXnIvSvVSmDrLjePgX0gqeSTHFlrM2LMu
 psyGM19zd6R6zU6fDgBeqgvwsXGZanpbP58btB1o3Cv2OwFfHfHFJDuMrMmEpGD4A6Iz
 sGzYSMLFfr1ySC0CSVnJXecmfVOI14HKH4Hqq+7249JStJRdzPPA5UXDY2lw9Og6Ndia
 AclMLJUqXYqrVRSQWPPzl3YVf97QBMq3oeVtTWzUP7uFR76CbToFOGwXVC3ABTPuo6s2
 E4UQ==
X-Gm-Message-State: AOAM530d9+lpBL7Rvh31WOuPaNdu0fUADl4VEd99P3VgFhB2jmpqrnAK
 9znPsgRjCErYu2sONyqy6dTU0CtuTd+9gw==
X-Google-Smtp-Source: ABdhPJwvm+PmZM6Nzy2nwoNgY+xAyan3jiju8w4GFfmxIvSQ6X9jvWTzVddg2a9TyBVt1Mjdr8p+kQ==
X-Received: by 2002:a17:902:b692:b0:14c:935b:2b03 with SMTP id
 c18-20020a170902b69200b0014c935b2b03mr38395485pls.81.1646341201182; 
 Thu, 03 Mar 2022 13:00:01 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] tcg/i386: Implement avx512 variable shifts
Date: Thu,  3 Mar 2022 10:59:23 -1000
Message-Id: <20220303205944.469445-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has VPSRAVQ, and
AVX512BW has VPSLLVW, VPSRAVW, VPSRLVW.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6a53f378cc..055db88422 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -419,9 +419,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
 #define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
+#define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
+#define OPC_VPSRAVW     (0x11 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
+#define OPC_VPSRAVQ     (0x46 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSRLVW     (0x10 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
@@ -2835,16 +2839,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
     };
     static int const shlv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16.  */
-        OPC_UD2, OPC_UD2, OPC_VPSLLVD, OPC_VPSLLVQ
+        OPC_UD2, OPC_VPSLLVW, OPC_VPSLLVD, OPC_VPSLLVQ
     };
     static int const shrv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16.  */
-        OPC_UD2, OPC_UD2, OPC_VPSRLVD, OPC_VPSRLVQ
+        OPC_UD2, OPC_VPSRLVW, OPC_VPSRLVD, OPC_VPSRLVQ
     };
     static int const sarv_insn[4] = {
-        /* TODO: AVX512 adds support for MO_16, MO_64.  */
-        OPC_UD2, OPC_UD2, OPC_VPSRAVD, OPC_UD2
+        OPC_UD2, OPC_VPSRAVW, OPC_VPSRAVD, OPC_VPSRAVQ
     };
     static int const shls_insn[4] = {
         OPC_UD2, OPC_PSLLW, OPC_PSLLD, OPC_PSLLQ
@@ -3335,9 +3336,24 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
-        return have_avx2 && vece >= MO_32;
+        switch (vece) {
+        case MO_16:
+            return have_avx512bw;
+        case MO_32:
+        case MO_64:
+            return have_avx2;
+        }
+        return 0;
     case INDEX_op_sarv_vec:
-        return have_avx2 && vece == MO_32;
+        switch (vece) {
+        case MO_16:
+            return have_avx512bw;
+        case MO_32:
+            return have_avx2;
+        case MO_64:
+            return have_avx512vl;
+        }
+        return 0;
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
         return have_avx2 && vece >= MO_32 ? -1 : 0;
-- 
2.25.1


