Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E8E721F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:52:02 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4V6-0001j7-Vz
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3wa-0002OZ-03
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3wY-0001lV-Op
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55531
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3wY-0001kf-KY
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572264978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+MXzl/3CFa1bQWMYehBdS2keQt5KxH37UFTv13JeXw=;
 b=h6h40v7e4kFzlGCXEceW7UX/CkMMoKwMRANWmJhSI1EpGy477bMHsancbjYueQ9j3mpVd2
 aaw/modQaONIaBAclL+sS28UE1KHDfuFz7e0xWMNWkdkl2yD3QYEqVDkiNfi7il2Qs4b9F
 4fXUD+15cKMREbwT6cnOZgN+u9Wf4NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-T-IqAX4LPEmgeE5c1PjXvg-1; Mon, 28 Oct 2019 08:16:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA792107AD28;
 Mon, 28 Oct 2019 12:16:13 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53BEE5DA2C;
 Mon, 28 Oct 2019 12:16:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 34/69] iotests/267: Create socket in $SOCK_DIR
Date: Mon, 28 Oct 2019 13:14:26 +0100
Message-Id: <20191028121501.15279-35-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: T-IqAX4LPEmgeE5c1PjXvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191017133155.5327-23-mreitz@redhat.com
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/267     | 4 ++--
 tests/qemu-iotests/267.out | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index d37a67c012..170e173c0a 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -29,7 +29,7 @@ status=3D1=09# failure is the default!
 _cleanup()
 {
     _cleanup_test_img
-    rm -f "$TEST_DIR/nbd"
+    rm -f "$SOCK_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -143,7 +143,7 @@ echo
=20
 IMGOPTS=3D"backing_file=3D$TEST_IMG.base" _make_test_img $size
 cat <<EOF |
-nbd_server_start unix:$TEST_DIR/nbd
+nbd_server_start unix:$SOCK_DIR/nbd
 nbd_server_add -w backing-fmt
 savevm snap0
 info snapshots
diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
index 9d812e3c72..8dddb4baa4 100644
--- a/tests/qemu-iotests/267.out
+++ b/tests/qemu-iotests/267.out
@@ -161,7 +161,7 @@ Internal snapshots on backing file:
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base
 Testing: -blockdev driver=3Dfile,filename=3DTEST_DIR/t.IMGFMT.base,node-na=
me=3Dbacking-file -blockdev driver=3DIMGFMT,file=3Dbacking-file,node-name=
=3Dbacking-fmt -blockdev driver=3Dfile,filename=3DTEST_DIR/t.IMGFMT,node-na=
me=3Dfile -blockdev driver=3DIMGFMT,file=3Dfile,backing=3Dbacking-fmt,node-=
name=3Dfmt
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) nbd_server_start unix:TEST_DIR/nbd
+(qemu) nbd_server_start unix:SOCK_DIR/nbd
 (qemu) nbd_server_add -w backing-fmt
 (qemu) savevm snap0
 (qemu) info snapshots
--=20
2.21.0


