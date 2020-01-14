Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF2513ACB8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:56:33 +0100 (CET)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irNcP-0003Rl-1N
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1irNak-0001bc-Gb
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:54:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1irNag-0005vT-FH
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:54:50 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:36819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1irNaf-0005tc-SL; Tue, 14 Jan 2020 09:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=FsPv6n8VFRZlWe90o3QUM7ajHEmRyD3J7UuMj6UG8OA=; 
 b=MGtJbYqO1gtTfR0QBCp8hxUgeiriatjodRe/unpXNSe6UIt/agkXcWh9ylZXKO/07MBpYrrOXks8M7jcGT6PBxhdTGQfxTi2p4s+4HOdbt276ae6BkQ/C42qXN4m31xWWC28kTU6DIKHw8oN6EW8lKD927BiTAFp/Nld/fkZaEGHhahFZ6Nd0hrn0pfos7SZKHs5ykbapMNH941ZGfaBp5qNJxWM8hSKHCNodinJDZrvSJK9rc59JJi5nl80246rX9XquW0vlwP4hlFF71qCloU3LG6WvOksSaG34eN965yV3Y8LZa17fK1oWmkv27lL98voQHfi2TxyedFQqo2zhA==;
Received: from [192.168.12.213] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1irNaa-0001Za-Ve; Tue, 14 Jan 2020 15:54:41 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1irNaa-0007OY-MZ; Tue, 14 Jan 2020 15:54:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qcow2: Use a GString in report_unsupported_feature()
Date: Tue, 14 Jan 2020 15:54:37 +0100
Message-Id: <20200114145437.28382-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bit more efficient than having to allocate and free memory
for each item.

The default size (60) is enough for all the existing incompatible
features.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index cef9d72b3a..ecf6827420 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -453,16 +453,15 @@ static void cleanup_unknown_header_ext(BlockDriverState *bs)
 static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
                                        uint64_t mask)
 {
-    char *features = g_strdup("");
-    char *old;
+    GString *features = g_string_sized_new(60);
 
     while (table && table->name[0] != '\0') {
         if (table->type == QCOW2_FEAT_TYPE_INCOMPATIBLE) {
             if (mask & (1ULL << table->bit)) {
-                old = features;
-                features = g_strdup_printf("%s%s%.46s", old, *old ? ", " : "",
-                                           table->name);
-                g_free(old);
+                if (features->len > 0) {
+                    g_string_append(features, ", ");
+                }
+                g_string_append_printf(features, "%.46s", table->name);
                 mask &= ~(1ULL << table->bit);
             }
         }
@@ -470,14 +469,15 @@ static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
     }
 
     if (mask) {
-        old = features;
-        features = g_strdup_printf("%s%sUnknown incompatible feature: %" PRIx64,
-                                   old, *old ? ", " : "", mask);
-        g_free(old);
+        if (features->len > 0) {
+            g_string_append(features, ", ");
+        }
+        g_string_append_printf(features,
+                               "Unknown incompatible feature: %" PRIx64, mask);
     }
 
-    error_setg(errp, "Unsupported qcow2 feature(s): %s", features);
-    g_free(features);
+    error_setg(errp, "Unsupported qcow2 feature(s): %s", features->str);
+    g_string_free(features, TRUE);
 }
 
 /*
-- 
2.20.1


