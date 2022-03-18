Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578E4DDA8E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:29:02 +0100 (CET)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCf7-0006Mk-Jz
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:29:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZb-0006Ea-22
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:19 -0400
Received: from [2a00:1450:4864:20::32e] (port=40738
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZZ-0002As-AU
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so6656365wme.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s6v9sW/5b+lNngegiNeXR9i1AkvUX9wJBIUB91fUBiA=;
 b=hTrotaJVHDwZgeZ57S+RnwTFsYv1EdVgY5nNkxN3wMG0lxPCWjmi8E8nkn93po5Sc0
 hLlwKFpJ+qXp1kC6lWWZa6s+qxigiHRHAdLNK2nS8eRjDXzueXan5yEvq7uSqDcm7yAA
 17M21FGIaoMzBfuhucMRlSljhgtXjZlYXTzLQnyd7zGKQAWxITu7ykCp/IWEEB7chL9z
 XD3FG7ga8jboMhQ/6CJbd4DHb/JWd2fRxlvJAtkFj8AaF4UerZGFuGZvbOkzeu6aiZUP
 LCE6VDzq+T5jwIkF0F4HL6GXypRI+og94SXYd5AfnmZAx8Zafudy9TMzne6QXX+xLDBo
 MR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6v9sW/5b+lNngegiNeXR9i1AkvUX9wJBIUB91fUBiA=;
 b=31nCXGvmpK4CrSrs6s/SWjvEKNXxtfReO1i/GJHHFVI6dTzCJzcdYpjVPYelbNu0CI
 VJVR9IBx9DIZ+zppbZA+KF3vcl+M2JPwAODscBpfnCndwZlnu22yKTMtcMK+BA7z2CoX
 +HsX0nZo85h4l43PB46d73Jea1k3ckoaaK/X18NA1+fzAmFiMcaPhnX43TBqpZc+Ta4c
 uRAgmEms11DsQjyYAFcibAnvAxnPFYvZI5wvO6EOaoSqAJb3jKHIQrlGGhZuQkcvkM8k
 Pw2tZxVi07QGoLxM9TBJDxJKguLSlhVxo0HhS893zts9VpZUvrKKQMJTMF5plM4fh+7A
 bAZg==
X-Gm-Message-State: AOAM5335tK1YO0pCL1P0rTdMg519CYynIE0tm5vcySSkYB98DQAvVJcs
 Y9pw1yBVvhgYgEAE1mQoJlUsyHVgWhqKsA==
X-Google-Smtp-Source: ABdhPJzFXrEWCd0Pqi1fDIP2SBjJf96Az0t4uDk/Bm/63qcpeTL/kXCmiBHJP7iYr8xoQ0/J0brn9g==
X-Received: by 2002:a05:600c:3b15:b0:38c:6cae:ff2 with SMTP id
 m21-20020a05600c3b1500b0038c6cae0ff2mr11729380wms.175.1647609795883; 
 Fri, 18 Mar 2022 06:23:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] hw/misc/npcm7xx_clk: Don't leak string in
 npcm7xx_clk_sel_init()
Date: Fri, 18 Mar 2022 13:22:50 +0000
Message-Id: <20220318132306.3254960-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().
Use g_autofree so we free it rather than leaking it.

(Detected with the clang leak sanitizer.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220308170302.2582820-1-peter.maydell@linaro.org
---
 hw/misc/npcm7xx_clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 0b61070c52f..bc2b879feb5 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -612,8 +612,8 @@ static void npcm7xx_clk_sel_init(Object *obj)
     NPCM7xxClockSELState *sel = NPCM7XX_CLOCK_SEL(obj);
 
     for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
-        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
-                g_strdup_printf("clock-in[%d]", i),
+        g_autofree char *s = g_strdup_printf("clock-in[%d]", i);
+        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel), s,
                 npcm7xx_clk_update_sel_cb, sel, ClockUpdate);
     }
     sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
-- 
2.25.1


