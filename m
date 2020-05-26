Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617E1E2FF8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 22:28:13 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdgBH-00046h-TH
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 16:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jdgAE-0003Zd-9N; Tue, 26 May 2020 16:27:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:48070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jdgA8-0000mG-P6; Tue, 26 May 2020 16:27:04 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jdg9y-0003rd-73; Tue, 26 May 2020 23:26:50 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] iotests: Dump QCOW2 dirty bitmaps metadata
Date: Tue, 26 May 2020 23:26:47 +0300
Message-Id: <1590524807-821646-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 16:26:57
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirty bitmap information to QCOW2 metadata dump in qcow2.py script.
The sample output:

Header extension:         Bitmaps
magic                     0x23852875
length                    24
nb_bitmaps                2
reserved32                0
bitmap_directory_size     0x40
bitmap_directory_offset   0x100000

Bitmap name               bitmap-1
flag                      "auto"
bitmap_table_offset       0x90000
bitmap_table_size         8
flags                     2
type                      1
granularity_bits          15
name_size                 8
extra_data_size           0

Bitmap table
   0     serialized, offset 0xa0000
   1     all-zeroes, offset 0x0
   2     all-zeroes, offset 0x0
   3     all-zeroes, offset 0x0
   4     all-zeroes, offset 0x0
   5     all-zeroes, offset 0x0
   6     all-zeroes, offset 0x0
   7     all-zeroes, offset 0x0

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
v2:
  01: Refactoring of the Python code in the script qcow2.py.
      New methods were added. The bitmap dictionary was instantiated.
      The all of bitmaps information is read completely before
      printing the dictionary.
  02: The outputs of the tests 031, 036 and 061 were modified.

 tests/qemu-iotests/031.out  |  22 +++---
 tests/qemu-iotests/036.out  |   4 +-
 tests/qemu-iotests/061.out  |  14 ++--
 tests/qemu-iotests/qcow2.py | 167 +++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 179 insertions(+), 28 deletions(-)

diff --git a/tests/qemu-iotests/031.out b/tests/qemu-iotests/031.out
index 46f97c5..0383ebb 100644
--- a/tests/qemu-iotests/031.out
+++ b/tests/qemu-iotests/031.out
@@ -24,7 +24,7 @@ autoclear_features        []
 refcount_order            4
 header_length             72
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
@@ -52,7 +52,7 @@ autoclear_features        []
 refcount_order            4
 header_length             72
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
@@ -80,12 +80,12 @@ autoclear_features        []
 refcount_order            4
 header_length             72
 
-Header extension:
+Header extension:         Backing format
 magic                     0xe2792aca
 length                    11
 data                      'host_device'
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
@@ -115,12 +115,12 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
@@ -148,12 +148,12 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
@@ -181,17 +181,17 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Backing format
 magic                     0xe2792aca
 length                    11
 data                      'host_device'
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
 
-Header extension:
+Header extension:         Unknown
 magic                     0x12345678
 length                    31
 data                      'This is a test header extension'
diff --git a/tests/qemu-iotests/036.out b/tests/qemu-iotests/036.out
index 23b699c..d305f1a 100644
--- a/tests/qemu-iotests/036.out
+++ b/tests/qemu-iotests/036.out
@@ -24,7 +24,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     []
 compatible_features       []
 autoclear_features        [63]
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -36,7 +36,7 @@ No errors were found on the image.
 incompatible_features     []
 compatible_features       []
 autoclear_features        []
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 5a8d36d..bb4b236 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -24,7 +24,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -82,7 +82,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -138,7 +138,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -193,7 +193,7 @@ autoclear_features        [42]
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -262,7 +262,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -324,7 +324,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
@@ -353,7 +353,7 @@ autoclear_features        []
 refcount_order            4
 header_length             104
 
-Header extension:
+Header extension:         Feature table
 magic                     0x6803f857
 length                    288
 data                      <binary>
diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
index 94a07b2..483decb 100755
--- a/tests/qemu-iotests/qcow2.py
+++ b/tests/qemu-iotests/qcow2.py
@@ -4,6 +4,132 @@ import sys
 import struct
 import string
 
