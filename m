Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E60541D2C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:09:16 +0200 (CEST)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhNz-0004Xf-MS
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5n-0007IP-T1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5l-0001Pj-BX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:22 -0400
Received: by mail-pf1-x432.google.com with SMTP id g205so16507992pfb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lkal5KDK4537KjIiM5DwOIkXPoQZ/flNccQ9lkg/eXQ=;
 b=BKwrP/V6wehA/E0kailighFLe4S1AMzDd9JRJgXCdGcGeDLfC4D8ZA1Zux5xTCMOEV
 GRbRCa9MFxWg8DsQfmeU8YJZ4h1rav7y0YnpOEUax8/j3vc2dA0FGNYWDeO4psesf/74
 bvxdK9GpNtcQ1lraq7bWcT3LOCJjKeupAZK6el4gSzO7Z34orK7mwsZCOqU1SYMTii1q
 ER5uGJ0nj0+NqHT8AuTb7I0Ei9dOe/ez1kvDxmBnN8vjgeWeNC3OhKznMa6+4u38oRJe
 ODCdiEykNQxeZg2ZYsd91KfnQgNPElov7n1ZViVF+G7EXoJCGhpAHhd+Ojh/jtrrVbTy
 IbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lkal5KDK4537KjIiM5DwOIkXPoQZ/flNccQ9lkg/eXQ=;
 b=YqkcBHx3TSmDHo6M2/qu+k6xgTKHdLOPzjiw4urOJDbnumnt3O/Wuaiz5JHMV+wLx1
 cAH30XKHFsYu+YXPgzLVnSWkGpuhH98f7tYIgLDV+A8tv8vIcLfVPJSWEXFLvo9nJ64b
 atf7+5YOJTsc+pCyuTsjU12ZWXipP5BPnbrnnxSyBCOuhHXurjB5B9zo7x1TWiB+ojgn
 1Cv8v6hjb0LhTvmUYZz0WU+E4m8MxMRwwRG31k8ULGSlTIc5r6c8pLcgLJF6v93eKXuU
 C/OmzojzRooL3aAanRRIZi8jQtfckIhkzi90Xeov7ZGUbGT7ai+Ex9E0EWRWi6ejdoKo
 /y/A==
X-Gm-Message-State: AOAM530K4H7OUR+c8qWlfUreaogH0BV9tdomZ14aAeyityFuQyA5W4Lo
 nJImVl/wLhzXrz3/lZjn+Aes6uIDNa8xGQ==
X-Google-Smtp-Source: ABdhPJzREz8uQPaYulNHQGczUUTiEl7EhOoDs8JxOiPA2iGEflfIwJ8KvlBrd1hDzLcljzNxITHF0w==
X-Received: by 2002:a05:6a00:194d:b0:51b:eb84:49b1 with SMTP id
 s13-20020a056a00194d00b0051beb8449b1mr21619672pfk.77.1654634779972; 
 Tue, 07 Jun 2022 13:46:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 23/53] semihosting: Split out common_semi_has_synccache
Date: Tue,  7 Jun 2022 13:45:27 -0700
Message-Id: <20220607204557.658541-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out a boolean test for SYS_SYNCCACHE.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7550dce622..50f40a2a1a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Ok for A64, invalid for A32/T32. */
+    return is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -260,6 +266,11 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
 #endif
 
 /*
@@ -1102,16 +1113,11 @@ void do_common_semihosting(CPUState *cs)
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-#ifdef TARGET_ARM
-        if (is_a64(cs->env_ptr)) {
+        if (common_semi_has_synccache(env)) {
             common_semi_set_ret(cs, 0);
             break;
         }
-#endif
-#ifdef TARGET_RISCV
-        common_semi_set_ret(cs, 0);
-#endif
-        /* fall through -- invalid for A32/T32 */
+        /* fall through */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
         cpu_dump_state(cs, stderr, 0);
-- 
2.34.1


