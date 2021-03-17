Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9E33F5C0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:40:42 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZDt-000681-Qz
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8g-0002cF-Rf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:35:24 -0400
Received: from relay.sw.ru ([185.231.240.75]:50300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8b-0005P3-25
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=NHJOjm6wNZ/ix5dzVo/rxljiVEJ9yBpUOxowQqxxGVg=; b=YzdSjZhOtwA0
 KkwXKPkyfTw9fX2NuKkEZEsTxwIt3i+K/035ClXjeWqm/yh2oF2BDyeRcq8YUyALyLj85Le+u9wj3
 VjVr5m6ts9emBT9a6hkJQHlLAr4KoxcgU1wjVaTRHMl64M5hxwvsQarhBj/+BCKmEMoHcMjmzbsUU
 DY7Go=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ7z-0034yI-Pn; Wed, 17 Mar 2021 19:34:35 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 6/9] migration/snap-tool: Move RAM_SAVE_FLAG_xxx defines
 to migration/ram.h
Date: Wed, 17 Mar 2021 19:32:19 +0300
Message-Id: <20210317163222.182609-7-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
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
index 52537f14ac..d3da0c8208 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -65,22 +65,6 @@
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
index 6378bb3ebc..c6bad8bbdf 100644
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
2.25.1


