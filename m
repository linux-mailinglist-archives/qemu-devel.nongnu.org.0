Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821A6A4F6C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:03:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmUu-0007Hr-QH; Mon, 27 Feb 2023 18:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUs-0007GU-Hg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:30 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUq-0000x7-Qb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:30 -0500
Received: by mail-pl1-x644.google.com with SMTP id i5so6806809pla.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTNMbTWIUFHY2u2ZLT0n2ZG7eWfkLXxJ/1KtgwAcDkA=;
 b=ZuJeYqWbal2zL5DnD/CMt8Z35P5rWhp+TxLrguhhMxcRDK2W0z4TAQc7fwp8w4SOth
 /2JJ30WZ+oGX5F9rXiej4WD8g3U30ZwMvxA7lGdNvUxgEYX7nN8Cm5uXWl5TEqMvWDLm
 3yAWUpF6motFC4IT/IjaoqXMNZe40R2bY+06/907K6PhqVIbnqTMaQoTu8UR+ZWZPKJw
 0QvaXGFgI9DNAa7q9cu6cyUwvHUu2t3oOQggKZzXj4Qsi1F0JKsD4aWy+MSJQ5n7GGxA
 Yo6lDW3Rtyc9mQQGnOXeAYc7vdLSmWMGF7P2zUEcBYdJSOTOL+2m5NIU2wIxxfAfHgJM
 UD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTNMbTWIUFHY2u2ZLT0n2ZG7eWfkLXxJ/1KtgwAcDkA=;
 b=Wju45FmhJ+Bg9/ZebiK0UI7YUcAXrkcnEcDM9nRXNoXL5OYmin7aT4iYQlmmFGpfVp
 oI7qcoGlQyvkgOMavV4SpRViY6nBOE6U3lN+RUtJzWh/wg/pikvdzEQuj8YdDethuhw7
 3bD9soT/Fa+azvMJn9syW3vL9qYLIP5ZFppsqaAJ7Du9mkU57Uk+tuSsWEyJuuHMhngu
 mfvbFI/eFVNZo9jcuXQz1sECMpBLonp72KfQZDOa6UQKU/A6o/q/oVom/f8ub5TkCRXM
 cJdJ57xaSuKOtXf/mLD2m7i6wkBVPxJPotawkmpE9BZpMBROByts/A4ZuQp+aHAlhi9l
 vHQw==
X-Gm-Message-State: AO0yUKW/9YIrZhDl+e8/rrWdmbX52f5PcLarTQ7hEsDz7UoCep9VnI7E
 xsMF7959HKXcFK8GFY3HJtP7sTbiENY/pjGyx3wsnQ==
X-Google-Smtp-Source: AK7set9I/F+tJNtAe4m6kjwHN3MDDTEN9aoAEShEOXD1LiikJiYD4xCR5nLdK/RNsIeVDk5D2s0cSg==
X-Received: by 2002:a05:6a20:2445:b0:cc:f057:d3e2 with SMTP id
 t5-20020a056a20244500b000ccf057d3e2mr1161218pzc.9.1677538887548; 
 Mon, 27 Feb 2023 15:01:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 01/21] target/arm: Add isar_feature_aa64_rme
Date: Mon, 27 Feb 2023 13:01:02 -1000
Message-Id: <20230227230122.816702-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cb4e405f04..b046f96e4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2190,6 +2190,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -3808,6 +3809,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
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
index 0b333a749f..5092450e5b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1950,6 +1950,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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


