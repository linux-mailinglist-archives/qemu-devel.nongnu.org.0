Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF3541C78
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:02:49 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhHk-0002xx-Ap
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwz-0007WF-HP
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwm-0008Kz-E8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id b5so15785223plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=NBRgEiOefQ6of5ai/lbpMJqEnYjAkS/4NedeDVG+IoVaQLU+LQxsm9d6UTp4Lce6y2
 gFfhiT3mZ+riSg7DGJZcZo9wXbqA8GOemvXaPpwvadeRm4T6Ml61rtRWyKeCoATxhj9e
 cVlYK+PI2E/XcMyvrPZlNA/p0JBK6STfS3/K5giEGNF2dYEJ+B+PItfyDt71q1i8ixtV
 4rYxpZ9VY+Nlm12ZuWBLZmgS/DwOk/Hytf7D4Ky6f6/9vKUSjaoTO7lHzDuyBpupTVEf
 wRUo93itIAc3CNvNvP0yQGIikwbG409rQ7f9+G9zwDoi3ai59mE9Ktc2koZbuP45HPYx
 y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=2It5+DLFFFxVrthFbJFxYFNriCbsZrFkF4bdERqU3DR3EWOS+MyIYOuSVN9jkRd/TF
 5BF9K1ZQWGX47ee4oiTVDsxJeZIBP0fuhSlASQoM0dDunhSNc+96k9qvd6MT/k6rsmqG
 9zbCTRIqM5MqBgVodBZPIwk/btM7Xb8EpiotV1lIq9bca3i77zXNBYXFfWfWy7sM1eUD
 oPsFcH2WXGS7M8a4+veRcbNKy7zCYG7pFf85x1W7K8TWVBN/AWqOdVzhU6j2yP8oAH6d
 KRaXc7whyCpXHbgWZ/+yhftHeDOUiBGnNjEZlikvkH77nSU+FofCoysdfP7cuOoAY3VX
 vwTg==
X-Gm-Message-State: AOAM532SZ+W5X92YZsiFi18ujsO+iamKux13GXDWbfzDl+kXoClqChz1
 MkVNwPQwfthb29adhDjQDiIvuxTxRKbwQA==
X-Google-Smtp-Source: ABdhPJxE9si945flMaf1hnybjTIwx5rUV/Ur5d2v7qa/bOKcaq92vjcVX8DvxP9C0jT2Dz/zp3wJHA==
X-Received: by 2002:a17:902:d509:b0:167:6ed8:af9e with SMTP id
 b9-20020a170902d50900b001676ed8af9emr15593000plg.140.1654634223172; 
 Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 60/71] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Tue,  7 Jun 2022 13:32:55 -0700
Message-Id: <20220607203306.657998-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1


