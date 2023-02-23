Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246726A13A2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKr6-00006c-5U; Thu, 23 Feb 2023 18:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKr2-00006L-Nu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:24 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKr0-0000Uc-1r
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so637688wmq.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3swxdcDHt7SWz/NHP9p3WXbEpqYOBVxykbO5R3hJM2k=;
 b=GUhG9Cp/xmzJeun4ct0s9wOfLBSh+VPuuF80imKKQYwKfRqBaYxOATm0jNXvCcZV50
 GYSjyB75lrdpys5KLTsXPMyl70vCOmXN3091zF8q63QuNwUmk6T0xvMf0HQn/PL8BPrg
 w6vMxlC9E6Wt+3LPAAV3nKKnHXqx+ZXAUE3PvZQ4UxxnuWAnaoAHUQJzVtuuVrOpnj+T
 bFXU/67CpeQTnpy3JK9bROAXZvD4l3U2C1CIATVaU6SsBkR1Nx2XRocGGtH/iPHSOf3S
 oBzAy/t12w1mxVdl7MkFQDnU3nbEL5rTE2axnJG0MHZ56zuoYo83BbRlyTSsO6WCF+5m
 5ATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3swxdcDHt7SWz/NHP9p3WXbEpqYOBVxykbO5R3hJM2k=;
 b=urYYRXJd7ycVNLpqhpQI8MzEfu4bueRh/AuIR9WoDHhq8AEciXJ9SJy/jecP5sa+5K
 ohXuSqDqLLYpT3Uq9z5ITpCE3WibpQEiT7TH/3Vqk3lP/0R/+bUiS5XbfAsBvAKL8DOM
 aEnOTmMk52EtABdBWxz+AMuBru4oDEZPFjNhCHX6rvCGHOuV1ybicruKs4p8/owfKkpN
 J732drFoW6izDCSlcgG/wvb8g5kiPhcpwUTxnqRwzxXfHbAT0dFACkCMUmWSAM8PdwFu
 52k1RqH6pWGjqDA+MExrX8Piep72WAAfX6uG5Sw7cSWv2I55e4ESrgvdWr0Qf0shQOt5
 KayQ==
X-Gm-Message-State: AO0yUKXjbt1vKVuKkRmv0Q4gE49zQiiD5A8tL4oS/LGTyRPlhjPCcMEf
 U41cm8a0BN0bAw+Tp2/6/R9UcEnwsohHOg3h
X-Google-Smtp-Source: AK7set/dQmAfiBB+27PaofkG4lJGIEFaLiagYWmh8oWkC9NBSZhVpqYIjaqbfKq5Wbyr0hHk6RQE4Q==
X-Received: by 2002:a05:600c:3b85:b0:3ea:e7f7:65e2 with SMTP id
 n5-20020a05600c3b8500b003eae7f765e2mr1155976wms.26.1677194299096; 
 Thu, 23 Feb 2023 15:18:19 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b003e8dc7a03basm744716wmr.41.2023.02.23.15.18.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 4/7] dump: Introduce win_dump_available()
Date: Fri, 24 Feb 2023 00:17:52 +0100
Message-Id: <20230223231755.81633-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Remove a pair of TARGET_X86_64 #ifdef'ry by introducing
the win_dump_available() method. We'll soon extract it
to a stub file for non-x86 targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c     | 23 +++++++++++++----------
 dump/win_dump.c |  5 +++++
 dump/win_dump.h |  3 +++
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 3784a9054d..c356a88be1 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -30,9 +30,15 @@
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
-
-#ifdef TARGET_X86_64
 #include "win_dump.h"
+
+#ifndef TARGET_X86_64
+bool win_dump_available(Error **errp)
+{
+    error_setg(errp, "Windows dump is only available for x86-64");
+
+    return false;
+}
 #endif
 
 #include <zlib.h>
@@ -2130,12 +2136,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     }
 #endif
 
-#ifndef TARGET_X86_64
-    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-        error_setg(errp, "Windows dump is only available for x86-64");
+    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP
+            && !win_dump_available(errp)) {
         return;
     }
-#endif
 
 #if !defined(WIN32)
     if (strstart(file, "fd:", &p)) {
@@ -2217,10 +2221,9 @@ DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
     QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY);
 #endif
 
-    /* Windows dump is available only if target is x86_64 */
-#ifdef TARGET_X86_64
-    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
-#endif
+    if (win_dump_available(NULL)) {
+        QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
+    }
 
     return cap;
 }
diff --git a/dump/win_dump.c b/dump/win_dump.c
index 12b7da5da0..ffeef4b738 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -24,6 +24,11 @@
 #include "qemu/win_dump_defs.h"
 #include "win_dump.h"
 
+bool win_dump_available(Error **errp)
+{
+    return true;
+}
+
 static size_t win_dump_ptr_size(bool x64)
 {
     return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
diff --git a/dump/win_dump.h b/dump/win_dump.h
index 56f63683c3..9abce289ac 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -13,6 +13,9 @@
 
 #include "sysemu/dump.h"
 
+/* Windows dump is available only if target is x86_64 */
+bool win_dump_available(Error **errp);
+
 void create_win_dump(DumpState *s, Error **errp);
 
 #endif /* WIN_DUMP_H */
-- 
2.38.1


