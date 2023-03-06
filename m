Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B606AB3DE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:45:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuX-0004wf-PH; Sun, 05 Mar 2023 19:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyti-0004Qh-QC
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:15 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytf-0006bR-Ui
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:14 -0500
Received: by mail-pl1-x633.google.com with SMTP id ky4so8529062plb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daf84NTL5DuZtNABcQHyVosU/3aSJJqivBZiA0CELkE=;
 b=G2OVg+4Sczu9NYN3nkCANCtf1RsHicIp8RvLu04DB5+rxwuF8ak0oZdqh44PWn0r0q
 Fhhg+AYdJGf+fHjNZ6ZvBlXJsjmhiuvwRXYFycZC6xxQMv4HCpdhFkxNEPysqbikOQwH
 aThJcR2wKToYsrS+4fDxvOYoT1L5t2EwMR6mRVwVlOTGEFxaZmuOL5wCdu+MrkPXeqGG
 +5pZPodK1JTkpHhv79+/YYMG/U3/OhiSlnS6D500Tm3smKVmBdTniknVtcK8SEuZkGQl
 yM6lt0YfVYwdYg/qXja9JBNyLssFaSERp/fgTUPtYdq01SIMRvA/nIdCBATvj/yT/kjH
 opJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daf84NTL5DuZtNABcQHyVosU/3aSJJqivBZiA0CELkE=;
 b=KkMxlq9br8T7AXlPfGCnuUoYqnZwlb3eiWNsmrbDULmrmf8xdK7Y2plO9rntItRkGB
 4FdPzTF7nShF+kqiU1cXPMmRVg1U/6MjlBYZ1GC/LEI3IfR/hsEOfPbDM6unGvTsBjkT
 ABEuMteGorl8D/mGXOE7rsYHIlI4W58QZlxIPKvxahDU3NmW4YOuJQo1YeKCSAAVWBZl
 OpbjayeCp/YvIE/H7CLXhiILhUpMJLRHkwzAF4nV9NGj7bnACOEZzUrhi1Rqui4eN2Ec
 wZYUfDSJe1t6y7cE6JrL2PAv5F4uVINMuisJ7+vKK8eYswNWRKP2ezGFGLGysYpNHj6A
 Y//g==
X-Gm-Message-State: AO0yUKW0VGSdPWev1Z5bM+pkGBlLQKVzVzl0Sa2QjsK8oBk0TgPhVpwf
 4wS6n1CmC8YZOK7zdMGXhfgCCjdqPWx1jgEGQvQiXg==
X-Google-Smtp-Source: AK7set8bjoFTpnZ8Xqd5U8Lk+UQjS+8UddGFqw7CDnkT6+c7Ungjzw3algucMDgKUefh+QsU29Kxvw==
X-Received: by 2002:a17:90a:194c:b0:237:ae98:a47f with SMTP id
 12-20020a17090a194c00b00237ae98a47fmr13565882pjh.1.1678063209623; 
 Sun, 05 Mar 2023 16:40:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 16/84] target/arm: Remove value_global from DisasCompare
Date: Sun,  5 Mar 2023 16:38:46 -0800
Message-Id: <20230306003954.1866998-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This field was only used to avoid freeing globals.
Since we no longer free any temps, this is dead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h | 1 -
 target/arm/tcg/translate.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 5c37574cb8..853a0b84e6 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -157,7 +157,6 @@ typedef struct DisasContext {
 typedef struct DisasCompare {
     TCGCond cond;
     TCGv_i32 value;
-    bool value_global;
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f414a891db..4828fbf93c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -672,7 +672,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
 {
     TCGv_i32 value;
     TCGCond cond;
-    bool global = true;
 
     switch (cc) {
     case 0: /* eq: Z */
@@ -703,7 +702,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 9: /* ls: !C || Z -> !(C && !Z) */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* CF is 1 for C, so -CF is an all-bits-set mask for C;
            ZF is non-zero for !Z; so AND the two subexpressions.  */
         tcg_gen_neg_i32(value, cpu_CF);
@@ -715,7 +713,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
         /* Since we're only interested in the sign bit, == 0 is >= 0.  */
         cond = TCG_COND_GE;
         value = tcg_temp_new_i32();
-        global = false;
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
         break;
 
@@ -723,7 +720,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 13: /* le: Z || N != V */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* (N == V) is equal to the sign bit of ~(NF ^ VF).  Propagate
          * the sign bit then AND with ZF to yield the result.  */
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
@@ -751,7 +747,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
  no_invert:
     cmp->cond = cond;
     cmp->value = value;
-    cmp->value_global = global;
 }
 
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
-- 
2.34.1


