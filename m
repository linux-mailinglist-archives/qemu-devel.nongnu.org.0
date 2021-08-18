Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E23F0C7F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:13:43 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRwU-0006hQ-Im
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9z-0007nP-DD
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9x-0002qJ-Op
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:35 -0400
Received: by mail-pf1-x434.google.com with SMTP id t42so618342pfg.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1cpsMDhGC9RcGcWm5BcMRPq9nZ7pllN/pajlbOR5Sm8=;
 b=oxbEo0pygBTOkb0waG+IBooSMcA13T9GWsz4x4lOJbte8OM5JorQq1WvMAIK+ZoWg0
 Sb8N0OcqS8TAz9MZ3FXWubLV88tbysb/818FW8gH3d/UYfCLG+twbxGQkqhbm8wXvhN1
 QHYJSgDUgvpEtPOQUSPLfQHlgvOzA/sh1/T//lSZfUUmmz2U4LkPL6jZ4CsTr64BIjoo
 5kjr+4Mfi0bLaQco555CUjMmzEn8lO1UC6bAOdbflRgA7ebb7dmpzuM5aHa5J9Lw1ASA
 MzstwzxxQiK0CDRQwkT1ppQQd7XAOSh6r30GacZ4TbfOcS9QYk6wWS6f0vAnvuWnW+uI
 S6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cpsMDhGC9RcGcWm5BcMRPq9nZ7pllN/pajlbOR5Sm8=;
 b=PfiAyZBufXfZ6iiSOW8Zje/xyx9tekE17aphWNScjeajvEHe/Vr//WJ0xNMVfPN/ZY
 GSGHsFVkTE4ugfscaeAVLnDy+MPb2axLnsUEx9dg+pd7NIadBWQfF7RNx0RS5DXVoiaj
 hGvY8keYegXckTDRlaAhC6qB5gXMledLdNDLpGArjWvBxP1CuMNVGM21sQ+IR+lb7XXK
 We9kQGnPdX2isITAHYdLjd21ywZHtPRu7F9MrfEOqiD9C10CpOq93TcjLDVWx0KCi7wi
 JsrXLzt7cmjitkMhA117VVNHwM24LUvrxRQAcVN+t3QdBZ6B109fyoJL9oRhw00kZzz0
 kD3Q==
X-Gm-Message-State: AOAM532NvnT3L/e9V0I8zBu5GgFW7OvbnXfkCkcnDD7v5hwf8pBMUprY
 4xgVn9OubrtOkFuC522WBrfZhrJ1n06pRw==
X-Google-Smtp-Source: ABdhPJzVjXy9bTAEfVi38Z9IBpPhCijsPeEBnAKHmAQTyJRDuek1QdvufXHOuG+Uhtdjxx0IDghOJg==
X-Received: by 2002:a65:448a:: with SMTP id l10mr10266182pgq.313.1629314612078; 
 Wed, 18 Aug 2021 12:23:32 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 57/66] accel/tcg/user-exec: Convert DEBUG_SIGNAL to
 tracepoint
Date: Wed, 18 Aug 2021 09:19:11 -1000
Message-Id: <20210818191920.390759-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c  | 9 +++------
 accel/tcg/trace-events | 3 +++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 6a3fec3002..1c9486c76d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "trace.h"
 #include "tcg/tcg-ldst.h"
 #include "internal.h"
 
@@ -45,8 +46,6 @@
 
 __thread uintptr_t helper_retaddr;
 
-//#define DEBUG_SIGNAL
-
 /* exit the current TB from a signal handler. The host registers are
    restored in a state compatible with the CPU emulator
  */
@@ -133,10 +132,8 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
         abort();
     }
 
-#if defined(DEBUG_SIGNAL)
-    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, address, is_write, *(unsigned long *)old_set);
-#endif
+    trace_sigsegv(pc, address, is_write, *(unsigned long *)old_set);
+
     /* XXX: locking issue */
     /* Note that it is important that we don't call page_unprotect() unless
      * this is really a "write to nonwriteable page" fault, because
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 59eab96f26..d54416f2ee 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -8,3 +8,6 @@ exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 
 # translate-all.c
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
+
+# user-exec.c
+sigsegv(uintptr_t pc, uintptr_t addr, int is_write, unsigned long old_set) "pc:0x%"PRIxPTR", addr:0x%"PRIxPTR", w:%d, oldset:0x%lx"
-- 
2.25.1


