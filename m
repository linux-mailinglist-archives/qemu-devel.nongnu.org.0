Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D755D515E13
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:13:23 +0200 (CEST)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknqc-0006j4-Va
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAs-00057K-SZ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAr-0006XR-BX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:14 -0400
Received: by mail-pl1-x632.google.com with SMTP id p6so9292494plf.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyI9atIKZgVrQgHTzauV1Q/z1myJDzCa5CWllyH6//o=;
 b=i/chQaADAoksE27Ep83yDkoNrfhd5H4DbyXhCV8UeoFlWaIumaZ70kbAaDl8mXiM8s
 lgu6AwaUzNueHGQYhqtURTQtUIr3gXY0aelxQCNCZ6cX8rW7rDqmVF+yBUr76k7RxRL2
 Z/+l1Uuacw5rHr+bpF+aDgV9IB2CTTVAS6nwwy0uYF8OV/TCx/cUNkuAvxMFsSLaWF2m
 wNi6j6ok3j5jOqJgeLrnRI1DzNtaWWj6L9r6uK0gC5ZRK9DAZDhkizdK/hKIUMTR+TCI
 rg7DVqkjdt5xyxR4kS7PATABMKGwRfl1poR90FXVtSMV4ocqqLM9elY2u7bJXBrP3QGD
 W4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyI9atIKZgVrQgHTzauV1Q/z1myJDzCa5CWllyH6//o=;
 b=1GFoW4wxXD6X7izkuWppOc2zpCTkY+gU39BjSq5cDvti/gPWudn8BvoTFzeQQgcAzV
 kwuNX0xP3xthgO1k6AqXQdjaNmwO57/I6n7xlOwRMhTK8wRjB19GPPceuyPnhUCH/0qt
 Bvbq8NV9rjCzZqE0wkBiA+cc60ypxoTDcbabtehNsVQKE2yh8rigtbEkMMBQ8XtiY9kp
 WYotjKh3ceifu5JBQbJ4j0uu1uTp3hG6zzaHah+FYnxF8rlnIcUv3pZ+tip6q6o1RKvL
 eMCsIWP0IEu0Ab6QZXCClRUkETZDj6LIRe7oqwzZjWIztREJQdkBiCDTtPAdQ+5F+h4y
 Agxw==
X-Gm-Message-State: AOAM530P92FlK/BDyCegvvmogzoof18r98/Z8mXHjsFXK6JSJ/Et3L/J
 xevKfEbLBuUw9i/nSTXgmkjkzAdAPoyBEQ==
X-Google-Smtp-Source: ABdhPJzzzUX8MLHa6J+jx0m1Jq/8En8nv6/cbNgIr9uYPanyVEDtdsccY+XPN458+9wGPx+kQrNZFA==
X-Received: by 2002:a17:90b:4d08:b0:1ce:8d09:1c58 with SMTP id
 mw8-20020a17090b4d0800b001ce8d091c58mr4270641pjb.168.1651325412068; 
 Sat, 30 Apr 2022 06:30:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/43] target/m68k: Remove EXCP_HALT_INSN
Date: Sat, 30 Apr 2022 06:29:28 -0700
Message-Id: <20220430132932.324018-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that semihosting is not attached to EXCP_HALT_INSN,
we can use EXCP_HLT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h       | 1 -
 target/m68k/op_helper.c | 5 -----
 target/m68k/translate.c | 3 ++-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 60f88e6bc9..f10554318b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -66,7 +66,6 @@
 #define EXCP_MMU_ACCESS     58  /* MMU Access Level Violation Error */
 
 #define EXCP_RTE            0x100
-#define EXCP_HALT_INSN      0x101
 
 #define M68K_DTTR0   0
 #define M68K_DTTR1   1
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index a345245612..6218ac791b 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -201,11 +201,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             /* Return from an exception.  */
             cf_rte(env);
             return;
-        case EXCP_HALT_INSN:
-            cs->halted = 1;
-            cs->exception_index = EXCP_HLT;
-            cpu_loop_exit(cs);
-            return;
         }
         if (cs->exception_index >= EXCP_TRAP0
             && cs->exception_index <= EXCP_TRAP15) {
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 51c546f26f..354a127e1a 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4736,7 +4736,8 @@ DISAS_INSN(halt)
     if (maybe_semihosting(s)) {
         return;
     }
-    gen_exception(s, s->pc, EXCP_HALT_INSN);
+    tcg_gen_movi_i32(cpu_halted, 1);
+    gen_exception(s, s->pc, EXCP_HLT);
 }
 
 DISAS_INSN(stop)
-- 
2.34.1


