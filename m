Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C054392364
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:50:49 +0200 (CEST)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3IV-0000S3-VH
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FN-0005gH-1H
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:33 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FB-0004To-MJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:32 -0400
Received: by mail-pg1-x531.google.com with SMTP id 6so2296282pgk.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NKrR+Y1HHSCDluHdieEW79BiIBCD6gCzbNQyl4SjDwo=;
 b=pPkVqmsYA/T5h4tjidjw8D5DDXKdQGPUiDcVfPV+/UPFIBOS1nYDuJvFquAbZ+q6Dh
 s3SvVonUhR6lzc2WyVk6GFQEEq+wnDjdacLajx1wv52G1aOkb+khcriPwhjuw3tWiHl7
 i1ElN47eoANZYm04hkulvI/3/+Tg12yHrWQohiWTzpMAs6XCnZc5CAO5DmXShpxw0wGC
 T48MMSVgv2rCi/8We7PGSbs2ftcJll/lySLaJrYTFGUB2abSrQLMJzefXuLZfv1gtGf8
 8AbGHlthThYRNSfnGH7HMIEm/RFjglwJNZurFCk8mIR+Lsw7oUZC5jqCOBBIkygbgVrE
 0plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NKrR+Y1HHSCDluHdieEW79BiIBCD6gCzbNQyl4SjDwo=;
 b=gJNFxnELHiShfAXL77appI2ERuEwQsPp91epWRCs8D6YjxO0uPjCVSTKdbfajwSLqT
 ub7lPBmnC/Qdz7zUUwYizJEA9fwvnMqTYesJ6kybVINIbyoBw/agoouRfhQLVP8oXLVO
 32QIQe9eplwYc+3T82lbGZh0UoXeFtDxwrxDUIO7GXS3lcx8hb4ncwuPcMnzLoW64eXR
 VqpT1PLpg6//vuw2X/noRpiEbS+M0zWt8/FnMcMWNUhiutel+jL5FueRbqCLntvIAcAN
 gQGX2j4ybIESII4XGiFZfE53HL1Z0nVy/jY4vlBz9PDTxgvxtTGyaqMHHl4AOd8hL9ZM
 hrBQ==
X-Gm-Message-State: AOAM530S65ZJLHvSRX4qyw9TbFF8s3kZjtV8H5idljofffh6WLNWU8T1
 gFnpQUovnNCo0kjNgSmXPo37m9khldzruA==
X-Google-Smtp-Source: ABdhPJxmj35c7FEM7aTc5cLJCVqw/Oa84swZjjCGtLpnT3VXn+V2I+qiN7+Rl7GWTfwZFlgjuAUsDQ==
X-Received: by 2002:a62:30c2:0:b029:289:116c:ec81 with SMTP id
 w185-20020a6230c20000b0290289116cec81mr960600pfw.42.1622072838487; 
 Wed, 26 May 2021 16:47:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/31] accel/tcg: Reduce 'exec/tb-context.h' inclusion
Date: Wed, 26 May 2021 16:46:46 -0700
Message-Id: <20210526234710.125396-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Only 2 headers require "exec/tb-context.h". Instead of having
all files including "exec/exec-all.h" also including it, directly
include it where it is required:
- accel/tcg/cpu-exec.c
- accel/tcg/translate-all.c

For plugins/plugin.h, we were implicitly relying on
  exec/exec-all.h -> exec/tb-context.h -> qemu/qht.h
which is now included directly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210524170453.3791436-2-f4bug@amsat.org>
[rth: Fix plugins/plugin.h compilation]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 1 -
 include/tcg/tcg.h         | 1 -
 plugins/plugin.h          | 1 +
 accel/tcg/cpu-exec.c      | 1 +
 accel/tcg/translate-all.c | 1 +
 5 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8021adf38f..754f4130c9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,6 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#include "exec/tb-context.h"
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0f0695e90d..74cb345308 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -27,7 +27,6 @@
 
 #include "cpu.h"
 #include "exec/memop.h"
-#include "exec/tb-context.h"
 #include "qemu/bitops.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 1aa29dcadd..55017e3581 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -13,6 +13,7 @@
 #define _PLUGIN_INTERNAL_H_
 
 #include <gmodule.h>
+#include "qemu/qht.h"
 
 #define QEMU_PLUGIN_MIN_VERSION 0
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 0dc5271715..10e11f27bb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -31,6 +31,7 @@
 #include "qemu/rcu.h"
 #include "exec/tb-hash.h"
 #include "exec/tb-lookup.h"
+#include "exec/tb-context.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 640ff6e3e7..e9f4de5190 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -48,6 +48,7 @@
 
 #include "exec/cputlb.h"
 #include "exec/tb-hash.h"
+#include "exec/tb-context.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
-- 
2.25.1


