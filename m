Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83C5B88D9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:10:41 +0200 (CEST)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSA4-0000Ua-Ai
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwg-0000jo-Mp
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwX-00008N-UU
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id c11so25277354wrp.11
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bjUDZtR1TEqJoK1ajVIqvV6K5hZ6P+TSty5uBuxcqTk=;
 b=U8dUPC2tbC6DSycDksnWUdvwscrMBO1nfqhj6F0PMpeJPyv4QtQBMBbqWiVM38GSEy
 uEzjpeZHMpZ9HHT5RLoil8y0ReJvpyHjiNyydSLK7jO3MndeL8WFKnJ/ob0dHGayo1YT
 snSysGA/wY99UE16zLNRURdXrC+LImIrd3dRM2ofFauXIgAAo8tTRHyqtaYEUziymqTw
 MA2UEgoVp4Np6v4km43VaMw31lG8LMB4doi8EXIg4F7DxbyR1LJRkPQ3pP2IxW8JBwKc
 6QR5nZrgRZJCKaARDLDwgoHl8YRplt57nJPMAd1YUa+dSOwHwfPmG3bEoMsXyobGhoo4
 TzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bjUDZtR1TEqJoK1ajVIqvV6K5hZ6P+TSty5uBuxcqTk=;
 b=tHUzom+DzLNfRoK0pLfeWQ89pe+84Ftku5HozISDP0h9K/mItWkPhtJvFdJmaEfqVv
 sHnDQjAP1pIfHZB+49IhWA02J1gmBHYLOGiyYbSE9bRzaPHYUTWBgbUuoQlvM6ziV8ZW
 j1kpHhLUKHi8fEVFsYNYj+494nbWErBYAaGt7wTUrKfGwwKTBp0uuUSdXWeEqQg+AvtK
 2KKNb9vBMf7F0T41KyhqndI0b+7NkGDV0TF8fYUDPp19ZbTZkmrluZLS2mTLVx1BWoP4
 JwLEOjQ/shvpqH7Ex0SVMryxp4v5CsfeXb9MSECcun4ZjWp8Ix6nmHfsOxDYQCt8vXRM
 SM3g==
X-Gm-Message-State: ACgBeo1iceRtnUNajCz6m06tsU2mB1Qsf8CUqTkVuKycY8U9iOWo4W1K
 c04uAUFqRvkq2tKTSmcmwf54y1uM7Y7EedwJ
X-Google-Smtp-Source: AA6agR5jxV2QTemXKmmeGp+X1rt2j/pzGn2VzG1Y+CgcTYFMKfcdq8+w+DzWFkoh73XIQC03MLGbAw==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id
 bp29-20020a5d5a9d000000b002252783d6f1mr21874077wrb.385.1663156356355; 
 Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/20] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Date: Wed, 14 Sep 2022 12:52:15 +0100
Message-Id: <20220914115217.117532-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
compliant PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-11-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 811358fd0a..be7bbffe59 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -53,6 +53,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ac5e197a7..e6314e86d2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1152,7 +1152,7 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b714c61d94..98b5ba2160 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -85,7 +85,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = cpu->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.34.1


