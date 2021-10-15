Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7342E7FA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:41:48 +0200 (CEST)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF2R-000598-V7
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcB-0006of-0B
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc8-0002qu-5g
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6349087pjb.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=poa10+caLetC1TkeKR3MlvgZXCAxCqn5i/UC4qHieAqXuO9i7Rs43cei0jD0G5GCEr
 Np53kigyP8NuOVoViNmyiEaR+tIRhJWxJ6YxLLV9hkSzeYWS70iIsFVtkHMmyw9b44HS
 IZvP/2BoprZPLRMPszGApssvhsvqC//aAsF6D8Kl3qAAzjEqOSjl/Tv9h0Kfas8FLNR9
 6vzLZv9KY5qOC0mHOLVq0DPstXSY/o5uNaCTtVJ9V5cNx6w5EBXf1110I+BLgQTsmqo1
 P71rkJ1LMSxfBGeJZvP63nJX+nz4L3u4Tep6hlwFzetllgz+Xb4wEaIKnRVNNBHyDsw+
 aIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDIIDmSt3XkX7dozNp8YyanBuOQiSpBj16JErrhb+ZE=;
 b=ZxVoGw1bLskcSnUB+4IAEBbJLyNCWcI9XiOLKcda0+tidS2k5anOF/9Cgl/EVz2wJu
 YNec80nCrwZOEuKKOHe5CtqRJpHeln+g5uJn3HZPeGBQI8SItAl+Qb/pUdC0s70gi5qK
 qLqCGmNizaY8we/e0RIjECvj7jCh8UuLq2bp3hJtm8N3eUkggoMdczb/qUsNLGFIFuXF
 7OEfGeQiKcrMU2siScfvp3bpvIFMZ5DSw9piJ/yMydJavJRt4Gf+P4gFzA4X+tpbz4A0
 9RBQZhXy0L89zqZE7vo+MiM+CjjITfmr8ccATjzcmRwMgrUIRkJpqloGXMtA4tOGX8r0
 hpbg==
X-Gm-Message-State: AOAM532GAJq81LnbESH6l2HNex7yOqHx/z9CO+F9NrVspMmwMjcF4+QE
 cHGUyYDS3jWvN5QgLtj6ejgA7yh/E0+NAg==
X-Google-Smtp-Source: ABdhPJzfS8jlkmiVDWYrUrOdLpYyVB8POA1EYIs1ciAODpk+I7S70lYmlGpL2RQ26rUNxgAbwW8P3w==
X-Received: by 2002:a17:90b:20d2:: with SMTP id
 ju18mr24090948pjb.66.1634271274874; 
 Thu, 14 Oct 2021 21:14:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 50/67] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Thu, 14 Oct 2021 21:10:36 -0700
Message-Id: <20211015041053.2769193-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-ppc@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 imp@bsdimp.com, Peter Maydell <peter.maydell@linaro.org>
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


