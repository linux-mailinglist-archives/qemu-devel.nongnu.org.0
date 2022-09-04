Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772935AC346
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:42:47 +0200 (CEST)
Received: from localhost ([::1]:47532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkHG-00084V-0G
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1P-0007uU-93
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1N-000314-MI
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so4035532wms.5
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JzE3BnwXRopw8l+GYkEmSmqp7UW2cE9nuMRHARwLvoE=;
 b=l5wOQriXCYObMfQ50ZyW2BPzkUa1iomPA4cRZLrkeyqwLYVGT5GSNHo9IbFWF7Usa/
 7DpWtnUhKf85f+lsYg/tLX0i9D2UZuLMbIJo+HoDGZDxgNhq+j5ATYm9UcHTJWrYKSTM
 2c4ncwlCQ+xKQVqHrERYsF2QUZAyFckFxWFCVqYhtWlwUAUSDGDjVfZijPG0hcXJnAqW
 7APXOwp5FOgXIagsdF3/SvMrqYCagj10DiaXQpke+fX5niMibmB/aiYAPBmLV33dgWrK
 plGyOtp+nJOgIY01l8G8mtAXpU53tn/qsvbgULOmc/nF5dIXfyHsIvbdVVLVX2QKdBqZ
 w+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JzE3BnwXRopw8l+GYkEmSmqp7UW2cE9nuMRHARwLvoE=;
 b=AF1pZh1Ixwc2Nv3+nz7zF+kol/9rpelXI0PhWIm7NTSZZTLzhHhExHOCoA9AZY4rT9
 pR5TsRgJ37CZM4xBuoutIkKMlZIkXVysW0s+mwUXmnf/yYORRPB+S+u2gomXaEVT1S/g
 KhrTyCeDgZKOzeGcacVIefwuA7SVw67zctcPunmggKqVZDQ+/FeHIbDnQfxhrfi5E5h0
 HfMvXvmAR15p3NJ0GPC3oEt3xJHBKYZV6dmUq8BTuavmR7mo7SIpIopsh0iFr0d5rSiF
 YRfL/DuyMmZnmBCDYeWkmonWF4QHaONhVZRJHW0PwoFga1aXRmqnSymp38inVLbEeSiV
 Amkg==
X-Gm-Message-State: ACgBeo16eEI/IvKfoorsi3N83cs5bzi92rBP1+NM+YxLkMDw0TsocuhK
 4mtco+107Cdy7gVHoJQUNYvtFJMWEZE=
X-Google-Smtp-Source: AA6agR7MOIEITAors4wvQjJ2Wr5SvZ4HMNRvAS0uUoJq83zvOAxiChumpWFURrNpjhRyProCkmc4Ow==
X-Received: by 2002:a7b:ce91:0:b0:3a7:b67c:888f with SMTP id
 q17-20020a7bce91000000b003a7b67c888fmr7722962wmj.187.1662276379052; 
 Sun, 04 Sep 2022 00:26:19 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003a3442f1229sm12924571wmc.29.2022.09.04.00.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:18 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/11] target/openrisc: Add interrupted CPU to log
Date: Sun,  4 Sep 2022 08:26:03 +0100
Message-Id: <20220904072607.44275-8-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we are tracing it's helpful to know which CPU's are getting
interrupted, add that detail to the log line.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/interrupt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index e5724f5371..c31c6f12c4 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -83,7 +83,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
             [EXCP_TRAP]     = "TRAP",
         };
 
-        qemu_log_mask(CPU_LOG_INT, "INT: %s\n", int_name[exception]);
+        qemu_log_mask(CPU_LOG_INT, "CPU: %d INT: %s\n",
+                      cs->cpu_index,
+                      int_name[exception]);
 
         hwaddr vect_pc = exception << 8;
         if (env->cpucfgr & CPUCFGR_EVBARP) {
-- 
2.37.2


