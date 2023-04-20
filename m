Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B66E8F3C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAM-0000lR-Ff; Thu, 20 Apr 2023 06:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAA-0000Zh-EK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA4-0003rg-KW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso278135f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985106; x=1684577106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=evM3bJgzg0o01IMtcO3BFkkA5dz04OO5SQWdXeDF5tY=;
 b=E5kMW4dEtaeK/e/xgL/bVah802K5YPT5Akd1mZZmZVH2CKXVkjU/iOg7AvlW4U42tf
 UDg1rxFBXQhWCEKHf9EX/i8uIpQK8vJUcn9+hwcb1Q4GXMH28EQI9oFH8Fzo3UnIskDg
 6b92AmbN8b0iazlkFTbloGkrOdvZ3TzvU3pXRFTC3Woaxd9Nf8PNnB2gGnz4aSPee3u4
 Oyp9cA06AIjY+9/STSz/Z18FU1+TogSLqEMZGMEQu4zvISIL0i4CiKeCPD6idCoGkkGz
 SOti1FzRn0dHpqCO7DxGieJdiOFcMhFwNgDtxdz/rkd1lOD225NKVSn/R8URNYMRFfbd
 fLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985106; x=1684577106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evM3bJgzg0o01IMtcO3BFkkA5dz04OO5SQWdXeDF5tY=;
 b=AZvGAnGlU3P8P8HTvQVrCQXDQxB5fYLxa9NYJKzkfZiRN/j9efSv8Iy2RRG4kgziPt
 QZXiE6/iwFhG37xJU6xQD/YtKr3yVSJGfHUcA5XB6D0y9DNuvouOAIb69Jw8CqoQbFl+
 51Lbn2MgkKn+cFwoo8U58ZqXy/9SEa83SO8Ox03G/Ce16vXv6FqToPxJSUGFtT+7eOY4
 lrrXJce/syS7QVZuR9OBifXyOw3unI0etQMEDy72KeyYkcxqr3R9wzmvMMQESJVsJ19L
 nXmNlvG13AFCQTqX4rS5NZeeTZDEnmWDmg36iZMD+vJvkXhKOuGM1NkIfIUx5jX1+6ni
 I6ig==
X-Gm-Message-State: AAQBX9e6MLAuuxCIvxh7ItAaX5UIhmkF9pHd88HxiWca/zh9cLUt5QB5
 QQIamYbci49f6jtzPLyi3rRM7Rmp/MdN348PH4s=
X-Google-Smtp-Source: AKy350aPlvloBjgDzrkL6edLcs3W5QvtXRqB1KrD+eqWkWxRn9OGE/OFTu6vc7idje/9kccm2ApWrg==
X-Received: by 2002:a5d:60c8:0:b0:2f4:9f46:6865 with SMTP id
 x8-20020a5d60c8000000b002f49f466865mr875329wrt.30.1681985106152; 
 Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] target/arm: Pass ARMMMUFaultInfo to
 merge_syn_data_abort()
Date: Thu, 20 Apr 2023 11:04:47 +0100
Message-Id: <20230420100456.944969-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We already pass merge_syn_data_abort() two fields from the
ARMMMUFaultInfo struct, and we're about to want to use a third field.
Refactor to just pass a pointer to the fault info.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230331145045.2584941-2-peter.maydell@linaro.org
---
 target/arm/tcg/tlb_helper.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 31eb77f7df9..1a61adb8a68 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -24,9 +24,9 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 }
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            ARMMMUFaultInfo *fi,
                                             unsigned int target_el,
-                                            bool same_el, bool ea,
-                                            bool s1ptw, bool is_write,
+                                            bool same_el, bool is_write,
                                             int fsc)
 {
     uint32_t syn;
@@ -43,9 +43,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * ISS encoding for an exception from a Data Abort, the
      * ISV field.
      */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || fi->s1ptw) {
         syn = syn_data_abort_no_iss(same_el, 0,
-                                    ea, 0, s1ptw, is_write, fsc);
+                                    fi->ea, 0, fi->s1ptw, is_write, fsc);
     } else {
         /*
          * Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
@@ -54,7 +54,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
          */
         syn = syn_data_abort_with_iss(same_el,
                                       0, 0, 0, 0, 0,
-                                      ea, 0, s1ptw, is_write, fsc,
+                                      fi->ea, 0, fi->s1ptw, is_write, fsc,
                                       true);
         /* Merge the runtime syndrome with the template syndrome.  */
         syn |= template_syn;
@@ -117,9 +117,8 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
-        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                   same_el, fi->ea, fi->s1ptw,
-                                   access_type == MMU_DATA_STORE,
+        syn = merge_syn_data_abort(env->exception.syndrome, fi, target_el,
+                                   same_el, access_type == MMU_DATA_STORE,
                                    fsc);
         if (access_type == MMU_DATA_STORE
             && arm_feature(env, ARM_FEATURE_V6)) {
-- 
2.34.1


