Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D785AE70E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:00:06 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXFN-0000EI-8Y
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVej-0003O3-05
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVee-0005F9-H0
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id az27so14693877wrb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MQwqk3aIYqNZS+g6VsRklK9PY/N9SMW46xNvH4pbJm0=;
 b=xjdk4tfuchgFwAOyMHdwJpSizj0nhlwbC2Nnns4aEuLbnafektnoR0tCMaPhLcMwG6
 Ua2TYEMHVmhTzIPTwOx+ASGqJzcNkTaO6MaPDwxtM5KHXJ9TkfO8U5puSECrpIR1J+0l
 jpwGjPLttOpLc567hshrW11eLm6BR7XFHW0sA0Hl/w1J6ohI8rVCseTh1a5LGMRp5zdF
 xhCxT2/dA5uyeuVxyaDKBtRep4q76VYDHjuWvxiQxb9pvTa8nHM6OFk3e2ydXwzaHWF/
 HT9HKwBpGt+6r07XYNYUhjbex2uaqq2ZWmg7Wl0rxPbWfhA6YAMbuHobref1DoJMQ9qq
 0nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MQwqk3aIYqNZS+g6VsRklK9PY/N9SMW46xNvH4pbJm0=;
 b=lJDEzOS0t0Mitg6XOIqJeYZgbEXFjqhH/wOYP41YT42075PL+R2g7E+Tqu3+fnLEHz
 +LdLC15DQ024WFn9v5WY+cygfpliFEJ9S0mu7BOmvrjMd7Ncc1r7DGmkSAS2tPsyLGmE
 hJwRsHdcnha0lLDYeqG4w1pdkieErrJjqWhnJxAj4hrXftEM+pdUzPotGCBqvFNeKVbM
 Z3mbpvQK1FrYcoX8j7eO+nIhDF4VLac65Lwm59o43Bj13HbVotwsZxOPXy5jVFqf4r6g
 l7WVjrygtyfK7Owj5ZFgHAwbEUzLWlDWY1U01DNgn320WJlnKN3rmq10yBTmD355Q9vy
 Ot4Q==
X-Gm-Message-State: ACgBeo3jT+ASGpCF/2dpT41eU+tVNs+SMFxhf6mBKHOizBZqTPQHCYNt
 JreY2qf9edZByIZLCTMGHyloTlymc55rrVIV
X-Google-Smtp-Source: AA6agR7PZCY5dG69aNa+YGfGD+y1X2ujd6VBndieXDSssA+6bOPO/uEjAxBzON9z8vSL3dvjU/VrtQ==
X-Received: by 2002:a05:6000:1f03:b0:228:6c98:b01 with SMTP id
 bv3-20020a0560001f0300b002286c980b01mr6283215wrb.250.1662459480834; 
 Tue, 06 Sep 2022 03:18:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 12/26] target/s390x: Move masking of psw.addr to
 cpu_get_tb_cpu_state
Date: Tue,  6 Sep 2022 11:17:33 +0100
Message-Id: <20220906101747.344559-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Masking after the fact in s390x_tr_init_disas_context
provides incorrect information to tb_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.h           | 13 +++++++------
 target/s390x/tcg/translate.c |  6 ------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..b5c99bc694 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -379,17 +379,18 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 }
 
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
+                                        target_ulong *cs_base, uint32_t *pflags)
 {
-    *pc = env->psw.addr;
-    *cs_base = env->ex_value;
-    *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
+    int flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
     if (env->cregs[0] & CR0_AFP) {
-        *flags |= FLAG_MASK_AFP;
+        flags |= FLAG_MASK_AFP;
     }
     if (env->cregs[0] & CR0_VECTOR) {
-        *flags |= FLAG_MASK_VECTOR;
+        flags |= FLAG_MASK_VECTOR;
     }
+    *pflags = flags;
+    *cs_base = env->ex_value;
+    *pc = (flags & FLAG_MASK_64 ? env->psw.addr : env->psw.addr & 0x7fffffff);
 }
 
 /* PER bits from control register 9 */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 67c86996e9..9ee8146b87 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6485,12 +6485,6 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    /* 31-bit mode */
-    if (!(dc->base.tb->flags & FLAG_MASK_64)) {
-        dc->base.pc_first &= 0x7fffffff;
-        dc->base.pc_next = dc->base.pc_first;
-    }
-
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
-- 
2.34.1


