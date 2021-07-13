Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C33C7537
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:46:36 +0200 (CEST)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LYJ-0006oT-S7
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUE-0006u5-E0
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUB-0005gO-Ce
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso1803342pjj.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Ox+DD1VyGDD2SWlngk4YcouD6dR00XZiALJU9OxjL4=;
 b=q9WkDpCEdlMjMvspJD322CtxcGko6rp1HFq6WoZv0+ZaFhh6CD3wzql3YcyMykPwpI
 S2k6pD6E9AGmQCHj4BTYq36mL/zIP+EtsiBxtIe5p76MQ5KuF0o+1u8souy8GSapwDCe
 PlWah6aQNH/4i4RP1eRS/vkVA4DDWvy675risDCpn/xwtNOgJXV5pn/+NJtDiQhJsuXG
 5oBihygk9SFdb/FwIorcqWPLCjZ2RLeu3EODCq0fCltDH/wBPXxlTiqhV0qLp+j/pZO+
 t/kPqyfAEl0jK7r7jLdh5AfIVlojlfQDXNT1Xzaq4kIxFNGcygZDUPb4wwdy/U0Ij5oY
 rSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Ox+DD1VyGDD2SWlngk4YcouD6dR00XZiALJU9OxjL4=;
 b=i27l/AQZRWSYe55XLxRgosYMf0uxkI4jX4jKCLBp4qgWFmKiB6Zh3YzVKT51vlKNaZ
 IuYhFKEAoUgeN4wx7Uwb83/fa432I9KQoxcTX188AaB1JuG9xqM/A/GErhZc6fcSPLhB
 upr24z0m4Xq2CNKS7wM1rVoqmLWi4SIzQaw9fcmvd0CGflB98vBOh2M4IoFORTVDgVrH
 dHYsTyAVZnIeeyRcnMGFqNWh56HVyURTaWsyNFaHQSpzFamaFiYuwy5KfRvW+mvvL/oD
 bQ4paSh9l0VvOzbkSvcK//tGANs8bNZ3MjRf58ZYMOAfPUdXlgfnxtrkc2MEvW5wFCy3
 Ae0Q==
X-Gm-Message-State: AOAM532CgHPnF4LuIddS0Ix5ygFBHIpEIaOMjby9CfnHJeUFMF0nAl93
 c5tou0y/m/MF6CTXAQyeZ224QYd7Z/CIgA==
X-Google-Smtp-Source: ABdhPJz7mYn149Xo/ivnwWno77wBjPm+vhg39GIrJqUbJQPWu2eila8JNWiRs4fJJ+T7WQs9X8IQcw==
X-Received: by 2002:a17:90a:7bc3:: with SMTP id
 d3mr214428pjl.145.1626194538162; 
 Tue, 13 Jul 2021 09:42:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] target/openrisc: Use tcg_constant_tl for dc->R0
Date: Tue, 13 Jul 2021 09:42:07 -0700
Message-Id: <20210713164211.1520109-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The temp allocated for tcg_const_tl is auto-freed at branches,
but pure constants are not.  So we can remove the extra hoop
jumping in trans_l_swa.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 1e3b019c59..2db529b7de 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -732,12 +732,6 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
     ea = tcg_temp_new();
     tcg_gen_addi_tl(ea, cpu_R(dc, a->a), a->i);
 
-    /* For TB_FLAGS_R0_0, the branch below invalidates the temporary assigned
-       to cpu_regs[0].  Since l.swa is quite often immediately followed by a
-       branch, don't bother reallocating; finish the TB using the "real" R0.
-       This also takes care of RB input across the branch.  */
-    dc->R0 = cpu_regs[0];
-
     lab_fail = gen_new_label();
     lab_done = gen_new_label();
     tcg_gen_brcond_tl(TCG_COND_NE, ea, cpu_lock_addr, lab_fail);
@@ -745,7 +739,7 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
 
     val = tcg_temp_new();
     tcg_gen_atomic_cmpxchg_tl(val, cpu_lock_addr, cpu_lock_value,
-                              cpu_regs[a->b], dc->mem_idx, MO_TEUL);
+                              cpu_R(dc, a->b), dc->mem_idx, MO_TEUL);
     tcg_gen_setcond_tl(TCG_COND_EQ, cpu_sr_f, val, cpu_lock_value);
     tcg_temp_free(val);
 
@@ -1601,7 +1595,7 @@ static void openrisc_tr_tb_start(DisasContextBase *db, CPUState *cs)
     /* Allow the TCG optimizer to see that R0 == 0,
        when it's true, which is the common case.  */
     if (dc->tb_flags & TB_FLAGS_R0_0) {
-        dc->R0 = tcg_const_tl(0);
+        dc->R0 = tcg_constant_tl(0);
     } else {
         dc->R0 = cpu_regs[0];
     }
-- 
2.25.1


