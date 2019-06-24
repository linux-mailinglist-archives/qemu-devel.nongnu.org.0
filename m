Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88551A36
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 20:02:50 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfTIo-0003Rz-2a
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 14:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfSxD-0001lF-8n
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfSxA-0005k1-Qm
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 13:40:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39786)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfSwy-0005SF-R8; Mon, 24 Jun 2019 13:40:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC8D5C057E9F;
 Mon, 24 Jun 2019 17:40:10 +0000 (UTC)
Received: from localhost (ovpn-204-152.brq.redhat.com [10.40.204.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6165D9D3;
 Mon, 24 Jun 2019 17:40:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 24 Jun 2019 19:39:32 +0200
Message-Id: <20190624173935.25747-13-mreitz@redhat.com>
In-Reply-To: <20190624173935.25747-1-mreitz@redhat.com>
References: <20190624173935.25747-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 24 Jun 2019 17:40:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 12/14] iotests: Test internal option typing
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
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It would be nice if qemu used the correct types for blockdev options
internally, even if the user specified string values (either through
-drive or by being not so nice and using json:{} with string values).
This patch adds a test verifying that fact.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/089     | 25 +++++++++++++++++++++++++
 tests/qemu-iotests/089.out |  9 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index ad029f1f09..156a8af85c 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -35,6 +35,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # get standard environment, filters and checks
 . ./common.rc
 . ./common.filter
+. ./common.qemu
=20
 _supported_fmt qcow2
 _supported_proto file
@@ -143,6 +144,30 @@ $QEMU_IO -c "open -o driver=3Dqcow2 json:{\"file.fil=
ename\":\"$TEST_IMG\"}" \
 $QEMU_IO -c "open -o driver=3Dqcow2 json:{\"driver\":\"raw\",\"file.file=
name\":\"$TEST_IMG\"}" \
          -c "info" 2>&1 | _filter_img_info
=20
+echo
+echo "=3D=3D=3D Testing option typing =3D=3D=3D"
+echo
+
+# json:{} accepts both strings and correctly typed values (even mixed,
+# although we probably do not want to support that...), but when
+# creating a json:{} filename, it should be correctly typed.
+# Therefore, both of these should make the "size" value an integer.
+
+TEST_IMG=3D"json:{'driver': 'null-co', 'size':  42 }" _img_info | grep '=
^image'
+TEST_IMG=3D"json:{'driver': 'null-co', 'size': '42'}" _img_info | grep '=
^image'
+
+echo
+
+# This should even work when some driver abuses bs->options to store
+# non-QAPI options (and the given -drive options are not complete)
+# (Watch for whether file.align appears as an int or a string)
+qemu_comm_method=3Dmonitor _launch_qemu \
+    -drive if=3Dnone,id=3Ddrv0,node-name=3Dnode0,format=3Draw,file=3Dblk=
debug::null-co://,file.align=3D512
+
+_send_qemu_cmd $QEMU_HANDLE 'info block' 'json:'
+
+_cleanup_qemu
+
=20
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/089.out b/tests/qemu-iotests/089.out
index 20c8ce8f0e..a43dfd3cf8 100644
--- a/tests/qemu-iotests/089.out
+++ b/tests/qemu-iotests/089.out
@@ -49,4 +49,13 @@ vm state offset: 512 MiB
 format name: IMGFMT
 cluster size: 64 KiB
 vm state offset: 512 MiB
+
+=3D=3D=3D Testing option typing =3D=3D=3D
+
+image: json:{"driver": "null-co", "size": 42}
+image: json:{"driver": "null-co", "size": 42}
+
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) info block
+drv0 (node0): json:{"driver": "raw", "file": {"image": {"driver": "null-=
co"}, "driver": "blkdebug", "align": 512}} (raw)
 *** done
--=20
2.21.0