+
+class Qcow2BitmapDirEntry:
+
+    name = ''
+    BME_FLAG_IN_USE = 1
+    BME_FLAG_AUTO = 1 << 1
+
+    uint8_t = 'B'
+    uint16_t = 'H'
+    uint32_t = 'I'
+    uint64_t = 'Q'
+
+    fields = [
+        [uint64_t, '%#x', 'bitmap_table_offset'],
+        [uint32_t, '%d',  'bitmap_table_size'],
+        [uint32_t, '%d',  'flags'],
+        [uint8_t,  '%d',  'type'],
+        [uint8_t,  '%d',  'granularity_bits'],
+        [uint16_t, '%d',  'name_size'],
+        [uint32_t, '%d',  'extra_data_size']
+    ]
+
+    fmt = '>' + ''.join(field[0] for field in fields)
+
+    def __init__(self, data):
+
+        entry = struct.unpack(Qcow2BitmapDirEntry.fmt, data)
+        self.__dict__ = dict((field[2], entry[i])
+                             for i, field in enumerate(
+                                 Qcow2BitmapDirEntry.fields))
+
+        self.bitmap_table_size = self.bitmap_table_size \
+            * struct.calcsize(self.uint64_t)
+
+    def bitmap_dir_entry_raw_size(self):
+        return struct.calcsize(self.fmt) + self.name_size + \
+            self.extra_data_size
+
+    def dump_bitmap_dir_entry(self):
+        print("%-25s" % 'Bitmap name', self.name)
+        if (self.flags & self.BME_FLAG_IN_USE) != 0:
+            print("%-25s" % 'flag', '"in-use"')
+        if (self.flags & self.BME_FLAG_AUTO) != 0:
+            print("%-25s" % 'flag', '"auto"')
+        for f in Qcow2BitmapDirEntry.fields:
+            value = self.__dict__[f[2]]
+            value_str = f[1] % value
+
+            print("%-25s" % f[2], value_str)
+        print("")
+
+    def read_bitmap_table(self, fd):
+        fd.seek(self.bitmap_table_offset)
+        table_size = self.bitmap_table_size * struct.calcsize(self.uint64_t)
+        table = [e[0] for e in struct.iter_unpack('>Q', fd.read(table_size))]
+        self.bitmap_table = enumerate(table)
+
+    def print_bitmap_table(self):
+        BME_TABLE_ENTRY_OFFSET_MASK = 0x00fffffffffffe00
+        BME_TABLE_ENTRY_FLAG_ALL_ONES = 1
+        bmt_type = ['all-zeroes', 'all-ones', 'serialized']
+
+        print("Bitmap table")
+        for i, entry in self.bitmap_table:
+            offset = entry & BME_TABLE_ENTRY_OFFSET_MASK
+            if offset != 0:
+                index = 2
+            else:
+                index = entry & BME_TABLE_ENTRY_FLAG_ALL_ONES
+            print("   %-4d  %s, offset %#x" % (i, bmt_type[index], offset))
+        print("")
+
+
+class Qcow2BitmapExt:
+
+    uint32_t = 'I'
+    uint64_t = 'Q'
+
+    fields = [
+        [uint32_t, '%d',  'nb_bitmaps'],
+        [uint32_t, '%d',  'reserved32'],
+        [uint64_t, '%#x', 'bitmap_directory_size'],
+        [uint64_t, '%#x', 'bitmap_directory_offset']
+    ]
+
+    fmt = '>' + ''.join(field[0] for field in fields)
+
+    def __init__(self, data):
+
+        extension = struct.unpack(Qcow2BitmapExt.fmt, data)
+        self.__dict__ = dict((field[2], extension[i])
+                             for i, field in enumerate(Qcow2BitmapExt.fields))
+
+    def dump_bitmap_ext(self):
+        for f in Qcow2BitmapExt.fields:
+            value = self.__dict__[f[2]]
+            value_str = f[1] % value
+
+            print("%-25s" % f[2], value_str)
+        print("")
+
+    def read_bitmap_directory(self, fd):
+        self.bitmaps = []
+        fd.seek(self.bitmap_directory_offset)
+        buf_size = struct.calcsize(Qcow2BitmapDirEntry.fmt)
+
+        for n in range(self.nb_bitmaps):
+            buf = fd.read(buf_size)
+            dir_entry = Qcow2BitmapDirEntry(buf)
+            fd.seek(dir_entry.extra_data_size, 1)
+            bitmap_name = fd.read(dir_entry.name_size)
+            dir_entry.name = bitmap_name.decode('ascii')
+            self.bitmaps.append(dir_entry)
+            entry_raw_size = dir_entry.bitmap_dir_entry_raw_size()
+            shift = ((entry_raw_size + 7) & ~7) - entry_raw_size
+            fd.seek(shift, 1)
+
+        for bm in self.bitmaps:
+            bm.read_bitmap_table(fd)
+
+    def print_bitmaps(self):
+        for bm in self.bitmaps:
+            bm.dump_bitmap_dir_entry()
+            bm.print_bitmap_table()
+
+
 class QcowHeaderExtension:
 
     def __init__(self, magic, length, data):
