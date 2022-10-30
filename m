Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CF612D71
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGrH-0001eT-6m; Sun, 30 Oct 2022 18:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqo-00005E-W8
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqg-0008OA-9h
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id v1so13650870wrt.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uaZe+sbT/g27ceIVMmjLGMoQzyXgJ/iUh8Exgos0kpA=;
 b=gdcKziiS9WduqxMBKxSGPPoIPo3uUluw9JPZWey54+LV70ss1K/G4tdYhar9E+plmA
 B02FtK/tDMWRZOtB8pXU3yt0zCZ4ejPWtiRMlDmhqQhtFyL5FOip45aSL9n9OV1yfDrM
 MYTjgmMAvzOKT+GvUYzJgYQ3u/qJjsWRVWnRIKx/xd/CIg5A408erJVMD158CvYdsUPi
 gc4zIqmLv0pSC39hMjsk79VDDt4Hef1jcNFq6Xcwjm4JOxt0MfrDBwH/UrDR0BIPNeGt
 EzP6I3ko9pEqHRJXYhtTMh1y54DL/qOUyz8it48RL0JNpIaUAkNXdI4BIxdbNiecs5f7
 npYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uaZe+sbT/g27ceIVMmjLGMoQzyXgJ/iUh8Exgos0kpA=;
 b=aombfav0hiUG57nQCu5oZu5BMxRN0LNeYsCevK+/ZkTotf1WpmJKaG9GlP1MRdqPVJ
 U2h/U/RUxD7P7xI1t+kw27hlN42k2qpBzPHZvo0xZLMwBUsEbFmQZ/bDOC6mjYDHv8r9
 L2Mt836PPfxDZcBD4QUZoGXUepJXDyHC8ea3kIFcfR9/aw2dxM6bYBlCdVKfN9VEnhOG
 Mtzjd04YaxJSbd7Vczh1PgMuJDFsviYHf/ZH8k8VMQMKpFeMDxm2GzuskBtJT140Krdv
 0QEHoOhl9QXZ09UxmvwgbAh8vS2N/3kk0XKiPsrqurA6Dk1LMmqg4JYChZ994+nBgmbW
 r4pw==
X-Gm-Message-State: ACrzQf1rSSsVf62BbiQ2dlaHsFPAEqlUivJX/L+eOcOaJv1o76w6Nilb
 LKGQMC09MrVSlqCmJVJTkKmRiP8y3uARGw==
X-Google-Smtp-Source: AMsMyM78R85erhMj7mtFd59xlG66sM69jiVdai8XO7ECNOYRmMdelt3YswQr6fsMgf4WWH7TLtECOg==
X-Received: by 2002:a5d:61c8:0:b0:236:b893:9d83 with SMTP id
 q8-20020a5d61c8000000b00236b8939d83mr4389198wrv.354.1667169126748; 
 Sun, 30 Oct 2022 15:32:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adffa83000000b0022ae401e9e0sm5213487wrr.78.2022.10.30.15.32.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 31/55] disas/nanomips: Remove CPR function
Date: Sun, 30 Oct 2022 23:28:17 +0100
Message-Id: <20221030222841.42377-32-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

CPR functions has been removed.

Before this patch, we'd been calling img_format twice, the first time
through the CPR function to get an appropriate string and the second
time to print that formatted string. There's no more need for that.
Therefore, calls to CPR are removed, and now we're directly printing
"CP" and integer value instead.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-18-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 110 +++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 3b1ca249ce..3a3a9a9b69 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -519,13 +519,6 @@ static const char *AC(uint64 reg)
 }
 
 
-static char *CPR(uint64 reg)
-{
-    /* needs more work */
-    return img_format("CP%" PRIu64, reg);
-}
-
-
 static char *ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
@@ -2774,10 +2767,9 @@ static char *BC2EQZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(ct_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BC2EQZC %s, %s", ct, s);
+    return img_format("BC2EQZC CP%" PRIu64 ", %s", ct_value, s);
 }
 
 
@@ -2796,10 +2788,9 @@ static char *BC2NEZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(ct_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BC2NEZC %s, %s", ct, s);
+    return img_format("BC2NEZC CP%" PRIu64 ", %s", ct_value, s);
 }
 
 
@@ -3403,9 +3394,8 @@ static char *CFC1(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CFC1 %s, %s", rt, cs);
+    return img_format("CFC1 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -3425,9 +3415,8 @@ static char *CFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CFC2 %s, %s", rt, cs);
+    return img_format("CFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -4889,9 +4878,8 @@ static char *CTC1(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CTC1 %s, %s", rt, cs);
+    return img_format("CTC1 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -4911,9 +4899,8 @@ static char *CTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CTC2 %s, %s", rt, cs);
+    return img_format("CTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5745,9 +5732,9 @@ static char *DMFC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5789,9 +5776,8 @@ static char *DMFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("DMFC2 %s, %s", rt, cs);
+    return img_format("DMFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5812,9 +5798,9 @@ static char *DMFGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5883,9 +5869,9 @@ static char *DMTC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5927,9 +5913,8 @@ static char *DMTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("DMTC2 %s, %s", rt, cs);
+    return img_format("DMTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5950,9 +5935,9 @@ static char *DMTGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -8148,10 +8133,10 @@ static char *LDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(ct_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LDC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
+    return img_format("LDC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      ct_value, s_value, rs);
 }
 
 
@@ -9089,10 +9074,10 @@ static char *LWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(ct_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
+    return img_format("LWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      ct_value, s_value, rs);
 }
 
 
@@ -9665,9 +9650,9 @@ static char *MFC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9709,9 +9694,8 @@ static char *MFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MFC2 %s, %s", rt, cs);
+    return img_format("MFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -9732,9 +9716,9 @@ static char *MFGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9755,9 +9739,9 @@ static char *MFHC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9799,9 +9783,8 @@ static char *MFHC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MFHC2 %s, %s", rt, cs);
+    return img_format("MFHC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -9822,9 +9805,9 @@ static char *MFHGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10391,9 +10374,9 @@ static char *MTC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10435,9 +10418,8 @@ static char *MTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MTC2 %s, %s", rt, cs);
+    return img_format("MTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -10458,9 +10440,9 @@ static char *MTGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10481,9 +10463,9 @@ static char *MTHC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10525,9 +10507,8 @@ static char *MTHC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MTHC2 %s, %s", rt, cs);
+    return img_format("MTHC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -10548,9 +10529,9 @@ static char *MTHGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -12021,9 +12002,9 @@ static char *RDHWR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *hs = CPR(hs_value);
 
-    return img_format("RDHWR %s, %s, 0x%" PRIx64, rt, hs, sel_value);
+    return img_format("RDHWR %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, hs_value, sel_value);
 }
 
 
@@ -13089,10 +13070,9 @@ static char *SDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(cs_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SDC2 %s, %s(%s)", cs, s_value, rs);
+    return img_format("SDC2 CP%" PRIu64 ", %s(%s)", cs_value, s_value, rs);
 }
 
 
@@ -15244,10 +15224,10 @@ static char *SWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(cs_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWC2 %s, %" PRId64 "(%s)", cs, s_value, rs);
+    return img_format("SWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      cs_value, s_value, rs);
 }
 
 
-- 
2.37.3


