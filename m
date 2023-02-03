Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D10B6894C4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsxG-00065K-DU; Fri, 03 Feb 2023 05:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNsxE-00064T-AE
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:06:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNsxC-00084k-Mr
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:05:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id y1so4171493wru.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JIztgTFKNmYfw6eD33E2XqY06f9D3nI1NFOrxnPLPOA=;
 b=FvCSjkHfK4t9oEO5Ic9b/p6Ug5I0U25BAquq5L8AhswQqqUiDGx0kUd6uw7TsjBKVY
 LYSH5mfKMN8BQjrEQK3QcVQ8sveY3Kz7vlvdSZyELSjdCbRoELf/aB73cRuP0ugfcVMZ
 fuETkU8gmmcDyp2jhaVZAaZpjtWsQnQklEW1SNgaQ+XUd3SsvdN+B5JV8Dvy44qZLl0H
 qh39pwjrB+Fo4kpxrd4/xdgiK4rUTVt7FAJk7fZO51rOWWtQnW0XSaEeyAGazqXXHmsp
 7MOe9NwTZ4ky6Moj73pJEC8PlsN0rgruuay5ILfbE3GAwQ1xlqz9ZYDHOcsd0XgtixOC
 KHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JIztgTFKNmYfw6eD33E2XqY06f9D3nI1NFOrxnPLPOA=;
 b=II+Iuk7B1TrYqdNJXkifTAmrpih4TckA2rTnFBUQZfiMZwCYj7qdbXgwrrN/zOrutq
 xkeNcPg/vfD30+OtAWuR3sJ2CjVW7OM52Wr0E3Woc0O47CWY1gZVRh3HYTXssNCV5r45
 q3gKE9lRtXEzc3LBcOdI5HRo4dm5gX4WpqxaVmAE9Jb0FMgPBTBXYw0jHcVA/ysnTvwD
 oUR7qpvgsyrL9tPDxRE4Zqqxaj7+vIOrW0xqcLIY6Nzcdv0MAgvMJolNMUtDXZOzw/1X
 jsLejrcUdZ3FWwwnNg8+QR8aiLR+X1ndIRhsvX6uaLJdo0xfT1p3S/I90JyV/n4bwT43
 uM3w==
X-Gm-Message-State: AO0yUKXOKDYMSylxlneXeKNH3l2gRiLzPw/Kgtjl3If17kXyknLJLRmF
 taYQjEmiyTXCchArMqJZO8CWMA==
X-Google-Smtp-Source: AK7set9P15xpSXLNdh5nAL6m0xrTYbjBgZyuKTLiO0cW8129tG69qsWBhDk/8hiTLWDDCzNjNTyewA==
X-Received: by 2002:a5d:4389:0:b0:2c3:d719:4fb with SMTP id
 i9-20020a5d4389000000b002c3d71904fbmr1544879wrq.43.1675418756831; 
 Fri, 03 Feb 2023 02:05:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a5d4a81000000b002c3d67aac74sm980093wrq.88.2023.02.03.02.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 02:05:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF8E31FFB7;
 Fri,  3 Feb 2023 10:05:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
Date: Fri,  3 Feb 2023 10:05:51 +0000
Message-Id: <20230203100551.2445547-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Before this change booting a -cpu max,sve=off would trigger and
assert:

  qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_sm: Assertion `sm' failed.

when the guest attempts to write to SMCR which shouldn't even exist if
SVE has been turned off.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
 target/arm/cpu64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb..a38d43421a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 = t;
+
+    /* FEAT_SME requires SVE, so disable it if no SVE */
+    if (!value) {
+        t = cpu->isar.id_aa64pfr1;
+        t = FIELD_DP64(t, ID_AA64PFR1, SME, 0);
+        cpu->isar.id_aa64pfr1 = t;
+    }
 }
 
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
-- 
2.39.1


