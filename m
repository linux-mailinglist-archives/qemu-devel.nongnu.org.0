Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D8D647C18
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sml-0006Rz-57; Thu, 08 Dec 2022 21:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3SmC-00068X-VN
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:20 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sm8-0001zm-CP
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:06:12 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 q18-20020a056830441200b006704633f258so2011840otv.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Xfk4bHnygfauWDlmIUai3p2sgHwvyBYVnNGY17EklU=;
 b=HJ5YvJqGLjFLD/6ZGyQihLm/5qvBw6odv+8g6Z8xs2qngJpoqlE26rHN9pf3cKWTxD
 fINCCXlxZi4CpugIrng4Yyl/osWAH3ToL0zh4lfB8h98fF5/VRDf0a5Z5k7X2SiJHexx
 WVQRzQpBjU7sf2XUf3ykeEEdZbRHPYqsKh46RvT/Ydogre+sE1gR0+5zsVchHCJTElBo
 CQGLSSb1BVYVsA5ZhoLryDGGUkz72Qcbl5T+M6DHUF/GqDsoIvIP+5hkmSqzyW2FhjAa
 8ILs3yoaMwygnbwW6DeUgxzvBcUVgnuBKv93Pz0fqMCGr8yFyQePIMD0YY4Hu4gFvL2F
 3oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Xfk4bHnygfauWDlmIUai3p2sgHwvyBYVnNGY17EklU=;
 b=SBrXQEO7Cf9EWSdlq3lPKlavPcAM2bMUQpyDNYSsutHZXDEcGOlCZpEFsFpfz7X98q
 +/x3dAR+dIs3fJKmRkLad8PORWj7zSp7Cm1oo+50IbPAfZNKj9aBG7YG+yVC6ewlNQuw
 p6nhHYAQYhswjjftsrRjejeNMA7GFLOtj62pZjQZZS848XzhGrlbsAOksSnyMdhCkHix
 ZhQGAHOY8qx+DOgccAa8Kleizzo4JoFKgorQT4QTV9tmJlVkU5Q48r5f+coQ+5JFYmqZ
 M+nkE5Mq7xmZp9eJR0g8kD//eXwy63wpsxO0v3L2S3bhZmb8mS1N47gCOogNzQ/uCzbQ
 mPRQ==
X-Gm-Message-State: ANoB5pnGDcstvD+I4OmoHLLviB1yqNG1kAF4oyYiqW1vdt0RrSoxMWlz
 L5I1BEB5N9AnI1wbkN9GPpAdTP4VXQfW0S063kQ=
X-Google-Smtp-Source: AA0mqf7wf7NhXX8HbWg+Wxhk5EZlgB0HjbcIL1Z+COuJyOsNrVscTb+EbbK1zmzaqyYsjyFKTHlEVA==
X-Received: by 2002:a9d:1987:0:b0:661:dfeb:ee91 with SMTP id
 k7-20020a9d1987000000b00661dfebee91mr2128811otk.11.1670551564122; 
 Thu, 08 Dec 2022 18:06:04 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:06:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 27/27] tcg/s390x: Avoid the constant pool in tcg_out_movi
Date: Thu,  8 Dec 2022 20:05:30 -0600
Message-Id: <20221209020530.396391-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Load constants in no more than two insns, which turns
out to be faster than using the constant pool.

Suggested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b72c43e4aa..2b38fd991d 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -877,6 +877,9 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 static const S390Opcode li_insns[4] = {
     RI_LLILL, RI_LLILH, RI_LLIHL, RI_LLIHH
 };
+static const S390Opcode oi_insns[4] = {
+    RI_OILL, RI_OILH, RI_OIHL, RI_OIHH
+};
 static const S390Opcode lif_insns[2] = {
     RIL_LLILF, RIL_LLIHF,
 };
@@ -928,9 +931,20 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         return;
     }
 
-    /* Otherwise, stuff it in the constant pool.  */
-    tcg_out_insn(s, RIL, LGRL, ret, 0);
-    new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
+    /* Otherwise, load it by parts. */
+    i = is_const_p16((uint32_t)uval);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, li_insns[i], ret, uval >> (i * 16));
+    } else {
+        tcg_out_insn(s, RIL, LLILF, ret, uval);
+    }
+    uval >>= 32;
+    i = is_const_p16(uval);
+    if (i >= 0) {
+        tcg_out_insn_RI(s, oi_insns[i + 2], ret, uval >> (i * 16));
+    } else {
+        tcg_out_insn(s, RIL, OIHF, ret, uval);
+    }
 }
 
 /* Emit a load/store type instruction.  Inputs are:
@@ -1160,9 +1174,6 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
 static void tgen_ori(TCGContext *s, TCGReg dest, uint64_t val)
 {
-    static const S390Opcode oi_insns[4] = {
-        RI_OILL, RI_OILH, RI_OIHL, RI_OIHH
-    };
     static const S390Opcode oif_insns[2] = {
         RIL_OILF, RIL_OIHF
     };
-- 
2.34.1


