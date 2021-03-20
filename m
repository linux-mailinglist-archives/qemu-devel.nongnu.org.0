Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AF3342B6F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 10:38:53 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNY4F-0006bh-U4
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 05:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXzW-0003t9-7W
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:54 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:48899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXzF-0005gZ-7t
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:47 -0400
Received: from email.seznam.cz
 by email-smtpc15b.ng.seznam.cz (email-smtpc15b.ng.seznam.cz [10.23.14.195])
 id 421e225b221105e9442d694c; Sat, 20 Mar 2021 10:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616232815;
 bh=LOrFaL5skzHDoWoBjlljQTlgSVrL0mw690dXxzPM/wc=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=HWfrvA0xE/LU2zK+ElSvIU1XIEAWIMibqMlv8gBh/bH6xpUOH639dFxXSVWWqg+7O
 COnWr5gPNXOMfIZoq7aQH7tdIl6DHiZet1dSaz4omAgwgc90h8ImDXSKWnYLsPzu+p
 tFKDpU5X+m5lEO43Ha1qjuQaxeoembDwc+3SA95o=
Received: from archlinux.localdomain (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay4.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Sat, 20 Mar 2021 10:33:32 +0100 (CET)  
From: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qapi: implementation of the block-dirty-bitmap-dump
 command
Date: Sat, 20 Mar 2021 10:32:35 +0100
Message-Id: <20210320093235.461485-3-pj@patrikjanousek.cz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210320093235.461485-1-pj@patrikjanousek.cz>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>,
 lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, dirty bitmaps are for internal use only and there is
no support for accessing their content from third party-apps.
This patch implements new command block-dirty-bitmap-dump, which
returns content of the dirty bitmap encoded in base64. This is
very useful especially in combination with a drive that uses raw
format because third-party apps can easily use it to create
incremental or differential backup.

Signed-off-by: Patrik Janoušek <pj@patrikjanousek.cz>
---
 block/monitor/bitmap-qmp-cmds.c | 61 +++++++++++++++++++++++++++++++
 qapi/block-core.json            | 64 ++++++++++++++++++++++++++++++++-
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..7f296e9ba7 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -146,6 +146,67 @@ out:
     aio_context_release(aio_context);
 }
 
+BlockDirtyBitmapContent *qmp_block_dirty_bitmap_dump(const char *node,
+                                                     const char *name,
+                                                     bool has_clear, bool clear,
+                                                     Error **errp)
+{
+    BlockDriverState *bs;
+    BdrvDirtyBitmap *bitmap;
+    BlockDirtyBitmapContent *bdbc;
+    HBitmap *hb;
+    AioContext *aio_context;
+
+    if (!name || name[0] == '\0') {
+        error_setg(errp, "Bitmap name cannot be empty");
+        return NULL;
+    }
+
+    bs = bdrv_lookup_bs(node, node, errp);
+    if (!bs) {
+        return NULL;
+    }
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+
+    bitmap = block_dirty_bitmap_lookup(node, name, &bs, errp);
+    if (!bitmap || !bs) {
+        return NULL;
+    }
+
+    if (has_clear && clear) {
+        /**
+         * Transactions cannot return value, so "clear" functionality must be
+         * implemented here while holding AiO context
+         */
+
+        bdrv_clear_dirty_bitmap(bitmap, &hb);
+
+        uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
+        uint64_t tb_size = hbitmap_serialization_size(hb, 0, bm_size);
+        uint8_t *buf = g_malloc(tb_size);
+
+        hbitmap_serialize_part(hb, buf, 0, bm_size);
+
+        bdbc = g_new0(BlockDirtyBitmapContent, 1);
+        bdbc->content = g_base64_encode((guchar *) buf, tb_size);
+    } else {
+        uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
+        uint64_t tb_size = bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size);
+        uint8_t *buf = g_malloc(tb_size);
+
+        bdrv_dirty_bitmap_serialize_part(bitmap, buf, 0, bm_size);
+
+        bdbc = g_new0(BlockDirtyBitmapContent, 1);
+        bdbc->content = g_base64_encode((guchar *) buf, tb_size);
+    }
+
+    aio_context_release(aio_context);
+
+    return bdbc;
+}
+
 BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
                                            bool release,
                                            BlockDriverState **bitmap_bs,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04ad80bc1e..cbe3dac384 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2031,6 +2031,14 @@
 { 'struct': 'BlockDirtyBitmap',
   'data': { 'node': 'str', 'name': 'str' } }
 
