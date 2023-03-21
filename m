Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBE6C2E3A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peYcv-0001VS-Tj; Tue, 21 Mar 2023 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peYcu-0001Uz-DV
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:49:56 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peYcs-0004Nh-Sy
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:49:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i5so10331426eda.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679392193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c9bpwthhF0dsabN6Li9aje0DlmpFhyF3ptVbHzSd1Rc=;
 b=r8Z3TWv84EHS1uGfrgP+/ci4/fQPZ1cw6Jo8u/pMNqrUlqGFKoyrFQyuw8RyIn2skE
 ruiiEu4XB7JJuXQjQTCVBWdqW9ObTQTIypea+peurLSngN9RAMrPbkBnImbuMY8vr1YZ
 jc2uv/m6LSA/MoeyCuRdhxsNhbeVJ2+vQXKBkVXsvr+cQHlEUwQNuEMEyPa/MdWB1ueV
 5xQDWQJbgcuTVF2t1VR8E/VTXrdcb8x/cthxIagF4YlU7PrhuY5QqF/1YpAtoveXFigM
 tnOcLcAgjOJmc2VigsWH3lDM5V3ZjuQFF3SUM/xet5HyGlIyLp0bz43IBAeRAf0u1FDa
 nE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679392193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c9bpwthhF0dsabN6Li9aje0DlmpFhyF3ptVbHzSd1Rc=;
 b=dGkmVfl9cVHfLIaTg/66X71kUp4RTvPzcV0If72zEk467hP+WNLHh+V+sJ8Ic/FrLX
 Jmr61ORm+Q0jCIfPVeBPxuxyAsKHGbMvTZvxVjAhhDN3oV4yP7iq+MZ/zAERoFOLwJmb
 9Q0/ymS7anSmsnyor8gqtAEpY74P+Vy/webj2Utkyv/WOkYCn/ptSj+l8QQeUR3106uo
 lYGgO0O47vMFuO2kYxI273dqt5I26WUjB6abUfHoDcQCyPnPozsVeghTbtDDCYOYpx3U
 va3bFJ4rw50muPuyHjPi3ta6YNImlEBsC9fBL+BmTQgt9t2HhP6gb7D85I1ijYBmxkhT
 QI9Q==
X-Gm-Message-State: AO0yUKWDyTlLP5fgw/IF0WiwKtQpbM6jtw1v7S7/IkGyVoMAV3jDNpmq
 i9HgwvUJHKr4G3EagpH6lmpwigjJYlpuqSpd9PghIQ==
X-Google-Smtp-Source: AK7set+TDmn6dctTm/e/+QpuLTxzpc0OnJgOMraHjoZGKENps30btWa+/hZSpfg0AhXWy3E+XsC4jA==
X-Received: by 2002:a17:906:344f:b0:8b1:75a0:e5c6 with SMTP id
 d15-20020a170906344f00b008b175a0e5c6mr2266994ejb.18.1679392193033; 
 Tue, 21 Mar 2023 02:49:53 -0700 (PDT)
Received: from localhost.localdomain
 (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr. [176.184.22.219])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a509b5b000000b00501dd53dbfbsm524192edj.75.2023.03.21.02.49.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Mar 2023 02:49:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.1] target/m68k/fpu_helper: Use FloatRelation enum to
 hold comparison result
Date: Tue, 21 Mar 2023 10:49:50 +0100
Message-Id: <20230321094950.43902-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

Use the FloatRelation enum to hold the comparison result (missed
in commit 71bfd65c5f "softfloat: Name compare relation enum").

Inspired-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 3a37d8f584..ab120b5f59 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -349,7 +349,7 @@ void HELPER(fsgldiv)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
     PREC_END();
 }
 
-static int float_comp_to_cc(int float_compare)
+static int float_comp_to_cc(FloatRelation float_compare)
 {
     switch (float_compare) {
     case float_relation_equal:
@@ -367,7 +367,7 @@ static int float_comp_to_cc(int float_compare)
 
 void HELPER(fcmp)(CPUM68KState *env, FPReg *val0, FPReg *val1)
 {
-    int float_compare;
+    FloatRelation float_compare;
 
     float_compare = floatx80_compare(val1->d, val0->d, &env->fp_status);
     env->fpsr = (env->fpsr & ~FPSR_CC_MASK) | float_comp_to_cc(float_compare);
-- 
2.38.1


