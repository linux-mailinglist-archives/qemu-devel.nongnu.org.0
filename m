Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334E6FF592
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:11:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7vx-0005Af-BH; Thu, 11 May 2023 11:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vt-00054B-Dn
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vm-00027u-61
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-307c040797bso1269329f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817806; x=1686409806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woscPhkVSzEl8I9GHPQdrPr9fWimU19q3FnzxdVnQus=;
 b=GVco0JmF6YjIS44Dc1aXt1G422QkEYcS3DNxNfooT40ONaa7ntaAdAT59UCcKVYWuD
 DRls+kLQAPbsS/vhjlkFEtp8Bj2yY2ySt3EPjxdb582+kVYEEJDpBpC9/PN0ClbXNC9a
 lIXQtOYJYYPewVtUUW/rwWn47w3IQ9BCR1YG6I78tLwwV8isVJOoUGWFfjr1Wmd7UzTf
 Jgq/YT/Jncj9uOWP3AqkehjLKzcOIcgS372Sp9zS8QHJP5lCMgBNh7nTbcwTp3f0XqIW
 xKwKPXbUiu+lHyf+0+Ia8OcshyxGZjBsGYOX9EvdxIyfVsNEWWewocy+BO2TsgObR+gu
 sj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817806; x=1686409806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woscPhkVSzEl8I9GHPQdrPr9fWimU19q3FnzxdVnQus=;
 b=ixG5/syH5nwt7Yf++inoqipV4WP0fvhDWENjW0SeFN2md4cYMlwDYOY1cvoPRrliP1
 BnEqgAhES5ouUM41qbB78yZDzZSCkwBrFsnaJJz4j8IxahtjNwPL5bSJSeGlBkXLVcRo
 an9nwLUY8+pGu0Onh0J/otaPcvwIC5xxDmz4kV80CkWiPeLLjPhzGubCnIb2FJVueFSv
 O747Qs6h8udfkcS5X3uRLwDOkL8Ra2qLDxtCkDwSttkCOm95JXyxChxCighaXQsCB+tl
 C/d2oK38XG+9PKuhd7Qglf6SgTMUxVN8Q+0bwAifq+qxYfxdjSnx3sH+Zfy6wMh4qDI/
 YS/g==
X-Gm-Message-State: AC+VfDwmkNWQeyySxD+49LoXmjZ24yYpfU84vrWFsUiOxRDyDtNk2ISF
 UkBHhpFCxt/JxdWUicg6lgfpYBkftUY=
X-Google-Smtp-Source: ACHHUZ6pZxkH20q8pvuG9JNq8nxaz7BTjcYoa/jpxSw7s4UDtpgaFxEor38jIkCDVTvyDWpe7nYCeA==
X-Received: by 2002:a5d:6285:0:b0:307:b9da:1547 with SMTP id
 k5-20020a5d6285000000b00307b9da1547mr5069301wru.12.1683817806426; 
 Thu, 11 May 2023 08:10:06 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfd0cd000000b0030631a599a0sm20603811wrh.24.2023.05.11.08.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:10:05 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/3] target/openrisc: Set PC to cpu state on FPU exception
Date: Thu, 11 May 2023 16:09:58 +0100
Message-Id: <20230511151000.381911-3-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230511151000.381911-1-shorne@gmail.com>
References: <20230511151000.381911-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42a.google.com
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
Since v2:
 - Add reviewed-by
Since v1:
 - Use function do_fpe (similar to do_range) to raise exception.

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


