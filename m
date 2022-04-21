Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B964850A61E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:47:14 +0200 (CEST)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZxZ-0005tA-Qb
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdD-0005jr-Jn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:07 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdC-0007DC-4I
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:07 -0400
Received: by mail-io1-xd2a.google.com with SMTP id 79so5627735iou.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6CaarkqQrAAyxbYSlNSLaV7b+x4O7r/FJICreGNNBLc=;
 b=TQ/g9IvP6VHkOxZFfWIIFhMXPQp47KD1j+a2nhxJ0+ZNTbIqCDpjPc4wLkGLLyV9WO
 SWfd5uWajyUQNT/25IKQWi7B1RtLULxvC8xBzIDtKTPyi49u1tKgCdpu/pDcshi/7nJW
 I1+xyfrya/Mp12vmzjqnt4+LMSVuHW0KC6BfMzkgTyLUSuYO1aUMpl29+s5LdgFEJHx2
 0u5US9Ik+FXgrY/jjSxJynFukFTXDzTS2DZhen+j2rv4mOQJ8kkgWo4eCzVDgiAgLiwm
 Fwi5dMsq551mfQolppmDLCjOt+HrUixacvmGJpFfn9GE2eTM4uIpT0OKDBihtIqUKFxm
 xL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CaarkqQrAAyxbYSlNSLaV7b+x4O7r/FJICreGNNBLc=;
 b=bsMhu6SZG37xArklp2Ex77Zow0iypwgDd7NuJaMjCAUDKU4wtQqE+qfCiipCEZIHnf
 65WwW3AqsPKrOIqKQ5h5Askp6OlEdPA1pIccRrCggwE+ZBP2GIhTc6DzgPqZxPyrvK6E
 jPZUpssovLmAj960de5NvWv5FIa4J0H3Vuya2kTxTbfDYkgx27Q4roawyI2Lg6c7RVq+
 j9k14qi/POvF1rAzRZLicnBQFlCyeDoqahymqw6rwfTnoAgICCfnaymz4nLCuIq6P74i
 PJA6aQgqEvG944wTn/lG+HTkyhwSEzDy0gfpvdG4XC7i4YHcjw9QaAFTq59j8HX1Ggy/
 goYg==
X-Gm-Message-State: AOAM530W6Ow03wWyeA7WdTOA1kW+jnoBbLTYtRguh6U8mz0bcqPI+K6s
 57V6dE0U2BkhXvTIQMi3mjG+bGyFF04djw==
X-Google-Smtp-Source: ABdhPJz3urYMSw0VqWTEytk/LWPx8/HZ9t+ZiilB5Xb818poiACA5vzijT8RQ2gHVyGKRuKDKWBcFA==
X-Received: by 2002:a5d:8450:0:b0:64c:cc87:c5fc with SMTP id
 w16-20020a5d8450000000b0064ccc87c5fcmr87744ior.190.1650554525184; 
 Thu, 21 Apr 2022 08:22:05 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:22:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 58/64] linux-user/nios2: Handle various SIGILL exceptions
Date: Thu, 21 Apr 2022 08:17:29 -0700
Message-Id: <20220421151735.31996-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed out on a couple of exception types that may
legitimately be raised by a userland program.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index a5e86990e2..da77ede76b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -50,6 +50,18 @@ void cpu_loop(CPUNios2State *env)
                             env->ctrl[CR_BADADDR]);
             break;
 
+        case EXCP_ILLEGAL:
+        case EXCP_UNIMPL:
+            /* Match kernel's handle_illegal_c(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
+            break;
+        case EXCP_SUPERI:
+            /* Match kernel's handle_supervisor_instr(). */
+            env->pc -= 4;
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-- 
2.34.1


