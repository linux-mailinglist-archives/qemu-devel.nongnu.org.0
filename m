Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA61698C5A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX80-0004Hm-Me; Thu, 16 Feb 2023 00:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7x-0004Gi-6E
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:17 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7v-0005RD-L9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:16 -0500
Received: by mail-pj1-x1031.google.com with SMTP id k24so857819pji.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQH43IIj0vMoTyNfpAs94SMYkwmuMc8FS4aDkU85qBI=;
 b=tW6dw9MuAU208GKuM1hRdHzi7GO0+vEEuEuDU7o+wNi2NvGt/DtNK0vvd384dC98j9
 O7tLp+6nkIat9OQ9+FGnag7qETjDJk7YqnfZ/kGyB66EUQmfBxB/ZeH8P3gJuHvF01LK
 cgrpvXqmCchzRTD/NdduqA5Lyksw/HJOGR1b+7Ah261a9CuLocQa+DU62gB8GeWP7ok2
 U3RLYYQDrSbErb0e/BlwargkEPkuY0xFNCKJ6DVSxOSoPy2+uW8eGzfY+m5ugZL0B1Ml
 q6SOm62obt4V2j9xeSgcpsUFrd0NCcnOMxhSP8nGmv12gDFiG5pIKUzaZ4KOkBeOOVaY
 G3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQH43IIj0vMoTyNfpAs94SMYkwmuMc8FS4aDkU85qBI=;
 b=Qn62Dpwsbsp4nEX8kEVZ8te2rJXC3jfaMia36mXPyLj7/EoSepFvWh/LKld6y0GeX+
 JpyFgupGXsGHvQA8gu8iPVG9BbCoQeocM+1TIXH1fJLjAWYxp+LpNgpQlPAfD5zo8JvT
 PSIvFXRn6Vu6VZlprLXBP3Un3qwv+UXKKb9gu1pReQ9wDrViArw9madpwF2aUQjDNsaa
 Dyf1pRjANxhDVN8Lx3ujylPZdG3LFXWSqvwZ14HIHW+Re8w6kTIKiDGVH4PrMDQDUgrA
 lPDUyY0IXf39kTm/hN/NlnH/mlK/sXA4zC0WR+QUwTAaz1WH+RlACa8GhOxIKm1kK9j0
 W+Pw==
X-Gm-Message-State: AO0yUKV/cldpf3/J70O41aa/GTKT9W1CPe6pwCdMy0rlMEWaNvk1+FQK
 2KZ/0afXdeVeD83d2VDWZO9GOirTZGoa6mGt+J8=
X-Google-Smtp-Source: AK7set+NE2jxAdXjU83pkrr9Cq8U7sIveLEXAGfMDNb3vqXEoTWCQsVHey3Jkjwm/4YUmKgKkpdPXg==
X-Received: by 2002:a05:6a20:a10c:b0:bc:d651:f267 with SMTP id
 q12-20020a056a20a10c00b000bcd651f267mr5573881pzk.2.1676526494341; 
 Wed, 15 Feb 2023 21:48:14 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 11/15] linux-user/sparc: Handle privilidged action trap
Date: Wed, 15 Feb 2023 19:45:12 -1000
Message-Id: <20230216054516.1267305-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is raised by using an %asi < 0x80 in user-mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 61b6e81459..43f19fbd91 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -306,6 +306,12 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#ifdef TARGET_SPARC64
+        case TT_PRIV_ACT:
+            /* Note do_privact defers to do_privop. */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+#endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.34.1


