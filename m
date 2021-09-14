Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB740A1D5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:21:37 +0200 (CEST)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwCe-0001wm-Om
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6M-0001fS-NL
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6I-0007aS-M9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso742362pji.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qLOJ7aAC4BizQd/i02xX0hEQglVCR9hQiC8rfWR7Us=;
 b=UEtlRyLrx6fxMRdBYw/fWpU8Ba2A6Ps87VtaE19hP3a0pgbVrGR8C6a0HK2XZOvqRR
 ZSbBZh/2blQgEhc5RaBfPc3xytwgqgoc/5ozi51ir2umeAalw2muPOyGfg2+y/CIb/1P
 LYAUzXqJnZxk5LzgIemw411NjwPUuDeyJ0qRXTWxR4HVr1/AbPCx1lEZm0NNkBd8KShW
 HFgDX6w1gNGXFN/i6EbU47Vx7OkRq8qZNCOvai84KgjEcTt3EVmXmZgw1UIhOlMOiQEK
 a3/az934LEdosPWl8Vc2BP8SRkJohuXsAglefDDUKcNmK0P7fOtEID4vBZ6mFuW5s4a1
 XKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qLOJ7aAC4BizQd/i02xX0hEQglVCR9hQiC8rfWR7Us=;
 b=hU0Tu8AIAft0tP7e8rpOJ8sEKHMH4DVjm15sgZa7boz6G/NzsCcVrdgPF4YxCY/wx2
 ikuVZtFF5gntaMBIH4y1FxKkDl+vX3szkv6/ISQrMbwsmU2ba8FNg0n8m5mxPveH9mFd
 tLikz5whCKebu/M6DMqOsY6J3lPRLQ7u3vpL83gDBZjjWaF/D5NoR56H5k38iVI4IHEX
 rVKD2VjQ3CkQv7QeV7ITKjcJAfizGrmnbhzoc0N2FjPvYBcxcn9QOZaTpe1mLI+46nTO
 V/LqeQj7mH56iQEtrMPYoglnnZneQI30prghHAghyFM4dQUZZFJINJymzNAIzHqV8yHt
 3IpA==
X-Gm-Message-State: AOAM533uZ/w86kT7iHMZ9qH5ETxa7eXhn8Uh8Z6sbJ75J6S06lSxMcp1
 hO/tFBtRq3+qENuPMOZRJW0DaQuyHZ6wLA==
X-Google-Smtp-Source: ABdhPJw/l4ZNQnHwsj0z3ffU1LFcimZTWP+WVFaa3gjDeZ5PBCvIuyw3UsGVH5eJ5nW3gBeBA52/tw==
X-Received: by 2002:a17:90b:17c1:: with SMTP id
 me1mr2520276pjb.28.1631578501086; 
 Mon, 13 Sep 2021 17:15:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/44] accel/tcg: remove redundant TCG_KICK_PERIOD define
Date: Mon, 13 Sep 2021 17:14:16 -0700
Message-Id: <20210914001456.793490-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <lmichel@kalray.eu>

The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
Remove it from tcg-accel-ops-rr.c.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210811141229.12470-1-lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c02c061ecb..a5fd26190e 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -60,8 +60,6 @@ void rr_kick_vcpu_thread(CPUState *unused)
 static QEMUTimer *rr_kick_vcpu_timer;
 static CPUState *rr_current_cpu;
 
-#define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
-
 static inline int64_t rr_next_kick_time(void)
 {
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + TCG_KICK_PERIOD;
-- 
2.25.1


