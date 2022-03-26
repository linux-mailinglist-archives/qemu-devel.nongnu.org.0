Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206364E811D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:36:06 +0100 (CET)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6aL-0004Um-7D
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:36:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QN-0006ka-6a
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:47 -0400
Received: from [2001:4860:4864:20::2e] (port=39772
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QL-0005Kk-Kz
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:46 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-deb9295679so3475175fac.6
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pd5+yLliVhBXIEFxiOo2I5aLF4BKy2rSqhZkhW/VVIE=;
 b=NwZVntCms6Y0SeW9amg3ctADWKd0YF/hKhl4W/6Y2id4PRaMkkBk9u/YgXLSBkJYaF
 LulxTIVoeHeIDr1fZO+nyaCnxtoB5G0A8GgxZgChl184+jZeS6U0202Qh/PiZQszM8DV
 UFCwUnHRIk8taYfEzNJmicPBZGkO7zzCUpS3O/m3vFYhO7mGpRDXToOlUcPy8uYllTDb
 inbOS9BJjqBe8J7rjw/3S5FakdwzpzAd6g5y/4w2bQaN12wMFFXxcaVrOW5LwyuiZ4tF
 JRXZrfDZybTqy7+KYpAr+lD/8KnceqT9QHA+M746JFv429nFn5ZC14VrdpNNt9SgvNeq
 cPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pd5+yLliVhBXIEFxiOo2I5aLF4BKy2rSqhZkhW/VVIE=;
 b=OCsg9AaKpyDV39r9D+xqfjgQDagdtiLOxlRs7h9dzB1yatJ7F6wzC9SoWImLIkI8Ut
 ZUwgMIrAqLvupqdwSs7eq2ItBLA1l8dyMp5FjYVO1dZjCjN/ZFJBQuAi0c4Ir0zEHXS/
 Ue8BrrXpWGKyTrljOsecWVzVDH6zQsAceOeOp0MCGDlmOO1iMIvx2xZUiYjMXyUMp/Oh
 0g+RIhUjbUpva5f3LSmZEMEaZ9kA10qwFyJX2MWPG+taT1HfTQplsxEHbAuftToQSNTZ
 TwIc24khbAK8cUg13NSn01gbDwgB+jy54FJaynghJ5vLnXjnMrKoqcg2BbRxPjuj41LB
 Ulsg==
X-Gm-Message-State: AOAM530cIL4xVlwtfjul6nqDZ9mMDIEdLe9eIOL4w0IWbgV12cHQMux5
 1W5/My0e4UxHrXcsY0/mUx7xUsOfBb9WUS0W
X-Google-Smtp-Source: ABdhPJw57EEAaGAoIO348alh84Jrms1TYZyhBpM6Gs7zeHsO7T5i2zoTSGNAos4ZepDhdo7utYkISQ==
X-Received: by 2002:a05:6870:9720:b0:de:8a16:e27 with SMTP id
 n32-20020a056870972000b000de8a160e27mr6927734oaq.292.1648301144527; 
 Sat, 26 Mar 2022 06:25:44 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] linux-user/nios2: Drop syscall 0 "workaround"
Date: Sat, 26 Mar 2022 07:24:52 -0600
Message-Id: <20220326132534.543738-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall 0 is __NR_io_setup for this target; there is nothing
to work around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2768ae61dd..a285781fc5 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,10 +55,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.25.1


