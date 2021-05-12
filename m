Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55EB37D3DD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:29:13 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguXg-00070v-Py
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguV2-000213-3d
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUz-0000ol-9y
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=A0JWUOrAKW7MU5G28uWQDZnypzF4zh7je8ZCTXY3fyI=; b=oAyAQECMBS/n
 rsPnSZQVOOWstWpq5PGtrtR4aGDaXmqOEiB7Gh3ayvM+2I0XgCNDph/JtrgN5GXmHX4KaM9DVFvGo
 svwrSGBnsQuTrNycDzac7xtauV8PWG1GKz1XewZLXjrISKJEMXM5eXpoWuXB+Fa7sIrUbZJYO1XRe
 uYvg4=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUu-002BHm-13; Wed, 12 May 2021 22:26:20 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH v1 3/7] migration/snapshot: Move RAM_SAVE_FLAG_xxx defines
 to migration/ram.h
Date: Wed, 12 May 2021 22:26:15 +0300
Message-Id: <20210512192619.537268-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
References: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Move RAM_SAVE_FLAG_xxx defines from migration/ram.c to migration/ram.h

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/ram.c | 16 ----------------
 migration/ram.h | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ace8ad431c..0359b63dde 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -63,22 +63,6 @@
 /***********************************************************/
 /* ram save/restore */
 
-/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
- * worked for pages that where filled with the same char.  We switched
- * it to only search for the zero value.  And to avoid confusion with
- * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
- */
-
-#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
-#define RAM_SAVE_FLAG_ZERO     0x02
-#define RAM_SAVE_FLAG_MEM_SIZE 0x04
-#define RAM_SAVE_FLAG_PAGE     0x08
-#define RAM_SAVE_FLAG_EOS      0x10
-#define RAM_SAVE_FLAG_CONTINUE 0x20
-#define RAM_SAVE_FLAG_XBZRLE   0x40
-/* 0x80 is reserved in migration.h start with 0x100 next */
-#define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
-
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
     return buffer_is_zero(p, size);
diff --git a/migration/ram.h b/migration/ram.h
index 4833e9fd5b..d6498b651f 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -33,6 +33,22 @@
 #include "exec/cpu-common.h"
 #include "io/channel.h"
 
+/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
+ * worked for pages that where filled with the same char.  We switched
+ * it to only search for the zero value.  And to avoid confusion with
+ * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
+ */
+
+#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
+#define RAM_SAVE_FLAG_ZERO     0x02
+#define RAM_SAVE_FLAG_MEM_SIZE 0x04
+#define RAM_SAVE_FLAG_PAGE     0x08
+#define RAM_SAVE_FLAG_EOS      0x10
+#define RAM_SAVE_FLAG_CONTINUE 0x20
+#define RAM_SAVE_FLAG_XBZRLE   0x40
+/* 0x80 is reserved in migration.h start with 0x100 next */
+#define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+
 extern MigrationStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
-- 
2.27.0


