Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D683D3D86
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:25:34 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xzR-0005KH-Rs
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvv-00008K-S4
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvr-0000lX-E3
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id e2so2962184wrq.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ACI532LNdXUXkP6ZLogSGJNZsbzdsfTkMdhJh+PsYgE=;
 b=R/0Fftc4OuG+6LGRRv1QsPli84hUDQxMqxbibcURt/PPTyiojlJe8/n4LJe2tMtXde
 2zkhE5azVv2EudV1syzBz5n4D6yQrghixe63AibGYDTDohKpcHzR24yzSzmEXmEKErt6
 NdiNDNJhGzEBCbRZ5TcCzqdd9amLnHm3dEGKVxjn4aEH34gEtNED0cu6VNTsj7hUh+7c
 kLoNqTH/Z0p1yYKM2jl/1+rCUEmv7LYyLRRJNRFexKsyxq4xS0X8wp4HP7O/9hecCubU
 khrY510pN9rLdr0jUwEvG5ZpdlDtNRZOHbv+MbeugYMzn2lu19rX4jZMmnyjM5bDf8/L
 ywYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACI532LNdXUXkP6ZLogSGJNZsbzdsfTkMdhJh+PsYgE=;
 b=bOPXmzdVHitMsacVvBaL8O6vdBZjtruOZbhwzpNIjlLqr0TkgqAgUvtyKyDGjkje7E
 dybOLaZRPEGQU7RbjgR+aHkFGE4imRRhhWYvDJPo1uv2P1z95Qw7ArTRACiX0JZPQlrT
 1S0gm8M1WCNQapPuwDZD7/1huBvLXcnSU/w2hdwaJL8+k910hgd69vMdy3sylm+ZZYS5
 BzigL3PGd1r8AtwSTNwimpwf8H6EEP9VosQUp4+SuFYYF3/DSkpdU8p3nRpUtIJ8vWuu
 Mvlw5/STR9GUxXDxhC/zApC0Z4JvXpP7wH2l13dKhAvWrhuf5nIB2mZBTR9VsRAR6PwA
 lyYQ==
X-Gm-Message-State: AOAM530TDxI8Y5n7Kk1rlPM9NR66I2j5t3PhcqU7ymx8Pt9bSpqaPMHy
 BNDVwPWe2ClcZElKFgNMKmSu3Fu/zwpxmQ==
X-Google-Smtp-Source: ABdhPJw396ib9ePD/p10QE3kj3p5kUCaeOfR7436zra85yEEEg8AXuVyvXdkHfxRP8ID/JKG7ewmSA==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr6048912wrs.323.1627057310098; 
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/6] target/arm: Add missing 'return's after calling
 v7m_exception_taken()
Date: Fri, 23 Jul 2021 17:21:42 +0100
Message-Id: <20210723162146.5167-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In do_v7m_exception_exit(), we perform various checks as part of
performing the exception return.  If one of these checks fails, the
architecture requires that we take an appropriate exception on the
existing stackframe.  We implement this by calling
v7m_exception_taken() to set up to take the new exception, and then
immediately returning from do_v7m_exception_exit() without proceeding
any further with the unstack-and-exception-return process.

In a couple of checks that are new in v8.1M, we forgot the "return"
statement, with the effect that if bad code in the guest tripped over
these checks we would set up to take a UsageFault exception but then
blunder on trying to also unstack and return from the original
exception, with the probable result that the guest would crash.

Add the missing return statements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f9a9cb466c9..f352346a964 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1554,6 +1554,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                         "stackframe: NSACR prevents clearing FPU registers\n");
                     v7m_exception_taken(cpu, excret, true, false);
+                    return;
                 } else if (!cpacr_pass) {
                     armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                             exc_secure);
@@ -1561,6 +1562,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                         "stackframe: CPACR prevents clearing FPU registers\n");
                     v7m_exception_taken(cpu, excret, true, false);
+                    return;
                 }
             }
             /* Clear s0..s15, FPSCR and VPR */
-- 
2.20.1


