Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B62DAFCF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:10:52 +0100 (CET)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpByV-0006AC-VW
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxJ-0005J2-L4
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:37 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxH-0000kk-Va
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:37 -0500
Received: by mail-wr1-x443.google.com with SMTP id d13so1930724wrc.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+b1GhhvLrJkl2Vn8twSVpP5pnoCxjLycXJoM3JnXDI=;
 b=vXod0hlRtxicw20rtXnuoOemidOlUPRkiR/tvzmwg/ezxSLvMCOld985Rb6jDK+WcU
 iuat5mh2r68+5zf887w/lY5ypFUeSYni2fIwDyNniK3LPoSVO86/vkI0Qpf5+iUdHYrf
 Fp5dnS/2WEVWuWWiR5uq0INpMcyiKMChYaauAvnA/2GLp0CMMgO6O+awD3IcfgPO0doW
 Z1eWaotURoPyn8zshWiZEEfa1/FVSg9bQqPbdq8Bl8y93R2Y68MO5bg7sj+QxcViAEj2
 QLaXlQIOCDa6vn1jiDdmz486lF8rZFW7BhUnojkaDvUyI3JBpwRnrlaTFdsAmHi0crlP
 6M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+b1GhhvLrJkl2Vn8twSVpP5pnoCxjLycXJoM3JnXDI=;
 b=XrhskQESeBIgU5clX/W+xT/bjolsw3R4LWsXum329SZaoktYVrz7d6NdyhX0blaCSh
 2zaKOMTPRNMebxQtAwXaz05nJ2efs6A4Xg2+68Ls/h//k4OJZMdd/zoTQk/wYAq6fWS/
 DdeQtWCC/VKaCapMOp17cjE+hspO78Vd6w7MyovpnOvW8h+B7TZXRVKNz6McumgNNB39
 akfQ+XhmHETCoqo0KrezH3nbK1nnVDA5sJconptcCO8fqgsYv170xNwxXmWNLC/vm/94
 tFWQ+Cz0bzKbVPBLyZbjyUOdEoxlthqlY3suaLVrc9tuIQTQJ/RiMTzZ/mEOISrfgu5i
 UReQ==
X-Gm-Message-State: AOAM5316GgtD2r9ZhvlfnGRuErClEWz+lKXu0SU1O/DxRSCOZxoDcm9B
 lQwuJt8UG38vKJ+bGmN92sPUw+IXqgXfjw==
X-Google-Smtp-Source: ABdhPJyPLZQEW38E3wxggCl/nNZzX+hiM7eD872pQkgvOCbC4dRBMNPXGBpZSl/WUyxkXKKdCr5Uww==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr33881136wrt.176.1608044974039; 
 Tue, 15 Dec 2020 07:09:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm36930593wmi.15.2020.12.15.07.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:09:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/mips: Don't use clock_get_ns() in clock period
 calculation
Date: Tue, 15 Dec 2020 15:09:27 +0000
Message-Id: <20201215150929.30311-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
 target/mips/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index aadc6f8e74d..eea14f3b52f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -380,8 +380,8 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
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


