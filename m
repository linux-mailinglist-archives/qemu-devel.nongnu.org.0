Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E2410844
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:04:49 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfdo-00036v-Cj
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLm-0005Ia-Dh
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:10 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:47089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006ww-5H
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:10 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m21so3884870pgu.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPeEJcgZH7TojaDG8K8aivb2xJIScpaxZoFZXE7a5sY=;
 b=S4JY2mStgSg8363Sq0kvbXKwnb2NR5+QabwRXj+5WKssNRzbI6i67hkzp6rDgWwvvc
 nzLXluddeGG+Y341TyCdea0z7DrY67mMI+ALF15VTgoYmb6az90n0u5GYoDC0lNMGH07
 mbm7Cq4kp2Z82bCxfbVx2cjO9hoKyHdSSZPckA0CCuBZAQN+zh8MNFNdAhHPbHwJ42Uw
 8RAB4POzXDyJvTpyt5uVD/yPzLwqxQn9rzTwfTIJc+F4S+Jv2T8HCvqR56++wj7i0gej
 T5a89iD8FvkqnQ69n9o+zUz5Vrb88fpaVb2qZbx5C+P4UkWZgHBHJ9Yn994NBGIrjtqf
 H0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPeEJcgZH7TojaDG8K8aivb2xJIScpaxZoFZXE7a5sY=;
 b=RGQ+Skg5mmfJwN3mDCMyJROUSym8FGKHALObH7vrrTVunq2K1/JHBZi4q+CzK+Nvqk
 xetaohYe7AAroKGvyDcnNts0ToEo87kCTt6DvZ94wc+aqDYj90n9JKFrf08CvG3Qvayu
 wVphmljKU/+vaZaHt3GsEZDf/17boUR7X7lexBD/mtEMuqR28Vhc2W8y6oSJOgcaK53w
 DLb9LYgmFC31LChyJjb0lm/zFi4a+f+052I2aWbA2WCNP9SyRZC422SrrwgqTZ6TAlxc
 lA5pXZ20NE4xvLBByujqnYZjaCQma3jswfDv2lyvjNG3L1ny9/ptetilDKdeV4UfdVq7
 XKNw==
X-Gm-Message-State: AOAM533kixa2dr1bhzKefqTbASNBLqayH294eyaC4lLJiDRj9GysuIsh
 zuIf9B/SgVXiSfBRv+f7+EF8WY6vcmjZvA==
X-Google-Smtp-Source: ABdhPJxKsWTtR0gusFON6WRH5WFBeYNaSKlXmionCB1ZmU18kypAiLV/N50LiGJ7swrvrNlTf1tQ6Q==
X-Received: by 2002:a63:4d20:: with SMTP id a32mr15733094pgb.247.1631990755291; 
 Sat, 18 Sep 2021 11:45:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/41] linux-user/openrisc: Adjust signal for EXCP_RANGE,
 EXCP_FPE
Date: Sat, 18 Sep 2021 11:45:18 -0700
Message-Id: <20210918184527.408540-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel vectors both of these through unhandled_exception, which
results in force_sig(SIGSEGV).  This isn't very useful for userland
when enabling overflow traps or fpu traps, but c'est la vie.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index b33fa77718..314e7fba1e 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUOpenRISCState *env)
 {
@@ -54,13 +55,17 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case EXCP_RANGE:
+        case EXCP_FPE:
+            /* ??? The kernel vectors both of these to unhandled_exception. */
+            force_sig(TARGET_SIGSEGV);
+            break;
         case EXCP_ALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
@@ -75,13 +80,6 @@ void cpu_loop(CPUOpenRISCState *env)
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
             break;
-- 
2.25.1


