Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C85181AB4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 15:04:17 +0100 (CET)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC1y4-0000ca-Ua
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 10:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jC1n1-0004CZ-NA
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jC1mz-0002dA-Vq
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32117
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jC1mz-0002bc-Pn
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583934764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uhbHXDeA6IJJvlcC/vjMp5zeB1K+hwCA9s+07s76M4=;
 b=Jrf9wfZGU6L0WrxGLnVLJkoFNoARXfVqQs2QO3i5y5wA4DVOw+dPKYbJx0hJ3QjvQKzFSH
 2zqYjXZV8+RmuCNK2hwN+rbhDI71SLPbbnUoo8muCAPeSEwevMzvpTBNIvqWl6Gk7sG4/h
 lTtBMl3WvYI1JaoRly4zi95kBxXeOOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-xVR70iq4N9iPP44j0BxQKg-1; Wed, 11 Mar 2020 09:52:25 -0400
X-MC-Unique: xVR70iq4N9iPP44j0BxQKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BC5100550D;
 Wed, 11 Mar 2020 13:52:24 +0000 (UTC)
Received: from localhost (ovpn-117-216.ams2.redhat.com [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D00127BD9;
 Wed, 11 Mar 2020 13:52:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/19] qemu-img: allow qemu-img measure --object without a
 filename
Date: Wed, 11 Mar 2020 14:51:57 +0100
Message-Id: <20200311135213.1242028-4-mreitz@redhat.com>
In-Reply-To: <20200311135213.1242028-1-mreitz@redhat.com>
References: <20200311135213.1242028-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

In most qemu-img sub-commands the --object option only makes sense when
there is a filename.  qemu-img measure is an exception because objects
may be referenced from the image creation options instead of an existing
image file.  Allow --object without a filename.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200221112522.1497712-4-stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qemu-img.c                       | 6 ++----
 tests/qemu-iotests/178           | 2 +-
 tests/qemu-iotests/178.out.qcow2 | 8 ++++----
 tests/qemu-iotests/178.out.raw   | 8 ++++----
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 804630a368..4bc40df6d2 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4932,10 +4932,8 @@ static int img_measure(int argc, char **argv)
         filename =3D argv[optind];
     }
=20
-    if (!filename &&
-        (object_opts || image_opts || fmt || snapshot_name || sn_opts)) {
-        error_report("--object, --image-opts, -f, and -l "
-                     "require a filename argument.");
+    if (!filename && (image_opts || fmt || snapshot_name || sn_opts)) {
+        error_report("--image-opts, -f, and -l require a filename argument=
.");
         goto out;
     }
     if (filename && img_size !=3D UINT64_MAX) {
diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index 51a70fe669..7cf0e27154 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -50,7 +50,7 @@ _make_test_img 1G
 $QEMU_IMG measure # missing arguments
 $QEMU_IMG measure --size 2G "$TEST_IMG" # only one allowed
 $QEMU_IMG measure "$TEST_IMG" a # only one filename allowed
-$QEMU_IMG measure --object secret,id=3Dsec0,data=3DMTIzNDU2,format=3Dbase6=
4 # missing filename
+$QEMU_IMG measure --object secret,id=3Dsec0,data=3DMTIzNDU2,format=3Dbase6=
4 # size or filename needed
 $QEMU_IMG measure --image-opts # missing filename
 $QEMU_IMG measure -f qcow2 # missing filename
 $QEMU_IMG measure -l snap1 # missing filename
diff --git a/tests/qemu-iotests/178.out.qcow2 b/tests/qemu-iotests/178.out.=
qcow2
index 9e7d8c44df..f59bf4b2fb 100644
--- a/tests/qemu-iotests/178.out.qcow2
+++ b/tests/qemu-iotests/178.out.qcow2
@@ -5,10 +5,10 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D10737=
41824
 qemu-img: Either --size N or one filename must be specified.
 qemu-img: --size N cannot be used together with a filename.
 qemu-img: At most one filename argument is allowed.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
+qemu-img: Either --size N or one filename must be specified.
+qemu-img: --image-opts, -f, and -l require a filename argument.
+qemu-img: --image-opts, -f, and -l require a filename argument.
+qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo'
diff --git a/tests/qemu-iotests/178.out.raw b/tests/qemu-iotests/178.out.ra=
w
index 6478365905..404ca908d8 100644
--- a/tests/qemu-iotests/178.out.raw
+++ b/tests/qemu-iotests/178.out.raw
@@ -5,10 +5,10 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D10737=
41824
 qemu-img: Either --size N or one filename must be specified.
 qemu-img: --size N cannot be used together with a filename.
 qemu-img: At most one filename argument is allowed.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
-qemu-img: --object, --image-opts, -f, and -l require a filename argument.
+qemu-img: Either --size N or one filename must be specified.
+qemu-img: --image-opts, -f, and -l require a filename argument.
+qemu-img: --image-opts, -f, and -l require a filename argument.
+qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo'
--=20
2.24.1


