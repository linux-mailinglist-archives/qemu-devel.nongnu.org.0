Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5312325C82
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:24:07 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUfe-000870-SA
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkg-00037k-Tl
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:16 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkc-0002rP-PJ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:13 -0500
Received: by mail-pf1-x42a.google.com with SMTP id j24so5332030pfi.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1K63dT0Tzdrjase8N2euXunPRGBjKAQzEzf7DeO2+d8=;
 b=aJF4UHKwOgKUdbPfjg0e2zm+un6zwqRncRfxpp1WkTvXbTFnb83Uv9vh0PdrR7TfH+
 ppP+HeCge+k+AKJodO/Xsxctw17ets4xj/YwImNAS62fitYFh+XLOU/szr0a62r8QNhn
 rGtJ2nydgTluMi4BV6U7sgcDHx0wAC2M8c6hJPCo28wyaEe3H8TWGL+ZVDzInO3Oa4FH
 LMl3XHugiqLfDcw0mMseNzlf3XCSu1RD6IfEnKyBYE4Vg3/oM+KqzcggrSCIBfiuMvt6
 nhd82LBOG6mgX2FLRK4KbNf+fyW7yO4er99lADotit0djv2B0UN3UDLA2ehOFUqJC0HL
 jEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1K63dT0Tzdrjase8N2euXunPRGBjKAQzEzf7DeO2+d8=;
 b=X5b2MQk2jbWO637JM9hMkyZw6+tlPZa/6qZqkGUNU1dxTS9kEmwVkqWPm9EVHNiVJK
 gT5N4eClRWDY0CzEnD6Nvmlc2gyVEZd5RP51wovvQ7kJbEEtTBxdkL33CVjZCuyAwDaq
 WR607TypxXxgP52oohlihbP/o5IsHn2h4ZgqbY+oRdEeLIyi1BDR9c3gwcP/ZwHJtiRj
 xYKyG95ow0N26BWMTTCdGZzQ9unhiT6rKbRxbIOKqaOO4z8VezA7MrgIDTEViAy/HMCc
 B2Kzv9Zxg39F/FK7r6zsntYnJceoPCXU3kj2eaHOziZOUYVYWAV1uSUXyWb9zi93XrHm
 W/OQ==
X-Gm-Message-State: AOAM532CZhRR/Dn9jen2XYDwRUuPqyBrAvPoxeNlDRXR0tcC9sDB3d0Z
 EzgrpW4diYXJ3sVBkG6Ak5bB1XN40MY91Q==
X-Google-Smtp-Source: ABdhPJyYwwFESwuuP+RtXJwkTVyD1rHwClYBVfz/nJpzwuD1Rens/Ij1/C2+H9ACGcRAgT6qdqa1TQ==
X-Received: by 2002:a63:d144:: with SMTP id c4mr1020250pgj.196.1614309908001; 
 Thu, 25 Feb 2021 19:25:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 62/75] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Fri, 26 Feb 2021 11:18:46 +0800
Message-Id: <20210226031902.23656-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
should be an interface private to translation, so add a new independent
helper_set_rod_rounding_mode().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/fpu_helper.c | 5 +++++
 target/riscv/helper.h     | 1 +
 target/riscv/internals.h  | 1 +
 target/riscv/translate.c  | 5 +++++
 4 files changed, 12 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ad84aeebc1c..ac3e7b4d08f 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,11 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+void helper_set_rod_rounding_mode(CPURISCVState *env)
+{
+    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
+}
+
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e11cce3e8ea..1d52936c399 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 469cc418c4e..6a80c067706 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -43,6 +43,7 @@ enum {
     RISCV_FRM_RUP = 3,  /* Round Up */
     RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
     RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+    RISCV_FRM_ROD = 8,  /* Round to Odd */
 };
 
 static inline uint64_t nanbox_s(float32 f)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d9a794d71e8..b9da55c75a8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -585,6 +586,10 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+    if (rm == RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
     t0 = tcg_const_i32(rm);
     gen_helper_set_rounding_mode(cpu_env, t0);
     tcg_temp_free_i32(t0);
-- 
2.17.1


