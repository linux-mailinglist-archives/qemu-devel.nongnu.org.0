Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C550BDC4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:58:51 +0200 (CEST)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwcM-0001Kv-NN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWo-0000lC-Uz
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:07 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWl-0007FT-Ak
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:04 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q3so12117299plg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtRmXlsOxeVOyDOQBenqjq06keYpCIdFa3N3ui9g9FQ=;
 b=CDpliTbHxgW5H294WbMl5Si0tVpg4Nbyni/Q8XF9PMRIGKV/rfUUXlGNS2mXEYjP5R
 31S6gp7FAGYm0cQplo12DjJoInZ8rpkJDpT1t7IzhMidrbJUInpugcZrX6iqnBa4LbeC
 YSGewge7YC68GkH7mwtLBn0tEo6y+LKbOB7nFWBLnp1K46LJAjhR0OZPHcDc+rv/z/Wp
 0i1egB1WvhS7Ge843WN3OAVfwDkb7LprDo+21rFhTpQ6/QJrMRrg6heI9uxUz5Io9XyM
 pcnbsPSrfBmv+FU1eHj+4ZytBWhN0j+h2Gm8vj9qpRpTnu1hFdWPJZtTYxaP45rEO+7S
 ykmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtRmXlsOxeVOyDOQBenqjq06keYpCIdFa3N3ui9g9FQ=;
 b=M6NKT+jeWWSCc0aUiWQ4Brrs21dGFfHa0jB4KhpRTHYO2srvNBXKMwEHKuOU78utBM
 3K1pS+93jYGyXRfSVkIv2E9dM820sPz3iF9q/x1804lgnpb/Mn0WTUi5MnFAr1vAVDF+
 bXZOdP878F+PtoP9jBisd+8fYgXWFqrvI5kXWm5wfeFcmS3kpuAJlllIT54FhXF7EoEr
 Y+Xd2GquE3NCXzj+85FSTU3UgQGj9Ny7n9lVjVIxbFUNUOu2H2/UZX+/V8Tf5w6F7Ot3
 Nrr93PSH4y7Pgfg5pVhXcUl9QH5IpYzv4TNxv1OEvQ5dCnj44r3T1Av8m/LeTWkFJwmf
 cS7g==
X-Gm-Message-State: AOAM530JuXp1lDKBxxQvmXXaWh+2EzovaVWitk2hAh+9hZeh47HCfTFl
 Bbepxc7A1yc1bZqvECbd/DL98KbQUUdKuTUe
X-Google-Smtp-Source: ABdhPJw4M7BLhjR/re3rVxj/UaVDB80VBq/qgwvfc1ejxT3S3gUK3JQCnVcjOCDFgPKfqNlGO43PQQ==
X-Received: by 2002:a17:903:2c1:b0:158:f9d0:839c with SMTP id
 s1-20020a17090302c100b00158f9d0839cmr5561800plk.118.1650646382058; 
 Fri, 22 Apr 2022 09:53:02 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/68] linux-user/nios2: Use force_sig_fault for EXCP_DEBUG
Date: Fri, 22 Apr 2022 09:51:42 -0700
Message-Id: <20220422165238.1971496-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Use the simpler signal interface, which forces us to supply
the missing PC value to si_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-13-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index f37850fe81..e725036628 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     int trapnr, ret;
 
     for (;;) {
@@ -121,10 +120,7 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
             break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
-- 
2.34.1


