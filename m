Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B243875BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:52:51 +0200 (CEST)
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwPC-0003lg-2K
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1livzG-0006tT-GK; Tue, 18 May 2021 05:26:04 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1livzA-0006qY-PO; Tue, 18 May 2021 05:26:02 -0400
Received: by mail-ej1-x629.google.com with SMTP id l1so13474429ejb.6;
 Tue, 18 May 2021 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w7HtY751VhTfxUbo3W0pArjCgPIGgh/qudCQex57c4Y=;
 b=TCRnXGXz9oY6XTNdJZQGwrUI/ftnovhCXuKx3wQLrsPfGO5+i4/NOuXSDId8WU85tU
 Q8+LB7DhASMQDVNGx8M2qDbTW0pFeEHeIk2KVgCnMBQXwWQgIUBHVfKV5gXYxAZG6+tg
 FOYnZ59R5Wml73pS8GKmlS6/5WYhIDbjfiuvpr9Byao3xJZHo0VALziw45oXz+U9hUBA
 mdv4jm6kPHIXY7JTvhEZ8wvYaa3Rp5UwcKxnbl6VseW0MrIB25JdPoTfLzFKPrZkQ0bk
 mvpn8U4LaHhW+FRd+hGYevhXCCcMmb2oTB0OKVDZOiMbNkrpQlSz8a87v9gC4laqvN3Y
 hVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w7HtY751VhTfxUbo3W0pArjCgPIGgh/qudCQex57c4Y=;
 b=Uj5CsjAt6HFKTVCX4AXxvFfDD1jT//T0Zyk37khgFwDfuVRMqwFAp52QEXX8c4edT+
 9flCXpPxoN07Rf6XKREvLxhn5mdX1NQtr9zEF7vnADqL0Xq4Uz1IXYKSh8M/wK9f2UKl
 19luDNB7NkOpvCezv1cLXuDSi8OBlFTrLv2M31vbDqpTkmO9j6073UkJA4eKA7paQdUl
 bGJajJ8ETtxEayw9lx8r0kM/gD4VcrL4kq7d0WExXIzrN+uT6Bke7OCm+OHoimfW1xEN
 SgaWw2Ykkf6DyYhvU0sK9t1VVIzWlBM+biO8AQtIubvKUFfkJKvEyPxaeXMBJXOdBqyU
 TjQg==
X-Gm-Message-State: AOAM530J6VZRJVVku0g0ImqoCmIQUSHzti/KSPMEb4iP/hMB3eTrt3/F
 kM1yjKfu00PXT8hwiGg9F0Lm55PAQx2Ucw==
X-Google-Smtp-Source: ABdhPJwDlAg7fTo4l/SWlwAQYw1fxcIaCcAcAD/yC7u8SsB5geVIR6BLtfp/FGfCWBRCoteX800kcg==
X-Received: by 2002:a17:906:4088:: with SMTP id
 u8mr2827463ejj.240.1621329954610; 
 Tue, 18 May 2021 02:25:54 -0700 (PDT)
Received: from localhost.localdomain ([151.60.43.39])
 by smtp.gmail.com with ESMTPSA id hp29sm9816644ejc.47.2021.05.18.02.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:25:54 -0700 (PDT)
From: Giuseppe Musacchio <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Date: Tue, 18 May 2021 11:23:52 +0200
Message-Id: <20210518092352.43610-1-thatlemon@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=thatlemon@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, pc@us.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
runtime-configurable parameter.

Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/translate/vsx-impl.c.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b817d31260..3e840e756f 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -139,7 +139,11 @@ static void gen_lxvwsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
+    if (ctx->le_mode) {
+        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_LEUL);
+    } else {
+        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_BEUL);
+    }
     tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
@@ -162,7 +166,11 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    if (ctx->le_mode) {
+        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
+    } else {
+        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_BEQ);
+    }
     tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
-- 
2.30.2