+##
+# @BlockDirtyBitmapContent:
+#
+# @content: content of dirty bitmap (encoded in base64)
+##
+{ 'struct': 'BlockDirtyBitmapContent',
+  'data': { 'content': 'str' } }
+
 ##
 # @BlockDirtyBitmapAdd:
 #
@@ -2056,6 +2064,18 @@
   'data': { 'node': 'str', 'name': 'str', '*granularity': 'uint32',
             '*persistent': 'bool', '*disabled': 'bool' } }
 
+##
+# @BlockDirtyBitmapDump:
+#
+# @node: name of device/node which the bitmap is tracking
+#
+# @name: name of the dirty bitmap (must be less than 1024 bytes)
+#
+# @clear: true if bitmap should be cleared after dump
+##
+{ 'struct': 'BlockDirtyBitmapDump',
+  'data': { 'node': 'str', 'name': 'str', '*clear': 'bool' } }
+
 ##
 # @BlockDirtyBitmapMergeSource:
 #
@@ -2086,6 +2106,26 @@
   'data': { 'node': 'str', 'target': 'str',
             'bitmaps': ['BlockDirtyBitmapMergeSource'] } }
 
+##
+# @block-dirty-bitmap-dump:
+#
+# Dump a dirty bitmap with a name on the node.
+#
+# Returns: - nothing on success
+#          - If @node is not a valid block device or node, DeviceNotFound
+#          - If @name is already taken, GenericError with an explanation
+#
+# Example:
+#
+# -> { "execute": "block-dirty-bitmap-dump",
+#      "arguments": { "node": "drive0", "name": "bitmap0" } }
+# <- { "return": { "content": "TG9yZW0gaXBzdW0gZG9sb3Igc2l0IGFt... (trunc)" } }
+#
+##
+{ 'command': 'block-dirty-bitmap-dump',
+  'data': 'BlockDirtyBitmapDump',
+  'returns': 'BlockDirtyBitmapContent' }
+
 ##
 # @block-dirty-bitmap-add:
 #
@@ -3908,6 +3948,26 @@
             '*x-dirty-bitmap': 'str',
             '*reconnect-delay': 'uint32' } }
 
+##
+# @BlockdevOptionsRawDirtyBitmap:
+#
+# Dirty bitmap options for the raw driver.
+#
+# @name: the name of the dirty bitmap (Since 2.4)
+#
+# @filename: the filename of the dirty bitmap
+#
+# @granularity: granularity of the dirty bitmap in bytes (since 1.4)
+#
+# @persistent: true if the bitmap was stored on disk, is scheduled to be stored
+#              on disk, or both. (since 4.0)
+#
+# @disabled: true if the bitmap should not be loaded (and saved) automatically
+##
+{ 'struct': 'BlockdevOptionsRawDirtyBitmap',
+  'data': {'*name': 'str', 'filename': 'str', 'granularity': 'uint32',
+           'persistent': 'bool', '*disabled': 'bool' } }
+
 ##
 # @BlockdevOptionsRaw:
 #
@@ -3915,12 +3975,14 @@
 #
 # @offset: position where the block device starts
 # @size: the assumed size of the device
+# @dirty-bitmaps: dirty bitmaps of the raw block device
 #
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsRaw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { '*offset': 'int', '*size': 'int' } }
+  'data': { '*offset': 'int', '*size': 'int' ,
+            '*dirty-bitmaps': ['BlockdevOptionsRawDirtyBitmap'] } }
 
 ##
 # @BlockdevOptionsThrottle:
-- 
2.31.0


