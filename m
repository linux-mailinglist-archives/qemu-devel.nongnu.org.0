Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CD332EB2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:08:18 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhiL-0004HH-NA
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8Q-0000kj-6s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:02 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:46172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf88-0002ti-4Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:01 -0500
Received: by mail-ot1-x32f.google.com with SMTP id r24so6275477otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KA40eVLdhdRfN2JR4MJ3Si1YCqVpEUGM3POPrQ47iFo=;
 b=qD0MOHKOp6bP/YsVj8koY8qGBD0BmVEgkJhNjcO5ZVl5Y0EQ6Ec5Fx1l1/F3IeTNYr
 X+7gf+PIU1/HXjQQF8lFgVqK6sTr16j6sSMiuDV++Y2hpGULonPr51y19Rs0UIlXMNuB
 mT23KnHS291zDdY/HRY/P/mJvxO9964oFu54YSUEUdZY2lCgKDjRBiAGTUDiIkl1YhqV
 LDl7OwAI4WglzV8CxDML4EfMjzvx8r51VqY7+xHM7Suc9t8aONa/ApxVK/Mn3bmcJ5rI
 0ia9MA22gHEijhojbrq3PtVohgmurbPWpCRHmMnQLn7FpxmO8sL3d+S5/xaWvM4GcGE2
 y/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KA40eVLdhdRfN2JR4MJ3Si1YCqVpEUGM3POPrQ47iFo=;
 b=VRvxIK8G0z3EtRhqpO21HjA3DT8BQJPWc0v3XKNvLvi5lbJwYj2ZEHAbapVO3ohjIg
 CrFbNX6hUOafX0UP301RQ/xwL9RVxwTK4Dy5buHH8sfXzsSAQMwqgw9TKNAqDVBHax9T
 BOmX7GNEOb1Dh5/4BZuJGDG/nmMYWS5hsMh90CR1OZxodXTHmXSlDz5rewc1VTvRIXYY
 wwfeVu7SpIJEGr6/OlCaMElvw9a4yqw+3qU20tfTnTUACqN1r+EDuDGa3bDH0LIqxYZH
 N7Y+EaQXZM7YhvMHJpZlEGz/iOqkpSQzl+ZvR8mHSRH81PGcgW1UiBPlWU3ijdccIe6N
 bpag==
X-Gm-Message-State: AOAM531ejOg2HHfx7Z9xnN4OjjnvJFfXcMWmNVv8oedqwZ9cS7iG2G7K
 084ZeZWY/+hUMO7kdtosVgyKFyGreqaCm+2v
X-Google-Smtp-Source: ABdhPJzhsOr09RZlqb1kFoXoEPRxSR6EgTzZJnc2KU3WgQ/nDQrpbjXihw/Dv5A8Tuicu/IbIPhrVg==
X-Received: by 2002:a9d:7513:: with SMTP id r19mr9976102otk.85.1615306962934; 
 Tue, 09 Mar 2021 08:22:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 78/78] target/arm: Enable SVE2 and some extensions
Date: Tue,  9 Mar 2021 08:20:41 -0800
Message-Id: <20210309162041.23124-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..b717b096c3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -702,6 +702,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-- 
2.25.1


