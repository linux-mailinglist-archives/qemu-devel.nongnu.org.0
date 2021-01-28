Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC43081A4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:02:59 +0100 (CET)
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GJW-0000nd-FF
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzi-0005sp-8q
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:30 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzV-0008DQ-CC
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:29 -0500
Received: by mail-pf1-x436.google.com with SMTP id u67so4978525pfb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsOKcDUplvtLSbcNJIP2P755UqI2zdVfdSuDuGF2xEE=;
 b=SoYV/8NvIGwNVvuNoKoctGOzHM2oKid0ZV5yGKF4C3eH01nkaVBMrFmhNm4p02SQTP
 WMINpMYofGGZbqaNiChS5rRo+VHvrDt/ap+m1XqXPua9b9YUIROys8uiSYlQkEgPQIcl
 /GrjDR9S7dqSIIFWWmGnEZcrhcxnzrTd9fHNnex99ov3ddpSyuuRFS7O7oNP54zKp4TC
 374ur/0w+rGRwE4O5ioF86OBQzEP0wvBiIISPT81k0dD/1qJae4scQBohcMBEOcpw5Mz
 nTijqRtZWevjD05/6hpP5CB5JO3SxoKpwNGQ1ExdY3AfU7nZc6Nxdd2ndRS+xH267CeU
 tw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsOKcDUplvtLSbcNJIP2P755UqI2zdVfdSuDuGF2xEE=;
 b=iEOJjtXRfiI/xf3fBtE9PceCp31mG+j01PU9tV8pDkNRbKCmH7wRAyBMzmm55P9h3W
 fVGY/deOz30QOY8dn5iRW6UmfwhD0AhreKn/e092Uacvx11/IJQqVQr2p3Sv9g91fmFZ
 760mPwjM/NvYja2XEoDP99B1Bg47lhE9IvCR+pYkBkDQj48L9ObWYiyg+hXbQI9Y5h8X
 AaLLhzablm2N7v9Pz3dfjIL0v4z1SUDkkaKxWa46mKJYeWHnepMnqX1/U+EKMRfCoVKZ
 mlj7b7qCAjIuOnffj5xB4yrKgXd1NB8ThA/I9HEc9PoqXJT3UVoaIdFi9/idYts9i4z0
 QkYw==
X-Gm-Message-State: AOAM532yTZiGnOI1+myIMAqGXGx0Z2nIzkeV8u25N+1zx1dspCP8Dbxt
 HfS7QtX8EZvvUU1MCw9XgjA3NS9EmTJdORIm
X-Google-Smtp-Source: ABdhPJzvdEN5AXX01Swn4sGNDQLdFiMbq8Z014kjMSewWPzdS0iDMPUWN4mHEkZ4gGH2GwpPmqxdXA==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr1630427pgo.181.1611873736001;
 Thu, 28 Jan 2021 14:42:16 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/23] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Thu, 28 Jan 2021 12:41:37 -1000
Message-Id: <20210128224141.638790-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66..b6a2e65593 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1


