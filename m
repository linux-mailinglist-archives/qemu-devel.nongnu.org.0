Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F275108E3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:22:03 +0200 (CEST)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQl8-0005db-8V
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpy-0001r3-NM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpw-0005RF-Q1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so3278247pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qxaCTAb9LNwU3nym8tcsfcPLahPlRpIRpMaVcx2cxM=;
 b=mvTchj3xjtD8zks+a17nSiJv8fHUt6k4MMHS1RtrE+hdv1/lWozzan63FRKjDNHy/5
 6/pDdTz2wxTPlzxq1ChefXsxqqBa02XH/a9iXw9FUN4lWRW0r2Nkux4kPJBZfq7EjFxx
 DbWCgvBocBphBzabg3lDDaV0cCRy6JoCTM/7BiiioIoGxxagLrrBDxzVOpTkTGsAfAE5
 cJ/t8RPu52WUCHRTzgm6g96R7SCplMRVCCG0fIV+8NudtBOAbNVyYECeOhkuk2E54+hX
 lgf+BbJ3xzBIUolu9Hwb3Z9pVNhWtIwku+peqwYB/6RLxkSBuCrzEp7kVqmcrjccFTCy
 q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qxaCTAb9LNwU3nym8tcsfcPLahPlRpIRpMaVcx2cxM=;
 b=zBDULBwDSt5mrb8rdK1yAyKvSxov6imdhV8Jora2wC0alI7iJYI6QSJpARaNjTpK2B
 9DuIhyMoZefIHU67rw7Sie3HUwQmQFCLfyV71DVWpna7rKPoWV1ZjMAOIIm4C+DFAeHy
 OMfqM4IHzzNt/Bl1cvTOH8cbwuX4bDGMBW9BlR8SAE1Qim9XXa+unLbunsbrqpHTgPJe
 zGIDpfhsBEuEXIpUX4rqhwgcRAR7UmX4IGQ1stG67y8ye24CyAYKe6/F4ggI8/ePVJMN
 K6XCP+P8PEgNV0htFmkU2Qg8uiybJ+iby2B3cweG2U3/oUvbkPSVM8Ikzs6Ivr2GRZgB
 4xFA==
X-Gm-Message-State: AOAM533zm7sCEOD+AujbId/KYynTXRehIPthpfueA0kqcxnfjsUlJ7F8
 wfIoX9/Vxvp+ah5WBE+A4uwky2Obaq6efg==
X-Google-Smtp-Source: ABdhPJwE/kPJ6VZbxCOjWHfPhXp0K22bTSiX/VqIFnlugsMZbQdCrAgj659gWxPBms3yAT7J/Y5Qew==
X-Received: by 2002:a17:902:da88:b0:15d:3dae:b0a4 with SMTP id
 j8-20020a170902da8800b0015d3daeb0a4mr3140853plx.75.1650997375560; 
 Tue, 26 Apr 2022 11:22:55 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/68] target/nios2: Enable unaligned traps for system mode
Date: Tue, 26 Apr 2022 11:18:50 -0700
Message-Id: <20220426181907.103691-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Unaligned traps are optional, but required with an mmu.
Turn them on always, because the fallback behaviour undefined.

Enable alignment checks in the config file.
Unwind the guest pc properly from do_unaligned_access.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-48-richard.henderson@linaro.org>
---
 configs/targets/nios2-softmmu.mak | 1 +
 target/nios2/helper.c             | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 9a372f0717..1e93b54cd1 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1 +1,2 @@
 TARGET_ARCH=nios2
+TARGET_ALIGNED_ONLY=y
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c5a2dd65b1..2e9fea4a01 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -241,8 +241,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
-    helper_raise_exception(env, EXCP_UNALIGN);
+    cs->exception_index = EXCP_UNALIGN;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.34.1


