Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C3346F0D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:50:09 +0100 (CET)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOseu-0001zp-5C
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYl-0005xe-TK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:49 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYd-0005je-PV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:47 -0400
Received: by mail-oi1-x22f.google.com with SMTP id f9so19194392oiw.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 18:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbPfp2/HarteDkEoK6vgLYJvIbLA4R8fYVtBiQeWrMA=;
 b=CBsldl65VrNqA3HV3AryVPc8Knfy9N/Ul6+L8PpjECXw14NTsAQn7uJZgvgdbgY0o8
 zPBkXo232jm7DwZLah+RubrvqRWx+5jEfuM6JwTICZrXXJo3k0s68YYBwC7h/XVsiQdJ
 pYYybCDXJLgAxYaHR6VLtcMwnw2AFMw/UT56oRrK4JtMgySgzGokkjEjSR982vF0DMH6
 jKV/voifyqc/eXihp1rk3rhXNmdMW9/ZKjV1XBQ9Jp0W2XE8XPyPhsk59dV0sbrWhLJ0
 VRwe6HMq+R60U3vh0xZGTP00wqZ7v7KpHxz/8ib04H/2irp83HTsKK2TrZvme6qePirA
 UKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbPfp2/HarteDkEoK6vgLYJvIbLA4R8fYVtBiQeWrMA=;
 b=qzlIToUXQY8K9zkfWFRLYV3WB1vFMILr7eDU9qThAdAr26Z/nXJkBEUeMvRmvvc/2a
 VN6kofU6wAFlwLxABXj8T1VVV2Mfsu9EjDT3kGPCwHDgvdoDnyRntvID3xI2xqvDmt/f
 9Xi7cOYGc3lZS6CqwOK1zA3cWFjj7aSqOBsT9rIegRmOqZpQoLriV/CZqZaxbRxAaFCn
 Yd9v/YgllfoyBAH4/H3DNQtieMiyuYPHQc7GskkezkREpp/iJYg3wfWo/hJtC5u5JhmS
 BocbtRaMAQLM15keoY9HXxl+MScy82HUnlUhEetfylffhXaPRrIsj2I/9RNJFs/iEITk
 44Ew==
X-Gm-Message-State: AOAM531G18MxT9Wz1kw+SALOWXTXaBlYZ3AJQZXF/C4qn7aLAcIxUrMf
 Cwhp8wo14X+OewiN0u8ag2arU+XCPXFyxAlk
X-Google-Smtp-Source: ABdhPJx/EHdmD8sMrMibRoibr20yoKKWnh38j/zzq/MTAVpET9BSQaGcKjebvW2L9ws3XClPd82o9Q==
X-Received: by 2002:aca:4b03:: with SMTP id y3mr755120oia.78.1616550217935;
 Tue, 23 Mar 2021 18:43:37 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c9sm203601ooq.31.2021.03.23.18.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] exec: Extract 'page-vary.h' header
Date: Tue, 23 Mar 2021 19:43:31 -0600
Message-Id: <20210324014332.6331-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324014332.6331-1-richard.henderson@linaro.org>
References: <20210324014332.6331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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


