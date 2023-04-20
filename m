Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C464F6E8FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:16:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHk-0000xB-3q; Thu, 20 Apr 2023 06:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-0000nT-Vi
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHN-00081i-8v
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHyvDQ2n8xkc8mJD5DMSGoHwNjJvguv6QaQ5mv0AIdA=;
 b=W2tmJzdsXgGU3xffkFJI3mR1ib8aVy+lRqQdAvRwQH5a0jfgJK3t8jTcFB/vXJMzhsM27I
 YOIS8IEFJf1ze+Siz3ZOdEn/Ug/wvjOsooYO8E3aUeoxMMqif0e7w+IIQhZBdCED5tOvmO
 JtVRvr4UEnTKX1dwlxm1bdTWooglbic=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-Ci8ayvIkNBulRs0pR6Nz4g-1; Thu, 20 Apr 2023 06:12:37 -0400
X-MC-Unique: Ci8ayvIkNBulRs0pR6Nz4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74F92823815;
 Thu, 20 Apr 2023 10:12:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11CB25AB7A;
 Thu, 20 Apr 2023 10:12:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/23] include/exec: Provide the tswap() functions for target
 independent code, too
Date: Thu, 20 Apr 2023 12:12:06 +0200
Message-Id: <20230420101216.786304-14-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In some cases of target independent code, it would be useful to have access
to the functions that swap endianess in case it differs between guest and
host. Thus re-implement the tswapXX() functions in a new header that can be
included separately. The check whether the swapping is needed continues to
be done at compile-time for target specific code, while it is done at
run-time in target-independent code.

Message-Id: <20230411183418.1640500-3-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/cpu-all.h | 64 +------------------------------------
 include/exec/tswap.h   | 72 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 63 deletions(-)
 create mode 100644 include/exec/tswap.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 090922e4a8..ad824fee52 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,6 +21,7 @@
 
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
+#include "exec/tswap.h"
 #include "qemu/thread.h"
 #include "hw/core/cpu.h"
 #include "qemu/rcu.h"
@@ -44,69 +45,6 @@
 #define BSWAP_NEEDED
 #endif
 
-#ifdef BSWAP_NEEDED
-
-static inline uint16_t tswap16(uint16_t s)
-{
-    return bswap16(s);
-}
-
-static inline uint32_t tswap32(uint32_t s)
-{
-    return bswap32(s);
-}
-
-static inline uint64_t tswap64(uint64_t s)
-{
-    return bswap64(s);
-}
-
-static inline void tswap16s(uint16_t *s)
-{
-    *s = bswap16(*s);
-}
-
-static inline void tswap32s(uint32_t *s)
-{
-    *s = bswap32(*s);
-}
-
-static inline void tswap64s(uint64_t *s)
-{
-    *s = bswap64(*s);
-}
-
-#else
-
-static inline uint16_t tswap16(uint16_t s)
-{
-    return s;
-}
-
-static inline uint32_t tswap32(uint32_t s)
-{
-    return s;
-}
-
-static inline uint64_t tswap64(uint64_t s)
-{
-    return s;
-}
-
-static inline void tswap16s(uint16_t *s)
-{
-}
-
-static inline void tswap32s(uint32_t *s)
-{
-}
-
-static inline void tswap64s(uint64_t *s)
-{
-}
-
-#endif
-
 #if TARGET_LONG_SIZE == 4
 #define tswapl(s) tswap32(s)
 #define tswapls(s) tswap32s((uint32_t *)(s))
diff --git a/include/exec/tswap.h b/include/exec/tswap.h
new file mode 100644
index 0000000000..68944a880b
--- /dev/null
+++ b/include/exec/tswap.h
@@ -0,0 +1,72 @@
+/*
+ * Macros for swapping a value if the endianness is different
+ * between the target and the host.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef TSWAP_H
+#define TSWAP_H
+
+#include "hw/core/cpu.h"
+#include "qemu/bswap.h"
+
+/*
+ * If we're in target-specific code, we can hard-code the swapping
+ * condition, otherwise we have to do (slower) run-time checks.
+ */
+#ifdef NEED_CPU_H
+#define target_needs_bswap()  (HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN)
+#else
+#define target_needs_bswap()  (target_words_bigendian() != HOST_BIG_ENDIAN)
+#endif
+
+static inline uint16_t tswap16(uint16_t s)
+{
+    if (target_needs_bswap()) {
+        return bswap16(s);
+    } else {
+        return s;
+    }
+}
+
+static inline uint32_t tswap32(uint32_t s)
+{
+    if (target_needs_bswap()) {
+        return bswap32(s);
+    } else {
+        return s;
+    }
+}
+
+static inline uint64_t tswap64(uint64_t s)
+{
+    if (target_needs_bswap()) {
+        return bswap64(s);
+    } else {
+        return s;
+    }
+}
+
+static inline void tswap16s(uint16_t *s)
+{
+    if (target_needs_bswap()) {
+        *s = bswap16(*s);
+    }
+}
+
+static inline void tswap32s(uint32_t *s)
+{
+    if (target_needs_bswap()) {
+        *s = bswap32(*s);
+    }
+}
+
+static inline void tswap64s(uint64_t *s)
+{
+    if (target_needs_bswap()) {
+        *s = bswap64(*s);
+    }
+}
+
+#endif  /* TSWAP_H */
-- 
2.31.1


