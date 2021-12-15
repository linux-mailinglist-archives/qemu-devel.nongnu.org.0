Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65647579E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:18:08 +0100 (CET)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSIR-0004In-TT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiZ-0006mu-6n
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:03 -0500
Received: from [2a00:1450:4864:20::42d] (port=41572
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008Qj-KK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a9so37361389wrr.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N0uYtzp1T/duTn386YyO+lODMSKezKpWWtt0gTXr47k=;
 b=jVeUpTG0PfHe04hWCUx9gHFtAWoldXy08VhH1THg353N4Kjii/D1vObmmRI4Hydj7I
 nZnMwmWuESbPtF52/88MZwsMr8xgaL1bWnXaCtc2N+8i1uh8Prm0XU+N0H3Qq2O3V4HK
 a1PZeazRBkq20sZqbK8qExK4TYO6Y/wyvju0ULZOuCk127x8TkLrB3n0+zfQU9SCzBQt
 qj4yVU6qPl1H9wkMZlW0ilZUNxRLmAZh3cTBYLIRSoNhcMtPPRRnKCOG+UKL2wE8A/z6
 mk1EI/tCorMUro/dhXgMwzhyXT66eIYGl5X/sWx2KtgVR5OhBoe6MptA/7YvGaojuBeT
 VChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0uYtzp1T/duTn386YyO+lODMSKezKpWWtt0gTXr47k=;
 b=tS2F7LMX/Kri/0TsQam7CAGIB7Al3j3jiTayMgBQ0+B8FyXagMReoGWiwr8GCm38JV
 Uf3qtDhVrBEiR8vhSfYTmG7qVGH33o3rNO4jzJzRQeSMkU/B4OijeAwiwtJiW4GW/apq
 9xFzpAZuNpSz3cGhLDIPa5NcwwBhqHdSZKGked6cvQ3gqA+Zg15CUFX1j00DY+BhDwgp
 MuYplP6m/L1V8tEsHFr86jRwyZhJ6SbvaoN+OvxlhYD4c0O2czwmu3Rbtn47eId5bK+g
 o0cKc2gRe8cz/NtuyqPBVTMDvBQ5bx5JtQq5414OIrEH0kCK57LQGI59r0HWMH7QmDqa
 xyNA==
X-Gm-Message-State: AOAM531+sNOyzrkyhHmcGd8f4SzcZg8c9/nPJgZXIh8u0E/zey2czRFC
 Z72HcGOUWQ262kyAYUxbrH3M7iGfgFlZdg==
X-Google-Smtp-Source: ABdhPJxua7bxjDWJKQIacXh+I6VgaOROObjZFLzWw8nl0cRpljkkPEudHo1RVUHDS2ORQG9UNvA6GA==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr3701133wrs.485.1639564858307; 
 Wed, 15 Dec 2021 02:40:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] target/arm: Advance pc for arch single-step exception
Date: Wed, 15 Dec 2021 10:40:29 +0000
Message-Id: <20211215104049.2030475-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

The size of the code covered by a TranslationBlock cannot be 0;
this is checked via assert in tb_gen_code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9c4258ccac2..2986fe13935 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14767,6 +14767,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         assert(s->base.num_insns == 1);
         gen_swstep_exception(s, 0, 0);
         s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = pc + 4;
         return;
     }
 
-- 
2.25.1


