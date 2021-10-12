Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD20E42A956
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:24:11 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKZV-0000GA-B1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXV-0005yS-1s
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:05 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXT-00040F-HO
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:04 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 75so14322859pga.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q7mA/5NMDye+T6oTs6PprYj8IGolC1UqhFN/enpkEuI=;
 b=U5AyijA/9NbFRVVwElD8cbfOHT12WJP9PBO6WI7JHzKeDxpOIrnxs2vdUDjx5xsgAD
 7cNW9maV+P05LhQNHjYcyXMq2kbySU/lG8dV8b2Y/BsmHg2ONzmnBB6oYowxOa2qI7TA
 0XpyzZu/kpO6uL31OmZ68Z5VtIS5Du+UPXW2eQMbYCPBQeMl8h6NnUVt+pDFsPYLLMmm
 x++IfzYZ3JnXDJ42VzH94Qe9WxErBSu4ahimN6rVa3NDKk+3Aay2qbRAvTbt/KnE68Jx
 ZHDgst+7BYMY1dErpRNbgcNk5n7ysHRtQ/wNyCbzogaq2UHQIyFkQnYuA4WyjMpjbknd
 kYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7mA/5NMDye+T6oTs6PprYj8IGolC1UqhFN/enpkEuI=;
 b=0Pqf7eJAXmz/yvrmB/Z4Bb86Kje5l8b7A+PLVrh28QRQopE5rnDLGN0iBfI9qn7KkK
 dQ6f0lE8CnAaW8lHaf9p6tqNnyjSGKQvRaacXP8h7lQmQ/MRPC10tVcrlgV492ppSFZ3
 9ALuZU8esQW084UO3BZeZobW1fMhNACSr5pzNLQV9WEu3Lgzvf8YITw/KnA0mvoTXth6
 oIAgvcMMbD2zTxtEVdcF3JaNxfppf6rlGuKRIvg9hPRYPY4ErIsNkmqyYncXf0Sma6VG
 ean5UnwLSH36IvRkmAi36bBO0q3QpePj0knostedIwa8QP1YCrRtDbPGIxJx4LIR4OdS
 6zxA==
X-Gm-Message-State: AOAM531XibTJjtb2MhpxD+tWODRrLXXZmqDVe7bNRm/mT+XD/cQWy4zL
 Shqt2BZ8eVPIXRid2am0AslwOEO0G53IJg==
X-Google-Smtp-Source: ABdhPJzypAPO37esvoOnrNiKIBmTyETrAdhwZhI16OVQRFv1IKEo6FNSazL3Ni7sfZgMJLw/DDysVQ==
X-Received: by 2002:a63:3388:: with SMTP id z130mr7053313pgz.476.1634055721857; 
 Tue, 12 Oct 2021 09:22:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] accel/tcg: Handle gdb singlestep in cpu_tb_exec
Date: Tue, 12 Oct 2021 09:21:37 -0700
Message-Id: <20211012162159.471406-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the change in cpu_tb_exec is masked by the debug exception
being raised by the translators.  But this allows us to remove that code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed3422..c9764c1325 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -383,6 +383,17 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
             cc->set_pc(cpu, last_tb->pc);
         }
     }
+
+    /*
+     * If gdb single-step, and we haven't raised another exception,
+     * raise a debug exception.  Single-step with another exception
+     * is handled in cpu_handle_exception.
+     */
+    if (unlikely(cpu->singlestep_enabled) && cpu->exception_index == -1) {
+        cpu->exception_index = EXCP_DEBUG;
+        cpu_loop_exit(cpu);
+    }
+
     return last_tb;
 }
 
-- 
2.25.1


