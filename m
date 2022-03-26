Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB144E8111
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:30:30 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Ut-0001QP-8b
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:30:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QH-0006gj-Pz
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:42 -0400
Received: from [2607:f8b0:4864:20::330] (port=41879
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QG-0005Jv-5t
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:41 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so7458363otk.8
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqvjDBxg6dzVMRz9GXbJw/AGrIZfs63ojgJ9mrqtjWE=;
 b=LKRHN2T6UpNIqCVNFfdgoIfv6jE76vXzTrQqllhcn68jFhH+eo5tke5n3pJC45BxHf
 zP2QRhfeHndG7im3+/nDCA87Fh/9cXrE/BAvVMyV0S5pYfUt8QXlfhP+3F+wKW+o+H33
 8FWA3soc1PX6pn8OzHd6Mnf6xvEjp+O4Ky4kw98jNSwGbmUX1Xogwoa8ONRSthU1ZZSe
 kSmNPqnwiSuulxRWs+l4YlzfReTlEmBUEqPDb/LaiHmsxW6BUtEIM4uyrsqF6qxchPH7
 09e7/ryDIIP3Z1g8HB/FgHDtCAIq7dZTfYL5P+JnlMUls96mmL9+6p52NC6bDWMdo4FV
 u4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqvjDBxg6dzVMRz9GXbJw/AGrIZfs63ojgJ9mrqtjWE=;
 b=BGHly0Ne9VT3NUdS+y2ON2maUvLsdFkTKGhKnG6dJ2Efvf1sW2KMxL4S3DNTuK5WmT
 eLVTPoAKWlaLBaSkRwv4xEjqM4LokUPucD9HF21C6/KXIPH0r+6IhZnx3IdJSgtLZ3eF
 +6I4Etq9zd3Lk48oC7cEdQlXRTt1DVjAIUgnXzpYqg2nt4mFwohpRzCrEqL/xLKDn6U9
 G9jdMRr58szPm5o25Thv/EZeXLJUvgfytQAPWad+KAzUt86+G/gN1hIjL/K9P/R9B190
 y+O8AWyt3yRs+sRUx8RrP8ec/d7yNb6pnh59nOYNubeJc5w7qcJkd1AmHJsuFBT9Mycx
 A8OA==
X-Gm-Message-State: AOAM531UsPA+g8ym6xfvaqcpulHQM0NJQ/D75aIDkysKq2W2GjD7iMDL
 rPPi0kmIN0xxIPQvpgmyEIPgxDGIjXzx2fM+
X-Google-Smtp-Source: ABdhPJzre4h85ihMCaPF/Rn2W4bO07TC7qnBjLfvfHbYEEy7Ysrxl26/QUHwqPoHjGGKRvs7c2oXEA==
X-Received: by 2002:a05:6830:20cc:b0:5ad:95:66e3 with SMTP id
 z12-20020a05683020cc00b005ad009566e3mr6459170otq.347.1648301139059; 
 Sat, 26 Mar 2022 06:25:39 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] linux-user/nios2: Hoist pc advance to the top of
 EXCP_TRAP
Date: Sat, 26 Mar 2022 07:24:48 -0600
Message-Id: <20220326132534.543738-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: alex.bennee@linaro.org
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


