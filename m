Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD489E2C1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 10:34:18 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Wvh-0005Ol-Fc
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 04:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1i2Wt5-00047d-7U
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1i2Wt3-0002Qv-3f
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:31:34 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:40188
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1i2Wt2-0002Ow-SD
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 04:31:33 -0400
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <johannes@sipsolutions.net>)
 id 1i2Wsw-0002r1-Ai; Tue, 27 Aug 2019 10:31:26 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 11:31:24 +0300
Message-Id: <20190827083124.30791-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: [Qemu-devel] [PATCH] libvhost-user-glib: fix VugDev main fd cleanup
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Johannes Berg <johannes.berg@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Johannes Berg <johannes.berg@intel.com>

If you try to make a device implementation that can handle multiple
connections and allow disconnections (which requires overriding the
VHOST_USER_NONE handling), then glib will warn that we remove a src
while it's still on the mainloop, and will poll() an FD that doesn't
exist anymore.

Fix this by just using the internal add_watch() function that has
all necessary cleanups built in via the hashtable, rather than
treating the "main" fd of a device specially.

Fixes: 8bb7ddb78a1c ("libvhost-user: add glib source helper")
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 contrib/libvhost-user/libvhost-user-glib.c | 3 +--
 contrib/libvhost-user/libvhost-user-glib.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/contrib/libvhost-user/libvhost-user-glib.c
index 99edd2f3de45..a092a55c1d57 100644
--- a/contrib/libvhost-user/libvhost-user-glib.c
+++ b/contrib/libvhost-user/libvhost-user-glib.c
@@ -146,7 +146,7 @@ vug_init(VugDev *dev, uint16_t max_queues, int socket,
     dev->fdmap = g_hash_table_new_full(NULL, NULL, NULL,
                                        (GDestroyNotify) g_source_destroy);
 
-    dev->src = vug_source_new(dev, socket, G_IO_IN, vug_watch, NULL);
+    set_watch(&dev->parent, socket, VU_WATCH_IN, vug_watch, NULL);
 
     return true;
 }
@@ -157,5 +157,4 @@ vug_deinit(VugDev *dev)
     g_assert(dev);
 
     g_hash_table_unref(dev->fdmap);
-    g_source_unref(dev->src);
 }
diff --git a/contrib/libvhost-user/libvhost-user-glib.h b/contrib/libvhost-user/libvhost-user-glib.h
index 64d539d93aba..32a6ec6df063 100644
--- a/contrib/libvhost-user/libvhost-user-glib.h
+++ b/contrib/libvhost-user/libvhost-user-glib.h
@@ -22,7 +22,6 @@ typedef struct VugDev {
     VuDev parent;
 
     GHashTable *fdmap; /* fd -> gsource */
-    GSource *src;
 } VugDev;
 
 bool vug_init(VugDev *dev, uint16_t max_queues, int socket,
-- 
2.23.0


