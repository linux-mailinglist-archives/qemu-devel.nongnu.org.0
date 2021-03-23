Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACB346636
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:23:33 +0100 (CET)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkkd-0005IB-Ub
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhS-00071J-Rx
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhP-0008RS-ET
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: by mail-oi1-x229.google.com with SMTP id m13so17564216oiw.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbPfp2/HarteDkEoK6vgLYJvIbLA4R8fYVtBiQeWrMA=;
 b=J6YZsZvPADbB4Xg5jpNc62U9q/JlPrbXIMjOT85oQTuSbwiTDwcBmMMrc5z1GrqUYu
 t1vSt6vNt2GJwEPzHdo2hUTd14mbl7EjNGPB1ELEaGK585u6v7du8YEB2hKq8eQ1adQt
 UzHJ1HpQL1H9kmLPXq58x1Yc5V2oOWJo2aumw+D3bwk/X37Ud0oiuvVDkV446XD6R4VS
 Z3/v28EW7usr+uZ9kOFrxuSpOpqp2Abd8nZYrpMZiyMHZg8EsPbGaQNrW4aeln3MCEbf
 /0RyDnIlR22DI9f3x2ZWL5Ymfqvmdy5GB/YMtYaYXIuHZ0Kc9CZVz3aZ5c5A/cBPDamt
 hVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbPfp2/HarteDkEoK6vgLYJvIbLA4R8fYVtBiQeWrMA=;
 b=fNKO1YcmL30z9Uosw//vkP9Y/dBGmlQDLwKEhXihS/6ALFZPMNlSM9bjr9WGtDGsfA
 VMWloUOJAEz52BviPGBBm5RCWqwBL94euuGCa7HgDg7LLHTlsi/fkH7t4v22VDHpJl0l
 HfKB5O6HVtrqxV6p3W9q70tNZaOC3Tam04b2aX2UvFpjpZe1A3W3wQgh7sw9oEBv7DpY
 OGKWMQwuyxIF2yoOnjv4AyRkVJTdQwvFMwKvAcGoQNqTeZWptP52dHhNs0jwPqZa1AVS
 01ZzKFT8O1ImRvomYhtNVMglp/4zPn62rcyXNhggYfRmnMCK1bbmNDszrt/9zXJIVyyi
 XiTg==
X-Gm-Message-State: AOAM533IjkizVOAxJlEkqEMsGbp7vEL7oxFznaOuSfFP8KsMeolKIbSK
 jrq/G+6Tv9rItJCJXYzX/SU3oux6MXjuxdlf
X-Google-Smtp-Source: ABdhPJwLCC/7pjlJXqXiMfMz2zjhXg8TEmyj4xY9n11lgKSM0NLrmEZEow66k7tBa2jMb66HBZy8nA==
X-Received: by 2002:aca:61c1:: with SMTP id v184mr3887727oib.125.1616516166399; 
 Tue, 23 Mar 2021 09:16:06 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 8sm4317822otx.1.2021.03.23.09.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:16:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] exec: Extract 'page-vary.h' header
Date: Tue, 23 Mar 2021 10:16:00 -0600
Message-Id: <20210323161601.454996-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323161601.454996-1-richard.henderson@linaro.org>
References: <20210323161601.454996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, gshan@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we will extract the generic code out of
page-vary.c, only keeping the target specific code. Both
files will use the same TargetPageBits structure, so make
its declaration in a shared header.

As the common header can not use target specific types,
use a uint64_t to hold the page mask value, and add a
cast back to target_long in the TARGET_PAGE_MASK definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210322112427.4045204-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h   | 11 ++++-------
 include/exec/page-vary.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 include/exec/page-vary.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 76443eb11d..b0a422c7b6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -215,11 +215,7 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 /* page related stuff */
 
 #ifdef TARGET_PAGE_BITS_VARY
-typedef struct {
-    bool decided;
-    int bits;
-    target_long mask;
-} TargetPageBits;
+# include "exec/page-vary.h"
 #if defined(CONFIG_ATTRIBUTE_ALIAS) || !defined(IN_EXEC_VARY)
 extern const TargetPageBits target_page;
 #else
@@ -227,10 +223,11 @@ extern TargetPageBits target_page;
 #endif
 #ifdef CONFIG_DEBUG_TCG
 #define TARGET_PAGE_BITS   ({ assert(target_page.decided); target_page.bits; })
-#define TARGET_PAGE_MASK   ({ assert(target_page.decided); target_page.mask; })
+#define TARGET_PAGE_MASK   ({ assert(target_page.decided); \
+                              (target_long)target_page.mask; })
 #else
 #define TARGET_PAGE_BITS   target_page.bits
-#define TARGET_PAGE_MASK   target_page.mask
+#define TARGET_PAGE_MASK   ((target_long)target_page.mask)
 #endif
 #define TARGET_PAGE_SIZE   (-(int)TARGET_PAGE_MASK)
 #else
diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
new file mode 100644
index 0000000000..799d6310d6
--- /dev/null
+++ b/include/exec/page-vary.h
@@ -0,0 +1,29 @@
+/*
+ * Definitions for cpus with variable page sizes.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef EXEC_PAGE_VARY_H
+#define EXEC_PAGE_VARY_H
+
+typedef struct {
+    bool decided;
+    int bits;
+    uint64_t mask;
+} TargetPageBits;
+
+#endif /* EXEC_PAGE_VARY_H */
-- 
2.25.1


