Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3553F46A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:22:26 +0200 (CEST)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPnV-0005RA-Ck
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGC-0007Vf-Mp
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:48:00 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGA-0000QH-MS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:48:00 -0400
Received: by mail-pf1-x434.google.com with SMTP id w21so14326498pfc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQ71nJahwuqq+z7DVE0+r1oElsGD+n7N1FiHPA9m6ck=;
 b=vAFIFBzfip9YbJuILHAJ+0Ll9RvT/j5oI5SOqM7O7iUGgrLjL0xZNYU0KPwQnajshS
 szox5ZfepniHVgen2HiepStLT589/WcYr2nmXLPWSjBVNby2XqulbdIyNMy/QMXa0pBm
 /aV3M2BcwDMz5T4yT9ijOTzG/sbi2gJ7wq1RIbi/0wmDer7//CscuYMqOx+HTJXCcZ29
 pBiGl8Fz2x+dD+UZr5p0r3JpLX0ZyqoPuAR91yC1bYNOR0bp3yVm+cygBcxPow3LGFH6
 EsEDJ/2v7S/KrBLRIw8uOdTunIcPj+XvdmQ1JF58KWrd1vo8bRfXU3rhvsVB6ZU4W+dm
 RNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQ71nJahwuqq+z7DVE0+r1oElsGD+n7N1FiHPA9m6ck=;
 b=HUdGi1DgR8IddvvYibyCubpLFoUSKxoOxS+lNex5HZ4sd3fIBP1nI2JOLwiozx/HLM
 tRlQ2GvVHGe6IBk9UwAqWIVn5u3TYGFkOQdiqqpzQkTGL6MnQtyDrKOtnYX1fFEo/9GC
 nbyCk9eV5qYy2n4g5zkzN2pVP54G/o25bcJKVncn7mJHEIBoe7SxnFexoI/Mm9Wgkj6f
 MIR31z99oj+IkuSuwmyyeW2EXhuzlrL/XaCVcA0Aw++cqITdKPGTLrQ6ZP8qIbdZe5on
 zcwdddXviQ/4L218tpqeJ6Kinl8zW6J495OEQ1XrEfhUS4EiOZCgUyaDwcRRykuBpBlm
 uShw==
X-Gm-Message-State: AOAM5304ZUXuXfJQQv4IvIBZVvKRrcOEM24kP9gTJeh/yneFfElBsiTl
 bq1HZP8Hhw9j2kte46Q7s7lWrs5F2IWyIw==
X-Google-Smtp-Source: ABdhPJwG0VAQber75eYEHf5mnjVIrNLk4WbWLydH1GMHmXGjYdCrQSMnAx9egrhV/Ww7w5VS8wTckQ==
X-Received: by 2002:a05:6a00:130e:b0:51b:c19c:44b0 with SMTP id
 j14-20020a056a00130e00b0051bc19c44b0mr27422448pfu.21.1654570077371; 
 Mon, 06 Jun 2022 19:47:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 25/25] target/arm: Fix Secure PL1 tests in fp_exception_el
Date: Mon,  6 Jun 2022 19:47:34 -0700
Message-Id: <20220607024734.541321-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We were using arm_is_secure and is_a64, which are
tests against the current EL, as opposed to
arm_el_is_aa64 and arm_is_secure_below_el3, which
can be applied to a different EL than current.
Consolidate the two tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index eeca1a5dc8..1d81a01c94 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13400,27 +13400,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         int fpen = FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN);
 
         switch (fpen) {
+        case 1:
+            if (cur_el != 0) {
+                break;
+            }
+            /* fall through */
         case 0:
         case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
+            /* Trap from Secure PL0 or PL1 to Secure PL1. */
+            if (!arm_el_is_aa64(env, 3)
+                && (cur_el == 3 || arm_is_secure_below_el3(env))) {
                 return 3;
             }
-            break;
-        case 1:
-            if (cur_el == 0) {
+            if (cur_el <= 1) {
                 return 1;
             }
             break;
-        case 3:
-            break;
         }
     }
 
-- 
2.34.1


