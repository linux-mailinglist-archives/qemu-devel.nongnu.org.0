Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5A3DE500
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:20:29 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlum-0000LE-DR
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpW-0002te-24
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpR-00025R-JX
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so2989476pjb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z52jqMahW7nYTfuwDqraaBizHHqXiMT/VaDEwV5Efo=;
 b=o8uT5APG1T9ArrkbKU6P8DjuiZ1t7IZbE+RNACpcJ4RiY+RMgSUV0c+1b0JwfK1DW6
 6AAS+QchoDpWSR9lix/6fJUnnZFlnLtlLbTWYGAlktceRZqQJs7aIduCHOhhQPJAF14S
 CMBAjD8xBJ06irBQqm4+J+mFcwRPnWt5i39wMnigs32sa95sDWkM7tVqpjg1wnQQSTvP
 cGBp60JC1PqHXmAKQ8+fhJXCIkgJdDuT/c1t+a/Zci3CyeCknkh1OWz/ZWDC9V1t3xlo
 6lhNIbqvz4IHNGS5ppd5TaBTF/sWfYWjPBW2w3YKEhfI2cBbRcYzCZKiclteA4FRbWRY
 VX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z52jqMahW7nYTfuwDqraaBizHHqXiMT/VaDEwV5Efo=;
 b=n3qKgIrLECwSyApxG069G02xMFGpd2vcCnkN7Fysh713ilzydePCTN/TXSAjZpdqlt
 zAPjse35jqzlsUVhqBLFiQw15lbTDfkTkGnyrUBICZESuSzSAgyOXJudKM5rYY1DWYLJ
 4CJwW2ypAy73RwiKT0rKVhNRf3eRpZwfsSc8hVCDIIiKTmEEGfC9vRchH/W8b92aYgsN
 HOrVQ+/7FBvCTToQFuMTPPRGyC1LnfmkrK0IC9++DU+vuvSeCdb8wXDPS12ohP2AXRWJ
 gxC2lUpFsvF3OVhx6zBzC4QCVbQP4txS7gH48NMmNfOuoR1ciKkEurpuIIcsAhMhAVCF
 UOOw==
X-Gm-Message-State: AOAM533cCY6tFL3uGJen2WbmspM9XzMypz5dRkkGrsoNDruESQhIzniS
 he5AqgEDdX3i/tcHORX6ZOvl5XeL8LmsOA==
X-Google-Smtp-Source: ABdhPJx3nupkpZAHM9nmfmeA4HL7LE1z8yuCsxBhyTT08+2ktT6hWO9Y6h03xfz+QbqO4Y89pWduzQ==
X-Received: by 2002:a17:90b:1e51:: with SMTP id
 pi17mr2322302pjb.155.1627964096325; 
 Mon, 02 Aug 2021 21:14:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/55] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Mon,  2 Aug 2021 18:13:57 -1000
Message-Id: <20210803041443.55452-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0df358f93f..d7743704ac 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1504,6 +1504,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
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


