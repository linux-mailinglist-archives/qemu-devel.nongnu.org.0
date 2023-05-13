Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5270152E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 10:07:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxkGF-0000go-69; Sat, 13 May 2023 04:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkGB-0000ba-4u
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkG9-000576-Ih
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so7019877f8f.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683965143; x=1686557143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk1SZdthGI97ZtAraCpLe6062EPa77UtYxoYCQVHTcE=;
 b=eImgkpUpqSWydxD4C3I0DbQwcWoro2oqZcqKqhGWaHOZJffYgPQeXIkxNDfgbsU8HA
 1I2eKHrzivOU2tqfeJ1swlqBXc4odIVlWg9E3Q9kGhN/a8wSxTlUmjwlXflagqdsqvm4
 8Dpcn2lpq5NcMRTlk4oYex6X5d66e4RIGL1Bdu5GIdtEfXudGa0VRe3sO+CHq51/WliY
 hfef34hCKuuxZDGw9ibjpjSBoqj3tbNDRT9tIPuKvKSosCCRX32NSTiJdQzMulFnma83
 44YlSqk45cuKvliLbPgXCHWXZbHFqx1cJz/5MOsueD47Ti8xIHaZMzxptOG1akV8YvDz
 cSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683965143; x=1686557143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk1SZdthGI97ZtAraCpLe6062EPa77UtYxoYCQVHTcE=;
 b=IrdYtTvLmNdsF36DBbudifSs7xew1pTPHZhgXZZ4QK6wkm1iJ+FYlumwyj+Zq+Mkxk
 jx3xZlljvBZNJpAFffyt5eySRf0TR2/XmkGng0n8o+R78YERIHZ1seQCFxuG8wUH2/FE
 CAX7pzC4+sc9Kx1WC+2uURXAs/taFgVgCUCg1pNplhx9olBhgh+/JS+9Wsob2Bmzbv+p
 xrpNnxpXnfIS0etIM+X3Hzs46mcpgOG1xD1hbRurq0KTbl8ND9ZdLWQpAaxQWdt0P8wE
 oLxlN+7yx1kpGyRYcTLZE2HFgU/CWI0kFdpZtHLiYES4ffCLpY+BnQBIvtghZV8oUfEH
 hdzA==
X-Gm-Message-State: AC+VfDyNuLFkHfjOqCX1hUaGpxXOh+sFLvg5zL5E+yHhkmB2cQN7Mvjb
 NYC41Wnj9Ac5nunJChYziFDb/70iM/o=
X-Google-Smtp-Source: ACHHUZ5GIVTsrQ3IHSnYgIzRrva92+28hg251EyYh1v4sR+UvbfmXbpD/SgHxWMgY8Yq9Vt4HmFUeQ==
X-Received: by 2002:a05:6000:104b:b0:2e4:eebe:aee3 with SMTP id
 c11-20020a056000104b00b002e4eebeaee3mr17115701wrx.60.1683965142741; 
 Sat, 13 May 2023 01:05:42 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 x18-20020a5d6b52000000b002ff2c39d072sm25752559wrw.104.2023.05.13.01.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 01:05:42 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/3] target/openrisc: Set PC to cpu state on FPU exception
Date: Sat, 13 May 2023 09:05:33 +0100
Message-Id: <20230513080534.580800-3-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230513080534.580800-1-shorne@gmail.com>
References: <20230513080534.580800-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Store the PC to ensure the correct value can be read in the exception
handler.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/fpu_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
index f9e34fa2cc..8b81d2f62f 100644
--- a/target/openrisc/fpu_helper.c
+++ b/target/openrisc/fpu_helper.c
@@ -20,8 +20,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "exception.h"
 #include "fpu/softfloat.h"
 
 static int ieee_ex_to_openrisc(int fexcp)
@@ -45,6 +45,15 @@ static int ieee_ex_to_openrisc(int fexcp)
     return ret;
 }
 
+static G_NORETURN
+void do_fpe(CPUOpenRISCState *env, uintptr_t pc)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_FPE;
+    cpu_loop_exit_restore(cs, pc);
+}
+
 void HELPER(update_fpcsr)(CPUOpenRISCState *env)
 {
     int tmp = get_float_exception_flags(&env->fp_status);
@@ -55,7 +64,7 @@ void HELPER(update_fpcsr)(CPUOpenRISCState *env)
         if (tmp) {
             env->fpcsr |= tmp;
             if (env->fpcsr & FPCSR_FPEE) {
-                helper_exception(env, EXCP_FPE);
+                do_fpe(env, GETPC());
             }
         }
     }
-- 
2.39.1


