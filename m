Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A689D5048BD
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:02:09 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9Ds-0007S3-NU
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x0-0000fY-4I
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:43 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wy-0003Hx-D6
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:41 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so14986518pga.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MiWeWkecp06NuqnvJcQe+4MeVb3lXXDHi5qwkM/XVaM=;
 b=B20sxyvpNez0Dj4y1gXoZcPlKJOklmmL98rVxx52/lIffU2syKDPNWTYTn1V5eNvoI
 1BvR+zNmREQIXGN8NHFFPGhVSMW9A22KtqBcbPWvJtM6O2KqhgBTNwEFXQEDDlKbzQu0
 3YmA8XB6I1Oxydq4f7zBJynmBUyCu1QIT+nh2eAyLuwBGPiL+GDuqljuYrjfruf6AbIO
 NQovIcO7noSyD6t61CDTie0lWOogauqxNaNJgFjBWUn1u1tD3hiuQsSYVEePLU9OZOVs
 sXgnKnK9J29WNXVaoLU7vwsMxF7WfFuqO/e6mwIP+DoHdpM5q6l269EUXgaEtlYNrhnO
 baBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MiWeWkecp06NuqnvJcQe+4MeVb3lXXDHi5qwkM/XVaM=;
 b=SSzQKzkAQGaHwo1GL/JO+xKx6EEPOx09FfD5CpoxlrFmac/r0sri62+fj5bGEZAyAK
 6JiTKT6w1BNfVBanDXBanORowHzyQnURPDJbFpU3TklVbSTai38NpATTpd6a5mRoOLwU
 yLudje99QCe1nitEYoaMaC7xWF6+VV/CTt6niJJR9zdo/sBoIaV3qQLYtP+yPl/1hFMp
 T4bM30V1Vala9pzivmtdzsUYm7rpsOqwItQwthH+JKmGO7L1CQpxy5nwM2T7C/HFtFR9
 qfb99MWjdv/FU2AN7vbwrCla54eOk/NJ8FRw8Cfl0NaHrR3L5yLZhooNqE/xxnu2UMfC
 pwFw==
X-Gm-Message-State: AOAM531RxCK955e5NFsDepswrixNeLtAqyazTH6Ndy9pKuYkM1XFJ1ua
 JmHnNHvEi214iy0NvMCOowZ2aOGsAcl5ow==
X-Google-Smtp-Source: ABdhPJyLFLMB1a5HTg6RqbJO0EtSNNPNlxQ+N2I8Vu++v6jJZpe/BIgKLGey3QwowejW/5esTPcv8Q==
X-Received: by 2002:aa7:9ad8:0:b0:50a:49e1:164c with SMTP id
 x24-20020aa79ad8000000b0050a49e1164cmr8354515pfp.8.1650217479056; 
 Sun, 17 Apr 2022 10:44:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/60] target/arm: Split out set_btype_raw
Date: Sun, 17 Apr 2022 10:43:37 -0700
Message-Id: <20220417174426.711829-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Common code for reset_btype and set_btype.
Use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index be7283b966..a85ca380a9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -128,29 +128,28 @@ static int get_a64_user_mem_index(DisasContext *s)
     return arm_to_core_mmu_idx(useridx);
 }
 
-static void reset_btype(DisasContext *s)
+static void set_btype_raw(int val)
 {
-    if (s->btype != 0) {
-        TCGv_i32 zero = tcg_const_i32(0);
-        tcg_gen_st_i32(zero, cpu_env, offsetof(CPUARMState, btype));
-        tcg_temp_free_i32(zero);
-        s->btype = 0;
-    }
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env,
+                   offsetof(CPUARMState, btype));
 }
 
 static void set_btype(DisasContext *s, int val)
 {
-    TCGv_i32 tcg_val;
-
     /* BTYPE is a 2-bit field, and 0 should be done with reset_btype.  */
     tcg_debug_assert(val >= 1 && val <= 3);
-
-    tcg_val = tcg_const_i32(val);
-    tcg_gen_st_i32(tcg_val, cpu_env, offsetof(CPUARMState, btype));
-    tcg_temp_free_i32(tcg_val);
+    set_btype_raw(val);
     s->btype = -1;
 }
 
+static void reset_btype(DisasContext *s)
+{
+    if (s->btype != 0) {
+        set_btype_raw(0);
+        s->btype = 0;
+    }
+}
+
 void gen_a64_set_pc_im(uint64_t val)
 {
     tcg_gen_movi_i64(cpu_pc, val);
-- 
2.25.1


