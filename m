Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AD3D73A0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:49:51 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kek-0004KG-Mt
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd6-0001ed-Sv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd5-0004tK-CX
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id h14so6693678wrx.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HoBq1aQo4iI6sG2Sa5KrsXKpQ77T6s/8HBR1ZYMWwPo=;
 b=miPckZCZtAXo2+9iQTjMzNoz7vn2Jr1wP+erhUvgCATxy92gradgk7+RISUjhGYJk9
 RA68xJLkBBNB+jSB3K2/Tt7ydqHDVhxwowx2zwNKJWCAxDI1+RwLo30kg2KdpGAekPS6
 6QjnY7Sj/Z4ck/LYXMyOMnEiWj5XOic5iIAk9kNg0U1sbm77194bId6maCX1rWgXs4+S
 3920NcfUrsUlme0/pgDwhBHyWB+uhbB7QNEmTas367FwEwqQos95gzSCgPXOHsQY/tIV
 0molf89W3uPfGWB/YuYX5rhwK0Tw7cDuHI3Q4/hJRW2XiAXLfH2Vd/909u62wBArBHf3
 Hj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HoBq1aQo4iI6sG2Sa5KrsXKpQ77T6s/8HBR1ZYMWwPo=;
 b=QXGdAthnDigAPRFPZi7JQQ6UWDpW6XtSPh/lk4Jks3msU9IsXgRxTpqctWlNdUcCjE
 6wjQoC70MqRAn+MTCMfamYO+a1RqjLh7Yz30QDqi5V/mja4SJXwEseZavcLOUefwnswt
 VpKy9kdcFfmvKv/xxHhnNgwaQsoDhVkocRE3n+8fgHE+fjJzdpyTa+WEIyvS82e7ljaR
 QgYtZ6pqTSg9rfg6zwPLv6MXtCW+Zx5btB/yfFTj6PxsznMxvEUNC9ehAnX2tvwh39fm
 2GGbxnZmISycZoY4WJ0sNObZfhYtGf1fN1wQxtCMzO4lh7uBkCDbJR5j9Q/eb+HIoI+y
 M6rQ==
X-Gm-Message-State: AOAM530WxR5rfr/5Vu5YgBI6lyGNez/LBi+uBZZXvGyixKLGlluCVu/S
 r8KXqB08W5o0fLdjejWT+V7Ae+mkRlgHpA==
X-Google-Smtp-Source: ABdhPJxERCSpRiTJ7LhaYePEW5Z/BrR1/ZYsdjuluopRdARLuK4+/m9NCyKw0N41EyPAn1T7sk2xvQ==
X-Received: by 2002:adf:f789:: with SMTP id q9mr8499270wrp.380.1627382886136; 
 Tue, 27 Jul 2021 03:48:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] target/arm: Add missing 'return's after calling
 v7m_exception_taken()
Date: Tue, 27 Jul 2021 11:47:51 +0100
Message-Id: <20210727104801.29728-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-3-peter.maydell@linaro.org
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


