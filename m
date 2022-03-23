Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E093E4E5682
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:32:10 +0100 (CET)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3u5-0005Z6-T0
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:32:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Q5-0005oQ-K9
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Q4-0005XO-0y
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GL2a4kZZG+9rIDlkOcXIXF4Z6YQjqZydvIWUfn2t91Q=;
 b=GNwVBbUwakv83KN10ZXrkZicR0/HtyUfDRWYcJY090cnaTNj7GSElFsitoM0cUBrXiWzfc
 0GgSf+IqyXIW7oxNmIi3He3Rz4He4eX9co/YOAW4NWghVpl9nStMhgI84u55S8i4qMMSif
 kjHaS9m/oT3/o1qDeLWWdN6DLj9BWPM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-x22K_NIEPBqPzMw6Tkg1lA-1; Wed, 23 Mar 2022 12:01:04 -0400
X-MC-Unique: x22K_NIEPBqPzMw6Tkg1lA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBEF0899ED0;
 Wed, 23 Mar 2022 16:01:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B268111F3B6;
 Wed, 23 Mar 2022 16:00:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 23/32] include: move target page bits declaration to
 page-vary.h
Date: Wed, 23 Mar 2022 19:57:34 +0400
Message-Id: <20220323155743.1585078-24-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the implementation unit is page-vary.c.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/exec/page-vary.h | 18 ++++++++++++++++++
 include/qemu-common.h    | 17 -----------------
 page-vary.c              |  2 +-
 softmmu/physmem.c        |  2 +-
 softmmu/vl.c             |  1 +
 target/arm/cpu.c         |  2 +-
 6 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
index c22a7a742e7c..ebbe9b169b8f 100644
--- a/include/exec/page-vary.h
+++ b/include/exec/page-vary.h
@@ -31,4 +31,22 @@ extern bool set_preferred_target_page_bits_common(int bits);
 extern void finalize_target_page_bits_common(int min);
 #endif
 
+/**
+ * set_preferred_target_page_bits:
+ * @bits: number of bits needed to represent an address within the page
+ *
+ * Set the preferred target page size (the actual target page
+ * size may be smaller than any given CPU's preference).
+ * Returns true on success, false on failure (which can only happen
+ * if this is called after the system has already finalized its
+ * choice of page size and the requested page size is smaller than that).
+ */
+bool set_preferred_target_page_bits(int bits);
+
+/**
+ * finalize_target_page_bits:
+ * Commit the final value set by set_preferred_target_page_bits.
+ */
+void finalize_target_page_bits(void);
+
 #endif /* EXEC_PAGE_VARY_H */
diff --git a/include/qemu-common.h b/include/qemu-common.h
index ced260d08be0..bc73daecb4e9 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,23 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-/**
- * set_preferred_target_page_bits:
- * @bits: number of bits needed to represent an address within the page
- *
- * Set the preferred target page size (the actual target page
- * size may be smaller than any given CPU's preference).
- * Returns true on success, false on failure (which can only happen
- * if this is called after the system has already finalized its
- * choice of page size and the requested page size is smaller than that).
- */
-bool set_preferred_target_page_bits(int bits);
-
-/**
- * finalize_target_page_bits:
- * Commit the final value set by set_preferred_target_page_bits.
- */
-void finalize_target_page_bits(void);
 
 void qemu_progress_init(int enabled, float min_skip);
 void qemu_progress_end(void);
diff --git a/page-vary.c b/page-vary.c
index 057c7f181521..343b4adb95a5 100644
--- a/page-vary.c
+++ b/page-vary.c
@@ -20,7 +20,7 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "exec/exec-all.h"
 
 bool set_preferred_target_page_bits(int bits)
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cdf0db733e57..657841eed0cf 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "qapi/error.h"
 
 #include "qemu/cutils.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0ae..46aba6a039c4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -27,6 +27,7 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "exec/cpu-common.h"
+#include "exec/page-vary.h"
 #include "hw/qdev-properties.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0980d3390112..3609de088827 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -22,7 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-- 
2.35.1.273.ge6ebfd0e8cbb


