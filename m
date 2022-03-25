Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983D4E7A83
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:55:45 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq2C-0004cr-5p
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:55:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpza-0001uD-A7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
Received: from [2001:4860:4864:20::2b] (port=45600
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzY-0008OG-Ap
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:01 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so9092514fac.12
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsjNufQ73Pa+Yv0ODGLjHkWTidw02PpY5LiPgXHEvoE=;
 b=elqumhUpXJ3g3PG+T759/CvPjF+4G0nr7XI6+SSY/NP6tGkBr4tHDatdG/K5GtPWOL
 OVJ+A5s+5UfT34BCfSPPG1uvs1muHS1lzDG/7S0jM9AGlTLG0AYzZvU9pWxyiBs3mbv7
 pcN/cVMLQrCJ68DBmfOYAY9jKyLAH+Bg93I0KGbAuKVbitca9tDoE5ISuJ9qkcK8FtuJ
 ZOGl3WHARRIm2X4qSmtyzs+7Yd1o4j8EA/ENWjNaNmGPM+wSHI2sNe5sQ+QWx3eGqLlS
 zujQR02NtSa+7hGkVLDyXfADAq3ma5nT0toxnrpKpZIB4fCveC8lzKrarT4ysUe0l5dU
 9pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsjNufQ73Pa+Yv0ODGLjHkWTidw02PpY5LiPgXHEvoE=;
 b=J0jyiYEa4+U1nVl4Nxgda/vFd5LWfSKM4BwsgDOZ4kQZ1QPkghSaWtw9+TvuUh8xvQ
 kKzHhAUmEOIU3xu5R73eanLnL6a/s5IPdyI6e+eOHLs5HxLd8L1v2KZyraGaZSOWiKSH
 iDB51wpQeT6ASSFfYH7J+3ZXqhwqMsHJadPzlbyDAURomh4qLBiH4dLgDjRq6u16XhZ4
 8Fm0JdzB/Y5KjwPsNtuom+DIcqWj9bvuDr8PDQ3g0NyzJ5PmnCBxTRIorZg5rpOMO9Hu
 MVLwVk2sYRDuNPIl/YrThT5gZbcCBXDF6YMCWnBtvgclVdCaB+mVBwKWG9W2IFDiCx9Z
 6WEg==
X-Gm-Message-State: AOAM5306xwOjfO92a3xiOOEcI3vXT6vL6pGLESzozJrUO7MuynYdQ3V7
 lm2scjC+DqwzKo/Sg1OrlXs7PivLAQ9DiPyE4IE=
X-Google-Smtp-Source: ABdhPJx+4D36maziHfTNkHc4M9dHgHxKnGaVhjzOIPiUOoB2t+cCoICEj/y3Lflale1OwwPWhWXqZw==
X-Received: by 2002:a05:6870:3324:b0:dd:fe5b:8d4f with SMTP id
 x36-20020a056870332400b000ddfe5b8d4fmr5834283oae.11.1648237978948; 
 Fri, 25 Mar 2022 12:52:58 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] linux-user/nios2: Handle special qemu syscall return
 values
Date: Fri, 25 Mar 2022 13:52:47 -0600
Message-Id: <20220325195250.386071-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor QEMU_ESIGRETURN and QEMU_ERESTARTSYS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 969460df58..dffe48b8e8 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,6 +55,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                if (ret == -QEMU_ESIGRETURN) {
+                    /* rt_sigreturn has set all state. */
+                    break;
+                }
+                if (ret == -QEMU_ERESTARTSYS) {
+                    env->regs[R_PC] -= 4;
+                    break;
+                }
                 /*
                  * See the code after translate_rc_and_ret: all negative
                  * values are errors (aided by userspace restricted to 2G),
-- 
2.25.1


