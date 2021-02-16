Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6931CE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:52:54 +0100 (CET)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3an-0004AG-Sa
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC336-0000FU-5x
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:04 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Q-0002Vz-Nu
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v14so13773324wro.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kge9xnDXTL8MeTEIkkz6WvzC7JslJeTbKDj4EWbFavE=;
 b=Ddk1ALn/OIWhJ247RN52WvZXbo4K0vTXI/PR0pGuGjpNm8uo2DtNe64+39fCkarbls
 1GyJvszrnUkIS1yNo3aLNsT3Xe4rZnSkbclyKQRxk8cheFsEWmYA51jJFtltJWQQzdlF
 BhI6hirSuXKl4hY8y5u2nJrEALj1gwYxZEnZyZqh0srnMKzaJ//nfxZL+VpV7Jru0UAW
 Cnylyhvsoy0SFWuUDCoSZc4DKXpJhyKAcOUfPHtl0S0su+pj8R06pGVe0QKcm6yYgy5p
 DCb1vIMCeVUHF4d92IN1Mko++Hq1ePpUY3WMPs0gGoCsD1HXmtououVfjw7SETG04yR8
 UejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kge9xnDXTL8MeTEIkkz6WvzC7JslJeTbKDj4EWbFavE=;
 b=ex3CMz5QuxayVVlWEKEqwYRCWwpFNYAdChQB6H/QYPzWVQ4M9pb1vN87C9VNb4ir8O
 RiOGZzPW2NmPDqw1UuDOZKsBQbyx30QQX1T1a3eLdj3UAXnpK/wk/SYG8sq+KoAjNWtV
 F0e/FpcHBAx5OIIXQ1zVbx/NRhNektZWshrij722+iqY5Ff7/JS+qxI/V7YILgNKT93+
 ffeafzMM6oAvlKEzrTtAlYc3yGEubu08rf5S98wCVgC8o8yfuKnX8WKGoUL2Prx2PZmd
 oNZKn8xh1dS9MLInj2OXQmY4Bu0uIJBkH1oscdvy+sA/UeYDXaQDfhmnG7xW+JARo2UV
 JqyQ==
X-Gm-Message-State: AOAM533/96BnaXKOfBDJPZH8LZ5NHNrexC+EQ2mPtDRMlsgyQjoTSTBQ
 16PHLPt/v8vFnWW79/cEO1ba0d7MSR4x2g==
X-Google-Smtp-Source: ABdhPJxVa+piDTQD9SqbLVv4StiX4EwF6WX0+1tPo7qmCSFfMoDiRWOduqixR82bvBOXaQqth6z3/g==
X-Received: by 2002:a05:6000:f:: with SMTP id
 h15mr24770412wrx.148.1613492241387; 
 Tue, 16 Feb 2021 08:17:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/40] target/arm: Enable MTE for user-only
Date: Tue, 16 Feb 2021 16:16:48 +0000
Message-Id: <20210216161658.29881-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 70cfcbc9181..b8bc89e71fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.20.1


