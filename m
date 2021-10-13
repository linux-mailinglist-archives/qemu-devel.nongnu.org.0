Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A5042B2E4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:50:19 +0200 (CEST)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maULS-0004XN-S5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHc-0004Dq-Nm
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHa-0004oi-V9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id q5so880275pgr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SttDrREQq6hsw1e6wi6gOFRhVJLqzj/IGCKsRbbMdzc=;
 b=JsaGtVZ7CGOJJh7a3y9zj91s/CpsEhKVA9bqf7S92PSwSSiKMQYdcXCJk3qXu8+WiI
 lRLnQfeTxP+1edrSoKmDa0/f30xNEHPR+DcwyTSfEVxYk36+JgIFaVhddEpLj5pIKTjR
 TJKHvgEHp/bNz/sjnCabLTzPgK4PncqZfATGzn1MDh2xlZ93d9eMOoBoo1kO/nfzPxZ0
 voyWZEidPt3ksVdcTAxv0CMOt8OK/o3Sx/2I4tatWxhGi6tzmaQ9tGGTFM2zR/MhNX0d
 Z6egmZbtukmh/ojvVU039kGxDotagBQiC+Fak+w8ItJlWtDJzztvZItSVKpKf3kvZWeF
 c9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SttDrREQq6hsw1e6wi6gOFRhVJLqzj/IGCKsRbbMdzc=;
 b=y6jlBV/bbmbAA/ZmdCnMbU6R0qb1TdHLiMsHsKojDUTk93ovL1WhqmPMkg987K6PyF
 xcDc6l5+uc9RRmQx5NS6qkQ7wxpXpr1yNNstgrYT7yGNzqxIBZQKPx4G3ZyN8aEwVeM/
 dzW6LC11YslgtqCOyi4rjAs/udeiNlyqSQuwy5g12fap+fkvtXEduP/99DnuSZB27vxS
 WCTFTQ8/VS+lrBXY9/tODTkBp2kurD2gJGj36hCCHPIWv6J6hOuSxXNa4perSCNO9Tcn
 ayylR/NYnVgPzEcXt58ptT6wQ7Rzc6oW4WVsfZVGlzcgyK/Z3RKMfq12RpBTvVx/2aoj
 9rtA==
X-Gm-Message-State: AOAM532xfGMqGJST7lA3KdU/nF1wqoAKudRhC+hWdNtCj6MSIiD+j9uc
 HWcw8x1kDq4nCxXAuDjhJU/PgVRrsh4WtQ==
X-Google-Smtp-Source: ABdhPJy1sDwFAtF04rvSDvU/Hr2uMKUi1bRUrscXhiDnQCKJ/rFTpGSfdmew1WY2n10EJ8nzej24Cw==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr25433439pga.209.1634093177614; 
 Tue, 12 Oct 2021 19:46:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/48] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Tue, 12 Oct 2021 19:45:27 -0700
Message-Id: <20211013024607.731881-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
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


