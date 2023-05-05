Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A911E6F8AFB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vS-0000ku-8c; Fri, 05 May 2023 17:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vB-0000cy-VN
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v9-0004Oi-Co
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:56 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso23287375e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321894; x=1685913894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LBuNmVB+VRtISP57Rd/VwE7/BgCkmrVs2in5OT4+XQ=;
 b=m9U60h9k0ecvMxfzjSNT7HSUkVnYikEPFPwr5W/cR9r3smJse/IlM8rLWAGkEAoNFG
 DoZVoluy8lMA+eKzt5WZ/Fom4g2/v368JkfBrq7hvMeYq3zAZyCtQWn8ROiR1RAOauZb
 YbMkynyieCoeDyRswHdO6FNVviZfrBggPPUrWq/5J53abzmcjnTNd1oF3tN0c8kDCyvk
 xR6opaLmDazu9Uorox/ZurLT+mltUKiWa6OEIqQn/mvMXCk6Xh1Co0WMVp06CLIiK/R8
 TA6Ooi5VeSCqQ77+a1eqJSjgGmCZCu6o6awACrXLp9EUMVh2ClnHiagkop9HPrPY9MH7
 kJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321894; x=1685913894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LBuNmVB+VRtISP57Rd/VwE7/BgCkmrVs2in5OT4+XQ=;
 b=fSuSP+SN6uzbVGjLiF0ZcqGV2fG5dGwDe2Xtfvw+NedEHn9SAcSXyKLxkRgM03Elrz
 FWnyr07+ktncgoj6XPW10byo2GvuXcumWY2zcFksPZxjheR7IFSP3gLQImp+uEbSTAib
 0grELdoxaV8OnXyvrSas9foKob9tzrsxT4aPCxseNr6u87dv5wWFAk+oz6UTJwmTSCKl
 HEJK5dKu80n+Vfp5ptSmNiydzfbkd40UGB7VGM+xemVQT0ZAOJNkmkEZadWczAlRIZIR
 cvzVWpYbYpIX1w5WdTzBnbzQH/wTLWlRuCeGVrREz7WRDy/ORy3tEyEd5FV+pApZfuaE
 ImBw==
X-Gm-Message-State: AC+VfDxHHXW781TKQ1Rjp+/dCClS/lLorkepDZ5rTPeNaLfO102ZwAYK
 LvrFAnlelt+X1qGdro+CnFGcopFdsXJlBXUu7X1EYQ==
X-Google-Smtp-Source: ACHHUZ4X20/2kSJY3a9mrScZXtFolm8q/5KZdehzpnA6BGNtfWvqxxf5OiR97Z+mHQ56BD56MLlK/g==
X-Received: by 2002:a05:600c:21cf:b0:3dc:55d9:ec8 with SMTP id
 x15-20020a05600c21cf00b003dc55d90ec8mr1908505wmj.41.1683321894046; 
 Fri, 05 May 2023 14:24:54 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 09/42] target/xtensa: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Fri,  5 May 2023 22:24:14 +0100
Message-Id: <20230505212447.374546-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Message-Id: <20230502135741.1158035-9-richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0cf3075649..728aeebebf 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1549,7 +1549,7 @@ static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 res = tcg_temp_new_i32();
 
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
-    tcg_gen_qemu_ld8u(res, addr, dc->cring);
+    tcg_gen_qemu_ld_i32(res, addr, dc->cring, MO_UB);
 }
 
 static void translate_depbits(DisasContext *dc, const OpcodeArg arg[],
@@ -1726,7 +1726,7 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
     } else {
         tmp = tcg_constant_i32(arg[1].imm);
     }
-    tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
+    tcg_gen_qemu_ld_i32(arg[0].out, tmp, dc->cring, MO_TEUL);
 }
 
 static void translate_loop(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


