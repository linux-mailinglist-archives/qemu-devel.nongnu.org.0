Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB406EE874
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:45:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS8-00068Q-0i; Tue, 25 Apr 2023 15:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORX-0005Fv-R0
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:15 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORJ-00059j-1i
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:15 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2a7ac89b82dso59898671fa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451297; x=1685043297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=cejMgGVXMpZVF2BRpBxRtwq9/Bb7QnOR7SFG5M7gpFh3egQXp6cDTaQvbEM6hfq9Ky
 NyaWgjRDly73YzNOMMN2wJxpM+/XMJhTTT1BP/yDCoxk5o8AAEBWw8ZqQQAFtnrggIjA
 ELapJLD/PlQO7k+4b8y2oqG2itcqrNdxy7N4w2StrwHVVxd3FA75NSsU+wWeseP6WyCn
 +uNIHTFTcsM7fmbyK4IqJuV4CdMzscTFihejmdSt02LR9eaw2Rd61AmGlYYSNGVP2Lwx
 LN0eTFWWcYFO4q3FVxwH/Tm1ZYSdccNoI6pR+ckhWTpJMVdzSJe9ouO8ldkO2KjmdmSl
 tNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451297; x=1685043297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=W0HK6dikT3K7FnCvIV/VTZGrbcUyE6EEkgcsHYYlr7Lt9z7I2Wu5yXpsKIArm7l1PT
 cJgugHgzELeeq8SlO0rFBy0EYuwnGPNxeV9xUTVG9jrwKEXQ2JbgKPrmO0cTcFOjlLR6
 Dxi3IXqN/pHbrJdTft/g/LbMSQQJTfBTcbt+fbi1FPDbcHBjVS4cGeH/mBlXGtAJsNQA
 16v9yshNgm4e88WvjJuileKH+e46qIzW5K8T0sK65Tkb4FdG0H5najYFo/Ni8FcYalRH
 iSbb2h06MYKCjLj/uy30AyK19fORjVYA/gxDFOwN5P0fpr9siFl3jRwVrKuPc+YFiByp
 k4lg==
X-Gm-Message-State: AAQBX9dLmdrYseaSNVuthFGh0movAPmzM1wyFLdg5YNoGWzV8VTzkVLm
 oyG863YSF+gSafvRJKxknNDOomjcnPqsAy+7RJSZ/A==
X-Google-Smtp-Source: AKy350Y006jtl7MUchtilB7tc+mQksfDBAHuLEdCPcBsBXpdkIIxuQDG14ZYDQ5PGVoh3RKQTISPsw==
X-Received: by 2002:a2e:3803:0:b0:2a8:b995:ffe5 with SMTP id
 f3-20020a2e3803000000b002a8b995ffe5mr3771287lja.25.1682451296951; 
 Tue, 25 Apr 2023 12:34:56 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 33/57] tcg/sparc64: Split out tcg_out_movi_s32
Date: Tue, 25 Apr 2023 20:31:22 +0100
Message-Id: <20230425193146.2106111-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e244209890..4375a06377 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,6 +405,13 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+/* A 32-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    tcg_out_sethi(s, ret, ~arg);
+    tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+}
+
 /* A 32-bit constant zero-extended to 64 bits.  */
 static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
@@ -444,8 +451,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
-        tcg_out_sethi(s, ret, ~arg);
-        tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+        tcg_out_movi_s32(s, ret, arg);
         return;
     }
 
-- 
2.34.1


