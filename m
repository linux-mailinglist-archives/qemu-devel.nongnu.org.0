Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69453515FBF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:06:56 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrUd-0006Dp-HH
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI3-0004dy-8t
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI1-00083C-C0
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id u9so8982724plf.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiL50oJATvoUHpaFbUSOhW72pyefXH6OHiLxuwc06l0=;
 b=ernaJqMTIkqITS2s+ZqNrq/Nrnth4SXgBsb439L7yEGQ3AuZvf5liSuaeXKvMnTWt3
 e4e13BGy5K5R4UeXPFjQsc4qtb0Iaetzh0xyFceLIZ4XzY8XJopZkavdj+qh86/L/ChG
 SQFQAjd3haDDUwu3i0yrFZjfHidsYStsDZtM/bABifc+DAUzBiodQ6kNuzkY3kXWUDcp
 FEhMz7DA/gDgiI1Q50d67WHf34lJpQut8C/w2uw2JdVGnPkcO96300thWZttrJJPwGpD
 KaPSpjDmjbOq/JfgK0tmv9R8denXb9wUaTppE4AfspJcmrE9hMJ6PsCRxPTeTMWwDlxx
 DawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiL50oJATvoUHpaFbUSOhW72pyefXH6OHiLxuwc06l0=;
 b=rFgldu3ZAwPAHKYdD5YANR7UEUx0jdaFUgc2L7rjA3P6EUb+CgutE5W8k6/ZH8nn9x
 1E/jDSvGsG/emA7VdaABWlKjp3aenQQiQEj6jSHU5vmAOf6sfZ9zW1AMZ02PzQ6y7ja/
 2KUmZLoIPFLNd1U8yozGAl0wX+oZ8ERxMtsoRq4cqPZH0cOBSxsrYcpuZKpNXKE4aBsW
 AtgJo2c9Y3Tn63T5wDsx+EMY5WwuWvFHQOWRbC0kOdnAyVdJUQlWZQw40NAs0TrU9AWd
 tIYikuYmeTENn7MELmhbD4CjAQTmlGhGdzpF1p6IjGw5F6ITcztEXreLxQum+NePcJFL
 PJ8w==
X-Gm-Message-State: AOAM531i6BJM5W5SSLPPLIrfcFLUdTOAwZKeoTjSg8Yq3ktzWT2SFOmp
 EAXWRwJyB0pKTWVLwlV+VQkkFZabmKxcOw==
X-Google-Smtp-Source: ABdhPJyILSOZqHUdbRWNp8Wno1+K0mwyEuBKFdyge8a0/db8JD9s7Ng0Cfu8VKa4cIf+WSIUFBWHLg==
X-Received: by 2002:a17:902:ec8c:b0:15e:8cbc:fd5b with SMTP id
 x12-20020a170902ec8c00b0015e8cbcfd5bmr4367819plg.141.1651341232123; 
 Sat, 30 Apr 2022 10:53:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/17] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Sat, 30 Apr 2022 10:53:34 -0700
Message-Id: <20220430175342.370628-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the M68040 Users Manual, section 8.4.3, Four word
stack frame (format 0), includes Illegal Instruction.  Use the
correct frame format, which does not use the ADDR argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 3cb71c9140..aa62158eb9 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -391,11 +391,14 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         }
         break;
 
+    case EXCP_ILLEGAL:
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
+        break;
+
     case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_ILLEGAL:
     case EXCP_TRAPCC:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-- 
2.34.1


