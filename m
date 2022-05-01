Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B7516246
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:44:59 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3KE-0003LN-Gd
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-00072H-Lp
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U4-0001Pr-Qy
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:07 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e24so10351328pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLmL8OHUPXIjo0sXAU8FjVln9l2ooq2J7ROpHXXZtis=;
 b=aRyFtQqnrJwkTfdumlf2aIP22ZbTQ6UdyAedj3ff7clHfnu3Y/xgxR9OODXH0IsKu5
 Akdvs/L2pudrastpqibBlXi9FB8yu2iAZzdVyGN+slj6Z157Kq0NcMMP6ZiUe1l+49kl
 4YBMs+ghtv4ckHPZkYYU+nwwcOodnFurakoissllOiGf88T6gQOgccqSve+MssB/Paem
 PSg7W8z2V/gjY6k4Bhs6HMWyJ7LpXFPJioW8/DGLBOTapF7dZ18CUgV+SCTW1Dtmd3+M
 9SSbb6o3x2IzJwLJ5tfJ4UzaQ9BP6Zh5jjr/BeDDMKcEn6sGkaHmyrcT6Bqn0s22PVV4
 eHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLmL8OHUPXIjo0sXAU8FjVln9l2ooq2J7ROpHXXZtis=;
 b=L8qQRsfatY6ExenbAi3aHZvdE0NJmjQYCg1canPBoEst/KL2oNv2F9MuOaf4tVzvUy
 CnLpZBszVpF8w0kz9iitAAEQJN22q4HW9IvnlXri0UDvXFdh842jA/pwWv+8+pRO5Use
 4MOT9LdiGTRJgKSvw2OnldDvfVBs3J3/BBarisRYXK6ZGcKxTcQHUFcLfiY8p5RWGDR/
 gFlF7/iAjZ2v7gyNvy9sMHMKZR5lk4Z/U0zCI5VddR+kvpcuLG04wDs0u2pPt48kz9sA
 XamfnWDfv+BzakXLrMTlKETjVMw+Dy5TQ62Q1728alccQXPorpOoy7h74zRx3/zSwWya
 tlZg==
X-Gm-Message-State: AOAM531A4fEWV84hnJ6CJwWVW5DLHdv9wlCMIf99Yiu04/3OFvYK/sLD
 ajZaalVzHh8PVpFWRMykO7uckn8+vS4Fqg==
X-Google-Smtp-Source: ABdhPJwuoWowyC2tn9/9nqLxuM6kgsDJvlc4zYuIfrHOTPydPpQLC/x/GLlWYwnYsu/5jZPILUXXfw==
X-Received: by 2002:a17:90b:4d0c:b0:1d9:aee3:fac1 with SMTP id
 mw12-20020a17090b4d0c00b001d9aee3fac1mr12283101pjb.15.1651384261966; 
 Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/45] target/arm: Add isar_feature_{aa64,any}_ras
Date: Sat, 30 Apr 2022 22:50:15 -0700
Message-Id: <20220501055028.646596-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7303103016..ca01f909a8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3886,6 +3886,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4108,6 +4113,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.34.1


