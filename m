Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE204E8120
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:38:54 +0100 (CET)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6d3-0001o6-Bs
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QU-0006wr-UH
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:54 -0400
Received: from [2001:4860:4864:20::2d] (port=34141
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QS-0005LY-36
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:54 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de3f2a19c8so10757408fac.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsjNufQ73Pa+Yv0ODGLjHkWTidw02PpY5LiPgXHEvoE=;
 b=gZXGGyjY/uBZ7z16FOHeILiIdWKrHwkBArJIoWSLSLA0NqQgF/zsENd0svLblWhm73
 330M94R0bcsONJicGQ4KFP27BUH6dDzSjbvnGIWIRhb2KdcY7rQC2jgltRbdWTL+30IM
 HOpIdMRRUgAYZQd3ttNryHzboDPzL5UxHq3WFvP6y2ZZCydeS/ZZfyPUL1opYvsGe9dM
 QEgQGClnmB/oaCep8kaliPC2MPiT56EvzBoRFtZhHH9R76QgpAxj+sDtmzpu97t2Ifvd
 f2D9gtqPhaq4tHR/HlG3I6e9CngqjN6N3zU6cgu5EpEaGNXkA7zLnnRXNwSOKoRxVp5l
 Dp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsjNufQ73Pa+Yv0ODGLjHkWTidw02PpY5LiPgXHEvoE=;
 b=YcQ4Ltty53zWZeS4swTPuHyA8KVrtSX4uuYdapPvCJ7BTYKP+mtF27Se814RdDOaIZ
 +VlxyTrNbn3iCW3XpxPahCkyzKMlvdjZYtwUIi4CCaFRNrWpHQPVWfLN8UD3m9MOgyIb
 VHQ/wdkX4Llwl3f8AxgPzpigPDblxwaLN6/xf4qkRZBADCUQ7zRsy4xrlUchgADCvVSO
 Mw/Id9pEzy1L/FIVebl73Vk6rsgoU6TUSg8coK8/R9xzc+RocoCSRxog3ftYLAWWVpqH
 DP4f7cTqCYwYmeouZNmo+TyiVju8K+aBUXHlC95IQKUtl0lNdqXGDifkQqEk75iNAVqs
 CU/w==
X-Gm-Message-State: AOAM531Y0XEBPs9GWmGbq5dFfm9KtQolgmbewVkrAOYUgvt05K4Jpmrq
 khJhsdNYChBXxpqOeu9TPLRT8c+/I5WlHEdk
X-Google-Smtp-Source: ABdhPJyFMSk4Uy6zF8RzzfB0wN/DM92X6tfII2GVz438sOgZz6jqJvG/TCGMyCSHYQL8M8PLBWdQUA==
X-Received: by 2002:a05:6870:4617:b0:de:7c85:37e6 with SMTP id
 z23-20020a056870461700b000de7c8537e6mr8046932oao.169.1648301149962; 
 Sat, 26 Mar 2022 06:25:49 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] linux-user/nios2: Handle special qemu syscall return
 values
Date: Sat, 26 Mar 2022 07:24:56 -0600
Message-Id: <20220326132534.543738-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
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


