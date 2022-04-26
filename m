Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF35108B9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:11:59 +0200 (CEST)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQbO-0004CJ-NZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpo-0001nM-TZ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpn-0005Kz-ER
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:48 -0400
Received: by mail-pj1-x102e.google.com with SMTP id p6so3878334pjm.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxB1TVMzBFwMcUq22tF+jwRMYyOH+mG1cEPhaGtvWVM=;
 b=wryWSAE4bXPxBUs54AexZGJw+ycSbv+CSCyjOZdU3apDxUcs2jYf/ye+2y3HcQyx3a
 2Alp5j3g2U+MqUKHLHPlquJmhGqDAzP8WDV48U9mgDSEuwX1cz7pA7H/6690//EnjoiF
 xM09+CZy5Ksw/enIH6i5hpz6MNLr1joCW8wNbwFMevW9yf8XS1502yuYq1VemeAVKj7l
 GAMleiMK8np+OFSnz425he13VCdgtA0Ynq59gJtvM8XM0qZYcWmHoO0mZFtnjotT+KDf
 OGLTkEeRjkjX1UrLE6noXW65GP2IaxI7eSa1SHRv6eNN+4w3WhhRchbYQA/kTgRrLadX
 1aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxB1TVMzBFwMcUq22tF+jwRMYyOH+mG1cEPhaGtvWVM=;
 b=LCepr8TZkk88hXBIkuymCM/1ocQ+rhqmOUnlzdE6YZFaCe6gSgskIo/EDC6fwJjtML
 brQOhhOGTUs7yInHLSouLR62DkN+3ltZsRSFNaAqlj2eSxZMK5bYx0LT0sx1bFhD9ObE
 RTiNDd1ygmt5VgdFJOBp3YWE0Wp+XSTYzSkYONK3cxMfsY25bpJ5lnwRp6ro/20Kq2py
 QS0Xvn6Vd8tp/EmipUWTt15UlV09mfPnMjJpBdON2ycvTI0IMXwIUtte/+bkTHYKCz4r
 D69/aS85wSuvGu77wKd2gnXiCYa5eBR26cAtNbYAzZWYulEoE/ALPQTzr6mdfPlSMYD+
 iQWg==
X-Gm-Message-State: AOAM532DAU+Yrx+4via4cUv3cIsyUfCNlBVuysZQLtPgHxhPs/VsE0l2
 OlgA8E3MmNa4uOVSHr3xHrAtHyZWE1G/8g==
X-Google-Smtp-Source: ABdhPJyyZwxamer0RwkYNwudfki7ErZtNWPlWF7VoyZBnxJdKKxr+DlchI4ZIu55d0KUQIl5HYkcBw==
X-Received: by 2002:a17:902:7fc9:b0:15b:d408:5b19 with SMTP id
 t9-20020a1709027fc900b0015bd4085b19mr23883919plb.12.1650997366024; 
 Tue, 26 Apr 2022 11:22:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/68] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Tue, 26 Apr 2022 11:18:39 -0700
Message-Id: <20220426181907.103691-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-41-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index da85d82faa..08284d7927 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -177,8 +177,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUArchState {
     uint32_t regs[NUM_GP_REGS];
     uint32_t ctrl[NUM_CR_REGS];
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 7d734280d1..58e6ad0462 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.34.1


