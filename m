Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F037450BE93
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:26:57 +0200 (CEST)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx3Z-0000Cf-1s
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX8-00017s-Ky
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX6-0007JA-W1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id k4so548309plk.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+4Qd4E9HIFHi1BwjZ85dNcwW/a/s3TNOGQFzvuAjJM=;
 b=R6u2YNiXH7uKu2XO3XB1AMkVEfkuEs2LjSMaLYGasD9rzeyCcZshhbSggVX/MPZ3x5
 rIrjmCPx3hiu2wqlHEkMuicmq/wNCppUzJ2WaXCV/X128RBlh50zbv1SVuXQ6OK5RGD+
 BKHpe+KwCNDfKDn3vI/efrWJo8i6VbmfbUPj1sn6II++X9rO31KmwsyNpHI12rug0E+t
 g1XcILSHzCAZ8k4G9LvC15W+5CvVxmoBa97sxQKLPotvbP2Z80d2lwLgdv4aP+U0Z/j2
 HOOKH6cEuhdH259pJnw+4mEjmvqwvFtTXHrTm/xEMc1q9WyDDLoS4gbac466/11ESleR
 Y3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+4Qd4E9HIFHi1BwjZ85dNcwW/a/s3TNOGQFzvuAjJM=;
 b=GJguet6/gjFq/6wdmJoCtJ1SxqZ4m7/tFhKlnDXmdVrd2G7fiM+UPoea4Sp0io28eJ
 8ciFRy0/1sB8BvZFbjj2OhUXRU07S4yCd0Gx2jB+v1Tb5s97DsNJORYGHbh3I6NwuMA4
 +nZDy4DGdr8cT1traZIwZtCKiDQLbkA4juxsYVWIYalJNqigZJwTKcd1PkQ9xZsgyL7a
 YvRIbvQjSY/mtLzy+D2Mao8PBFjxExXPNWWrShT1VAXLs/GN17Mu2jaMKbjjqjj9AQF3
 o4t/mS/K0Yu1BREpL3O1xzWn3h1YTsGmsvqv4tJ61eZzjoHhk+QT/Dr6HeziT5uXgDjD
 K+wQ==
X-Gm-Message-State: AOAM530FRObdCuxKtPoXVEEHPMWw2a1WUJKnj2kQ4kvCYFgnmfDZ+ThI
 eqROibl9YHTabibYj9IpVEQH0S16eev2bYQz
X-Google-Smtp-Source: ABdhPJzS/yA4t8/o/9ZmcCFcjN9/+ACWcGs7VZYfIeTTuZd1FRs3x4oVtJr0oJ9vqjeTN2zEbRRkLg==
X-Received: by 2002:a17:902:b586:b0:159:684:c522 with SMTP id
 a6-20020a170902b58600b001590684c522mr5447564pls.39.1650646403622; 
 Fri, 22 Apr 2022 09:53:23 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 24/68] target/nios2: Use hw/registerfields.h for CR_STATUS
 fields
Date: Fri, 22 Apr 2022 09:51:54 -0700
Message-Id: <20220422165238.1971496-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add all fields; retain the helper macros for single bit fields.
So far there are no uses of the multi-bit status fields.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-25-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 68ff8033b6..562dca8195 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 typedef struct CPUArchState CPUNios2State;
@@ -79,15 +80,24 @@ struct Nios2CPUClass {
 
 /* Control register aliases */
 #define CR_STATUS        0
-#define   CR_STATUS_PIE  (1 << 0)
-#define   CR_STATUS_U    (1 << 1)
-#define   CR_STATUS_EH   (1 << 2)
-#define   CR_STATUS_IH   (1 << 3)
-#define   CR_STATUS_IL   (63 << 4)
-#define   CR_STATUS_CRS  (63 << 10)
-#define   CR_STATUS_PRS  (63 << 16)
-#define   CR_STATUS_NMI  (1 << 22)
-#define   CR_STATUS_RSIE (1 << 23)
+
+FIELD(CR_STATUS, PIE, 0, 1)
+FIELD(CR_STATUS, U, 1, 1)
+FIELD(CR_STATUS, EH, 2, 1)
+FIELD(CR_STATUS, IH, 3, 1)
+FIELD(CR_STATUS, IL, 4, 6)
+FIELD(CR_STATUS, CRS, 10, 6)
+FIELD(CR_STATUS, PRS, 16, 6)
+FIELD(CR_STATUS, NMI, 22, 1)
+FIELD(CR_STATUS, RSIE, 23, 1)
+
+#define CR_STATUS_PIE    R_CR_STATUS_PIE_MASK
+#define CR_STATUS_U      R_CR_STATUS_U_MASK
+#define CR_STATUS_EH     R_CR_STATUS_EH_MASK
+#define CR_STATUS_IH     R_CR_STATUS_IH_MASK
+#define CR_STATUS_NMI    R_CR_STATUS_NMI_MASK
+#define CR_STATUS_RSIE   R_CR_STATUS_RSIE_MASK
+
 #define CR_ESTATUS       1
 #define CR_BSTATUS       2
 #define CR_IENABLE       3
-- 
2.34.1


