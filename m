Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA53CE17F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 14:21:04 +0200 (CEST)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHS0d-0002KG-MY
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 08:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iHRrU-0002sn-DY
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iHRrS-00050f-Cb
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:11:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iHRrK-0004rn-FN; Mon, 07 Oct 2019 08:11:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F5AB30832C8;
 Mon,  7 Oct 2019 12:11:25 +0000 (UTC)
Received: from localhost (unknown [10.36.118.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376AA1001B39;
 Mon,  7 Oct 2019 12:11:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] qemu-img: adds option to use aio engine for benchmarking
Date: Mon,  7 Oct 2019 13:09:33 +0100
Message-Id: <20191007120937.5862-13-stefanha@redhat.com>
In-Reply-To: <20191007120937.5862-1-stefanha@redhat.com>
References: <20191007120937.5862-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 07 Oct 2019 12:11:25 +0000 (UTC)
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@mail.ru>, Julia Suvorova <jusual@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v10:
 * Add missing space to qemu-img command-line documentation
---
 qemu-img.c       | 11 ++++++++++-
 qemu-img-cmds.hx |  4 ++--
 qemu-img.texi    |  5 ++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 384c6f38bc..77084c127b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4202,7 +4202,8 @@ static int img_bench(int argc, char **argv)
             {"force-share", no_argument, 0, 'U'},
             {0, 0, 0, 0}
         };
-        c =3D getopt_long(argc, argv, ":hc:d:f:no:qs:S:t:wU", long_optio=
ns, NULL);
+        c =3D getopt_long(argc, argv, ":hc:d:f:ni:o:qs:S:t:wU", long_opt=
ions,
+                        NULL);
         if (c =3D=3D -1) {
             break;
         }
@@ -4245,6 +4246,14 @@ static int img_bench(int argc, char **argv)
         case 'n':
             flags |=3D BDRV_O_NATIVE_AIO;
             break;
+        case 'i':
+            ret =3D bdrv_parse_aio(optarg, &flags);
+            if (ret < 0) {
+                error_report("Invalid aio option: %s", optarg);
+                ret =3D -1;
+                goto out;
+            }
+            break;
         case 'o':
         {
             offset =3D cvtnum(optarg);
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 1c93e6d185..77b5a8dda8 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -20,9 +20,9 @@ STEXI
 ETEXI
=20
 DEF("bench", img_bench,
-    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_inte=
rval] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s buffer=
_size] [-S step_size] [-t cache] [-w] [-U] filename")
+    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_inte=
rval] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s buffer=
_size] [-S step_size] [-t cache] [-i aio] [-w] [-U] filename")
 STEXI
-@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pat=
tern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-=
t @var{cache}] [-w] [-U] @var{filename}
+@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pat=
tern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-=
t @var{cache}] [-i @var{aio}] [-w] [-U] @var{filename}
 ETEXI
=20
 DEF("check", img_check,
diff --git a/qemu-img.texi b/qemu-img.texi
index b5156d6316..20136fcb94 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -206,7 +206,7 @@ Command description:
 Amends the image format specific @var{options} for the image file
 @var{filename}. Not all file formats support this operation.
=20
-@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pat=
tern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-=
t @var{cache}] [-w] [-U] @var{filename}
+@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-in=
terval=3D@var{flush_interval}] [-n] [-i @var{aio}] [--no-drain] [-o @var{=
offset}] [--pattern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var=
{step_size}] [-t @var{cache}] [-w] [-U] @var{filename}
=20
 Run a simple sequential I/O benchmark on the specified image. If @code{-=
w} is
 specified, a write test is performed, otherwise a read test is performed=
.
@@ -227,6 +227,9 @@ If @code{-n} is specified, the native AIO backend is =
used if possible. On
 Linux, this option only works if @code{-t none} or @code{-t directsync} =
is
 specified as well.
=20
+If @code{-i} is specified, aio option can be used to specify different A=
IO
+backends: @var{threads}, @var{native} or @var{io_uring}.
+
 For write tests, by default a buffer filled with zeros is written. This =
can be
 overridden with a pattern byte specified by @var{pattern}.
=20
--=20
2.21.0


