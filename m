Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242666FF593
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:11:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7vy-0005Lh-MW; Thu, 11 May 2023 11:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vu-00058f-MU
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1px7vn-00029g-6s
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:10:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so60658325e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683817808; x=1686409808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H53SzrgO3ToHMUxDNY/DRv16525yykIj2GicLYBw9HE=;
 b=hhbOXIpv8hae4f1/pgUX5pZtIlTUIB7ChkXXaTzwl1HzlWbRmgQ4RNs/FY1X7ExvMg
 K4HKVAmaaM6pwgOqih5Zc57OvS/6ynVkPEszdYTgtkWLCddYDabnAy3ZqVQV+SN6NUTN
 lMW9qi42i3q0jtgLMMjIFEoIkdZ6To0GWQeHiLMVN2PmnOcnw21LCa903L2f2PAl+oL6
 im+5OAQbDLAFGdGuCEQ1zwuu1JmKhwTvOFQwgYYQfnr0yZlAFKckAQg39wi6ZotjVPKe
 MlwQzwVSL9QEasJ4+6WCjTElD0fhfRv6cTYzy37jMzd0CGOSE6mG7XkSJeCgzN0icozE
 83Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683817808; x=1686409808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H53SzrgO3ToHMUxDNY/DRv16525yykIj2GicLYBw9HE=;
 b=DdNEV26vER9nQ3XzmBR5Duv7VcvcIZshP5Ssywl6J1JYBA0iZeGlWJ+HHYHh3//tPr
 c329xLANTLbz/zZcyq6LdnxZyDtUiSX3FYDhnHN2Yz9l0GjGseR/yJYtpKVgVIlQCey5
 8gqKSEDjlyVhlSyR2prz+5Tpla3A7q8lj4hSY6R8OVlPrSsoioESVoFd6sgfhdaioFbO
 l5wr/QGpM3SzGXko2xH2SRV/AJur5fPMf25J9cxDPLU4uAY2/MKo84u6ei/24GD8yJzW
 X4/e9i9EXPikZ26VRiWPlpv+ZYgjsoN01g7vT72Zu2b1APUZVUhVENbauuCJgGM0M/9+
 2UGA==
X-Gm-Message-State: AC+VfDwP7Roz7kGbpvRiMEKv9wjFTDJshs5dAIkq+NnpIVWw2juooi5+
 aZXPp4mpjo51oeZsgk7idEEw8egn83E=
X-Google-Smtp-Source: ACHHUZ4DHwv/BLI291DFdbNZ5tWNK0c7ay1bRzeYlHINJGOP8kdOrTCbBv7xRNet7znJrRPZqIvNDA==
X-Received: by 2002:a05:600c:2047:b0:3f4:2452:9675 with SMTP id
 p7-20020a05600c204700b003f424529675mr10279607wmg.0.1683817807960; 
 Thu, 11 May 2023 08:10:07 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 d10-20020a1c730a000000b003f325f0e020sm25834044wmb.47.2023.05.11.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:10:07 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Date: Thu, 11 May 2023 16:09:59 +0100
Message-Id: <20230511151000.381911-4-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230511151000.381911-1-shorne@gmail.com>
References: <20230511151000.381911-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

OpenRISC defines tininess to be detected before rounding.  Setup qemu to
obey this.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Since v2:
 - Add reviewed-by
Since v1:
 - Remove setting default NaN behavior.

 target/openrisc/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 0ce4f796fa..61d748cfdc 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
@@ -90,6 +91,9 @@ static void openrisc_cpu_reset_hold(Object *obj)
     s->exception_index = -1;
     cpu_set_fpcsr(&cpu->env, 0);
 
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &cpu->env.fp_status);
+
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
     cpu->env.picsr = 0x00000000;
-- 
2.39.1


