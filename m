Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9228140893
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:01:55 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPNy-000336-Vk
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1isPLN-0000Tw-0I
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1isPLL-0006Db-Bz
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21773
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1isPLL-0006DB-8I
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579258750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ST274PNeoT3e4ne/Epca/nX9z10W3liOCkxiSkqDRVc=;
 b=Zv+v6ouIMDFOzJoWjP1AnJTqdm4lqrcAxNdL8IEG+9ne91RTP8c+aJl+xjdJiUSvBuqCXx
 uxz0xHanXzBCs4QcQrY9Wv/Lfk0p8UbgSHi8bHsddHE+NizgMRhuHhxO9xpzg8D54UWiyt
 czeXOhJXNutl97cloiq80eOdNGAqwmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-NVjzCQ3xNxiTBrluyGHA5w-1; Fri, 17 Jan 2020 05:59:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD74800D12;
 Fri, 17 Jan 2020 10:59:08 +0000 (UTC)
Received: from localhost (ovpn-117-75.ams2.redhat.com [10.36.117.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 981DF845A1;
 Fri, 17 Jan 2020 10:59:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: Test snapshot -l field separation
Date: Fri, 17 Jan 2020 11:58:59 +0100
Message-Id: <20200117105859.241818-3-mreitz@redhat.com>
In-Reply-To: <20200117105859.241818-1-mreitz@redhat.com>
References: <20200117105859.241818-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: NVjzCQ3xNxiTBrluyGHA5w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test that all fields in "qemu-img snapshot -l"s output are
separated by spaces.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/284     | 76 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/284.out |  8 ++++
 tests/qemu-iotests/group   |  1 +
 3 files changed, 85 insertions(+)
 create mode 100755 tests/qemu-iotests/284
 create mode 100644 tests/qemu-iotests/284.out

diff --git a/tests/qemu-iotests/284 b/tests/qemu-iotests/284
new file mode 100755
index 0000000000..f14445ba4a
--- /dev/null
+++ b/tests/qemu-iotests/284
@@ -0,0 +1,76 @@
+#!/usr/bin/env bash
+#
+# Test qemu-img snapshot -l
+#
+# Copyright (C) 2019 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+seq=3D$(basename "$0")
+echo "QA output created by $seq"
+
+status=3D1=09# failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+
+_supported_fmt qcow2
+_supported_proto file
+# Internal snapshots are (currently) impossible with refcount_bits=3D1,
+# and generally impossible with external data files
+_unsupported_imgopts 'refcount_bits=3D1[^0-9]' data_file
+
+_make_test_img 64M
+
+# Should be so long as to take up the whole field width
+sn_name=3Dabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
+
+# More memory will give us a larger VM state, i.e. one above 1 MB.
+# This way, we get a number with a decimal point.
+qemu_comm_method=3Dmonitor _launch_qemu -m 512 "$TEST_IMG"
+
+_send_qemu_cmd $QEMU_HANDLE "savevm $sn_name" '(qemu)'
+_send_qemu_cmd $QEMU_HANDLE 'quit' '(qemu)'
+wait=3Dyes _cleanup_qemu
+
+# Check that all fields are separated by spaces.
+# We first collapse all space sequences into one space each;
+# then we turn every space-separated field into a '.';
+# and finally, we name the '.'s so the output is not just a confusing
+# sequence of dots.
+
+echo 'Output structure:'
+$QEMU_IMG snapshot -l "$TEST_IMG" | tail -n 1 | tr -s ' ' \
+    | sed -e 's/\S\+/./g' \
+    | sed -e 's/\./(snapshot ID)/' \
+          -e 's/\./(snapshot name)/' \
+          -e 's/\./(VM state size value)/' \
+          -e 's/\./(VM state size unit)/' \
+          -e 's/\./(snapshot date)/' \
+          -e 's/\./(snapshot time)/' \
+          -e 's/\./(VM clock)/'
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=3D0
diff --git a/tests/qemu-iotests/284.out b/tests/qemu-iotests/284.out
new file mode 100644
index 0000000000..13ced439be
--- /dev/null
+++ b/tests/qemu-iotests/284.out
@@ -0,0 +1,8 @@
+QA output created by 284
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) savevm abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
+(qemu) quit
+Output structure:
+(snapshot ID) (snapshot name) (VM state size value) (VM state size unit) (=
snapshot date) (snapshot time) (VM clock)
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index cb2b789e44..f8ce344f83 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -288,3 +288,4 @@
 277 rw quick
 279 rw backing quick
 280 rw migration quick
+284 rw quick
--=20
2.24.1


