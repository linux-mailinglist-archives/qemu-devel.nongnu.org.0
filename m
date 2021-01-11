Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1382F1EA9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:09:47 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2ZW-0004SZ-JA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RZ-0005z6-Ox
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:33 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RY-0006QQ-1h
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:33 -0500
Received: by mail-pf1-x42d.google.com with SMTP id h186so517400pfe.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7cb1wo+zig4w5wRyfLayVY9BN4eEXg6/tPvYTE+r/M=;
 b=nXwMW4Q9gwcedvGzBG/JeCMSXLQGMumCuHav6OoSOTfElFgD6ewT5f1YHRN25Fp06M
 PgwurTbe7eQ/8aTCQxmu8IEB0poaF1rC4fULY4Ye3CYufZBTmOQHe0LkEnAx7CAeVmUh
 6UkzPMFZGGq2USV74v77Pe7idqzBCWiuFbohsZELfWq2AFXkJYWZpW551UT6JyYY/+mw
 CdqAB6KbFt1wPNrmOYpDBiCHfTrzJoBSsBai6jmFYbX7QoNiuobgje+3dJEZola7Lu1g
 KlnEf4mYr6YbIHAxWzzzLASDrhSQVIICAykV3UeDEubkMnx6xNwdh6KQMonHI8qevHW5
 kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7cb1wo+zig4w5wRyfLayVY9BN4eEXg6/tPvYTE+r/M=;
 b=H4sSlFkLOOShvllR9sMiIGshm7weiPGJr7b6FHI9MzASdz1m/r6aD7+3Bbo+eMdIg0
 PC1acR1caAKhUw1KzNNJinAFoJk8N0boiEO9q++p/XXoh8+vv1wQJpS6GjF+2myII92C
 dyX2HRGHm2d0vgz54k3UjqgH/FrDemiHRDc9Ypc0nPVzOmJHKyVYICio4ieWnbv/hVAa
 Q6sFmin90DoCsT8QH1fi0TsxMDGQ+bMhqHuf/h8U9DP3hQTYUbP3K+i7H7Z44d2fmHdG
 wf1DbUvn+yKmaqdvfUsts1/BudrwodHkEPMHavM+EFRy2eusglk5W5HM0qvcP96FsMIs
 /+dg==
X-Gm-Message-State: AOAM531xrhWXMn2+Mtg459OLL6mSuj+fI0qijfSms8VTOgAKqdFfpIk0
 435ufcFAw1aCqP11aSC1I9AQPQtsRSUqGg==
X-Google-Smtp-Source: ABdhPJwRt/Psw0yU185psFnt8lgKOvQmrukRQOvQrtIeDyekmebSqnvnzxACDgs4iux2/eAwnIAWQw==
X-Received: by 2002:aa7:8d12:0:b029:1ae:4344:3b4f with SMTP id
 j18-20020aa78d120000b02901ae43443b4fmr780455pfe.16.1610391690404; 
 Mon, 11 Jan 2021 11:01:30 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Mon, 11 Jan 2021 09:00:51 -1000
Message-Id: <20210111190113.303726-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 43bcd21959..aa2f2d3a04 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3275,15 +3275,15 @@ typedef ARMCPU ArchCPU;
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
-FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
-FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
+FIELD(TBFLAG_ANY, AARCH64_STATE, 0, 1)
+FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)
+FIELD(TBFLAG_ANY, PSTATE__SS, 2, 1)      /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
+FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.25.1


