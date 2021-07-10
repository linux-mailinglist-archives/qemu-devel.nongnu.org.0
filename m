Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0F3C3553
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:47:21 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FCK-00043h-3c
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exf-00068p-5L
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:11 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exd-0002Sb-FZ
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id y4so11668098pfi.9
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROJxUKF4ozP3LXQH8wzMsHzOmSKxOrW0h+5+6kQNd1M=;
 b=GbmokYcDXH1HsCZjsZgkZtZBnrctaHdRaChjMnZpsmuNAz/HTCjkgfqbGo27cLiDSK
 NsYLojUaiR+28S2UPP96TEI8Al4WHp2/45mJ77RLhNsbr42zvUyLlN562HDsPoncaPH0
 LvHNWDdKakUO5ea9abK+wuOCX4Vbqln451YVTmy5UmdGiTDswbEqcmx7lxUDplC0W6Vc
 bBw8VU14vzkldrmcYBvj+ZYXO6mNN9EO924bXTjDmGKoGy6AMkmfayK4MGzWbEuIdVJZ
 r6Y/RVZzHr6wwAplHKGa70s93VDDj+yrOenx2DlaEYO9tavakLUEanQ4xNS0qYeio1ym
 Z3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROJxUKF4ozP3LXQH8wzMsHzOmSKxOrW0h+5+6kQNd1M=;
 b=BeozLPOV7xjTLFN1dLduyvs3o4zKilxotGs8Dni10FbO5ltq9OKNdhEGjh2mJ2MaE2
 Nm+M3ji6xT4w8ZifmBpmB/aWjvGQ9kHcHeDOHht1i836N9pxY2Sdg9PeZ8A16iUYpMyf
 4o8X/r62FFaJJGtLkJIrVy3bFKbbjktQcXDm6k/sK2JbBqWSGtBch8bE4Ff7HQGv1Hij
 Sf3V784hz9tvNUJmURFmAoRF9gjGMIb0y5bmWR7kkGQxgad88cXIb2Cf8QA3nbq51wcr
 M8Pi0w478F0dESwVfkVF2LYE9DnqoIX3b528iV4YZ2/oDbz/bMSjfo2cfNrzMlICcpwb
 xtTQ==
X-Gm-Message-State: AOAM5338hX959sFr1u14BSmnIB4P5Gz6t0AZkEQLhNVwiFhqQla/0Gep
 FnSND6KwjLs8N5th0EGQxiHAc+kh832PDw==
X-Google-Smtp-Source: ABdhPJyQeJLJJCYj247OU72GhW/d07Q8AyqCjWhm08XCaDQYPJziIwgWgy7WOAP9b1V0RKis6+CqMg==
X-Received: by 2002:a65:4289:: with SMTP id j9mr12601186pgp.256.1625931128308; 
 Sat, 10 Jul 2021 08:32:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/41] target/i386: Use cpu_breakpoint_test in
 breakpoint_handler
Date: Sat, 10 Jul 2021 08:31:37 -0700
Message-Id: <20210710153143.1320521-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The loop is performing a simple boolean test for the existence
of a BP_CPU breakpoint at EIP.  Plus it gets the iteration wrong,
if we happen to have a BP_GDB breakpoint at the same address.

We have a function for this: cpu_breakpoint_test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210620062317.1399034-1-richard.henderson@linaro.org>
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


