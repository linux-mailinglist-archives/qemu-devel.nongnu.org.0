Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C52D793A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 16:53:32 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKOCZ-0000rU-Au
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 10:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iKNoS-0007Td-Qr
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iKNoR-0000Pj-HM
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 10:28:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64618)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iKNoO-0000NC-Nz; Tue, 15 Oct 2019 10:28:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE9BC306F4AE;
 Tue, 15 Oct 2019 14:28:31 +0000 (UTC)
Received: from localhost (ovpn-117-226.ams2.redhat.com [10.36.117.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC0A6402A;
 Tue, 15 Oct 2019 14:28:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 21/21] iotests: Allow check -o data_file
Date: Tue, 15 Oct 2019 16:27:29 +0200
Message-Id: <20191015142729.18123-22-mreitz@redhat.com>
In-Reply-To: <20191015142729.18123-1-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 15 Oct 2019 14:28:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem with allowing the data_file option is that you want to use a
different data file per image used in the test.  Therefore, we need to
allow patterns like -o data_file=3D'$TEST_IMG.data_file'.

Then, we need to filter it out from qemu-img map, qemu-img create, and
remove the data file in _rm_test_img.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.filter | 23 +++++++++++++++++++++--
 tests/qemu-iotests/common.rc     | 22 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 63bc6f6f26..9dd05689d1 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -121,7 +121,13 @@ _filter_actual_image_size()
 # replace driver-specific options in the "Formatting..." line
 _filter_img_create()
 {
-    $SED -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
+    data_file_filter=3D()
+    if data_file=3D$(_get_data_file "$TEST_IMG"); then
+        data_file_filter=3D(-e "s# data_file=3D$data_file##")
+    fi
+
+    $SED "${data_file_filter[@]}" \
+        -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
         -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
         -e "s#$TEST_DIR#TEST_DIR#g" \
         -e "s#$IMGFMT#IMGFMT#g" \
@@ -204,9 +210,22 @@ _filter_img_info()
 # human and json output
 _filter_qemu_img_map()
 {
+    # Assuming the data_file value in $IMGOPTS contains a '$TEST_IMG',
+    # create a filter that replaces the data file name by $TEST_IMG.
+    # Example:
+    #   In $IMGOPTS: 'data_file=3D$TEST_IMG.data_file'
+    #   Then data_file_pattern =3D=3D '\(.*\).data_file'
+    #   And  data_file_filter  =3D=3D -e 's#\(.*\).data_file#\1#
+    data_file_filter=3D()
+    if data_file_pattern=3D$(_get_data_file '\\(.*\\)'); then
+        data_file_filter=3D(-e "s#$data_file_pattern#\\1#")
+    fi
+
     $SED -e 's/\([0-9a-fx]* *[0-9a-fx]* *\)[0-9a-fx]* */\1/g' \
         -e 's/"offset": [0-9]\+/"offset": OFFSET/g' \
-        -e 's/Mapped to *//' | _filter_testdir | _filter_imgfmt
+        -e 's/Mapped to *//' \
+        "${data_file_filter[@]}" \
+        | _filter_testdir | _filter_imgfmt
 }
=20
 _filter_nbd()
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index f3784077de..bed789a691 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -277,6 +277,20 @@ _stop_nbd_server()
     fi
 }
=20
+# Gets the data_file value from IMGOPTS and replaces the '$TEST_IMG'
+# pattern by '$1'
+# Caution: The replacement is done with sed, so $1 must be escaped
+#          properly.  (The delimiter is '#'.)
+_get_data_file()
+{
+    if ! echo "$IMGOPTS" | grep -q 'data_file=3D'; then
+        return 1
+    fi
+
+    echo "$IMGOPTS" | sed -e 's/.*data_file=3D\([^,]*\).*/\1/' \
+                    | sed -e "s#\\\$TEST_IMG#$1#"
+}
+
 _make_test_img()
 {
     # extra qemu-img options can be added by tests
@@ -297,7 +311,8 @@ _make_test_img()
     fi
=20
     if [ -n "$IMGOPTS" ]; then
-        optstr=3D$(_optstr_add "$optstr" "$IMGOPTS")
+        imgopts_expanded=3D$(echo "$IMGOPTS" | sed -e "s#\\\$TEST_IMG#$i=
mg_name#")
+        optstr=3D$(_optstr_add "$optstr" "$imgopts_expanded")
     fi
     if [ -n "$IMGKEYSECRET" ]; then
         object_options=3D"--object secret,id=3Dkeysec0,data=3D$IMGKEYSEC=
RET"
@@ -376,6 +391,11 @@ _rm_test_img()
         # Remove all the extents for vmdk
         "$QEMU_IMG" info "$img" 2>/dev/null | grep 'filename:' | cut -f =
2 -d: \
             | xargs -I {} rm -f "{}"
+    elif [ "$IMGFMT" =3D "qcow2" ]; then
+        # Remove external data file
+        if data_file=3D$(_get_data_file "$img"); then
+            rm -f "$data_file"
+        fi
     fi
     rm -f "$img"
 }
--=20
2.21.0


