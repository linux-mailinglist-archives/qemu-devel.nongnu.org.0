Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343626510ED
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jcj-00016r-1R; Mon, 19 Dec 2022 12:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcg-00013B-Ie
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:18 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jce-0008Cc-Pc
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r8-20020a1c4408000000b003d35acb0f9fso101313wma.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I9jBzjhbP9BR4+xEVxqmNR4IAreTs/c1FrP+L03MM4=;
 b=aSQBYpy+/FWW9BxI/g7cyeyIGqgq+EHHrxC0PMs/lyo1kFGtWdDED/v4HuSGuKGOQJ
 sanX4cuo3HQTX7ppv/Y/QkAvG3vthFkw7g4UNP3QANENyzrfMGBKeS1kZSz5PGnVcb3e
 tYFFaAI1XbDaeCZCk9wNsp83rgFVtRRyqFVSUA8RT3GN0UWupq9U7X1CmeUA7YwRfQcR
 zJ0yELV8/jvHygoKusgmpB5tpEt0uEEcEes73h8SRHTV99RX3Lbyc58x/MKgLB10b/FA
 TBMKFvNXGdgKHZ7ybSj4Bn8gG2lfd63A4G3Hk5A1GYlKFM0me4zwttL4G45ehUky2x+8
 TApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I9jBzjhbP9BR4+xEVxqmNR4IAreTs/c1FrP+L03MM4=;
 b=eXP2SHCsP6aQAmLO7U+V5E2dhnX7vYz8batzYDDkICgqhzdLwQw6GJ9alBPxOwCUZ+
 1+Zd4SjgZDBhij9AnoeBjXTciqt4qHFaHk7zKnurEDtqrSg/H1o4Xi6w+xK72+5uq5VG
 PAhIwTndjZ+lpQduIf9ej2HCyUvbqkzAg6vcQNoF48XSxsAqdzNQP6hZ2pTG+LmgLfVZ
 YuOvsaL6gmx8kfcux+wbkTheBkANwUOGaEdAonPjIhKYCKDTuUW0d6dlCjwN8mq8uJqh
 i0agzBF1KA396eIFqHa56kxvTkUgA0abdX0XUCwnZ7X0mp8ZMObtJgv1Y6VcRyC/kgls
 a32w==
X-Gm-Message-State: ANoB5pk8Gxq11v6Advr4uTVH0AJysczmAdun8rz9RHXDaoQHePM8SnfY
 sq5iyx3SNnt8pgia5yfqYFu1T0OqqvB5HrrY0no=
X-Google-Smtp-Source: AA0mqf4zMyamm6B7F2S5YQk8Asfox2enatuhelHcGPjjJWJnzglZelV/GhMH8RSa/JrJsdpBzU3sxA==
X-Received: by 2002:a05:600c:6543:b0:3d1:fcca:ce24 with SMTP id
 dn3-20020a05600c654300b003d1fccace24mr31310337wmb.32.1671469694960; 
 Mon, 19 Dec 2022 09:08:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm22246964wmq.2.2022.12.19.09.08.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 09:08:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 1/5] exec: Remove unused 'qemu/timer.h' timer
Date: Mon, 19 Dec 2022 18:08:02 +0100
Message-Id: <20221219170806.60580-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219170806.60580-1-philmd@linaro.org>
References: <20221219170806.60580-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c      | 1 -
 accel/tcg/translate-all.c | 1 -
 include/exec/gen-icount.h | 1 -
 include/sysemu/cpus.h     | 1 -
 tcg/tcg.c                 | 1 -
 5 files changed, 5 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..298149ed07 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -29,7 +29,6 @@
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
 #include "qemu/compiler.h"
-#include "qemu/timer.h"
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ed6656fb14..dea5ca81b5 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -49,7 +49,6 @@
 #include "exec/translator.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
-#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 #include "qemu/cacheinfo.h"
 #include "exec/log.h"
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..166170b08e 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -2,7 +2,6 @@
 #define GEN_ICOUNT_H
 
 #include "exec/exec-all.h"
-#include "qemu/timer.h"
 
 /* Helpers for instruction counting code generation.  */
 
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 1bace3379b..0535a4c68a 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -1,7 +1,6 @@
 #ifndef QEMU_CPUS_H
 #define QEMU_CPUS_H
 
-#include "qemu/timer.h"
 #include "sysemu/accel-ops.h"
 
 /* register accel-specific operations */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd..1071fc00fe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -34,7 +34,6 @@
 #include "qemu/cutils.h"
 #include "qemu/host-utils.h"
 #include "qemu/qemu-print.h"
-#include "qemu/timer.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 
-- 
2.38.1


