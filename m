Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC14DBED2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:56:36 +0100 (CET)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUj7j-0002sE-V2
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:56:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO8-0005lr-QA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:28 -0400
Received: from [2607:f8b0:4864:20::636] (port=36453
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO3-0002eI-6n
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:24 -0400
Received: by mail-pl1-x636.google.com with SMTP id e13so3571069plh.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVyC4ASoKbDoWqWtQ6it33/tXOmFXiabY9tyAWzkgHg=;
 b=rICzg+fm/Vsn8gQXcUwkFgAvnX0pemgFd4bl0tsVeIYj0KuYqOOrgMxBpsu0YQUzv1
 bFO4CNj/uaf8DGLatneK7sWyUKs8tQxQoGqqmOKIrl1zg8SWQa+0BMouYVh5HFNLl2Xa
 TlnKbeEHR2Rc7MCCs/17sJxEt9M7Jluch+K9ZlKchRGXQHgxR2kxQ0jnAFh7nZhlAkk/
 IvFywEBoXPa3iQkwLlCydeWHqU8IRg2tmtz4AAIm+lLt/rC+W0Wd2r3Ei6OongjxdoK2
 nuW3PntcfQz7wkpYzIm7iuZ/NedpFCr3k+ftH8T4Pzh9xeiZhA35FwPSop9b9323sAcW
 TLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVyC4ASoKbDoWqWtQ6it33/tXOmFXiabY9tyAWzkgHg=;
 b=LYmpGWNwKcOt3WL9DsKTi2UAESnDys2VREIu9WRZpP5Sw/no/OpovGgp9U7HJtlgNh
 AddnOyJ/BTrzr0kb2VspHoRijygsvHnsxlQ1khf9oqp7KwUCaWkmxxTblJJEVYhjwVUi
 fJ/Z5+0w9UeC7UzMxGF8SQpTyBSP6Xyum8cOecXQvHVqDKBjpj7jGiR+n9Qx0U3shs2C
 9J/ZeCacBz/9L3m0ifUcnlhNRL5xJUpEUpcErfwU3s3mzGZyNVslN6Pyvnxq22pV6q2N
 0Mdmr0ArPFlNFFggz5znlbGZBcOdXsF4anj+WgCVWlP9UYojEKtKCgwev+emgxpV3Nqq
 0x0w==
X-Gm-Message-State: AOAM530k+eKCziY0iJ1D8/AheObuaIx02omP8RIJLV4oULGpAZYkD20Z
 SV5FWhaEjpCDZN8cKjkkizKNpD8JMXcmXg==
X-Google-Smtp-Source: ABdhPJwbTIwji3SDTI1NlRbaVA7hhb0b00PqzBoLHWlJUTdQc9Cofj0OSX11yAHyPsDktemMPslgPg==
X-Received: by 2002:a17:90b:314e:b0:1bf:38a0:8e6b with SMTP id
 ip14-20020a17090b314e00b001bf38a08e6bmr14037319pjb.22.1647493761877; 
 Wed, 16 Mar 2022 22:09:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 43/51] target/nios2: Update helper_eret for shadow
 registers
Date: Wed, 16 Mar 2022 22:05:30 -0700
Message-Id: <20220317050538.924111-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CRS = 0, we restore from estatus; otherwise from sstatus.
Update for the new CRS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/op_helper.c |  3 ++-
 target/nios2/translate.c | 13 ++++++++-----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 26d4dcfe12..62a73c7b32 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -82,6 +82,7 @@ enum {
     R_FP     = 28,
     R_EA     = 29,
     R_BA     = 30,
+    R_SSTATUS = 30,
     R_RA     = 31,
 };
 
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index e5e70268da..2eac957f68 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -73,7 +73,7 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     }
 
     /*
-     * Both estatus and bstatus have no constraints on write;
+     * None of estatus, bstatus, or sstatus have constraints on write;
      * do not allow reserved fields in status to be set.
      */
     new_status &= (cpu->cr_state[CR_STATUS].writable |
@@ -81,6 +81,7 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
+    nios2_update_crs(env);
     cpu_loop_exit(cs);
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2b2f528e00..7a25c864e2 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -435,11 +435,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-    tcg_temp_free(tmp);
-
+    if (dc->crs0) {
+        TCGv tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
+        gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
+        tcg_temp_free(tmp);
+    } else {
+        gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
+    }
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
-- 
2.25.1


