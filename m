Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B760546A51
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:24:50 +0200 (CEST)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhRJ-00047s-5F
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB9-0007so-Ql
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007IA-0f
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1284486wmr.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BR60oI3h871nOCOr4dCh8Pzb9rLWR/82EvqYiciX8fs=;
 b=MrbNmCcOzx69HefFdgoPvDhi5yFPc+07bDBf2RZ8Q6IkBxoDcXYpi9AhFVLBZcu/v0
 PxZH5O+aUDx39BO3t0Cw9OmqFbKn2tciWRXuVA9gaoLc1RMHRBUO76c0gg1Lb8tZT/1r
 Q8l3YMw7/F02vCyj89QHksNv5CVuUl/bj5SStDi7pq35md5GzqofgzMoc8aNJtE2H+4s
 BF8XZkj7FR0307Cydrxu8YpGYEyAvhaVrCCzMQuq6aFQvUSPCS6l6dD6Tiz181InyZ5z
 Yp1apNBD/NXrork01BPWkRHd7zvDSYYOwb9888QuDLiqjWZ947TBloF+0saUiNA9HmKY
 Kxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BR60oI3h871nOCOr4dCh8Pzb9rLWR/82EvqYiciX8fs=;
 b=U96jOEFnOT05KIhXNvokPK4bKgAtmMdb5BRJt7O1Hlnk6aICXrXIcsoq0qbDAbG6JF
 voyG2ajEQY2b2aAj9cWWUrh5oltvVMHvc/SbtrOSMddt091at8nsYnIzR3qRw9fAwze8
 U2JtjA28wcpnS/xSDDo4dQoHLx4WXZRRiIWg9a/5WoBk42JlDhY4pYXAXSVLu/9C4IpE
 O7MTMpUo1etCS1zZU+wjKTomEzPtupiPwce3bK6UT1570V2Q6y1M9DYYEXbfR8Pw8juf
 RAIlqkgHIQBXlByeIcbX5cjgQfU2ynd3BzR2TQ/QU4qN67edsIDKDR8b3oskF9MsFDhk
 40Gg==
X-Gm-Message-State: AOAM5331lz7rodpkU5sVs1WTuPYRWXDNjC2vvSYLQmT9nME93huCjKwR
 RTO3DhNfIBw3b8N3in1BhK6XahBcdm0Kgw==
X-Google-Smtp-Source: ABdhPJzUbFV7H99QcBtgqRm40bMI6XqsUSVHdBW3NwNek2+nus6z5D3ytVOJNVSXCXuhps21vzXuTQ==
X-Received: by 2002:a05:600c:322a:b0:39c:7ec0:fbfd with SMTP id
 r42-20020a05600c322a00b0039c7ec0fbfdmr524060wmp.20.1654877280685; 
 Fri, 10 Jun 2022 09:08:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] target/arm: Fix Secure PL1 tests in fp_exception_el
Date: Fri, 10 Jun 2022 17:07:33 +0100
Message-Id: <20220610160738.2230762-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We were using arm_is_secure and is_a64, which are
tests against the current EL, as opposed to
arm_el_is_aa64 and arm_is_secure_below_el3, which
can be applied to a different EL than current.
Consolidate the two tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2b2c1998fd1..b95aa534741 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10879,27 +10879,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
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
2.25.1


