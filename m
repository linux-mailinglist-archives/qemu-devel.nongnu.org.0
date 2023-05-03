Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252F66F5208
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rM-00050g-FY; Wed, 03 May 2023 03:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qZ-0003Ya-4I
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qK-0001n9-0B
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso870342f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098642; x=1685690642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPpDHaGu2W783WXEJBOafms8AwwjAB3ql2IEU0+tgxU=;
 b=ssMVmUFsams5GEc7M2a4Is/yHsAuEALlVcngkXt/E/B55jl/osgHIM67jHoPix8tzK
 UzKSCRFk+iD8uRW5vHukXuXCsS5DOJLKhf0MKue2P8n+z+FmDGK4EW2MrA6Dvg16lwi8
 PerVbdyZtCpWBtDhv1RZ3TZ6r2UP1Bi2+ql4mknCL1+AM1IN0F20NFb7LX+gUO0lH0hZ
 u4cNoknt78ib0IT7t2fCjrtGhmaAZE86H1lWmUHzCqiHO/bZT/TrEqTSPOm75Aj0N1wF
 OVj7NjYpQukRJW7ylbTaxVaDnYVWZhL5+yhog9/2XQtxjE6iKb0GlrHiiC5kSP5zfqF7
 6mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098642; x=1685690642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPpDHaGu2W783WXEJBOafms8AwwjAB3ql2IEU0+tgxU=;
 b=UKC73LEdNvmuQ7J0mnxr6qY62WB+mNxTa7jgdgtWVtDj0KE8azGXliKNzwPN4hnR15
 qjM8e52n7s96UPMrjTrileonNSq2k4bu9CFHbwRuA8LJN0pd/2GJ3rzKkj19/5MpR1UK
 Zg2mrZ8OifFaOMXuLJt8w+QuGug4d4hQXf4bauzmsQAHJJd7/Q0IOA1XnwnSV/SPN+6Q
 A6uJoEFcAnzycXo3fOcGZBMclIVlsifkQmjs1ptowYxwRZDPjp24I1FjyzthsAJt4XDD
 leDrI3AOs0yM3/yTuO/MAe0urLvYiH6bQqqkVqaq5VbgtXa/xYDJ9QeqrVL8ZBV9hDCR
 1oJw==
X-Gm-Message-State: AC+VfDx/My4z422A94FQeewBqN8t3vm3GjA9qfgLLqeCSEnLK+uE6/ND
 Oe03smS1K7HUVpZMwh8QueUqnt25cIxXX/P2PQXejg==
X-Google-Smtp-Source: ACHHUZ4xSm/Qq75/2ZHPYVFmUlriHnov3WhtNyEBuHnB3jCyIzCOo9Y8Ztx2i430GqEWSLoENmTbyQ==
X-Received: by 2002:adf:ef91:0:b0:306:36ea:8368 with SMTP id
 d17-20020adfef91000000b0030636ea8368mr3338509wro.44.1683098642464; 
 Wed, 03 May 2023 00:24:02 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:24:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 39/84] *: Add missing includes of tcg/tcg.h
Date: Wed,  3 May 2023 08:22:46 +0100
Message-Id: <20230503072331.1747057-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This had been pulled in from exec/cpu_ldst.h, via exec/exec-all.h,
but the include of tcg.h will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/monitor.c             | 1 +
 accel/tcg/tcg-accel-ops-mttcg.c | 2 +-
 accel/tcg/tcg-accel-ops-rr.c    | 2 +-
 target/i386/helper.c            | 3 +++
 target/openrisc/sys_helper.c    | 1 +
 5 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index 92fce580f1..f171bc6f5e 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -15,6 +15,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
+#include "tcg/tcg.h"
 #include "internal.h"
 
 
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index d50239e0e2..5d72c9b1bd 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -32,7 +32,7 @@
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 #include "hw/boards.h"
-
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37f..07c5630847 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -31,7 +31,7 @@
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
-
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
 #include "tcg-accel-ops-icount.h"
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 8857444819..682d10d98a 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -28,6 +28,9 @@
 #include "monitor/monitor.h"
 #endif
 #include "qemu/log.h"
+#ifdef CONFIG_TCG
+#include "tcg/tcg.h"
+#endif
 
 void cpu_sync_avx_hflag(CPUX86State *env)
 {
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index ec145960e3..17598689d7 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -26,6 +26,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
+#include "tcg/tcg.h"
 
 #define TO_SPR(group, number) (((group) << 11) + (number))
 
-- 
2.34.1


