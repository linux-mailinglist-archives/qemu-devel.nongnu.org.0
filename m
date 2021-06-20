Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E123ADD59
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 08:24:08 +0200 (CEST)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luqsJ-0007or-Ls
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 02:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqrZ-00076v-1I
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:23:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqrX-0004r0-Ia
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:23:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so8314265pjn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BiRmqcZNF2hJVvi+mtvT/dUtK5fKY7sdVO7TwBKWEiU=;
 b=XjIogWdxlN6IrObJ3JwUxA1EIFrPIGXC4Lo5sAdrBAQj8DqcqmfXZ2sZU4uCbpgzaC
 18wVHwI77OSn0UrBYWqg35nWw6P6TxpnFg6c+SalWPHGsMvzBiNWT0LmOMR4kG7+dLJV
 sRKMQDMyftFuYF7agYjC1Tp4xPcc9VjyQGtyZR4rMLnUvwwcX1Y6HiF95+IRpoKY/b03
 mnBKFH90Tu9s93Fo58/6v/G+sfvJESnJVHlwZMElK23nfrROT9wnpUsRlZizKRHx4nyF
 19IRnTmzF8nN31rCmxnv6ongU7q/kFlPHP1nJLpX9pg33fO2OUSPe27HNY3qt3bquanT
 /K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BiRmqcZNF2hJVvi+mtvT/dUtK5fKY7sdVO7TwBKWEiU=;
 b=rAPqiahwIpipMz5qmIvQkbEtCkjs4ykVEYCOQp4ZeMx/Hp2IETkZCoavWwV7B/yTC9
 wCw6R3ISJ8KypdjyzTAFPLd8uboq4Q36gAYj1UHvohf2yeGQsdL+bw9CRhLGwmAFyH8N
 +8E199ZRjcxAGNJURcEGwMW/C5vspfXMyOIN2dp+MSyBFoDH4RbM8GjxAj+iheEeECoa
 YTRl5RFNd3G6oSyhKfzfMLalk8vdM/k7kn7j2Opb4K0VtAz7BTubdKjIm29HxfX5k59B
 HEDdMfqysdSDZHDNQqwNWo3j/R0csEQzRFq7PoK/XgBYu4AwhgATiGmZsq31heDKy0S0
 k17Q==
X-Gm-Message-State: AOAM530UjA59bw8Le9lGYlGScisjKK6TsDdxa+eRfERCCSmYcaVoyg86
 7j9yQX2FeZcBfQKd9Fx/3RSm3DQDBeW+tg==
X-Google-Smtp-Source: ABdhPJy7PjWACwfIOLrv0oOo97HxaftU180KVrb9hlzTcWDxeTRByW5mlDayvhDsPXNegRBnrk7cNA==
X-Received: by 2002:a17:902:ce86:b029:121:e5b8:dfef with SMTP id
 f6-20020a170902ce86b0290121e5b8dfefmr3690654plg.66.1624170198408; 
 Sat, 19 Jun 2021 23:23:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h1sm14953305pji.14.2021.06.19.23.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 23:23:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Use cpu_breakpoint_test in breakpoint_handler
Date: Sat, 19 Jun 2021 23:23:17 -0700
Message-Id: <20210620062317.1399034-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
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


