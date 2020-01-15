Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68213C43A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 14:57:27 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irjAk-00009G-E6
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 08:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1irj9x-00086g-GS
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 08:56:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1irj9w-0001Pm-95
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 08:56:37 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:50430)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1irj9v-0001M3-MI; Wed, 15 Jan 2020 08:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=l6dXk7mR0xuvOEX7rAc6XlsFXeiWlU8CW4e7KwhDkXY=; 
 b=g3vaNMwYc/k9OGjJnLHRRVsNYQ8hFNkgvNVd0INcncnVg3gen8kaCN1aXvAdqghEelXb4WiUZCTW6DA8KrljDWU3WNCZxo+Se0l1A7y35vfotsE/9CyD/DaBQpbdl8cvAQMwVOYq3z7Uexn5D7QCWHniksWc42PVBaMIz55GC0kiThpOSoxRg8Gt3Yatbq6I7dzuAu1DgsMVCrQpQKUyZqosFp2Ldms8ZeksdRlmgf8+fb/hebbZTJYa94n4UkNZgVL3bOBNV4teKKXUM2fMMLxw8qcl3qqXDeR1kr9CHwoDH5xNzPEyTXRsVlKiXe0LgJXrXaFKHevre2IvZU1KYw==;
Received: from [192.168.12.213] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1irj9q-0000d8-RX; Wed, 15 Jan 2020 14:56:30 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1irj9q-00054L-HP; Wed, 15 Jan 2020 14:56:30 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qcow2: Use a GString in report_unsupported_feature()
Date: Wed, 15 Jan 2020 14:56:26 +0100
Message-Id: <20200115135626.19442-1-berto@igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bit more efficient than having to allocate and free memory
for each item.

The default size (60) is enough for all the existing incompatible
features or the "Unknown incompatible feature" message.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 block/qcow2.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

v2: Use g_autoptr and update commit message

diff --git a/block/qcow2.c b/block/qcow2.c
index cef9d72b3a..e29fc07068 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -453,16 +453,15 @@ static void cleanup_unknown_header_ext(BlockDriverState *bs)
 static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
                                        uint64_t mask)
 {
-    char *features = g_strdup("");
-    char *old;
+    g_autoptr(GString) features = g_string_sized_new(60);
 
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
@@ -470,14 +469,14 @@ static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
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
 }
 
 /*
-- 
2.20.1


