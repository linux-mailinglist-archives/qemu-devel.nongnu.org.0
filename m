Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FEF69D714
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYO-0003hQ-UQ; Mon, 20 Feb 2023 18:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYL-0003fc-Tu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:37 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYK-0000IO-Bs
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:37 -0500
Received: by mail-pj1-x1041.google.com with SMTP id g14so2820759pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Qu5gxD3YQ1g3NpmrFTN+XCbNU1pC9zMqzEJSxEiZBE=;
 b=EKXdduJeENkKGmYARPZuvL7nQxI2Igm3uWPxBmFsncScgp1LYpRiQvYefGiokIeWv9
 VJiqZ2J1057wvZTcK9Wff9gKkILwnI6eoIcSg5rUYys6wGUImYnfCZzm6cvICMT32ogE
 8WV6zKCfXKrm/PdPiMw0+ypn9Qi3ZxzFcpSdMO7BcNpgUbij4PMIWxC81tsdp2mVBfIe
 ARHw83iUwVNO2FXYicNeoR2/X68BDhgBpjuqkQVolv8PIOA9KN+hA9V+maoDh8P9lEO5
 iBV3GUhrzGsxDK05drysVBP64AiDCmjGaavFadgxb6o/8NGN0lMyZf0TG+69g0s2S9d6
 NCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Qu5gxD3YQ1g3NpmrFTN+XCbNU1pC9zMqzEJSxEiZBE=;
 b=He+/Q5wzPJ2uetH8xbOXRaURrJFYoxsxOYjBlq506sBdAn3ug3ck/Lr6ZKKdFuBr8S
 8YzO7+ad35CwL2DTwImApMrdJztiMqgmpDRFOJ2RYP1fyTxNurG0tZDzA6YJ5QhTUZJl
 rrKcWwPMT1oKI/p7fMXuJ/THdTosjzCBTzyz/aju0zFsu3w8g5rSLFIW6eSiUzEMPXD1
 61D6g0+5g2M26hy2Pr6RR7T5rFvWriFR3uK5OvpA+ErcV8dINfPvOL/3uEwEKvsaFjgd
 wpJD5M0WABWlPO5BFrVYaCB1etIfMw43tvhqbmsk4x05UxB2GNw/uzitT+eV8wSH+LTm
 oG0g==
X-Gm-Message-State: AO0yUKXTxUd3gnlWrnwSe4YgtMrW/Y9+eaXVV91y8UbR1OIGdaLrr7Cz
 DvU2YnXrBlimEeQ2NWIVWsRxZoQLiZ7rdFsqjLweJw==
X-Google-Smtp-Source: AK7set9DRSjdDSOH/ubTtnj3ZWh/l/LM/Fed+a0gXsvyWOJJR2VSCb/44EF3F4bp835JuxcLhITk3w==
X-Received: by 2002:a17:902:cf46:b0:199:1682:9175 with SMTP id
 e6-20020a170902cf4600b0019916829175mr3264866plg.8.1676935594414; 
 Mon, 20 Feb 2023 15:26:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/21] target/arm: Add isar_feature_aa64_rme
Date: Mon, 20 Feb 2023 13:26:07 -1000
Message-Id: <20230220232626.429947-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..04f000cc54 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2190,6 +2190,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -3802,6 +3803,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..83685ed247 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1947,6 +1947,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1


