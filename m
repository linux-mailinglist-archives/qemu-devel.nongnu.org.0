Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CC4E7A84
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:55:45 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq2C-0004ce-DD
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:55:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzV-0001tT-FY
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:57 -0400
Received: from [2607:f8b0:4864:20::229] (port=33315
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzT-0008Nd-Jb
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:57 -0400
Received: by mail-oi1-x229.google.com with SMTP id k10so9327360oia.0
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqvjDBxg6dzVMRz9GXbJw/AGrIZfs63ojgJ9mrqtjWE=;
 b=XHblN35yV8+mkc3csOP4IMsoAtFAprFbgLeKz8KDplBxB0ymUqKLdkb50JGhtnkNMk
 X8S3gpV9qYmqKvi5dZhCPwzXxvK2d4hiGxGg3vw1SJUmvqSfS0zjFQmzX+cULFW+voto
 dQ66bdmVpbBCaL7c8Sdh9JR+LEOKc6BE7p1f8d+UbgoVds0oenbZLlpCd0BEARVzKLak
 XpkinMIQifnhIse3XkMQ/lm6qyqGZpWKktMRgx3l8oqGcTRx+XtNZNU/wuSYD9O5lgu3
 WqJMZYTgAvjVFAi1IknkMur4R4RpJY8WJFXzPT8+69PHPHhzXPOJi1S+Q7pZvQT5RQCp
 zfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqvjDBxg6dzVMRz9GXbJw/AGrIZfs63ojgJ9mrqtjWE=;
 b=4j9+/Aazm1EzYrwCYP0oKn+w92h4g+fIVoSh6e4oVVz5aRCZAGliixSFHv6UbGo8rP
 zAMKPofyGnWrXcoxsOxroUdzZy8XKpyFwYbct92fnpUgyhI3s9odleu3kczgOE8TTrTm
 2vQWKrp8imygh+EdQzO4A9vxoF2717ip3u3uFc7t7IVP0iwEk/xfm0zMIh2Y4cqHzAeJ
 m50TjCZ46oZMZ9o2HuWF5CuCi7GzUYzSWywBkE77KWJXL6UWET6uW3+pQh59c7SZfWbL
 lJXlZHhhyG57MyfSgWf5a1YCVKogXcf1XXOXYN4Ew0MO/fcMCDFtOSoE+AlynHDQSa1U
 pNfg==
X-Gm-Message-State: AOAM533VQMJ/kOTgvqTrgEucExkWP03jYSln2TgvgBZt6xLKEz5PpDKi
 Uxfqte68GT/72dgn66BbIMnvPAaUycUTUijChEI=
X-Google-Smtp-Source: ABdhPJz0FIPmVz1BaFVzYHNMKqR/yoJoXyztcFIJnjgvM6bRe1yANfKDSkeoQVhy1OowQQU3cYv5GA==
X-Received: by 2002:aca:2806:0:b0:2d9:e8c4:7ce2 with SMTP id
 6-20020aca2806000000b002d9e8c47ce2mr10875836oix.37.1648237974336; 
 Fri, 25 Mar 2022 12:52:54 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] linux-user/nios2: Hoist pc advance to the top of
 EXCP_TRAP
Date: Fri, 25 Mar 2022 13:52:43 -0600
Message-Id: <20220325195250.386071-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that this advance *should* be done by the translator, as
that's the pc value that's supposed to be generated by hardware.
However, that's a much larger change across sysemu as well.

In the meantime, produce the correct PC for any signals raised
by the trap instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 1e93ef34e6..2768ae61dd 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -40,6 +40,12 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_TRAP:
+            /*
+             * TODO: This advance should be done in the translator, as
+             * hardware produces an advanced pc as part of all exceptions.
+             */
+            env->regs[R_PC] += 4;
+
             switch (env->error_code) {
             case 0:
                 qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
@@ -56,7 +62,6 @@ void cpu_loop(CPUNios2State *env)
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-                env->regs[R_PC] += 4;
                 break;
 
             case 1:
@@ -99,7 +104,6 @@ void cpu_loop(CPUNios2State *env)
                     o = env->regs[5];
                     n = env->regs[6];
                     env->regs[2] = qatomic_cmpxchg(h, o, n) - o;
-                    env->regs[R_PC] += 4;
                 }
                 break;
             }
-- 
2.25.1


