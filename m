Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB193B0993
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:53:36 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviiV-00057W-Ah
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidc-00055g-I4
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:32 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidZ-0005KL-IJ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:32 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e20so17454726pgg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0J3Zms5jSdf0V0LutlOl2h6nFGrq/8kkpLuwS5pRBU=;
 b=WklPy6C8Pr+Zx5Z0rTlK5diQl081jz7V3wua22knYG4bgM0gff59UK361iANGAC2Ym
 HPOS0qYkg/+d7CjA8Wj9w+k9zsT2F4JAYRqLlU1lD/8OsNW7/+OaiZmkek/5JESqk+d6
 zlWvyOQTVsreKsnfNKb0ZpFXlaaYSENCcn54A6EOZhYhf9ayN6vr+wcwWilBdueUa9VE
 FG7uGw/1NgkkD3k3lWQedZNv0QEOc2m7HP5tx7vHCtBNA1qAJShEoaCmSlfnq1TjqnG2
 a/4E8XOfBPz8qqT4pv6wDCXYPmlTL8etgeR8d2FLliZJYllAU1M1K6DMjq8fUsIr33sF
 cdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0J3Zms5jSdf0V0LutlOl2h6nFGrq/8kkpLuwS5pRBU=;
 b=s8NrPSwwHBySZO+agX61wo3BcX7rtHrcr/0IqglVsXlkF02m1mmD5Lx/793BSXpExA
 MeW/BShwxi8Rf3Kv9u7H+L5N/aTsqyjANpE/EsBxSkFIFtE2mQ1IE8oMOnqebQ+9pl17
 z/OM6TW3lejHJV674gcahDPv6DbzDhxuAcXXlsvb1xUxZWXW43k6lHx6V9ltM8DceBFA
 vjW2uJegPGftOcZgnS5m/wgHEnmE9XVC2h4zFBKQTCzItZHruQN6whlACAl19FdovPDK
 01dDSsECU4TuX5cHpQLL4ISJueOE2p5esrYJzRgqm5eITDUb7/dDGQTlYnloe+Trcy6u
 f+NQ==
X-Gm-Message-State: AOAM532sm+pTfFxmE0YYstrAMcvMfy1/2JqL6i31Sw8nmwEKMvj9TyNO
 6qSKMJg+F588aHtpZlSuQMT1WFwE9SY1TQ==
X-Google-Smtp-Source: ABdhPJyp3OLzpHfPf+mVaG11dzyzT8OxNOprQ/+a/9Y5E9CnSFlo9sfiQ2lWyrZys1camjvgPfauFQ==
X-Received: by 2002:a63:b63:: with SMTP id a35mr4390811pgl.318.1624376907592; 
 Tue, 22 Jun 2021 08:48:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] target/cris: Fold unhandled X_FLAG changes into
 cpustate_changed
Date: Tue, 22 Jun 2021 08:48:14 -0700
Message-Id: <20210622154820.1978982-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We really do this already, by including them into the same test.
This just hoists the expression up a bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index e14b7acb10..80276ae84d 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3217,6 +3217,10 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         cris_clear_x_flag(dc);
     }
 
+    /* Fold unhandled changes to X_FLAG into cpustate_changed. */
+    dc->cpustate_changed |= !dc->flagx_known;
+    dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
+
     /*
      * Check for delayed branches here.  If we do it before
      * actually generating any host code, the simulator will just
@@ -3227,9 +3231,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
             t_gen_movi_env_TN(dslot, 0);
         }
 
-        if (dc->cpustate_changed
-            || !dc->flagx_known
-            || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
+        if (dc->cpustate_changed) {
             cris_store_direct_jmp(dc);
         }
 
@@ -3263,10 +3265,7 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Force an update if the per-tb cpu state has changed.  */
-    if (dc->base.is_jmp == DISAS_NEXT
-        && (dc->cpustate_changed
-            || !dc->flagx_known
-            || (dc->flags_x != (dc->base.tb->flags & X_FLAG)))) {
+    if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
         dc->base.is_jmp = DISAS_UPDATE;
         tcg_gen_movi_tl(env_pc, dc->pc);
     }
-- 
2.25.1


