Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70904E7A8F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:00:02 +0100 (CET)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq6L-00068C-U1
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:00:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzc-0001vr-S5
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:05 -0400
Received: from [2607:f8b0:4864:20::235] (port=33327
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpza-0008OZ-1C
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:04 -0400
Received: by mail-oi1-x235.google.com with SMTP id k10so9327648oia.0
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOJF6hs6MIWp7u5IOBbMVU2hqWWBLm4vep8AaaojE1I=;
 b=D8zPgITMMggSQkSh3x6FJ9KuRhzjYSZOO7AEEiIpYcIaX6JvTUSK7p8svOrwkPDV8l
 KCOrwS+PkhF3FY/ctb/UWfM2Y4CvSiByBYVbvMq5uL7HM1Hh9tQ9y8s4SLygB98OkQRx
 7kSZKAsVVHmjZQ5PSgT8NJ4k+ZOzaliVifp3LDmQXVloXQGWTlJ4ZHEc/fpJrmz7fOb+
 Vsv/tzBbROlfV1p5kZmjgbW5uEj7W0x4IY7JEhd7rV2WBs7SnN49kmXDaw+0rroc9e1/
 v8yE79PigHH+55sFHI5ECH9PHEcKRQdI9sghEyyx+NeSPnZQWr1NEkh6WVhAJc9wD7Ka
 msDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TOJF6hs6MIWp7u5IOBbMVU2hqWWBLm4vep8AaaojE1I=;
 b=H0jjLYf+BN6y3C+MIRu7qH3vDtEWUBzktmfF/IXFLMVsp01W9s5m1FNJGX5lGdZzXT
 5fAlDMHfi6AJtm7XS6qdLmid4UnZypvcZiMFhF3FiH0nR3Ae2d7LYxG+FyiSevUwz0hk
 TZEObk5d1R4CUBgqeEGQPy8pWmFZ6QbZiRi7aKBEMWmLSNlvNC0Oe887Lbqgak4EIl+b
 KajWFLm3NqstomxJ5ZLkynTQV1WTpd8CE9yvwyctw9p7VlQXcW/iItVV+m2wnMBx02nQ
 pyFAPy/KUnDzax7I1sWoWwZofeITazwBqRaLIBGNJLxmztbpStY/1QcSFZ0YfMiJhL1Z
 0auw==
X-Gm-Message-State: AOAM530rfXla5ZMc/RZVlPqISW26WsgcWZkJG9AlDBdBNaI1UgD/u6bN
 BIAIq8qH+49g66fPV/nBAjCzMMdWmLAiprYeOoQ=
X-Google-Smtp-Source: ABdhPJzdni5bxT5pP6aom7CKbiRHEaicc0kn1nGLzNBPsdsyTp8ih+3k0qtlosgcpoIE4PynsE8G1A==
X-Received: by 2002:a05:6808:113:b0:2ed:22b3:fe57 with SMTP id
 b19-20020a056808011300b002ed22b3fe57mr6422643oie.164.1648237980181; 
 Fri, 25 Mar 2022 12:53:00 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] linux-user/nios2: Remove do_sigreturn
Date: Fri, 25 Mar 2022 13:52:48 -0600
Message-Id: <20220325195250.386071-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

There is no sigreturn syscall, only rt_sigreturn.
This function is unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..133bc05673 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
-long do_sigreturn(CPUNios2State *env)
-{
-    trace_user_do_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
-}
-
 long do_rt_sigreturn(CPUNios2State *env)
 {
     /* Verify, can we follow the stack back */
-- 
2.25.1


