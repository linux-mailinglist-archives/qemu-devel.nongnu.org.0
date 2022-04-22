Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFDB50BF05
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:50:10 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxQ1-0007Ws-Jx
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb9-0000ic-GG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:36 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb7-000849-WB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:35 -0400
Received: by mail-io1-xd30.google.com with SMTP id q22so9243094iod.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOjXySDL0Ufzbbr9M/xH36yPYqmTAVv3+nLLoSnWdKg=;
 b=AiRXOo49rq/mLSIg7yP2HwzJvvpyPFeh68yST9wKKBcQqIuNTkr1cA1FEQZ6tVSp8w
 Gh+PcXfGFCaAwrjSj+VcC1tgPZwlmjf8XRs01YNsEFrSx1XfvqOgFsmU/FMFpyL+g5mN
 Q8C+9v3Z/XUgN9G9HutfHlVV1mZrQLOrtWhjX7wO5NNru9vHNp4B/iBx+U/lrZApPc+G
 uhwi8POEBrsebbsqTidX6vRf3pKMNVRBumvHIfFxP6vR9rZgfnMGO5+KW3XhuWp8QoxY
 ew8zeQdqCoYLOsKMStlcwSwLqCjScTXnusz0wS7tGeedx7jzcAxKQohHFMV8RHb37aUG
 BhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOjXySDL0Ufzbbr9M/xH36yPYqmTAVv3+nLLoSnWdKg=;
 b=JFusugpad7hDfVLMSqOlwTekLcU3izV2j1RT79iweyPK0O8kfqmXfn/PzszZFLN0Eq
 ZK6XfSLpdhAiIfg8T5j2lWmmZqu3N9p3fglxltuJraQAjAkcj8pSt7SI6NNcf0PrVpd+
 F4z7NzmvEgRtDCCQAZES3Iuqid5109NhAA53JcEuRq8OZ4CTFIEwrej8NXWJhm2MGFOA
 3FCLtiUXco29PcmLKwzvX4RKs3cPbzwgtVgmfL07+9NalVZyebvIfCO9jRdPaBZUYuHi
 GYhTthabhGIe+/S3TphBnZwMRbjBvkIzwexZ+Gn5+g7uTyEoFE9m0fyqUdwYy87hKq7b
 bp8A==
X-Gm-Message-State: AOAM5315oF9hNBpP+/vqcGiBeaXUufwRv/EvyM5AMJfzSg7DhCjsQdFo
 u92eCecy3pbw3J/gAeyL9Yg1u+0Ga6w9s+NH
X-Google-Smtp-Source: ABdhPJzyLUD05/3OSaDSgi8zLuVpnsdY+sw9v3/yGEayfbQj4lk7gqNK8bztZr7qzEmHutegE66DfA==
X-Received: by 2002:a05:6638:204a:b0:323:e148:74f2 with SMTP id
 t10-20020a056638204a00b00323e14874f2mr2505862jaj.90.1650646653014; 
 Fri, 22 Apr 2022 09:57:33 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 62/68] linux-user/nios2: Handle various SIGILL exceptions
Date: Fri, 22 Apr 2022 09:52:32 -0700
Message-Id: <20220422165238.1971496-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed out on a couple of exception types that may
legitimately be raised by a userland program.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-59-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index a5e86990e2..da77ede76b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -50,6 +50,18 @@ void cpu_loop(CPUNios2State *env)
                             env->ctrl[CR_BADADDR]);
             break;
 
+        case EXCP_ILLEGAL:
+        case EXCP_UNIMPL:
+            /* Match kernel's handle_illegal_c(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
+            break;
+        case EXCP_SUPERI:
+            /* Match kernel's handle_supervisor_instr(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-- 
2.34.1


