Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7A183971
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 20:30:16 +0100 (CET)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCTX5-0005vA-4a
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 15:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jCTVa-0004Or-Oc
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jCTVZ-00072w-8z
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47553
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jCTVZ-00071G-4l
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584041320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLYZ0NYdK4KlsEb4Jhb+oZYrHEz1g67ux3Km4nveCu8=;
 b=VVVlBNIeafLsJgYdbNNz6Tb5WzkCDKJxECGSpQX5nteU+oHJn1HGUju1a0YcANO4EvgSY0
 HTdiKgdIhsi0ArhinpQUN7QGL+HkGjVehI4q/KuBefRkRqrW0DZDfOWHKWzFQVGWgXQS4n
 N+BqQviimb10nINBUQfRtRGfF1+Vcvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-q3Ycqmd2Nja3ZyIlAfLWRA-1; Thu, 12 Mar 2020 15:28:38 -0400
X-MC-Unique: q3Ycqmd2Nja3ZyIlAfLWRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5B8107ACC7;
 Thu, 12 Mar 2020 19:28:37 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60975DDA5;
 Thu, 12 Mar 2020 19:28:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] qcow2: Deprecate use of qemu-img amend to change
 backing file
Date: Thu, 12 Mar 2020 14:28:19 -0500
Message-Id: <20200312192822.3739399-5-eblake@redhat.com>
In-Reply-To: <20200312192822.3739399-1-eblake@redhat.com>
References: <20200312192822.3739399-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 kchamart@redhat.com, libvir-list@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use of 'qemu-img amend' to change qcow2 backing files is not
tested very well.  In particular, our implementation has a bug where
if a new backing file is provided without a format, then the prior
format is blindly reused, even if this results in data corruption, but
this is not caught by iotests.

There are also situations where amending other options needs access to
the original backing file (for example, on a downgrade to a v2 image,
knowing whether a v3 zero cluster must be allocated or may be left
unallocated depends on knowing whether the backing file already reads
as zero), but the command line does not have a nice way to tell us
both the backing file to use for opening the image as well as the
backing file to install after the operation is complete.

Even if we do allow changing the backing file, it is redundant with
the existing ability to change backing files via 'qemu-img rebase -u'.
It is time to deprecate this support (leaving the existing behavior
intact, even if it is buggy), and at a point in the future, require
the use of only 'qemu-img rebase' for adjusting backing chain
relations, saving 'qemu-img amend' for changes unrelated to the
backing chain.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/system/deprecated.rst | 12 ++++++++++++
 docs/tools/qemu-img.rst    |  4 ++++
 block/qcow2.c              |  5 +++++
 tests/qemu-iotests/061.out |  1 +
 tests/qemu-iotests/082.out |  2 ++
 5 files changed, 24 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 0838338d8fbe..4261d5589e6a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -370,6 +370,18 @@ The above, converted to the current supported format::
 Related binaries
 ----------------

+qemu-img amend to adjust backing file (since 5.0.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The use of ``qemu-img amend`` to modify the name or format of a qcow2
+backing image is deprecated; this functionality was never fully
+documented or tested, and interferes with other amend operations that
+need access to the original backing image (such as deciding whether a
+v3 zero cluster may be left unallocated when converting to a v2
+image).  Rather, any changes to the backing chain should be performed
+with ``qemu-img rebase -u`` either before or after the remaining
+changes being performed by amend, as appropriate.
+
 ``qemu-img convert -n -o`` (since 4.2.0)
 ''''''''''''''''''''''''''''''''''''''''

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 0080f83a76c9..83d57586be96 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -254,6 +254,10 @@ Command description:
   Amends the image format specific *OPTIONS* for the image file
   *FILENAME*. Not all file formats support this operation.

+  The set of options that can be amended are dependent on the image
+  format, but note that amending the backing chain relationship should
+  instead be performed with ``qemu-img rebase``.
+
 .. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=3DFLUSH=
_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=3DPATTERN] [-q=
] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME

   Run a simple sequential I/O benchmark on the specified image. If ``-w`` =
is
diff --git a/block/qcow2.c b/block/qcow2.c
index d44b45633dbb..97a1757156bb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5281,6 +5281,11 @@ static int qcow2_amend_options(BlockDriverState *bs,=
 QemuOpts *opts,
     }

     if (backing_file || backing_format) {
+        if (g_strcmp0(backing_file, s->image_backing_file) ||
+            g_strcmp0(backing_format, s->image_backing_format)) {
+            warn_report("Deprecated use of amend to alter the backing file=
; "
+                        "use qemu-img rebase instead");
+        }
         ret =3D qcow2_change_backing_file(bs,
                     backing_file ?: s->image_backing_file,
                     backing_format ?: s->image_backing_format);
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 8b3091a412bc..3bf37b526f8b 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -342,6 +342,7 @@ wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-img: warning: Deprecated use of amend to alter the backing file; use =
qemu-img rebase instead
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 9d4ed4dc9d61..94ea990a2754 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -806,10 +806,12 @@ Creation options for 'qcow2':
 Note that not all of these options may be amendable.

 Testing: amend -f qcow2 -o backing_file=3DTEST_DIR/t.qcow2,,help TEST_DIR/=
t.qcow2
+qemu-img: warning: Deprecated use of amend to alter the backing file; use =
qemu-img rebase instead

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

 Testing: amend -f qcow2 -o backing_file=3DTEST_DIR/t.qcow2,,? TEST_DIR/t.q=
cow2
+qemu-img: warning: Deprecated use of amend to alter the backing file; use =
qemu-img rebase instead

 Testing: rebase -u -b  -f qcow2 TEST_DIR/t.qcow2

--=20
2.25.1


