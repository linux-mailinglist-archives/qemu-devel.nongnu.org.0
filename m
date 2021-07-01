Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0FB3B93EB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:27:52 +0200 (CEST)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyybV-0007ON-P1
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZZ-0004Od-V6
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:50 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZS-00088e-7B
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso6856963pjb.4
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiRmqcZNF2hJVvi+mtvT/dUtK5fKY7sdVO7TwBKWEiU=;
 b=aN1KSX6A5zT5OsJG+87PrIONda1RxJ77H2jH+QMO0/+DnA+Uk2XfeGyh+zyhtjOzvL
 trSDUiigqx1V+b13P6TCTd/ma8/IgcQgh7JqO3+nW+IaOK+EcEW+Q3A12aWoD6LXBckN
 npC5rCCFn0Ycq6ZCh9Q7yp5pbNCYuV9zwOZ4j9b6rJosgf8/JaG7NPZYjT6nKaRffIy5
 9HTA/5A1DkkxvmcppVutwmOsaA7PBtbvXHhUb2GN8iVQAMhwGIGdglk13Ay+1SV3H3VK
 u5QieRd3zNRjtcrO4XE4bvbPN6Ra3oYXn3m0Mto+9wWSIfY7fj9LRS8UCYJvmOuUlEPq
 Gipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiRmqcZNF2hJVvi+mtvT/dUtK5fKY7sdVO7TwBKWEiU=;
 b=qtEiJ28pratzLD/Z0N9IVupoYGz76bBZ+sY8qkUgJl9m4rzjGaGKvKOOgemV2GhKHJ
 fcL1nEDfGe5m/gHBa8BJqEMd9ByK3pN8OGLu3BDPHC/v4ScMhozOKO2L7Sf8nOc43+rt
 VxFcqKKj+G5pmuoAi7O3Uib0imIA4RislDmcmpxzXCROCgU3+s5PK4b+baj+anmyDx/8
 RYVr2YuewJPIoVfwgtXzGsfUksjRHDCuTOShU9kUsx8lsyiXDLibTQP1PsslYNqcsPuT
 xsXnu58f/j7VUnIObxRUm3ldz4FunmuZOEglHMf0q8s09muDmZzLNcFGkyNdF0rL7xGt
 p+yg==
X-Gm-Message-State: AOAM531OFi7FANwSuEE7PvieYH/3XCOnbcug2DkzO/oGKddLme3mCbgP
 OeNOrYjPcnkWfovsusii5CdMwwLcCUWXGQ==
X-Google-Smtp-Source: ABdhPJwDmI1l2a+4yphkwbvDYcXVf8PD2bJCef9uB64Rm9psb5W1X/MkNdcqG+PoNj/yekq0uxRuKQ==
X-Received: by 2002:a17:90a:f485:: with SMTP id
 bx5mr268051pjb.194.1625153139431; 
 Thu, 01 Jul 2021 08:25:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] target/i386: Use cpu_breakpoint_test in
 breakpoint_handler
Date: Thu,  1 Jul 2021 08:25:21 -0700
Message-Id: <20210701152537.3330420-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The loop is performing a simple boolean test for the existence
of a BP_CPU breakpoint at EIP.  Plus it gets the iteration wrong,
if we happen to have a BP_GDB breakpoint at the same address.

We have a function for this: cpu_breakpoint_test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/bpt_helper.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 9bdf7e170b..f1fb479ad9 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -210,7 +210,6 @@ void breakpoint_handler(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    CPUBreakpoint *bp;
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
@@ -222,14 +221,9 @@ void breakpoint_handler(CPUState *cs)
             }
         }
     } else {
-        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-            if (bp->pc == env->eip) {
-                if (bp->flags & BP_CPU) {
-                    check_hw_breakpoints(env, true);
-                    raise_exception(env, EXCP01_DB);
-                }
-                break;
-            }
+        if (cpu_breakpoint_test(cs, env->eip, BP_CPU)) {
+            check_hw_breakpoints(env, true);
+            raise_exception(env, EXCP01_DB);
         }
     }
 }
-- 
2.25.1


