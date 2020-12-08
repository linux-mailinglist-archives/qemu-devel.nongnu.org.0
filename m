Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B02D3276
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:57:25 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiAu-0005JB-4G
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWy-0005JZ-3y
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:09 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWr-0007w4-7D
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:07 -0500
Received: by mail-wr1-x443.google.com with SMTP id r7so5963126wrc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwadCJ02g06YVmm9WBr3OA6H8xYCnuJ8Eyeb77/KvE4=;
 b=BUc1NOklc4kh6Uy7ShIfNvT/fw/u2Py0Iw8IgOwo9zwtWmwbdakX+ntiGZSfl4k8Jm
 xXnefgnV9y4SdEygu6Z2pZ6BKzhvZzLer/7lCTe6TaGvSlCj6EHrbexMEG3cD4EaOtKY
 zGWZtf7ErHf6GuzmmCr8OwpGQbtaRReBb+7d++b0cdgfvV8267RG3Bv2J39X3MZrep2F
 MNQMymlZ2LlJXr2FHcsMDsga2IBdskWsjk9NkCN4xs7Z+nrpRdMJfywNU3iPOVS+4KfX
 bile6e7e8ZtcxpmIAu3vGQazR1v33+Iy+CSWDtnaAeCnuc5QXtTUx4x0jS7KR4v5ouo1
 q2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwadCJ02g06YVmm9WBr3OA6H8xYCnuJ8Eyeb77/KvE4=;
 b=IyORiSCrci/RA5SaLTifWBhfgrDvvwaFOWdHKDjSYDlDVMZohcHTpj5GcUIBqpzKe1
 Ofw34D6NP/HKxCztLir8pfK5+cP60JbKs9iEXvQ5hlkTSI8KdlIDppVowqmryUbHj3cl
 Zn7s50xOovT8FzNtfgux63GyFhKVlXxNvJJzq0V9fCKuLbO2Jl8KsqVRKp8sm+FVGo0O
 zOYx7aObrxGjOavTGXAb9xsIFeeYM3eqKHpTmjQ7UeT1PauDile2N2BhlHnOUIjvgu4k
 fqqDwHi4p7wSr0jN0nsEOfaftfTgXD+x6ot+HdTDeasPB1dXE1T3/tTCR/gWnkDoiM/l
 gOOQ==
X-Gm-Message-State: AOAM531WuT6Fb7og1BKtzvieWmQ/Qj0rPJpBEGUKrViiKd6rVbPJVg1e
 SbnBmWMQG0yaBV3n+hD72dXrZFDmbdbleQ==
X-Google-Smtp-Source: ABdhPJxZKMfGz8TRUAQVXYLhYh32JScuhaPq87clcsfkJ6mqime8WcBlaKLETc62zm0ssrIZ92dMKw==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr26712057wrr.222.1607451359039; 
 Tue, 08 Dec 2020 10:15:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u12sm4978873wmu.28.2020.12.08.10.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:15:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/mips: Don't use clock_get_ns() in clock period
 calculation
Date: Tue,  8 Dec 2020 18:15:52 +0000
Message-Id: <20201208181554.435-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208181554.435-1-peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the MIPS code uses the old clock_get_ns() API to
calculate a time length in nanoseconds:
 cpu->cp0_count_rate * clock_get_ns(MIPS_CPU(cpu)->clock)

This relies on the clock having a period which is an exact number
of nanoseconds.

Switch to the new clock_ticks_to_ns() function, which does the
multiplication internally at a higher precision.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 76d50b00b42..de15ec6068a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -147,8 +147,8 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
-    env->cp0_count_ns = cpu->cp0_count_rate
-                        * clock_get_ns(MIPS_CPU(cpu)->clock);
+    env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
+                                          cpu->cp0_count_rate);
     assert(env->cp0_count_ns);
 }
 
-- 
2.20.1


