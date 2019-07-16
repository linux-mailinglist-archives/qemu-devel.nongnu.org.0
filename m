Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2369FA1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 02:02:09 +0200 (CEST)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnAv2-0008Mu-4c
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 20:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hnAuP-0006nl-3W
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 20:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hnAuN-0007Ta-Kn
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 20:01:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39678)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hnAuK-0007Pr-JS; Mon, 15 Jul 2019 20:01:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C866459440;
 Tue, 16 Jul 2019 00:01:23 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-130.bos.redhat.com [10.18.17.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE4AD6085B;
 Tue, 16 Jul 2019 00:01:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 20:01:08 -0400
Message-Id: <20190716000117.25219-3-jsnow@redhat.com>
In-Reply-To: <20190716000117.25219-1-jsnow@redhat.com>
References: <20190716000117.25219-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 16 Jul 2019 00:01:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 02/11] iotests/257: add EmulatedBitmap class
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Represent a bitmap with an object that we can mark and clear bits in.
This makes it easier to manage partial writes when we don't write a
full group's worth of patterns before an error.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/257 | 124 +++++++++++++++++++++++++----------------
 1 file changed, 75 insertions(+), 49 deletions(-)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index 02f9ae0649..bc66ea03b2 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -85,6 +85,59 @@ GROUPS =3D [
         Pattern('0xdd', 0x3fc0000)]), # New; leaving a gap to the right
 ]
=20
+
+class EmulatedBitmap:
+    def __init__(self, granularity=3DGRANULARITY):
+        self._bits =3D set()
+        self.granularity =3D granularity
+
+    def dirty_bits(self, bits):
+        self._bits |=3D set(bits)
+
+    def dirty_group(self, n):
+        self.dirty_bits(GROUPS[n].bits(self.granularity))
+
+    def clear(self):
+        self._bits =3D set()
+
+    def clear_bits(self, bits):
+        self._bits -=3D set(bits)
+
+    def clear_bit(self, bit):
+        self.clear_bits({bit})
+
+    def clear_group(self, n):
+        self.clear_bits(GROUPS[n].bits(self.granularity))
+
+    @property
+    def first_bit(self):
+        return sorted(self.bits)[0]
+
+    @property
+    def bits(self):
+        return self._bits
+
+    @property
+    def count(self):
+        return len(self.bits)
+
+    def compare(self, qmp_bitmap):
+        """
+        Print a nice human-readable message checking that a bitmap as re=
ported
+        by the QMP interface has as many bits set as we expect it to.
+        """
+
+        name =3D qmp_bitmap.get('name', '(anonymous)')
+        log("=3D Checking Bitmap {:s} =3D".format(name))
+
+        want =3D self.count
+        have =3D qmp_bitmap['count'] // qmp_bitmap['granularity']
+
+        log("expecting {:d} dirty sectors; have {:d}. {:s}".format(
+            want, have, "OK!" if want =3D=3D have else "ERROR!"))
+        log('')
+
+
 class Drive:
     """Represents, vaguely, a drive attached to a VM.
     Includes format, graph, and device information."""
@@ -195,27 +248,6 @@ def perform_writes(drive, n):
     log('')
     return bitmaps
