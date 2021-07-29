Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4183DA1F8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:19:22 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m944P-0006ZG-8Q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940d-0000CE-Er
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:27 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940T-0000uk-PO
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id m12so1648139wru.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=WH01ZJuHu69DDGuF8DmKOAcY/rbpiR1Ksf0wH8yhWQHmjwpRwY9RyBw7UG/BodlJ/Y
 PuFHIPvHP6dqe1NuxefNXoEWdfJrbMpxM7nmE/ZJR4UexcKt14y+bQ5h/z9oOsh3Phdw
 rHxejHJ3TLGEnAylLlT50UklLO71qM+f7ZMIFcieTuMxOS/Rkdz0JEvhjSrEz2Q4zFRY
 MfMxyOSw184ZvMjDo/GnmZrHEyju1ij48jJ53yf43Wbt9gEWS4f9LcAq+13VS+0K6GlO
 3ktVNpFlIqIDyEqyP0JO3iDQNgqsqXO9g9+7xI5kZmReMfmwM5z5YJsmsFy9BVC/zuJd
 rsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X46IYmwDa0Vu+Tiq/N7j9UCGpxEaqTWhGbb7xdBU5TU=;
 b=KOiq3jKAVqhUgVid8GW5dLudV5D451rMfrwRKPixq1j9CzlzpoLN8Y+BLc+tY7YQ5r
 JpFu7M9LGkZDwKPOWV3Rqq3RAqsNTMimwN9uGLj9GHdCYKC3SwaUlG278fW8aGJu9x6y
 DKPCAhaJKUcGMFh/6Yl6j2Gm5s5sYFzB/E3juG6eUoVjo9Z0EUkvVUdFeSKMM3sy6TJi
 6pjNvXBstpt90vlmPbz7WsrnmLVAb5MLx1727vsNWUcEXPP+p9DUEZBby8Nc0FHL/JV8
 1Dywx1JF8+mIQ9JjWVxNADPl/nBuHBYIgMortEWNbzKLg5/qIDa6o502Aj8Wd5CIzuzo
 0ZKw==
X-Gm-Message-State: AOAM532zzjYlvXlTVe1fCGFpP1V/JEYuPLAvGJ/97quYyWw8rZ8l67RN
 WIT049pIuXSVmTi6qJ9EgdMA2Gqy84fWMQ==
X-Google-Smtp-Source: ABdhPJzp+W1Lxf/Bf7nITU879y1qefqvOP6XXRPzMxUCT5RyZK96zJEtRQMvRL1I8qgbHtSnSPYEaQ==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr4115122wru.427.1627557316473; 
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/53] target/arm: Print MVE VPR in CPU dumps
Date: Thu, 29 Jul 2021 12:14:21 +0100
Message-Id: <20210729111512.16541-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Include the MVE VPR register value in the CPU dumps produced by
arm_cpu_dump_state() if we are printing FPU information. This
makes it easier to interpret debug logs when predication is
active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd76588..a82e39dd97f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1017,6 +1017,9 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, v);
         }
         qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+        }
     }
 }
 
-- 
2.20.1


