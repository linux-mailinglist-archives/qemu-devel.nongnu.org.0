Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5313A811
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:13:26 +0100 (CET)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irK8S-0005nL-LX
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irJwe-0000Wy-PF
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:01:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irJwa-00078Q-25
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:01:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22059
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irJwZ-000787-V1
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578999667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjs/0jWG2isBDTQPRwDOdCNojZCmK0401SuUBwje5k8=;
 b=Bc1bI/hpc1snPlpQMCJzxEEOleHoPWPUEddRxNdpSXaZjbGIrQ04fmy82X8RZV8js5iH9d
 kH3s5AuYEiENip0MOfSMRK/GXaEvperz4O9iQZ9IqqrNmkyQMbZARuMj4Cc3gxymPP4pbg
 +32lYUvKY4ntrQ1dzkf0tu/hb+OL9O8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-NKLf_0TiMM-fvsJTwybTvQ-1; Tue, 14 Jan 2020 06:01:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B373D1005502;
 Tue, 14 Jan 2020 11:01:02 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376E860BE2;
 Tue, 14 Jan 2020 11:01:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/15] qemu-io: adds option to use aio engine
Date: Tue, 14 Jan 2020 10:59:17 +0000
Message-Id: <20200114105921.131880-12-stefanha@redhat.com>
In-Reply-To: <20200114105921.131880-1-stefanha@redhat.com>
References: <20200114105921.131880-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: NKLf_0TiMM-fvsJTwybTvQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-io.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/qemu-io.c b/qemu-io.c
index 91e3276592..3adc5a7d0d 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -130,7 +130,8 @@ static void open_help(void)
 " -C, -- use copy-on-read\n"
 " -n, -- disable host cache, short for -t none\n"
 " -U, -- force shared permissions\n"
-" -k, -- use kernel AIO implementation (on Linux only)\n"
+" -k, -- use kernel AIO implementation (Linux only, prefer use of -i)\n"
+" -i, -- use AIO mode (threads, native or io_uring)\n"
 " -t, -- use the given cache mode for the image\n"
 " -d, -- use the given discard mode for the image\n"
 " -o, -- options to be given to the block driver"
@@ -172,7 +173,7 @@ static int open_f(BlockBackend *blk, int argc, char **a=
rgv)
     QDict *opts;
     bool force_share =3D false;
=20
-    while ((c =3D getopt(argc, argv, "snCro:kt:d:U")) !=3D -1) {
+    while ((c =3D getopt(argc, argv, "snCro:ki:t:d:U")) !=3D -1) {
         switch (c) {
         case 's':
             flags |=3D BDRV_O_SNAPSHOT;
@@ -204,6 +205,13 @@ static int open_f(BlockBackend *blk, int argc, char **=
argv)
                 return -EINVAL;
             }
             break;
+        case 'i':
+            if (bdrv_parse_aio(optarg, &flags) < 0) {
+                error_report("Invalid aio option: %s", optarg);
+                qemu_opts_reset(&empty_opts);
+                return -EINVAL;
+            }
+            break;
         case 'o':
             if (imageOpts) {
                 printf("--image-opts and 'open -o' are mutually exclusive\=
n");
@@ -291,7 +299,9 @@ static void usage(const char *name)
 "  -n, --nocache        disable host cache, short for -t none\n"
 "  -C, --copy-on-read   enable copy-on-read\n"
 "  -m, --misalign       misalign allocations for O_DIRECT\n"
-"  -k, --native-aio     use kernel AIO implementation (on Linux only)\n"
+"  -k, --native-aio     use kernel AIO implementation\n"
+"                       (Linux only, prefer use of -i)\n"
+"  -i, --aio=3DMODE       use AIO mode (threads, native or io_uring)\n"
 "  -t, --cache=3DMODE     use the given cache mode for the image\n"
 "  -d, --discard=3DMODE   use the given discard mode for the image\n"
 "  -T, --trace [[enable=3D]<pattern>][,events=3D<file>][,file=3D<file>]\n"
@@ -496,7 +506,7 @@ static QemuOptsList file_opts =3D {
 int main(int argc, char **argv)
 {
     int readonly =3D 0;
-    const char *sopt =3D "hVc:d:f:rsnCmkt:T:U";
+    const char *sopt =3D "hVc:d:f:rsnCmki:t:T:U";
     const struct option lopt[] =3D {
         { "help", no_argument, NULL, 'h' },
         { "version", no_argument, NULL, 'V' },
@@ -508,6 +518,7 @@ int main(int argc, char **argv)
         { "copy-on-read", no_argument, NULL, 'C' },
         { "misalign", no_argument, NULL, 'm' },
         { "native-aio", no_argument, NULL, 'k' },
+        { "aio", required_argument, NULL, 'i' },
         { "discard", required_argument, NULL, 'd' },
         { "cache", required_argument, NULL, 't' },
         { "trace", required_argument, NULL, 'T' },
@@ -575,6 +586,12 @@ int main(int argc, char **argv)
         case 'k':
             flags |=3D BDRV_O_NATIVE_AIO;
             break;
+        case 'i':
+            if (bdrv_parse_aio(optarg, &flags) < 0) {
+                error_report("Invalid aio option: %s", optarg);
+                exit(1);
+            }
+            break;
         case 't':
             if (bdrv_parse_cache_mode(optarg, &flags, &writethrough) < 0) =
{
                 error_report("Invalid cache option: %s", optarg);
--=20
2.24.1


