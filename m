Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E34CC7E2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:21:25 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPst2-0004hf-OV
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYc-00067E-5o
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:31 -0500
Received: from [2607:f8b0:4864:20::62c] (port=41714
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYa-0004J3-EY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:17 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so5864544plg.8
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORB0WZKLRvhYig2aj896fzDRd+pz6bQqLgVN/Bqwse4=;
 b=z0Km8Ogb+0FP636Ovn5Y0aguO/ZwklKdUDtkowFiE8CRA3v9MqjuUR9ZuttYDrIOX/
 xXR+7ub5+QP5NxQxfRpXn7U2vPn3CK5uwouRxGv9N9CNETw67CA5BOLuhuaLFBODZdJT
 bj9/eFDg0wdAwg3CwcfzVO+1Kgj5IHJkDp/26fgMpWwE2T5DFYkXH39kstXvhhaMDzmD
 u99NbrUPL5FIJxOLQhmsARiyYdDX9E32r6BbeH5yg49Ohkq5SMSjiBBd6y4VlgeR/Qqb
 5YrL2PXItPxpalHf9l1SCCNWBIe7XIRxfW/0YJQ9kIqsLnd+Kl7fonzzdoFVnon55fD8
 HLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORB0WZKLRvhYig2aj896fzDRd+pz6bQqLgVN/Bqwse4=;
 b=CmyOQ1TMzjynN9H9TzQRMf9nUlZluiDU58axpf8pRRW7hx2LTgj8cvpUVPmAkhVPlr
 ZBwFK5gYJ376l/kw0OXoAETDSrrtT5M6k0jmzwyGWN7AMwThTG1YZlJwhAH/yzEVo9VN
 X9pRMQZzIU5MnUpoxlv8xbNQ6br1LWUPMUO3bN87W1PDxRvLIs15DmKO0hkgZVJVEuda
 4UNVs6AzTpaPQ75J7haVCB7vYvhGcq5xwwMq1iBSHEhcnF3a1WTh20rw+KQLTx2Q2wVC
 7o/thbs0aR20yqnINmaSGvyfGTLwl2DSSAXYxP/Vr/JHDhhYA17qPFtB1p9r84uU+GGw
 N/mQ==
X-Gm-Message-State: AOAM530Qk5aKngXOJly5iOkcuRlHb+kg5DOilJeckpH7MaPyLuqPi9/k
 WCu8BN45LRQLPtr3Gpy8hGpijsbUsaMlqQ==
X-Google-Smtp-Source: ABdhPJxNczEaSpyz/c9lGgZT3K7fzrpiKfejWPScJyWjQSgLWkiVn2AJd9AhFxkXod39TIaWWAaO6Q==
X-Received: by 2002:a17:90a:8911:b0:1bd:395e:40e5 with SMTP id
 u17-20020a17090a891100b001bd395e40e5mr7246714pjn.121.1646341214341; 
 Thu, 03 Mar 2022 13:00:14 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] tcg/i386: Implement avx512 min/max/abs
Date: Thu,  3 Mar 2022 10:59:32 -1000
Message-Id: <20220303205944.469445-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

AVX512VL has VPABSQ, VPMAXSQ, VPMAXUQ, VPMINSQ, VPMINUQ.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index edf0d066e7..be94b82fd6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -313,6 +313,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PABSB       (0x1c | P_EXT38 | P_DATA16)
 #define OPC_PABSW       (0x1d | P_EXT38 | P_DATA16)
 #define OPC_PABSD       (0x1e | P_EXT38 | P_DATA16)
+#define OPC_VPABSQ      (0x1f | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PACKSSDW    (0x6b | P_EXT | P_DATA16)
 #define OPC_PACKSSWB    (0x63 | P_EXT | P_DATA16)
 #define OPC_PACKUSDW    (0x2b | P_EXT38 | P_DATA16)
@@ -339,15 +340,19 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
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
@@ -2841,16 +2846,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2886,8 +2891,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_UD2, OPC_VPSHRDVW, OPC_VPSHRDVD, OPC_VPSHRDVQ
     };
     static int const abs_insn[4] = {
-        /* TODO: AVX512 adds support for MO_64.  */
-        OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_UD2
+        OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_VPABSQ
     };
 
     TCGType type = vecl + TCG_TYPE_V64;
@@ -3471,7 +3475,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_umin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_abs_vec:
-        return vece <= MO_32;
+        return vece <= MO_32 || have_avx512vl;
 
     default:
         return 0;
-- 
2.25.1


