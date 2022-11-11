Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B054862610E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiy-00087k-2D; Fri, 11 Nov 2022 13:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYiq-000848-H7
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYil-0005G5-6L
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v7so3399653wmn.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8IRhutszjP7KcNpe3Rgsdhclavr2Z8wlN87Tg35KU0=;
 b=saAec4AhXJ9Ngi+mzzbh1wkeLpO8irkzPmrllFG+3Qj6akdEDfDOqPQrk+IRyQ6hMp
 BMPfIikAFR1GZhB7GbTQ8AEHnI9xppOUMHvmj4ybYa4Oa6b/Lks3rlWx/hTt1KjkZihQ
 km9jttR8Ox7vbOubLm7Bbtd8VUKaoZEByxemZOMAgL5PIz0eKTrbwxiL9w4W1+YnNFKm
 4N+XyE1lhk0fDRENjReB4YB0CyhL5M4FC1AKTpNxMRsVZpzlwQrScudDudv2pZ+SRaYA
 7m1+21FhKWAaSeMdRZRtZp1UhmcE+k6a6Y0yww4TQDa6LqXQT84zIkWx/om++i2TB+xl
 TaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8IRhutszjP7KcNpe3Rgsdhclavr2Z8wlN87Tg35KU0=;
 b=CoMGENILQ794F/6Kn0enC9AFPBBP7OLmjxTYU3W81Dsm9YAs4fPBmDcsiqtjJ1nLkD
 M+uBmWDdGMdNQpqhN8CCln/nHfehlD8FODLHb/77+9IKzEl72slIjNc5yrlOgSPnsFZn
 ZJJc+MmaPE0vkSG5WhqZizLVYUWn7YTlqGHLMMRgZdxcq71fOiJh8x9RMy2LBiWpyymC
 UBW9tP5GYY81hHmvV3EuLIuEwAeaPv+jGO5OCbKM7+dFFiVGsHQ1sRWtJJ9TSBHh4Btl
 oXkwmmkrDToqN3Jk4BYHrM8AIqhZ6JPNPNfypISlc23d62+5R9clt/26q5HjoRqADL0N
 Cz3Q==
X-Gm-Message-State: ANoB5pnIrI0gLrXh3ew37kKfZEqIQh4jaWzxmFkelwJKQFcXnQ9YjSEv
 TSpphnERGyxs/IVhuPUBharXCg==
X-Google-Smtp-Source: AA0mqf4QAF9OmIgs0JObbNu0L9phNSLm2Q2+3RYJTQHjxAg24xxreiIk+mcPjIHmuU++dzsTIgx4rw==
X-Received: by 2002:a05:600c:3516:b0:3cf:8952:300c with SMTP id
 h22-20020a05600c351600b003cf8952300cmr2177458wmq.51.1668191141704; 
 Fri, 11 Nov 2022 10:25:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b002416e383e1csm2289017wrw.25.2022.11.11.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88DD61FFC0;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:PXA2XX)
Subject: [PATCH  v5 09/20] hw/arm: remove current_cpu hack from pxa2xx access
Date: Fri, 11 Nov 2022 18:25:24 +0000
Message-Id: <20221111182535.64844-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We can derive the correct CPU from CPUARMState so lets not rely on
current_cpu.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 93dda83d7a..065392a8bc 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -319,7 +319,7 @@ static void pxa2xx_pwrmode_write(CPUARMState *env, const ARMCPRegInfo *ri,
 #endif
 
         /* Suspend */
-        cpu_interrupt(current_cpu, CPU_INTERRUPT_HALT);
+        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HALT);
 
         goto message;
 
-- 
2.34.1


