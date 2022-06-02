Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6D53B153
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:46:46 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZvA-00088C-Lx
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj4-0002Os-9y
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:14 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj1-0005F5-Qk
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:13 -0400
Received: by mail-pf1-x433.google.com with SMTP id u2so3480900pfc.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=Yk3723jLF3gTb9CncvWRZv7v4jv30ttiW0r1k86QlT/dwP1HSfirZzaTh890ccF6kP
 N+5FYcCDchwBpl94epRqAXDSKE2VteAPnkXQ8DwkVzCW8BYCy0WZeijSGTyMxmWD6XzT
 K1YY0zwpjD6cLorYgOwd5UZDcHB+LeY013IhSvEVdGQMMZX+1kl6pglvB81ElmEocwHX
 KmBXO+VUwUjOvD15OqH9zp8WnGhdP8cgMN1WwQteqUv9ZnASAgheFRBl0LO8UVodQDuO
 ijcevWreJXE8byjFeuAErSZ2XGcgKI7nnvqjdkYRD7J0CSUgnG2hUkbzWdJnunObA6KE
 5Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=ld53qoesoVPgoSLuTqa3UIrvxRW7s4EpheVSHGK5oBVIW9ECWMF9K/TfM12lEMRJXe
 3/MOR7DCmPzg0QXEWbl/REKDLWiNcd/ggwv8Tzen18ZoXfL85G/HkZhPtSWDVsiKtHNj
 ODWuDbhLq2uvHEvGKxlgBzv58QiZOLHWh4CnhtQprjEHGsLsDSPOtHqr0bl8/eFmwD2U
 gpZqUvPv78YPVxGrxJIELuvhVT5cJM3kvb4z7Lk1uBwYuKw4/dFmcZ+J9bCZ2Ecan32W
 SVzxVy+MTTO9zKMnwlMriiLDQ5azBqb/IiSexU2LkkfeVWB6EHiTJ1/zkpIwOeKURBx0
 Pv4g==
X-Gm-Message-State: AOAM531adC41pTgYc17a8qfiFj/QwzTsr/KoidrFV5G9h4xFOnHB0Yie
 c2TXmKwLFg5Rs2yfm5dmL0wEmxCnDAs0CQ==
X-Google-Smtp-Source: ABdhPJwtX9WkB5u8mfvwhrafrfIC38BBQXOH4B/o0AJOZqfkQqFy/hWjv+Y6QoVILNe+5R378g2pmg==
X-Received: by 2002:a05:6a00:1506:b0:518:bcdd:6a33 with SMTP id
 q6-20020a056a00150600b00518bcdd6a33mr2335457pfu.27.1654133649569; 
 Wed, 01 Jun 2022 18:34:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 05/17] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Wed,  1 Jun 2022 18:33:49 -0700
Message-Id: <20220602013401.303699-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only value this variable holds is now env->pc.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 0f41c2dce3..777869790b 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -287,12 +287,9 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 {
     CPUState *cs = env_cpu(env);
     uint32_t sp;
-    uint32_t retaddr;
     uint32_t vector;
     uint16_t sr, oldsr;
 
-    retaddr = env->pc;
-
     if (!is_hw) {
         switch (cs->exception_index) {
         case EXCP_RTE:
@@ -385,7 +382,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp -= 4;
         cpu_stl_mmuidx_ra(env, sp, env->mmu.ar, MMU_KERNEL_IDX, 0);
 
-        do_stack_frame(env, &sp, 7, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 7, oldsr, 0, env->pc);
         env->mmu.fault = false;
         if (qemu_loglevel_mask(CPU_LOG_INT)) {
             qemu_log("            "
@@ -395,7 +392,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ADDRESS:
-        do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
     case EXCP_ILLEGAL:
@@ -404,12 +401,12 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && (oldsr & SR_M)) {
-            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
             oldsr = sr;
             env->aregs[7] = sp;
             cpu_m68k_set_sr(env, sr & ~SR_M);
@@ -417,13 +414,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
             }
-            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 1, oldsr, 0, env->pc);
             break;
         }
         /* fall through */
 
     default:
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
         break;
     }
 
-- 
2.34.1


