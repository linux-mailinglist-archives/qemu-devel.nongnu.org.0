Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DD362C3A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:05:31 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYSo-00057P-CU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNF-0005Wy-3Q
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:45 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNC-0005j4-H5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:44 -0400
Received: by mail-pg1-x531.google.com with SMTP id j7so10810932pgi.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i8izMTvg3e0bJXY5dkxCzGZga98HxaSuFHI21G+m4Dk=;
 b=rGBumnDmD5WfVGnMfu2kMXWc5jGetCBkH3qLmGghWP/HfDkGqGFhBn9y6ys7NPBix4
 2e5s+Kveo9UrJdvhDbyEIrojtMrr+u5ZYmXy/1dSP9+kM1j5mMTAwFPW4uCMD9jChi1K
 wkwmeaP7x3Nyrg0qGb1kW79wq35A8I3Y2BNa63E6JFbpBP1Fbi0iaQDF0oCLMoD/bWa2
 ykzz/klGxUJY3IX+EWezRT5RVAoTVMqTSh/aXWZO8nhbAZo7C5PgCCxsrWhjj3fOE2cb
 l+GtrzU7uwhtMxkbTHEo681yos7QaW0iAMO1yOF/MaWOr4lVeVIfMidxvBvMbnVBvHm5
 aopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i8izMTvg3e0bJXY5dkxCzGZga98HxaSuFHI21G+m4Dk=;
 b=aW5gbt24jN0g13GjTIytUTKyWq6GpBsfekudiqghxYGmnJ9dTrc3Dy44RioROVfX/L
 N1C/xiMDChB6mlKzyVXqmfMKNx/55WqPxHHGImrNxjqMDcxcsFjS20dMc82mAoFLwRNo
 SQSxzp513pIcQ9cp61iMmg8wEiYIcqM8g+93jYwXRrOwaXBSY9NngziSxiMmsOqiwfS/
 wF+y6jr5YneGMHUU50kCivbaFSuw7YrEUa494IOd5eZEatwRQbOrCdae+NpeDLzmW7eh
 Ah973+OO9Ccx7vV9tPF5hPm986gQQnm+GzEq472691ep/i/FEwNvFLdJWZ4Xq6UusjKf
 DOcQ==
X-Gm-Message-State: AOAM530QvJ9vZXVKY/i4go9VBZdwrPwnm0uKlip7ciI6miIBpp44rGR+
 Q2pUna9RUEsoxwuQHPuBdtn2uLIHTJGIZg==
X-Google-Smtp-Source: ABdhPJxdbHGh7B5kOjFlN+91F/pNjycaiGKiCeU6sFa9Pw+CcrDiTwjRBbD46/3JSEeAH/zzDORf0w==
X-Received: by 2002:a62:2aca:0:b029:23e:1c40:4d1a with SMTP id
 q193-20020a622aca0000b029023e1c404d1amr9970921pfq.60.1618617581320; 
 Fri, 16 Apr 2021 16:59:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
Date: Fri, 16 Apr 2021 16:59:28 -0700
Message-Id: <20210416235928.1631788-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 3 +++
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 379f90fab8..db4f48edcf 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -660,6 +660,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
@@ -707,6 +708,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
         t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
@@ -730,6 +732,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 046e476f65..b2463cf109 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
         cpu->isar.id_isar6 = t;
 
         t = cpu->isar.mvfr1;
-- 
2.25.1