=20
-def calculate_bits(groups=3DNone):
-    """Calculate how many bits we expect to see dirtied."""
-    if groups:
-        bits =3D set.union(*(GROUPS[group].bits(GRANULARITY) for group i=
n groups))
-        return len(bits)
-    return 0
-
-def bitmap_comparison(bitmap, groups=3DNone, want=3D0):
-    """
-    Print a nice human-readable message checking that this bitmap has as
-    many bits set as we expect it to.
-    """
-    log("=3D Checking Bitmap {:s} =3D".format(bitmap.get('name', '(anony=
mous)')))
-
-    if groups:
-        want =3D calculate_bits(groups)
-    have =3D bitmap['count'] // bitmap['granularity']
-
-    log("expecting {:d} dirty sectors; have {:d}. {:s}".format(
-        want, have, "OK!" if want =3D=3D have else "ERROR!"))
-    log('')
=20
 def compare_images(image, reference, baseimg=3DNone, expected_match=3DTr=
ue):
     """
@@ -321,12 +353,13 @@ def test_bitmap_sync(bsync_mode, failure=3DNone):
         vm.qmp_log("block-dirty-bitmap-add", node=3Ddrive0.name,
                    name=3D"bitmap0", granularity=3DGRANULARITY)
         log('')
+        ebitmap =3D EmulatedBitmap()
=20
         # 1 - Writes and Reference Backup
         bitmaps =3D perform_writes(drive0, 1)
-        dirty_groups =3D {1}
+        ebitmap.dirty_group(1)
         bitmap =3D get_bitmap(bitmaps, drive0.device, 'bitmap0')
-        bitmap_comparison(bitmap, groups=3Ddirty_groups)
+        ebitmap.compare(bitmap)
         reference_backup(drive0, 1, fbackup1)
=20
         # 1 - Bitmap Backup (Optional induced failure)
@@ -342,54 +375,47 @@ def test_bitmap_sync(bsync_mode, failure=3DNone):
             log('')
             bitmaps =3D perform_writes(drive0, 2)
             # Named bitmap (static, should be unchanged)
-            bitmap_comparison(get_bitmap(bitmaps, drive0.device, 'bitmap=
0'),
-                              groups=3Ddirty_groups)
+            ebitmap.compare(get_bitmap(bitmaps, drive0.device, 'bitmap0'=
))
             # Anonymous bitmap (dynamic, shows new writes)
-            bitmap_comparison(get_bitmap(bitmaps, drive0.device, '',
-                                         recording=3DTrue), groups=3D{2}=
)
-            dirty_groups.add(2)
+            anonymous =3D EmulatedBitmap()
+            anonymous.dirty_group(2)
+            anonymous.compare(get_bitmap(bitmaps, drive0.device, '',
+                                         recording=3DTrue))
+
+            # Simulate the order in which this will happen:
+            # group 1 gets cleared first, then group two gets written.
+            if ((bsync_mode =3D=3D 'on-success' and not failure) or
+                (bsync_mode =3D=3D 'always')):
+                ebitmap.clear_group(1)
+            ebitmap.dirty_group(2)
=20
         vm.run_job(job, auto_dismiss=3DTrue, auto_finalize=3DFalse,
                    pre_finalize=3D_callback,
                    cancel=3D(failure =3D=3D 'simulated'))
         bitmaps =3D query_bitmaps(vm)
-        bitmap =3D get_bitmap(bitmaps, drive0.device, 'bitmap0')
         log(bitmaps, indent=3D2)
         log('')
=20
-        if ((bsync_mode =3D=3D 'on-success' and not failure) or
-                (bsync_mode =3D=3D 'always' and failure !=3D 'intermedia=
te')):
-            dirty_groups.remove(1)
-
         if bsync_mode =3D=3D 'always' and failure =3D=3D 'intermediate':
             # We manage to copy one sector (one bit) before the error.
-            bitmap_comparison(bitmap,
-                              want=3Dcalculate_bits(groups=3Ddirty_group=
s) - 1)
-        else:
-            bitmap_comparison(bitmap, groups=3Ddirty_groups)
+            ebitmap.clear_bit(ebitmap.first_bit)
+        ebitmap.compare(get_bitmap(bitmaps, drive0.device, 'bitmap0'))
=20
         # 2 - Writes and Reference Backup
         bitmaps =3D perform_writes(drive0, 3)
-        dirty_groups.add(3)
-        bitmap =3D get_bitmap(bitmaps, drive0.device, 'bitmap0')
-        if bsync_mode =3D=3D 'always' and failure =3D=3D 'intermediate':
-            # We're one bit short, still.
-            bitmap_comparison(bitmap,
-                              want=3Dcalculate_bits(groups=3Ddirty_group=
s) - 1)
-        else:
-            bitmap_comparison(bitmap, groups=3Ddirty_groups)
+        ebitmap.dirty_group(3)
+        ebitmap.compare(get_bitmap(bitmaps, drive0.device, 'bitmap0'))
         reference_backup(drive0, 2, fbackup2)
=20
         # 2 - Bitmap Backup (In failure modes, this is a recovery.)
         job =3D bitmap_backup(drive0, 2, bsync2, "bitmap0", bsync_mode)
         vm.run_job(job, auto_dismiss=3DTrue, auto_finalize=3DFalse)
         bitmaps =3D query_bitmaps(vm)
-        bitmap =3D get_bitmap(bitmaps, drive0.device, 'bitmap0')
         log(bitmaps, indent=3D2)
         log('')
-        bitmap_comparison(bitmap, groups=3D{}
-                          if bsync_mode !=3D 'never'
-                          else dirty_groups)
+        if bsync_mode !=3D 'never':
+            ebitmap.clear()
+        ebitmap.compare(get_bitmap(bitmaps, drive0.device, 'bitmap0'))
=20
         log('--- Cleanup ---\n')
         vm.qmp_log("block-dirty-bitmap-remove",
--=20
2.21.0


