Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04C479C72
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:53:23 +0100 (CET)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfli-0000hy-RG
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbl-0000ul-UV
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:05 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53165
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbk-0003UW-2f
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:05 -0500
Received: by mail-pj1-x102b.google.com with SMTP id co15so5398388pjb.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o/7najhkR5qPEA2ciVqzf3+aTS5Pj28E4SIFbzKl/N0=;
 b=dBRUwLc9e3kFu4k5pj3QTJ5DUuLNEXgfvGEf++Lg3i/7fTN+Jo1bolz+VdTfdpwFsd
 w7uMQAK6pp5+MqL78HuOdluqhsCt6yC4SK33hkhlRMyLw0QlU73uCbQAMrVHqiQJr7/k
 /iF3YPSb9E+MRhL8zT4xtZBtAxSBkN+Ut4TAF5AW+oos0En+2/Va3aOL9NBKGWlVrL5C
 Y29gFEZSlfmLPTL7v0sPsVwGVCD5WJ28KP25g0oLsrPHTM0BiMyRVFB9X/KL+oVlD/lJ
 193RNEiH7PrsUUH/Z/P0HAxSQkUXfJ/Fs072sqotpxfkAg6Kps2/fphd3hxC5yi6FQmX
 wk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o/7najhkR5qPEA2ciVqzf3+aTS5Pj28E4SIFbzKl/N0=;
 b=lBhgHxWclUgysj2VzbvgiQXLLeVF5rORUr2TcIBu6x2OIOxWHU0ZwzebLTkQAnQXAU
 s3O/mlDFq3N3G+X5uhUqoyCpFlbcyYhQa4ZV00CTkz6fm3jqafyViOLMGGf2JvMtxwe+
 QHStfQ0rOCCAMFqhABOuDKnQ1gJ6ynCI/K2VbwfhT+hD4E+MfhRn0nVq+SO8h+dYfpfn
 JJT7W7YSjOwzBPtcS9ImbDR8smvn+CIF7HZz6pLpgQZt7uDzN8JuFguEThNuDQ/saowT
 fLOb22mD+IR2rnBTFyo7+ywVXJH5KULK4UZ4olGqSZdfmxhYyGMHtq4CSuH3aBgAoaxV
 C3hw==
X-Gm-Message-State: AOAM530t2q+m/WZv9kOYBQpEklVlUMla3TJq0YeWqo8MBkoobcML8V2A
 AcUP5prnbdsURyn9IchAFoqwyc2b11csYQ==
X-Google-Smtp-Source: ABdhPJxwQOGh902x8gtSy3lVsRALLy7KS7WPaw8oOdLd+ZI2A1/LKRtJqVCPlDXjGHCgMycd+IBLYA==
X-Received: by 2002:a17:90a:f998:: with SMTP id
 cq24mr14422241pjb.64.1639856582310; 
 Sat, 18 Dec 2021 11:43:02 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/20] tcg/i386: Implement avx512 min/max/abs
Date: Sat, 18 Dec 2021 11:42:47 -0800
Message-Id: <20211218194250.247633-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 447aab7438..22eaa53cb1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -312,6 +312,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PABSB       (0x1c | P_EXT38 | P_DATA16)
 #define OPC_PABSW       (0x1d | P_EXT38 | P_DATA16)
 #define OPC_PABSD       (0x1e | P_EXT38 | P_DATA16)
+#define OPC_VPABSQ      (0x1f | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PACKSSDW    (0x6b | P_EXT | P_DATA16)
 #define OPC_PACKSSWB    (0x63 | P_EXT | P_DATA16)
 #define OPC_PACKUSDW    (0x2b | P_EXT38 | P_DATA16)
@@ -338,15 +339,19 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PMAXSB      (0x3c | P_EXT38 | P_DATA16)
 #define OPC_PMAXSW      (0xee | P_EXT | P_DATA16)
 #define OPC_PMAXSD      (0x3d | P_EXT38 | P_DATA16)
+#define OPC_VPMAXSQ     (0x3d | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PMAXUB      (0xde | P_EXT | P_DATA16)
 #define OPC_PMAXUW      (0x3e | P_EXT38 | P_DATA16)
 #define OPC_PMAXUD      (0x3f | P_EXT38 | P_DATA16)
+#define OPC_VPMAXUQ     (0x3f | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PMINSB      (0x38 | P_EXT38 | P_DATA16)
 #define OPC_PMINSW      (0xea | P_EXT | P_DATA16)
 #define OPC_PMINSD      (0x39 | P_EXT38 | P_DATA16)
+#define OPC_VPMINSQ     (0x39 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PMINUB      (0xda | P_EXT | P_DATA16)
 #define OPC_PMINUW      (0x3a | P_EXT38 | P_DATA16)
 #define OPC_PMINUD      (0x3b | P_EXT38 | P_DATA16)
+#define OPC_VPMINUQ     (0x3b | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PMOVSXBW    (0x20 | P_EXT38 | P_DATA16)
 #define OPC_PMOVSXWD    (0x23 | P_EXT38 | P_DATA16)
 #define OPC_PMOVSXDQ    (0x25 | P_EXT38 | P_DATA16)
@@ -2748,16 +2753,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_PACKUSWB, OPC_PACKUSDW, OPC_UD2, OPC_UD2
     };
     static int const smin_insn[4] = {
-        OPC_PMINSB, OPC_PMINSW, OPC_PMINSD, OPC_UD2
+        OPC_PMINSB, OPC_PMINSW, OPC_PMINSD, OPC_VPMINSQ
     };
     static int const smax_insn[4] = {
-        OPC_PMAXSB, OPC_PMAXSW, OPC_PMAXSD, OPC_UD2
+        OPC_PMAXSB, OPC_PMAXSW, OPC_PMAXSD, OPC_VPMAXSQ
     };
     static int const umin_insn[4] = {
-        OPC_PMINUB, OPC_PMINUW, OPC_PMINUD, OPC_UD2
+        OPC_PMINUB, OPC_PMINUW, OPC_PMINUD, OPC_VPMINUQ
     };
     static int const umax_insn[4] = {
-        OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
+        OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_VPMAXUQ
     };
     static int const rotlv_insn[4] = {
         OPC_UD2, OPC_UD2, OPC_VPROLVD, OPC_VPROLVQ
@@ -2793,8 +2798,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_UD2, OPC_VPSHRDVW, OPC_VPSHRDVD, OPC_VPSHRDVQ
     };
     static int const abs_insn[4] = {
-        /* TODO: AVX512 adds support for MO_64.  */
-        OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_UD2
+        OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_VPABSQ
     };
 
     TCGType type = vecl + TCG_TYPE_V64;
@@ -3377,7 +3381,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_umin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_abs_vec:
-        return vece <= MO_32;
+        return vece <= MO_32 || have_avx512vl;
 
     default:
         return 0;
-- 
2.25.1


