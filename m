Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D6580577
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 22:24:07 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG4cY-0003Bh-MK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 16:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oG4a3-0000UU-RI; Mon, 25 Jul 2022 16:21:31 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oG4a2-0007dK-62; Mon, 25 Jul 2022 16:21:31 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10dc6e9f500so10264061fac.4; 
 Mon, 25 Jul 2022 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYz/I6nIClVYV4AmYNvgntkd6YLJfPXKU4TZ5PWIxJk=;
 b=icuIYFcByFrau07APZ8ZOFyoW6YTBEGniRLjfaZ0KHZSJhBsSepoLxliPzq+IqVaIa
 nTDuhGLCeDJwDzTPiserXdPDWAOgbdZHYVZQ1JiDhRZlCyemcmmzbkkxjAMuIlkd8MG6
 Y7NL7V1XqHlDm6lnJVjASDw+/t4GrnhKS+ucJLEAv9XU7dBWHVD+nKgwZFObiRG0isAC
 KYE6MBw5WVThi08+1vt5cxxfaDFuIA+5iwPuTG1bcQcouaXqibNOzQvv3eshkbuyB7QB
 EjquxvzcnC0WAZAU7rKdNDLo3mKgmrmh+S/Tc5zmMmOAwxe6TQ7hm6I9MfKKzVR0sI2X
 s4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYz/I6nIClVYV4AmYNvgntkd6YLJfPXKU4TZ5PWIxJk=;
 b=j8gyYzsjjXoD8joYvUmta4/XG9KENRrS+dCbQs0x2iPj1hYlTbcOamqj846sLnbVoT
 HSPrswI3YNnXbdu3d0sblrKo9IqQxRboLjHL42cvO3Iw3xbKoh0oHCthqwEKopiZdRLb
 Q+w3jbY0eIjXUv3XOpFaEBg138BxIMOHaRxeRPQBzv6pZTE4D20+ut87P65wra8w9gxh
 wGviQp53McZ527AfGK/VnYkICXYxj9M/kK2joJe24mI0r5l6+0dsM+FJJkJ3ugvTxxoS
 Fx7SGnTxVTcZiqUAQi+E+XrKDdNbROVUxThSYooM/i+wRIOuMrauMSsljDPl95yhDx3W
 Lnmw==
X-Gm-Message-State: AJIora/+MDnFzjisEvRm0C1JZDV9t2IGkS7ukbouDTm8fQJdsc1BJI97
 3szbxVG0kkI/mYM/hA8uxFBwOGJrDJ8=
X-Google-Smtp-Source: AGRyM1uoP7lkM5Qx7xM9ewGftcvHnbe9Gpu7fv52BcnvAA39rUxDLmchGNGvxE/VQA74sUEoP+9owg==
X-Received: by 2002:a05:6870:5896:b0:e6:6c21:3584 with SMTP id
 be22-20020a056870589600b000e66c213584mr7440389oab.220.1658780488505; 
 Mon, 25 Jul 2022 13:21:28 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a4ad0b0000000b0043577be222bsm5173669oor.22.2022.07.25.13.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 13:21:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2 1/1] target/ppc: fix unreachable code in do_ldst_quad()
Date: Mon, 25 Jul 2022 17:21:22 -0300
Message-Id: <20220725202122.1810709-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725202122.1810709-1-danielhb413@gmail.com>
References: <20220725202122.1810709-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
check privilege level") turned the following code unreachable:

if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
    /* lq and stq were privileged prior to V. 2.07 */
    REQUIRE_SV(ctx);

>>>     CID 1490757:  Control flow issues  (UNREACHABLE)
>>>     This code cannot be reached: "if (ctx->le_mode) {
    if (ctx->le_mode) {
        gen_align_no_le(ctx);
        return true;
    }
}

This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
always result in a 'return true' statement. In fact, all REQUIRE_*
macros for target/ppc/translate.c behave the same way: if a condition
isn't met, an exception is generated and a 'return' statement is issued.

The difference is that all other callers are using it in insns that are
not implemented in user mode. do_ldst_quad(), on the other hand, is user
mode compatible.

Fixes include wrapping these lines in "if !defined(CONFIG_USER_MODE)",
making it explicit that these lines are not user mode anymore. Another
fix would be, for example, to change REQUIRE_SV() to not issue a
'return' and check if we're running in privileged mode or not by hand,
but this would change all other callers of the macro that are using it
in an adequate manner.

The code that was in place before fc34e81acd51 was good enough, so let's
go back to that: open code the ctx->pr condition and fire the exception
if we're not privileged. The difference from the code back then to what
we're doing now is an 'unlikely' compiler hint to ctx->pr and the use of
gen_priv_opc() instead of gen_priv_exception().

Fixes: Coverity CID 1490757
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index db14d3bebc..a3ade4fe2b 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -79,8 +79,11 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
     REQUIRE_INSNS_FLAGS(ctx, 64BX);
 
     if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
-        /* lq and stq were privileged prior to V. 2.07 */
-        REQUIRE_SV(ctx);
+        if (unlikely(ctx->pr)) {
+            /* lq and stq were privileged prior to V. 2.07 */
+            gen_priv_opc(ctx);
+            return true;
+        }
 
         if (ctx->le_mode) {
             gen_align_no_le(ctx);
-- 
2.36.1


