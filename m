Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E942EC99
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:40:11 +0200 (CEST)
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIl8-0007v0-Hk
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzF-0003iJ-Kv
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzD-00058A-Fe
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id d23so7855590pgh.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GPOf5AV1y+ul1lb/Ux3tJS63pwxNaNmCF+5fwEy9Rvk=;
 b=VEEN31gGSko6YuOwTrZ2yTBSdtS6MTllfL9iBmSLU4LJ09BxXFAaqLj+28kxmbJEgo
 BvIfdI013W4EIXQeLpRM/lZQBGNVoQwET0VWa+f6dxeSsmG84zDk4rPchxLdiXOcpaWz
 ocadP9vyb/DNZ/DDF5aDDFGtAri0/Ff4/vaQ+VTR0DwsiVn1IV4jzoMRYU6P2pxeCNRr
 LPWBhe+Fz0lOGhVttQVtIsgE+rru/TxhTXS5Wvzpnu5KHzFglNGdXg5MvZRLk9Ehs0on
 pwPS6kCMDSJv/PB9gqnwsJL4flt3P9U7R4MZBPH0KXVF+zMjHioqVW8+xEQPibTy8heK
 NqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPOf5AV1y+ul1lb/Ux3tJS63pwxNaNmCF+5fwEy9Rvk=;
 b=At9Bky7uWUCHeFFIVaNx66g9g8O4b0NqPh92ZyZIfRX6BpBpt0FENLh9CXD3nIBV7H
 P5TtV7dd6yU+3fMbiexUIRgs63uGBq/MQJqcM/eUdm3DCKJ3HlBCuELAot0+OgXKIOzu
 g1YdX36uzHRhZSph8ip8azoT2WDjaW74To9ejj/m/7CAboqvI4R6UvcMnQQp9OwfXm15
 zQ6Rhr75CXD6H2KtZdOLOI3LgdELf0PQGDZe/TO7IfkNzARmOp+PQYYb6wVBPP/kMirp
 U0YYTmqxCJ6wmKFNHvSx/Y0gSF9BqWKS2nE6wy98o5y+JRcHSPj58Zkb+1oEwI9p/wOZ
 LCNg==
X-Gm-Message-State: AOAM533I/6wnVur5PIzzXVVsqW8WD91DTUBiqOXlSMkrsSZL7I/gotzt
 nzh5l20o45Su+qa2EysT8K5UDEez9GS8+vk7
X-Google-Smtp-Source: ABdhPJwRjhMRBbfTzyIbwxYA8PZvBWyk0uRePDHwILaS69oTr2GGiNV0jF77TevwBVqmheQQ69HE7A==
X-Received: by 2002:a63:731a:: with SMTP id o26mr8187544pgc.248.1634284235998; 
 Fri, 15 Oct 2021 00:50:35 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 63/78] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Fri, 15 Oct 2021 15:46:11 +0800
Message-Id: <20211015074627.3957162-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
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
 target/riscv/translate.c  | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 43ce6148313..cf21097b5fb 100644
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
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 53cf88cd402..606bf72d5cb 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index db105d4d640..065e8162a2f 100644
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
index 6a3f105d431..6fa7e016e22 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -382,6 +383,12 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+
+    if (rm == RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
+
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
-- 
2.25.1


