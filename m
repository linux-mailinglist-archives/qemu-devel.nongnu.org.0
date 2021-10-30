Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1675A440AFA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:28:23 +0200 (CEST)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgt5a-0001Zm-3P
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1s-0001UY-6j
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1o-0002C3-1v
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:25 -0400
Received: by mail-pf1-x42d.google.com with SMTP id s5so753007pfg.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=lrdYcKbzQ0c+F3yUg3gPnHdd01mr+Zsevis/Hpk6OAGdzCnjHeHgZDjjBKuAgUgLuZ
 x+sio0YitJs9t7SbbuGirw48WVgAZntqXU+zXzeIadwZjuhz99q5kXIK9dv9NtCTnqvP
 nRo8oPvg6H2ujVWC7IZDPydxlIz7lsFqz7joHIJ1MrYn3RuvUuec9wBQnNZJbWUE1XA/
 rxKl0KbYUg2Bvonb3bKkFRklpY3SqunsQDVn+dwVE9jUA6FoBFZMEopBGeVyHI/NNP7s
 4sMdiESoiT3YdkIfD2dDgDs6SkTOZycahkSyMDTfRPwrXSmE50bjlYlxa4QKFrK26j+F
 kUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=4ES7mHGrtUAKMDMZDs+1uQ80w9jpmkGAM66ne2aerKX7uu55ugsSwglbRGrFKhQp/V
 qxn6u+vEFa8q8ic3osoGicx7YBjg1948zev/tW/4MI9Tbwn8xw6OC7I4uCv4EtDho9Gt
 QacTdq3YvPYgNDHuuboJiXnbWcpIGJqkQfSTSvSg+RMVvRz8xXidnqjoiP+y4/+pXo5l
 FglDwYFa5NzMLgCwl5kXoTTib/6QBW0xn7SRTj9+GaILb/YuQyXvA482WVaPgC600674
 v78qLAy2ZUjuhAI/pww+0ZZK1QqFqrJ3vdY7YOjDhYPgjoufF0yJF5uznMHiAA5JKyfR
 x8Mw==
X-Gm-Message-State: AOAM533HrIccwWp4F6RFcOpHUKRrkT/ouBL8xTmPc00D5G/XFnzF+pn0
 4NdK/bBu9IpPhXsvG8JorB3KbeSa2oZSPg==
X-Google-Smtp-Source: ABdhPJxkfzS/EGK4MQLC2fo0Ek06uyWpr5cP1cXzqu4pTjUjtlnrco7OeSuey0Gp+woDP5ExxbalGw==
X-Received: by 2002:a62:5304:0:b0:44c:719c:a2c with SMTP id
 h4-20020a625304000000b0044c719c0a2cmr17729993pfb.13.1635614421984; 
 Sat, 30 Oct 2021 10:20:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 49/66] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Sat, 30 Oct 2021 10:16:18 -0700
Message-Id: <20211030171635.1689530-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu,
 f4bug@amsat.org, qemu-ppc@nongnu.org, alex.bennee@linaro.org, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 88a8de4b80..e568a54536 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1465,6 +1465,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 {
     CPUPPCState *env = cs->env_ptr;
 
+    switch (env->mmu_model) {
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_SOFT_4xx_Z:
+        env->spr[SPR_40x_DEAR] = vaddr;
+        break;
+    case POWERPC_MMU_BOOKE:
+    case POWERPC_MMU_BOOKE206:
+        env->spr[SPR_BOOKE_DEAR] = vaddr;
+        break;
+    default:
+        env->spr[SPR_DAR] = vaddr;
+        break;
+    }
+
     cs->exception_index = POWERPC_EXCP_ALIGN;
     env->error_code = 0;
     cpu_loop_exit_restore(cs, retaddr);
-- 
2.25.1


