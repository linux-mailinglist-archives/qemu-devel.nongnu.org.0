Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02131011F6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 04:14:40 +0100 (CET)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWtyR-0000sD-Hs
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 22:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWtsK-0001z4-W9
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWtsI-0004p1-UP
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57561
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWtsI-0004oD-QD
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574132898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sMogfW6oNSS6+OquqWXNrhtHWsI3J23eaamEA7qgMs=;
 b=drRNcQev0439OigmRyhCbpBe4qVbOCSBUmNBZOF1bFD81DwnyQ7BoAR460mb1WM7QoJ/xt
 ZfdEEXj7ubPdOta0Ajo7aY7jtcTyBq+GbuOVgF6UPMMnl6NlqOSb4oADh9FqS5ftjeBNLE
 O2hLqouJYF4+reSXEQYPwvKxxNb6xEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-WyohkPpzNqeMXMeAfkm7Ew-1; Mon, 18 Nov 2019 22:08:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08FD11005509;
 Tue, 19 Nov 2019 03:08:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF3860565;
 Tue, 19 Nov 2019 03:08:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] iotests: Fix 173
Date: Mon, 18 Nov 2019 21:07:56 -0600
Message-Id: <20191119030759.24907-8-eblake@redhat.com>
In-Reply-To: <20191119030759.24907-1-eblake@redhat.com>
References: <20191119030759.24907-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: WyohkPpzNqeMXMeAfkm7Ew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test has been broken since 3.0.  It used TEST_IMG to influence
the name of a file created during _make_test_img, but commit 655ae6bb
changed things so that the wrong file name is being created, which
then caused _launch_qemu to fail.  In the meantime, the set of events
issued for the actions of the test has increased.

Why haven't we noticed the failure? Because the test rarely gets run:
'./check -qcow2 173' is insufficient (that defaults to using file protocol)
'./check -nfs 173' is insufficient (that defaults to using raw format)
so the test is only run with:
./check -qcow2 -nfs 173

Note that we already have a number of other problems with -nfs:
./check -nfs (fails 18/30)
./check -qcow2 -nfs (fails 45/76 after this patch, if exports does
not permit 'insecure')
and it's not on my priority list to fix those.  Rather, I found this
because of my next patch's work on tests using _send_qemu_cmd.

Fixes: 655ae6b
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20191114213415.23499-2-eblake@redhat.com>
---
 tests/qemu-iotests/173     | 4 ++--
 tests/qemu-iotests/173.out | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/173 b/tests/qemu-iotests/173
index 9e2fa2e73cb9..29dcaa1960df 100755
--- a/tests/qemu-iotests/173
+++ b/tests/qemu-iotests/173
@@ -47,9 +47,9 @@ size=3D100M
 BASE_IMG=3D"${TEST_DIR}/image.base"
 TOP_IMG=3D"${TEST_DIR}/image.snp1"

-TEST_IMG=3D"${BASE_IMG}" _make_test_img $size
+TEST_IMG_FILE=3D"${BASE_IMG}" _make_test_img $size

-TEST_IMG=3D"${TOP_IMG}" _make_test_img $size
+TEST_IMG_FILE=3D"${TOP_IMG}" _make_test_img $size

 echo
 echo =3D=3D=3D Running QEMU, using block-stream to find backing image =3D=
=3D=3D
diff --git a/tests/qemu-iotests/173.out b/tests/qemu-iotests/173.out
index f477a0099a32..e83d17ec2f64 100644
--- a/tests/qemu-iotests/173.out
+++ b/tests/qemu-iotests/173.out
@@ -7,6 +7,10 @@ Formatting 'TEST_DIR/image.snp1', fmt=3DIMGFMT size=3D1048=
57600
 {"return": {}}
 {"return": {}}
 {"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk2"}}
 {"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "BLOCK_JOB_COMPLETED", "data": {"device": "disk2", "len": 104857600, "off=
set": 104857600, "speed": 0, "type": "stream"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "disk2"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event"=
: "BLOCK_JOB_COMPLETED", "data": {"device": "disk2", "len": 0, "offset": 0,=
 "speed": 0, "type": "stream"}}
 *** done
--=20
2.21.0


