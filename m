Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68B6F51A2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:33:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tl-0005ET-SJ; Wed, 03 May 2023 03:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6td-0004v3-8q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tb-0005iV-3j
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11850405e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098845; x=1685690845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ5fwNriFOJMunwUullpRhczt9WK0ojq3s0G8gYMW4c=;
 b=fs4L8Sh8P2eE7pjiyQnLrRLn3Mas0qZl8bixbL60o4rxQfBJtTSGtU75/u5VVDN77U
 KdUsftLL9P1E7L8n6t/NUFVGdk6NOo++7/X91v+SVYlL1cojTwceGEPnv/qf6+mSzmD1
 V2WrWdB4jwRsqjhMpZPF04H7enzcodH5JFwZbj+O1m6zcdiseNE9GVC91FX0E0rnoqIg
 /1zV02oSkakFx0MtTW2Ebj8IzWjzY6YOL6slrYYmHUdRt3sPu+2ESywV3nxBpXh3A7Sg
 5+pq9uTjkU4Ikf6WLqA37rW01jKC78sv/xjS52FnczRG2pB9x0hc6aV8iUU+OpliLYIE
 7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098845; x=1685690845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZ5fwNriFOJMunwUullpRhczt9WK0ojq3s0G8gYMW4c=;
 b=AK7gNtRt+9ZjXGK3IGJm/opuiNd21XJhJUQ6w4YdWE5+JLpXql3aRToDkmk7uWV3aG
 Zcx+0G2MCLIAifgcqZC9xusVPflhzu0yKAY4ZYk9Qiq4+bmJodF6PkRl1ou4UKrCg8NK
 Tym0IOr81e8srFc2A+2bQvoaT608rzypUApd1atl2ZjKLuGG8HsOBwr4jJ38MBa411T0
 T3eKGkxLJOuLFA1zz6NeI9PK3e1TVYrhtaKWcYnc9v2TPHHHN6UBpnLaS0C6liTXaYli
 a/Pby1Mr3fy0M5oYJ047+5GY58o124U/AXxX5mvlwFPQxQhRajUN1tAcUxSIAPVJ505+
 2dyg==
X-Gm-Message-State: AC+VfDzlGu0sEV22iJ6mxLHh+nueqxmJdrdikFlqIamGX6J5RolbGjLn
 cpVMthcMh85rtrbh/bwAjBHeUHqgd3XDpWgFF5KYoQ==
X-Google-Smtp-Source: ACHHUZ7rD+n68ZoMv9bdowMIqqGHAQwX83ZBDvg/QXwz2IQNoWNd+UON0kHzYKkX1Xr+kbiqMUM2sg==
X-Received: by 2002:a05:600c:4585:b0:3f1:80d0:906b with SMTP id
 r5-20020a05600c458500b003f180d0906bmr779034wmo.4.1683098845692; 
 Wed, 03 May 2023 00:27:25 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 70/84] *: Add missing includes of exec/translation-block.h
Date: Wed,  3 May 2023 08:23:17 +0100
Message-Id: <20230503072331.1747057-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This had been pulled in via exec/exec-all.h, via exec/translator.h,
but the include of exec-all.h will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c   | 1 +
 target/loongarch/translate.c | 2 +-
 target/mips/tcg/translate.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 8fb5c38a4e..6cd60a6159 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -22,6 +22,7 @@
 #include "tcg/tcg-op-gvec.h"
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
+#include "exec/translation-block.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 03b806369d..0e0abf407d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -8,10 +8,10 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "tcg/tcg-op.h"
+#include "exec/translation-block.h"
 #include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 #include "fpu/softfloat.h"
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f3da05ba3b..74af91e4f5 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -26,6 +26,7 @@
 #include "translate.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
+#include "exec/translation-block.h"
 #include "semihosting/semihost.h"
 #include "trace.h"
 #include "disas/disas.h"
-- 
2.34.1


