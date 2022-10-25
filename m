Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150360D1EF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:50:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyP-0005cT-Q7; Tue, 25 Oct 2022 12:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyI-0005Og-MH
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyE-0001OR-1H
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id z14so8565379wrn.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ppG/EzB7l5bDKZ2NX6MJRQhjOOzL6dQ8KubnemNVd/Y=;
 b=DK8N6ZXSKIcjtIvkiENAftifoYD5iiqrKJDoSrY2E68GMr9Dh42isgEbeUYilx3Fmq
 RF+u5WN07I3NlTjkvsfG3zYfSi0+O06jQ6pJWquo6MyqzZ2IHhbI4C6p6rl3JATllKJ+
 faA8sQ8iU0SCM95aJVHqfSBzdlvIA96SU84dnBoC6p54hu/5g5Wi9toDxM7CeTgvWk8s
 pZeKpocoFWFDolWHVB5u5pOBy8Fb+Tbzp09nc9tGSZvq6iuGcPpIFgGPMzzCQVPGsDRC
 wDqAHfvdfKtjEDzRBQavTcb4BITnxjjLhNhqA/DinAa8BvBlMkaQDiGc+rx1P+B7sbjP
 lAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppG/EzB7l5bDKZ2NX6MJRQhjOOzL6dQ8KubnemNVd/Y=;
 b=NO1Oi8AC1Ir5zxY0r6eDTlUYo8BSF1+EG/oXWpCQcV+X8bKeERzqKlYT1OOwcE/4xf
 M9rIKgTgm7Fivwc5J3YYSqUmWlarh5BgOF02VWqrVTn+zNALR1bAQdRU6smFphxrQ8A9
 19OSlktShaAoUSInBc5LWNA3Bz1Eyi6+4kYD6LDFZVUtX0kyKP1f2nzkJ1HWBF34omKQ
 B9q3Z0xxinz5ZyErL88pWWRdcMyUqXdeBAv5dPUsjnE5EFMQnwJL5DAHu3hwfXLS4BB1
 pv2Dr7mF0jpgnXrk5NGxpR04iELKUfZsjEpzEnrGsk8Ufcjd7RxhraUEh9F8cQwR0L7w
 10Ig==
X-Gm-Message-State: ACrzQf2RzP9cs9gvJAj5EQeahXPVJIzQ/FZ73/FiWU9wSdfPDIWFrcbe
 nk4apsvaB5HDwyzhIURfvnmiQ8KfYb6X5A==
X-Google-Smtp-Source: AMsMyM6MyXU/0c5AT8FzV6rkajX2okhs4M4JCF5ZI+LG0dMA2c9IU55pQ98LuE3b/rz7ySyhWT42Mw==
X-Received: by 2002:a5d:61c9:0:b0:236:781a:8d7e with SMTP id
 q9-20020a5d61c9000000b00236781a8d7emr6194561wrv.576.1666716005317; 
 Tue, 25 Oct 2022 09:40:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Tue, 25 Oct 2022 17:39:31 +0100
Message-Id: <20221025163952.4131046-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221024051851.3074715-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f8c59858063..592b4ffbad4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4144,6 +4144,16 @@ static inline bool isar_feature_aa64_e0pd(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, E0PD) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.25.1


