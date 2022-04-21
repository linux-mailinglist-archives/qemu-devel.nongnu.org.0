Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2150AAF0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:44:53 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhebc-0007Ux-70
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWW-0005r8-V2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWV-00073G-FT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:36 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i24so6158054pfa.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4/QWtXWUGL6bGLYMAeUnisR9BYGfOC4zsLjYQrXeY8=;
 b=CQQuIRIxGhBn1Od8BfeBqHg+4UGk5wvSgChpODe3xQ39N8RS7QjmoWs7i2ULvXJUUP
 L4G4Z1mVj4PGcsbSW0GI5iYJH5M4jHZes3/FjY1cvxVEYKb34rGvtLYTJcc5rftdxISC
 ml50WUUaXaqsKhCukXLsq2KWwJJbIBNJStZMqagR4Kir15HS6E5JB9GnGQVozftQ1Pu9
 GpmCaDwsUr9IuLfWJoudRDGffheBDql+bK486ktrsFy9PtR07fxZ6pJ9T/UKul8pIT+g
 LG2i+7HIjwFhpMhn8CafwfVRcffJoBwRqPHt2MPNT446RHFMEuiVpRueTD5ocmIT4f+M
 vVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4/QWtXWUGL6bGLYMAeUnisR9BYGfOC4zsLjYQrXeY8=;
 b=b6nXEFOUcgeamjNdfyQQn9SMRZG8si/HwpYG5z6FetjbL7wEaXqRnZnt3ABML++XJQ
 Q2HEChjFNtoqXZpw3sfrkQPjmcbB0+XqUeuVIPEVcXTpm8wG69TJtj/5WT17xMMGXzkN
 xzXWQiG/+Vyuh3CWY6xnQKIv+9nhbH0WtB/8wPUAAFQvVDXk0J5K3WpBmkLdtAPWtM9C
 RPvCGHyrAHQnHvrav5gllYtJ6qxiE1eD3TCjvEpn9HgGj/WI5tkudt1YQqVVHbK3L6tK
 ZPG47lZ/4lc6l6bbLwxbgXS7am+/x1Fy0XNPIF4wT0P8W7nFDuCMJo8BaMDiNnGnpgoj
 VKjQ==
X-Gm-Message-State: AOAM5320LCeYZtk6kUmj9glKCmUCjuLErTN9Ty+ReD0SuIlvbVhJcFKk
 pPH/0eicdDEeF5avWkvSZWIG7DN2D8TgmQ==
X-Google-Smtp-Source: ABdhPJxrv23of5FM+8LeXBR+MUCjgGj2jltCKcggN02jy39/FolSFCY3ab5PfP9queUG2QHAhYvBew==
X-Received: by 2002:a63:503:0:b0:3aa:63e6:d1f7 with SMTP id
 3-20020a630503000000b003aa63e6d1f7mr1182103pgf.387.1650577174105; 
 Thu, 21 Apr 2022 14:39:34 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/xtensa: use tcg_constant_* for numbered special
 registers
Date: Thu, 21 Apr 2022 14:39:15 -0700
Message-Id: <20220421213917.368830-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Numbered special registers are small arrays of consecutive SRs. Use
tcg_constant_* for the SR index.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 82a0dbf46d7c..c4991735ead7 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2615,15 +2615,13 @@ static void translate_wsr_ccompare(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     uint32_t id = par[0] - CCOMPARE;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->nccompare);
     if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
     tcg_gen_mov_i32(cpu_SR[par[0]], arg[0].in);
-    gen_helper_update_ccompare(cpu_env, tmp);
-    tcg_temp_free(tmp);
+    gen_helper_update_ccompare(cpu_env, tcg_constant_i32(id));
 #endif
 }
 
@@ -2643,11 +2641,9 @@ static void translate_wsr_dbreaka(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - DBREAKA;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->ndbreak);
-    gen_helper_wsr_dbreaka(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_dbreaka(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
@@ -2656,11 +2652,9 @@ static void translate_wsr_dbreakc(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - DBREAKC;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->ndbreak);
-    gen_helper_wsr_dbreakc(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_dbreakc(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
@@ -2669,11 +2663,9 @@ static void translate_wsr_ibreaka(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - IBREAKA;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->nibreak);
-    gen_helper_wsr_ibreaka(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_ibreaka(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
-- 
2.30.2


