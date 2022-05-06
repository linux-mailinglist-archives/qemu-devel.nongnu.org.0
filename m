Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB351DF07
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:21:34 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2a5-0005hp-Ce
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IW-00064t-FN
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:24 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:44720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IT-0003ww-K2
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:24 -0400
Received: by mail-oi1-x229.google.com with SMTP id m11so8277106oib.11
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=DDx14ellYOvEHSv1oirlyqCOE+oJ6npKUMD3D3hB4HJrM7dNBy93iuOxMW1gaXLQlO
 a5m4g9k2msCY3zKvN3MAjH44vUdM0OjU/lrwe3JHn6+dMKfp4rYPaEOvAfNJqI0Mc4v6
 hScR5ITkFz1o8pjvQyb+NnP80w9CmlhokSJs86O1HiIV/bEcyADzM2LTgLQCFQgYhiVy
 1x0HrnhnW9Ubb6zIB0LZ9r6ZQtI1vNKzPa6pl0/53aNY1pYSWbrB/nx36hYtMd45mbrx
 27xOBHpC2BBW9NZjomH2RrEm0UJU/2/L9GdeyansBVsv9+HeXBCN5crtyBMUfJf4HHEf
 Q+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43XuEEQaBW24fA/OpN/C0G+r/QXfL2oSSQvbYI2NnFc=;
 b=5Ns69ZKg/3oMm0MqrF0kjscVztOGWbnNtBsLPn8XOgFQ0W8J7NzBS25L62OJC5/eEj
 0uFGz6qmcR1rAEEdHyP3FbuFRxDT5jkO8eAK3UPTNd2voqYFQLFucVCE9tFRFeKqmM7k
 yHiCYJ4b/AX46A3Gzb84AyAgPg9CJM/En+Tr/PG9Hee2mQcI6Ym4Se+YdC4XQuCofrTY
 /VZa5DXIFYwTZZaPwYgjNH+H/TtZLiBQdYmBUGKsuq4eo1JYtZ0jJ2Kd4TwphjzeD9Nm
 Tg3TlJbg8XvuK4m99prmjevReK6whcI0NbTncoj4qHumxpS2WqDeYwIJwNEz3aEPIPi5
 gx6A==
X-Gm-Message-State: AOAM533S2h3D7UlaztrWhvrTr9HP26W5bRZfBO/IVhYFRDuMYhOOHW+v
 PZrYJ2X6odDmvui/bmbMgN+Z9MTuacRCN3HD
X-Google-Smtp-Source: ABdhPJxYipEW3J2Iw/i+UcwQCBodpd8I8W0mcZwiUE3mGg0MkDnm8cpIf7ETiAv3BAHShqR9SqoJDQ==
X-Received: by 2002:aca:3788:0:b0:326:89e4:6ecf with SMTP id
 e130-20020aca3788000000b0032689e46ecfmr2580220oia.74.1651860200173; 
 Fri, 06 May 2022 11:03:20 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 21/24] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Fri,  6 May 2022 13:02:39 -0500
Message-Id: <20220506180242.216785-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 9765ee3eaf..48522b8e1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -16,6 +16,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 07b44a62be..40f77defb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.34.1


