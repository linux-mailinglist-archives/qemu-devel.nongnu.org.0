Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF3D66FF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:15:04 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK2zb-00005w-Q1
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iK2pJ-00034O-ME
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iK2pI-0006bx-Ap
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:04:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10549)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iK2pF-0006YR-Q9; Mon, 14 Oct 2019 12:04:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A53530860C0;
 Mon, 14 Oct 2019 16:04:01 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 032265C1D4;
 Mon, 14 Oct 2019 16:03:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/15] iotests/028: Fix for long $TEST_DIRs
Date: Mon, 14 Oct 2019 18:03:43 +0200
Message-Id: <20191014160343.8211-10-kwolf@redhat.com>
In-Reply-To: <20191014160343.8211-1-kwolf@redhat.com>
References: <20191014160343.8211-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 14 Oct 2019 16:04:01 +0000 (UTC)
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

For long test image paths, the order of the "Formatting" line and the
"(qemu)" prompt after a drive_backup HMP command may be reversed.  In
fact, the interaction between the prompt and the line may lead to the
"Formatting" to being greppable at all after "read"-ing it (if the
prompt injects an IFS character into the "Formatting" string).

So just wait until we get a prompt.  At that point, the block job must
have been started, so "info block-jobs" will only return "No active
jobs" once it is done.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/028     | 11 ++++++++---
 tests/qemu-iotests/028.out |  1 -
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 71301ec6e5..bba1ee59ae 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -119,9 +119,14 @@ fi
 # Silence output since it contains the disk image path and QEMU's readli=
ne
 # character echoing makes it very hard to filter the output. Plus, there
 # is no telling how many times the command will repeat before succeeding=
.
-_send_qemu_cmd $h "drive_backup disk ${TEST_IMG}.copy" "(qemu)" >/dev/nu=
ll
-_send_qemu_cmd $h "" "Formatting" | _filter_img_create
-qemu_cmd_repeat=3D20 _send_qemu_cmd $h "info block-jobs" "No active jobs=
" >/dev/null
+# (Note that creating the image results in a "Formatting..." message ove=
r
+# stdout, which is the same channel the monitor uses.  We cannot reliabl=
y
+# wait for it because the monitor output may interact with it in such a
+# way that _timed_wait_for cannot read it.  However, once the block job =
is
+# done, we know that the "Formatting..." message must have appeared
+# already, so the output is still deterministic.)
+silent=3Dy _send_qemu_cmd $h "drive_backup disk ${TEST_IMG}.copy" "(qemu=
)"
+silent=3Dy qemu_cmd_repeat=3D20 _send_qemu_cmd $h "info block-jobs" "No =
active jobs"
 _send_qemu_cmd $h "info block-jobs" "No active jobs"
 _send_qemu_cmd $h 'quit' ""
=20
diff --git a/tests/qemu-iotests/028.out b/tests/qemu-iotests/028.out
index 7d54aeb003..37aed84436 100644
--- a/tests/qemu-iotests/028.out
+++ b/tests/qemu-iotests/028.out
@@ -468,7 +468,6 @@ No errors were found on the image.
=20
 block-backup
=20
-Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=3DIMGFMT size=3D4294968832 back=
ing_file=3DTEST_DIR/t.IMGFMT.base backing_fmt=3DIMGFMT
 (qemu) info block-jobs
 No active jobs
 =3D=3D=3D IO: pattern 195
--=20
2.20.1


