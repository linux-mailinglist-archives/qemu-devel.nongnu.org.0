Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4A69C955
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU460-0004Wd-Tc; Mon, 20 Feb 2023 06:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45n-0004VY-6L
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:23 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45l-0006Sf-Gy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id p8so876564wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7h6E11Jxo8IiawWK95L0Dw59rMSl1d8e8Ox3uSUoz/Q=;
 b=B0bPPjauP6+ElCVi5bWLWVfK/oaX4U0igbAE2EKOS2kOI1B0/MyWHM/DyMe20IyvUC
 FZgzufAdlItbQ9HAGuSJdHMIyfn7b/EDw5DNP+aDg31/jOkA+vNjMJtPEhRTBFLVXp7z
 yNeMeTHN0SmiR4NnTQuQEHNPSinYHpFQ7BA1DQ4FgTT1CgPjwRd7IWW+tVgYWTjqgO9I
 o+k1w0iMnNTFLSQ13QP6PYgIBR7EUL9yGykxmkhadeLXFdjIb05ewSLDgxBBomTMSYnC
 ObE2H98gw9zDhO7Po62Pi9/dvRH7IHmrSR79l3vm7Uqxjao3YvvcI3wRlMqWCO5FxMPk
 G7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7h6E11Jxo8IiawWK95L0Dw59rMSl1d8e8Ox3uSUoz/Q=;
 b=rWHCjesiNmqgQS0vT3jHGa4iJWoJdedeJ/EL5sxNzh3KA/Bd8XwJnVdiDNlgnoHlj/
 I4vYfcbwYxBD2mr5IrCDhCj9fE1xwSzO6pO7QSM5qAIPVKg+czYeVb/RVoJ/ccDqTvcF
 8c5/Ap1xIvM/w+lAnSQajMMB22/2vlHJ6Uq4rYlwpNKawKzK8B1M6np3bINUwDJ2QCj2
 RV7P6Azih9N9dFBLYKaQSIwQVfaeRMIM/+ILPfC48k3z0noiZN2CDfOdvAugTOPmdBeA
 JXlt51L0yFBC1TxSsxkmi6jv4adxVjLwCFeei945wqd4jwMIqU/vawB7M0yhLXQNttt3
 f0Jw==
X-Gm-Message-State: AO0yUKUwR7rhe4SE6JD8n4nBnxqr/+PVMhLvOar2N4d4hphqiOUDJvQl
 UpfgHCYUSLNO/5qax2XgaxKHqn6xaTyzpx+/g4o=
X-Google-Smtp-Source: AK7set+MWopFzrDcEQcyJOA1MZwTJWQTvwxsxJbIKP8De3Xc810zs2zks3o21Myb9L07HxUuuzZPnw==
X-Received: by 2002:a5d:44d2:0:b0:2c5:588f:c5c4 with SMTP id
 z18-20020a5d44d2000000b002c5588fc5c4mr2158549wrr.37.1676891539636; 
 Mon, 20 Feb 2023 03:12:19 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b002c573778432sm5046656wrr.102.2023.02.20.03.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:12:19 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 4/4] target/ppc: fix warning with clang-15
Date: Mon, 20 Feb 2023 12:12:15 +0100
Message-Id: <20230220111215.27471-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..5967ea07a9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached();
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.30.2


