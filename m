Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300B13A2EB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 09:24:16 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irHUk-0003lZ-T7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 03:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1irHT3-00023a-9o
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:22:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1irHT1-0006lt-PO
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 03:22:29 -0500
Received: from relay.sw.ru ([185.231.240.75]:36844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1irHSy-0006jo-Io; Tue, 14 Jan 2020 03:22:24 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1irHSr-0005Ix-RP; Tue, 14 Jan 2020 11:22:17 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/3] qcow2: introduce Qcow2Metadata structure
Date: Tue, 14 Jan 2020 11:22:15 +0300
Message-Id: <1578990137-308222-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578990137-308222-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1578990137-308222-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preliminary patch to provide an extendable structure for dumping
QCOW2 metadata allocations in image. The command line optional key is
introduced in the patch that follows.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 qapi/block-core.json | 209 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ff5e5e..fab7435 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -176,6 +176,209 @@
            '*backing-image': 'ImageInfo',
            '*format-specific': 'ImageInfoSpecific' } }
 
+
+##
+# @Qcow2Metadata:
+#
+# Encapsulates QCOW2 metadata information
+#
+# @qcow2-header: QCOW2 header info
+#
+# @active-l1: L1 active table info
+#
+# @refcount-table: refcount table info
+#
+# @crypt-header: encryption header info
+#
+# @bitmaps: bitmap tables info
+#
+# @snapshot-table: snapshot tables info
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2Metadata',
+  'data': { 'qcow2-header': 'Qcow2Header',
+            'refcount-table': 'Qcow2RefcountTable',
+            'active-l1': 'Qcow2L1Table',
+            '*crypt-header': 'Qcow2EncryptionHeader',
+            '*bitmaps': 'Qcow2Bitmaps',
+            '*snapshot-table': 'Qcow2SnapshotsTable' } }
+
+##
+# @Qcow2Header:
+#
+# QCOW2 header information
+#
+# @version: version number
+#
+# @location: header offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2Header',
+  'data': {'version': 'int',
+           'location': 'Qcow2Allocation' } }
+
+##
+# @Qcow2EncryptionHeader:
+#
+# QCOW2 encryption header information
+#
+# @location: header offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2EncryptionHeader',
+  'data': {'location': 'Qcow2Allocation' } }
+
+##
+# @Qcow2RefcountTable:
+#
+# QCOW2 refcount table information
+#
+# @location: refcount table offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2RefcountTable',
+  'data': {'location': 'Qcow2Allocation' } }
+
+##
+# @Qcow2L1Table:
+#
+# L1 table information
+#
+# @l2-list: list of L2 table locations
+#
+# @location: L1 table offset and size in image
+#
+# @name: entity name the table relates to
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2L1Table',
+  'data': {'l2-list': ['Qcow2Allocation'],
+           'location': 'Qcow2Allocation',
+           'name': 'str'} }
+
+##
+# @Qcow2Allocation:
+#
+# QCOW2 data location in image
+#
+# @offset: data offset
+#
+# @size: data size
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2Allocation',
+  'data': {'offset': 'uint64', 'size': 'uint64' } }
+
+##
+# @Qcow2Bitmaps:
+#
+# QCOW2 bitmaps information
+#
+# @nb-bitmaps: the number of bitmaps contained in the image
+#
+# @bitmap-dir: bitmap directory information
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2Bitmaps',
+  'data': {'nb-bitmaps': 'int',
+           'bitmap-dir': 'Qcow2BitmapDir' } }
+
+##
+# @Qcow2BitmapDir:
+#
+# QCOW2 bitmap directory information
+#
+# @dir-entries: list of bitmap directory entries
+#
+# @location: bitmap directory offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2BitmapDir',
+  'data': {'dir-entries': ['Qcow2BitmapDirectoryEntry'],
+           'location': 'Qcow2Allocation' } }
+
+##
+# @Qcow2BitmapDirectoryEntry:
+#
+# QCOW2 bitmap directory entry information
+#
+# @bitmap-table: bitmap table offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2BitmapDirectoryEntry',
+  'data': {'bitmap-table': 'Qcow2BitmapTableInfo',
+           'bitmap-name': 'str' } }
+
+##
+# @Qcow2BitmapTableInfo:
+#
+# QCOW2 bitmap table information
+#
+# @table-entries: list of bitmap table entries
+#
+# @location: bitmap table offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2BitmapTableInfo',
+  'data': {'table-entries': ['Qcow2BitmapTableInfoEntry'],
+           'location': 'Qcow2Allocation' } }
+
+##
+# @Qcow2BitmapTableInfoEntry:
+#
+# QCOW2 bitmap table entry information
+#
+# @type: bitmap table entry type
+#
+# @cluster: bitmap table entry offset and size in image
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2BitmapTableInfoEntry',
+  'data': {'type': 'Qcow2BitmapTableInfoEntryType',
+           '*cluster': 'Qcow2Allocation' } }
+
+##
+# @Qcow2BitmapTableInfoEntryType:
+#
+# An enumeration of cluster types in bitmap table
+#
+# @all-zeroes: cluster should be read as all zeroes
+#
+# @all-ones: cluster should be read as all ones
+#
+# @serialized: cluster data are written on disk
+#
+# Since: 5.0
+##
+{ 'enum': 'Qcow2BitmapTableInfoEntryType',
+  'data': ['all-zeroes', 'all-ones', 'serialized'] }
+
+##
+# @Qcow2SnapshotsTable:
+#
+# Snapshots table location in image file.
+#
+# @location: offset and size of snapshot table
+#
+# @l1-list: list of snapshots L1 tables
+#
+# Since: 5.0
+##
+{ 'struct': 'Qcow2SnapshotsTable',
+  'data': {'location': 'Qcow2Allocation',
+           'l1-list': ['Qcow2L1Table'] } }
+
 ##
 # @ImageCheck:
 #
@@ -215,6 +418,9 @@
 #                       field is present if the driver for the image format
 #                       supports it
 #
+# @metadata: encapsulates QCOW2 tables allocation information (default: none,
+#            turned on with the command line optional key; since 5.0)
+#
 # Since: 1.4
 #
 ##
@@ -223,7 +429,8 @@
            '*image-end-offset': 'int', '*corruptions': 'int', '*leaks': 'int',
            '*corruptions-fixed': 'int', '*leaks-fixed': 'int',
            '*total-clusters': 'int', '*allocated-clusters': 'int',
-           '*fragmented-clusters': 'int', '*compressed-clusters': 'int' } }
+           '*fragmented-clusters': 'int', '*compressed-clusters': 'int',
+           '*metadata': 'Qcow2Metadata' } }
 
 ##
 # @MapEntry:
-- 
1.8.3.1


