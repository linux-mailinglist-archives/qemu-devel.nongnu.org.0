Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83AA466B36
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:54:05 +0100 (CET)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst5h-0000ni-1S
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0u-00005o-Nr
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:08 -0500
Received: from [2607:f8b0:4864:20::631] (port=42972
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0s-0005TT-Lf
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:08 -0500
Received: by mail-pl1-x631.google.com with SMTP id u17so565806plg.9
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMS++2dwv9z8ou0xgXRFjbkq4F7YRX5rhwWnAtj0BDE=;
 b=ddXykI0u3gjtHgaFNkoKFqz5yXJhru45o2Tz4NoanvtXqAW0tW6EibFV6Jt60YPSAB
 jMFhFBe+JSp3EA+kMR5am6AkILaIfe4BtuyPxznFSoTtYG431bZldWLexOWrpc1n+/ib
 CFAR8fj9mIbDEquhu3AL9plp66R8j9mXF/t1azWIEfjiGxnVK+gw67+/vMk7aFJciAZc
 nNy0nKDMzE0O05X1KXvjXusogNT1co8N4WVXFqyDC7ZOWjTBs+2r8rwvNG1hzD/NnZht
 GHjK30HhtyZIMxZuS/gYb2VqRtHICOC9zIjkyIl/avenD+KwManDkTzxzrXYwq9BGY1M
 azKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMS++2dwv9z8ou0xgXRFjbkq4F7YRX5rhwWnAtj0BDE=;
 b=7w/Cxm3bI2pa6sOI9BBpaHxQ32ynUSUPUfdj/PvCP5L1b7h18dWcjJHU2QCI1Nl7jh
 /32rWGo2uT66B33ozzVWODDsyx+6IyL08mXls/oNtEeNmFw2YWS5nEyryR48qUrWJhaa
 67yAXJmd9osLrSx2YFzLVizTB8BJc93AaLN8RQmz62v3WYltSOA1SCUfctuNEG+l0k84
 BAlAZg91/bVn0HEBkRBFvpFfbbLehAoOsceHa/IdRO50qCEvjP03RyS/T7faTWhkzmA6
 rR3wbvEbIizCuZiJ2epJBDyT0zTulH0xByAmCF+FlBuAkh+SFcy4Cear1jeKndUGgHEE
 hDLA==
X-Gm-Message-State: AOAM531Qf8/DuGqarLqpKn/EBU0xEU7GC77Hh0eVA5vrAL5F6jlYbl7s
 9AxUrgT3KMHbId4w01quFLfh/rHG7zGGBA==
X-Google-Smtp-Source: ABdhPJztlhLQjkXDbW/0vjtCfs2qS3eJxC01a3Z1FEWDT2rIL8ihAVTlDy9cZ7LM4KvA2DNR1+BMQA==
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr8754908pjy.169.1638478145306; 
 Thu, 02 Dec 2021 12:49:05 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Thu,  2 Dec 2021 12:48:50 -0800
Message-Id: <20211202204900.50973-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only value this variable holds is now env->pc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 71176eb3d8..afbbb8b4ca 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -286,12 +286,9 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
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
@@ -384,7 +381,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp -= 4;
         cpu_stl_mmuidx_ra(env, sp, env->mmu.ar, MMU_KERNEL_IDX, 0);
 
-        do_stack_frame(env, &sp, 7, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 7, oldsr, 0, env->pc);
         env->mmu.fault = false;
         if (qemu_loglevel_mask(CPU_LOG_INT)) {
             qemu_log("            "
@@ -394,7 +391,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ADDRESS:
-        do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
     case EXCP_ILLEGAL:
@@ -403,23 +400,23 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && oldsr & SR_M) {
-            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
             oldsr = sr;
             env->aregs[7] = sp;
             cpu_m68k_set_sr(env, sr &= ~SR_M);
             sp = env->aregs[7] & ~1;
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
2.25.1


