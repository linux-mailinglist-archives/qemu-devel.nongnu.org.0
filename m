Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4754183970
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 20:30:11 +0100 (CET)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCTX0-0005ou-MP
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 15:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jCTVW-0004GF-IC
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jCTVV-0006uC-I4
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22005
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jCTVV-0006sw-Ez
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584041317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuMYgC9w9ONLyxeRRLmmWK1FsLOHsfI+Gf/8rjpkgSs=;
 b=EOf7Fd2fwKuczSX0iz2neLpvMsk9i8dd/OsBCrjeZsVyyqUBzpYO2kTrHVjmMp/A0zTPH+
 A8XvKNcOyong7lSeLMztMmP0nOKv61lTcaruTD/JivwC8xQnPWg0wKeSPrvueHpHDSVJLL
 E7HV7gufvxoPkKZgg0x+NaY5kOJ3qgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-zIX4nardOLeBD12wl20DFw-1; Thu, 12 Mar 2020 15:28:34 -0400
X-MC-Unique: zIX4nardOLeBD12wl20DFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A5A6800D53;
 Thu, 12 Mar 2020 19:28:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0985DA7B;
 Thu, 12 Mar 2020 19:28:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] vmdk: Add trivial backing_fmt support
Date: Thu, 12 Mar 2020 14:28:17 -0500
Message-Id: <20200312192822.3739399-3-eblake@redhat.com>
In-Reply-To: <20200312192822.3739399-1-eblake@redhat.com>
References: <20200312192822.3739399-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, pkrempa@redhat.com,
 qemu-block@nongnu.org, kchamart@redhat.com, libvir-list@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 mreitz@redhat.com, "open list:Trivial patches" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmdk already requires that if backing_file is present, that it be
another vmdk image (see vmdk_co_do_create).  Meanwhile, we want to
move towards always being explicit about the backing format for other
drivers where it matters.  So for convenience, make qemu-img create -F
vmdk work, while rejecting all other explicit formats (note that this
is only for QemuOpts usage; there is no change to the QAPI to allow a
format through -blockdev).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/vmdk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/vmdk.c b/block/vmdk.c
index 20e909d99794..3c7893817afe 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2611,6 +2611,14 @@ static int coroutine_fn vmdk_co_create_opts(const ch=
ar *filename, QemuOpts *opts
     bool zeroed_grain;
     bool compat6;
     VMDKCreateOptsData data;
+    char *backing_fmt =3D NULL;
+
+    backing_fmt =3D qemu_opt_get_del(opts, BLOCK_OPT_BACKING_FMT);
+    if (backing_fmt && strcmp(backing_fmt, "vmdk") !=3D 0) {
+        error_setg(errp, "backing_file must be a vmdk image");
+        ret =3D -EINVAL;
+        goto exit;
+    }

     if (filename_decompose(filename, path, prefix, postfix, PATH_MAX, errp=
)) {
         ret =3D -EINVAL;
@@ -2669,6 +2677,7 @@ static int coroutine_fn vmdk_co_create_opts(const cha=
r *filename, QemuOpts *opts
                             vmdk_co_create_opts_cb, &data, errp);

 exit:
+    g_free(backing_fmt);
     g_free(adapter_type);
     g_free(backing_file);
     g_free(hw_version);
@@ -3005,6 +3014,11 @@ static QemuOptsList vmdk_create_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "File name of a base image"
         },
+        {
+            .name =3D BLOCK_OPT_BACKING_FMT,
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "Must be 'vmdk' if present",
+        },
         {
             .name =3D BLOCK_OPT_COMPAT6,
             .type =3D QEMU_OPT_BOOL,
--=20
2.25.1


