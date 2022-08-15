Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14959360D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 21:16:00 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNfZ9-00065a-9h
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 15:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfN2-00031z-5g
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMt-0006K7-7E
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:03:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id p10so10089810wru.8
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
 b=jknClf+toYIvPEkgUrydqqr9UCEeCEr58GLRzowOM/IR+L5/RRiMyasTBBMRmmqRh+
 VXmtjuUtV6pE17LQfKKL1GbOlJaW2ahc7y2BGrrhYaOsBJt9c+92OFP70Cj8GUH4cpjt
 FP+5S80H/lA3PfnsxbmYnpY4GG0F1g+qU5vO2TzsFXTvUY77ZLJIIbo/FeIaxLDF36xv
 a2R0r4ph5J4G45NgcdWOmn1wde72VHauCcdnjAES4VC1OApf+xdpoHJrnLBL4816MbHb
 KfF6rPf/qLx6WS2D4wOZsqK+d6jo6DcvcytgBHs1PuU0pgP5sxVqEV35A3KcyEKUgdq8
 ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
 b=Lm1OEQhN+aEeP02Min4lhcJ8fl9Rkq6NHiPivdwK4+XLvrhjWswRU/WaBrFtu4j/h+
 QhYDijkLfwYwQRaqDQXU/QqfDXAzrZ2GKWsaqimmpB8rPjsDf58W4C4U5ZjWPx1GgPSx
 RkvI0ZPvoXrF2unHarDLso0cO7mvGs0ynsHm6o6X29FgVFyHnbfHplRu7Rx9/8YTqSKr
 HsF+J21rs0pTnl8u/+D1/RB/W7Ys7x5cellf9RMXrs/Z9g7ktqHH0pbKnWfOOdke5x4w
 g1axd780TvwGmYJma7ufKhoLHyBi8+AOskRgLBcuogSb6YvpWM6qxlJg82NQOh/l4hE0
 qjwg==
X-Gm-Message-State: ACgBeo0CVhQjr5XFEmP0LOESpz0XIBYxToYHKCjsyUdwdURH8LAH4jqR
 TwphGE7/7LpeniM6lFg1O3HOsGONa8JH/Q==
X-Google-Smtp-Source: AA6agR6EenKqtVnb6qh+v5OZDGtZ6StmoxTQ1eASfHElCzeymsfQZli0AJNuSum8kl6Yi5j4QTlgUw==
X-Received: by 2002:a5d:6047:0:b0:220:6dc5:73ee with SMTP id
 j7-20020a5d6047000000b002206dc573eemr9634750wrt.213.1660590198464; 
 Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on and
 enable=on
Date: Mon, 15 Aug 2022 20:03:03 +0100
Message-Id: <20220815190303.2061559-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The riscv target incorrectly enabled semihosting always, whether the
user asked for it or not.  Call semihosting_enabled() passing the
correct value to the is_userspace argument, which fixes this and also
handles the userspace=on argument.

Note that this is a behaviour change: we used to default to
semihosting being enabled, and now the user must pass
"-semihosting-config enable=on" if they want it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b2..49c4ea98ac9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "semihosting/semihost.h"
 #include "semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
@@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
+        if (semihosting_enabled(env->priv < PRV_S)) {
             do_common_semihosting(cs);
             env->pc += 4;
             return;
-- 
2.25.1