@@ -21,6 +147,11 @@ class QcowHeaderExtension:
 
 class QcowHeader:
 
+    QCOW2_EXT_MAGIC_BACKING_FORMAT = 0xE2792ACA
+    QCOW2_EXT_MAGIC_FEATURE_TABLE = 0x6803f857
+    QCOW2_EXT_MAGIC_CRYPTO_HEADER = 0x0537be77
+    QCOW2_EXT_MAGIC_BITMAPS = 0x23852875
+    QCOW2_EXT_MAGIC_DATA_FILE = 0x44415441
     uint32_t = 'I'
     uint64_t = 'Q'
 
@@ -127,6 +258,15 @@ class QcowHeader:
         buf = buf[0:header_bytes-1]
         fd.write(buf)
 
+    def extension_name(self, magic):
+        return {
+            self.QCOW2_EXT_MAGIC_BACKING_FORMAT: 'Backing format',
+            self.QCOW2_EXT_MAGIC_FEATURE_TABLE: 'Feature table',
+            self.QCOW2_EXT_MAGIC_CRYPTO_HEADER: 'Crypto header',
+            self.QCOW2_EXT_MAGIC_BITMAPS: 'Bitmaps',
+            self.QCOW2_EXT_MAGIC_DATA_FILE: 'Data file',
+        }.get(magic, 'Unknown')
+
     def dump(self):
         for f in QcowHeader.fields:
             value = self.__dict__[f[2]]
@@ -142,30 +282,41 @@ class QcowHeader:
             print("%-25s" % f[2], value_str)
         print("")
 
-    def dump_extensions(self):
+    def dump_extensions(self, fd):
         for ex in self.extensions:
 
+            print("%-25s %s" % ("Header extension:", self.extension_name(
+                ex.magic)))
+            print("%-25s %#x" % ("magic", ex.magic))
+            print("%-25s %d" % ("length", ex.length))
+
             data = ex.data[:ex.length]
             if all(c in string.printable.encode('ascii') for c in data):
                 data = "'%s'" % data.decode('ascii')
+                print("%-25s %s" % ("data", data))
             else:
-                data = "<binary>"
+                self.dump_extension_data(fd, ex)
 
-            print("Header extension:")
-            print("%-25s %#x" % ("magic", ex.magic))
-            print("%-25s %d" % ("length", ex.length))
-            print("%-25s %s" % ("data", data))
             print("")
 
+    def dump_extension_data(self, fd, ext):
+        if ext.magic == self.QCOW2_EXT_MAGIC_BITMAPS:
+            b_ext = Qcow2BitmapExt(ext.data)
+            b_ext.dump_bitmap_ext()
+            b_ext.read_bitmap_directory(fd)
+            b_ext.print_bitmaps()
+        else:
+            print("%-25s %s" % ("data", "<binary>"))
+
 
 def cmd_dump_header(fd):
     h = QcowHeader(fd)
     h.dump()
-    h.dump_extensions()
+    h.dump_extensions(fd)
 
 def cmd_dump_header_exts(fd):
     h = QcowHeader(fd)
-    h.dump_extensions()
+    h.dump_extensions(fd)
 
 def cmd_set_header(fd, name, value):
     try:
-- 
1.8.3.1


