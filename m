Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F73124E31
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:45:11 +0100 (CET)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcRh-00023Y-O3
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ihcHR-0004qU-Se
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:34:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ihcHQ-0000qf-Gh
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:34:33 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22564
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ihcHQ-0000no-BV
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576686871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0vpb2kVCJV5YOJiUU8pWfG3b8NemYhWXlLjuH88E5o=;
 b=ifKwV5EOVU3DXE/57xMEI+nHfyu7ncpJE6NsWSTaWOF97QjRAe6ToF4iI7TpPc2kqWRhCF
 4Ya4NHZbA9rd/p5SuuYI83ZKrEKhTW+mkGrapqzrM1XXwGbiQ0dCXj6JEm3N04e3TV57Ot
 vhUbLRhNubXjGdlsOjarC08GcY+rY08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-YYIYOKi2PZ6wLjimfyStgw-1; Wed, 18 Dec 2019 11:34:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B094E802687;
 Wed, 18 Dec 2019 16:34:26 +0000 (UTC)
Received: from localhost (unknown [10.36.118.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E4D5C1D4;
 Wed, 18 Dec 2019 16:34:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 12/15] qemu-img: adds option to use aio engine for
 benchmarking
Date: Wed, 18 Dec 2019 16:32:25 +0000
Message-Id: <20191218163228.1613099-13-stefanha@redhat.com>
In-Reply-To: <20191218163228.1613099-1-stefanha@redhat.com>
References: <20191218163228.1613099-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: YYIYOKi2PZ6wLjimfyStgw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v10:
 * Add missing space to qemu-img command-line documentation
---
 qemu-img-cmds.hx |  4 ++--
 qemu-img.c       | 11 ++++++++++-
 qemu-img.texi    |  5 ++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 1c93e6d185..77b5a8dda8 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -20,9 +20,9 @@ STEXI
 ETEXI
=20
 DEF("bench", img_bench,
-    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_interv=
al] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s buffer_siz=
e] [-S step_size] [-t cache] [-w] [-U] filename")
+    "bench [-c count] [-d depth] [-f fmt] [--flush-interval=3Dflush_interv=
al] [-n] [--no-drain] [-o offset] [--pattern=3Dpattern] [-q] [-s buffer_siz=
e] [-S step_size] [-t cache] [-i aio] [-w] [-U] filename")
 STEXI
-@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-inte=
rval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pattern=
=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-t @var=
{cache}] [-w] [-U] @var{filename}
+@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-inte=
rval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pattern=
=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-t @var=
{cache}] [-i @var{aio}] [-w] [-U] @var{filename}
 ETEXI
=20
 DEF("check", img_check,
diff --git a/qemu-img.c b/qemu-img.c
index 95a24b9762..cde0a4834a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4184,7 +4184,8 @@ static int img_bench(int argc, char **argv)
             {"force-share", no_argument, 0, 'U'},
             {0, 0, 0, 0}
         };
-        c =3D getopt_long(argc, argv, ":hc:d:f:no:qs:S:t:wU", long_options=
, NULL);
+        c =3D getopt_long(argc, argv, ":hc:d:f:ni:o:qs:S:t:wU", long_optio=
ns,
+                        NULL);
         if (c =3D=3D -1) {
             break;
         }
@@ -4227,6 +4228,14 @@ static int img_bench(int argc, char **argv)
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
diff --git a/qemu-img.texi b/qemu-img.texi
index b5156d6316..20136fcb94 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -206,7 +206,7 @@ Command description:
 Amends the image format specific @var{options} for the image file
 @var{filename}. Not all file formats support this operation.
=20
-@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-inte=
rval=3D@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pattern=
=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-t @var=
{cache}] [-w] [-U] @var{filename}
+@item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-inte=
rval=3D@var{flush_interval}] [-n] [-i @var{aio}] [--no-drain] [-o @var{offs=
et}] [--pattern=3D@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_=
size}] [-t @var{cache}] [-w] [-U] @var{filename}
=20
 Run a simple sequential I/O benchmark on the specified image. If @code{-w}=
 is
 specified, a write test is performed, otherwise a read test is performed.
@@ -227,6 +227,9 @@ If @code{-n} is specified, the native AIO backend is us=
ed if possible. On
 Linux, this option only works if @code{-t none} or @code{-t directsync} is
 specified as well.
=20
+If @code{-i} is specified, aio option can be used to specify different AIO
+backends: @var{threads}, @var{native} or @var{io_uring}.
+
 For write tests, by default a buffer filled with zeros is written. This ca=
n be
 overridden with a pattern byte specified by @var{pattern}.
=20
--=20
2.23.0


