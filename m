Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F01698AF5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe9-0007OW-DK; Wed, 15 Feb 2023 22:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe1-0007K8-J6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:14 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdy-0008WD-HH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:13 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r17so587839pff.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7PUivR9YRgzFVAw8uLHbwLnPM1WOwEN/2TbJJpnsL8=;
 b=sojJnfYFKN+VhODxgeAQehBOgAHeniN2bvbNrvMdbwwTsOSbjbUtiydKJ95839HaUL
 nlKdjpUpIfR3h52V4ibugiYVLLeQc3A3KjFZbsEoRYZOii+6GpOC71CgPawZ3ctlKjPg
 ZqKvfno2+7cTlIkWN04zni1BAUo/Y4jJQPI1T34joymF63Bd6ux/+LSx/c8fgzDcXR+V
 Lff/9SyVvIbJhhgAp9VBw4AfYuyjH2l9Tm08b9+zQZ8Y9Yzhn+YP8x6AiF54ZtBKaAXM
 RuNmUyWssfD5an2oqEF2G+RJv/ByqgEWH3XfvkMuqImXrMK6j8OqUSs344TcZ/dMNMvS
 stcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7PUivR9YRgzFVAw8uLHbwLnPM1WOwEN/2TbJJpnsL8=;
 b=5/IHJFb5ZlNtY/wwiJthXt14xHgwiSKEmTVjhvLApoo3VPVTY+1cKZQXrIYJcSjPjU
 Eo+UfQh+Bw6u9a9zk3HK+DBzt/vqFQCRCEZ0cWdl4vhTiekHGVHJPxW0GdJ2OJeU936w
 A5+JK86qCWfBxYvTAe2auD4ev9wpt3ijr1Afm1aJGJdC64vv4LCcKDTOIoq5CdF1SM6z
 vG0yjkhBzf4Weod8e+5TGxTBuCEhDotwJo/UdyTq308RunevrJ7S6w4g5gGB7v7k5Q40
 8gosBmds6rp8kBzlzxYNHd6EcnkSUknuygEqY2OV4xKrgx2Drl+8p5yvSb1ayFma30G5
 sO4g==
X-Gm-Message-State: AO0yUKVusDoi+O1W812QflNaD19k9pMhgu8ogOdTURF+3HM9EApifzOl
 nRKb9d0Lpw7gcOacNjfwLWvzvEnFZflM0N8GTeM=
X-Google-Smtp-Source: AK7set8sOVNDFY7a6zFpQzY0UzFhd5ObVg7ShSxIcNxaWTy1hAY4SkgxyNWzEFb0vAX2oTaINda+Uw==
X-Received: by 2002:aa7:9f8d:0:b0:5a8:4d33:f39e with SMTP id
 z13-20020aa79f8d000000b005a84d33f39emr3839903pfr.24.1676516949674; 
 Wed, 15 Feb 2023 19:09:09 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 08/19] target/arm: Add atom_data to DisasContext
Date: Wed, 15 Feb 2023 17:08:43 -1000
Message-Id: <20230216030854.1212208-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Use this to record the default atomicity of memory operations.
Set it to MO_ATOM_WITHIN16 if FEAT_LSE2 applies.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 14 +++++++++++---
 target/arm/translate-a64.c |  4 ++++
 target/arm/translate.c     |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3717824b75..809479f9b7 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -54,6 +54,7 @@ typedef struct DisasContext {
     bool eci_handled;
     int sctlr_b;
     MemOp be_data;
+    MemOp atom_data;
 #if !defined(CONFIG_USER_ONLY)
     int user;
 #endif
@@ -556,10 +557,10 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
 /**
  * finalize_memop:
  * @s: DisasContext
- * @opc: size+sign+align of the memory operation
+ * @opc: size+sign+align+atomicity of the memory operation
  *
- * Build the complete MemOp for a memory operation, including alignment
- * and endianness.
+ * Build the complete MemOp for a memory operation, including alignment,
+ * endianness, and atomicity.
  *
  * If (op & MO_AMASK) then the operation already contains the required
  * alignment, e.g. for AccType_ATOMIC.  Otherwise, this an optionally
@@ -568,12 +569,19 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
  * In the latter case, there are configuration bits that require alignment,
  * and this is applied here.  Note that there is no way to indicate that
  * no alignment should ever be enforced; this must be handled manually.
+ *
+ * If (op & MO_ATOM_MASK) or (op & MO_ATMAX_MASK) then the operation already
+ * contains the required atomicity, e.g. for AccType_VEC.  Otherwise, apply
+ * atomicity for AccType_NORMAL.
  */
 static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
 {
     if (s->align_mem && !(opc & MO_AMASK)) {
         opc |= MO_ALIGN;
     }
+    if (!(opc & (MO_ATOM_MASK | MO_ATMAX_MASK))) {
+        opc |= s->atom_data;
+    }
     return opc | s->be_data;
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cd86597172..fa793485c3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14762,6 +14762,10 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     tcg_debug_assert(dc->tbid & 1);
 #endif
 
+    /* Record the atomicity of a single AccType_NORMAL memory access. */
+    dc->atom_data = (dc_isar_feature(aa64_lse2, dc)
+                     ? MO_ATOM_WITHIN16 : MO_ATOM_IFALIGN);
+
     /* Single step state. The code-generation logic here is:
      *  SS_ACTIVE == 0:
      *   generate code with no special handling for single-stepping (except
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23a3462bf..552c376050 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9449,6 +9449,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->sme_trap_nonstreaming =
             EX_TBFLAG_A32(tb_flags, SME_TRAP_NONSTREAMING);
     }
+    dc->atom_data = MO_ATOM_IFALIGN;
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.34.1


