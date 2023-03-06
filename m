Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C86AB419
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYz1H-0002Vo-2p; Sun, 05 Mar 2023 19:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0m-0000uY-E7
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:34 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0j-00083a-P9
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:31 -0500
Received: by mail-pj1-x102e.google.com with SMTP id oj5so8146011pjb.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyGMrsQTYruCIAiU5aChMmQRcQ7d0Js3zv9Ml813lNc=;
 b=fDdcjmKPEP5xklk0QJ10lfYmeCmQ1qsEdPQp0EFZnqJoIIaw8Pes2T2MXoQQJIimXQ
 VVSUmFUFMlTg3nArrCeDBvEdFZV2q6v2r2AQxbXAKLuA1O9XXNn8VqF5R8G9+HJ0FxBu
 cqYNkal5tS2LVqrCS2WmEQPURqMULg8OJdB3/oTqQQuW9YA7OXfcAmOz7T7qIWJSE/6X
 zCRZi3yoMramDFohSG7lrmXwF+VkvT+o1s1CCrBb2nPhYwj84pfEJvD/Y9Vh72JgKlRA
 6uKOcajvDpIEyFv4LCE4r6gTDJsTHfttmJP+a2/XT+XVYk9SlvqupRnkzpU/q4uiAMj2
 BPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HyGMrsQTYruCIAiU5aChMmQRcQ7d0Js3zv9Ml813lNc=;
 b=BVQfc+4u/8NPz1jCw8AnqubXzLkBZ53z4ALyNwLVPqvoE6jsaTT7hlj/YL+lm7rNse
 WM13q6ljrRLEV5ltVtfr+ZjI0ZWQui/Tzb9buaOKEcLXtApJ3bo6d49eADOedPxEVOMu
 xp2zYY7myhJJVgeUPTBnElWBCLpj76D3cH9b6GuKmNc1RiXbZM/C8bcNg5EHcbZFyXOG
 tMgJpbpo0NHs60Dyj7fn/QDHHWCRGaieHE3xObCLX3HWSyfIfRj3bqfP5I9aotQ3rurS
 Il5f1xBhGp+as+2PePK3EIdRGIkHTVjBparg0hrGGzPCP28UATiK9EJq1b7GZzLh2Zxw
 A4aA==
X-Gm-Message-State: AO0yUKX7DIUgUlZWMN94H1sPbGXnuaG2XdhZG6TdJcLdPB7KN+pFbCfq
 2HMXxUFDk1FH0GmIKxdueDZnmO+x72aq07AqSayQuw==
X-Google-Smtp-Source: AK7set88inPVjknci/lHsC32iD2akmXiclLxilVyV6ss/RZz1fg2UqS3hQOAB6Wy3zMrAuMJmlTDrg==
X-Received: by 2002:a17:90b:3e8e:b0:236:99c4:6096 with SMTP id
 rj14-20020a17090b3e8e00b0023699c46096mr9487705pjb.35.1678063648403; 
 Sun, 05 Mar 2023 16:47:28 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm4971492pjb.21.2023.03.05.16.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:47:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 81/84] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Date: Sun,  5 Mar 2023 16:39:51 -0800
Message-Id: <20230306003954.1866998-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use addi on the addition side and tcg_constant_i32 on the other.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d727f9ffd8..41b84082de 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1721,10 +1721,10 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp;
 
     if (dc->base.tb->flags & XTENSA_TBFLAG_LITBASE) {
-        tmp = tcg_const_i32(arg[1].raw_imm - 1);
-        tcg_gen_add_i32(tmp, cpu_SR[LITBASE], tmp);
+        tmp = tcg_temp_new();
+        tcg_gen_addi_i32(tmp, cpu_SR[LITBASE], arg[1].raw_imm - 1);
     } else {
-        tmp = tcg_const_i32(arg[1].imm);
+        tmp = tcg_constant_i32(arg[1].imm);
     }
     tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
 }
-- 
2.34.1


