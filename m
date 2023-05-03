Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659516F5163
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:28:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rY-0005sf-1C; Wed, 03 May 2023 03:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qK-0002ZI-7u
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:05 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qH-0001mV-Po
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so49117095e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098640; x=1685690640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltltnSmlPnCka61roKfkDJCxGmwdYrh10AhkBoJXCRA=;
 b=AQmyeMVASsPxLF0x3c/9B168MqSQ6dXEKQr6MfusQjLVFEjZAi9dt3j93p8ayBuj0F
 X/d3CQkGDaXhKBu5FDM8sBLlXz5pDbC1BudasPOMqKanXPEugZj1eVzhkwkfc1tlHfXc
 xY9yh5zVzJSPlE3nzDLIhSHdyDHHp2bSSa5LEjeq+wehqlYE9RbeqTQo99uuZSEycm+e
 rMbLbZNja4c1qQi9MABasT8cld8jWFZEkiupgSgZ7M1EpJusX+sX65XmuG/QwD3g+cuN
 6MgR5eIT4QGZLTNO84glmg94XJKH9Ea6u2bqXzm4UnBEKiu9XBYtBeWOpppdF1PYZCMp
 H5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098640; x=1685690640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltltnSmlPnCka61roKfkDJCxGmwdYrh10AhkBoJXCRA=;
 b=WATM+0dVqZE1CTgJKnKQ3wQu5rW6Vo1de9dhVHacfJfRVvu4nb63I6srBfg+4yEOlv
 lf4DA+giqv9UOsNu4U1KcU9PI0ii4N3NGPckQMSlY6vaHIgBB0r2scjrvXXxtakI3qBY
 0yCksD7MqfQq6hR0yz+bwHwN0KoCUoad0vFpBezTrWlIYl86rqGs/15JGke2vUeatRAA
 TSJn+V0rm3DBIbNkYj/ww6nBdYwW/5tBpWx/ZzYAwQyxXvueiZ5HvWiFng7ZhFaPtuMX
 8w1EMm1jucjkrvAzEn++vMyyIIzpT+6J40xNuHixqloCKQ8UB0y0hDc4sHzEaNwXydvj
 hyjg==
X-Gm-Message-State: AC+VfDyMRc8XFl2aiHRn3rnyAr1yzBpODm+MXYBbbotm5KT4MXniogdh
 Fini+9JJ71TJdTjjy5tfj1nuoWiGBy+i9tLk0n41CQ==
X-Google-Smtp-Source: ACHHUZ6ktS6fZlkghDlraPqoYXdYi2q3l9pv/MTCubqiBLjV41NcWbFU9+/l4yP58F1vL0JGFspjMw==
X-Received: by 2002:a7b:cc1a:0:b0:3f1:969f:c9d0 with SMTP id
 f26-20020a7bcc1a000000b003f1969fc9d0mr13715241wmh.4.1683098640437; 
 Wed, 03 May 2023 00:24:00 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:24:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 36/84] tcg: Split out tcg/debug-assert.h
Date: Wed,  3 May 2023 08:22:43 +0100
Message-Id: <20230503072331.1747057-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/debug-assert.h | 17 +++++++++++++++++
 include/tcg/tcg.h          |  9 +--------
 2 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 include/tcg/debug-assert.h

diff --git a/include/tcg/debug-assert.h b/include/tcg/debug-assert.h
new file mode 100644
index 0000000000..596765a3d2
--- /dev/null
+++ b/include/tcg/debug-assert.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define tcg_debug_assert
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef TCG_DEBUG_ASSERT_H
+#define TCG_DEBUG_ASSERT_H
+
+#if defined CONFIG_DEBUG_TCG || defined QEMU_STATIC_ANALYSIS
+# define tcg_debug_assert(X) do { assert(X); } while (0)
+#else
+# define tcg_debug_assert(X) \
+    do { if (!(X)) { __builtin_unreachable(); } } while (0)
+#endif
+
+#endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 60d4923de3..57ea0b7d1d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -34,6 +34,7 @@
 #include "tcg/tcg-mo.h"
 #include "tcg-target.h"
 #include "tcg/tcg-cond.h"
+#include "tcg/debug-assert.h"
 
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
@@ -222,14 +223,6 @@ typedef uint64_t tcg_insn_unit;
 /* The port better have done this.  */
 #endif
 
-
-#if defined CONFIG_DEBUG_TCG || defined QEMU_STATIC_ANALYSIS
-# define tcg_debug_assert(X) do { assert(X); } while (0)
-#else
-# define tcg_debug_assert(X) \
-    do { if (!(X)) { __builtin_unreachable(); } } while (0)
-#endif
-
 typedef struct TCGRelocation TCGRelocation;
 struct TCGRelocation {
     QSIMPLEQ_ENTRY(TCGRelocation) next;
-- 
2.34.1


