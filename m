Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B514397E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 10:31:32 +0100 (CET)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itpsh-0007rY-SW
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 04:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrezanin@redhat.com>) id 1itpph-0005Jk-Vh
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>) id 1itppg-0001ma-WE
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:28:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29572
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mrezanin@redhat.com>) id 1itppg-0001mQ-T5
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 04:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579598904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:in-reply-to:references:references:references;
 bh=tLxyOeT3VL5PaRjCIKPmBGFw0DadvQA+VbCzoFlCEFQ=;
 b=ZGZtCSyrfJxwk2GUGz8wvpVlGHOvuxUU/iTljLnDW9xz+RtxbDHeXMZxrfxXPY0Mf5bs0i
 qPf8g7MHj7eolgFPjJWPLgN0KkRmCTSlcNPHAfzDsuflR7QfUAYLrW/rB6DzIvyHwu9kzV
 pa0jNb/VH7/hxUisIjNw7I+xzxVu3qA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-MjGylKfNNg6d1zNdVMgZSA-1; Tue, 21 Jan 2020 04:28:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF6618FF662;
 Tue, 21 Jan 2020 09:28:19 +0000 (UTC)
Received: from workimage.localdomain (ovpn-204-25.brq.redhat.com
 [10.40.204.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2635DA66;
 Tue, 21 Jan 2020 09:28:17 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] test-logging: Fix -Werror=maybe-uninitialized warning
Date: Tue, 21 Jan 2020 10:28:13 +0100
Message-Id: <63b0fcedf7dfe799c8210b113e5dccf32414a89d.1579598240.git.mrezanin@redhat.com>
In-Reply-To: <cover.1579598240.git.mrezanin@redhat.com>
References: <cover.1579598240.git.mrezanin@redhat.com>
In-Reply-To: <cover.1579598240.git.mrezanin@redhat.com>
References: <cover.1579598240.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MjGylKfNNg6d1zNdVMgZSA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Checking for uninitialized variables raises warning for file path
variables in test_logfile_write and test_logfile_lock functions.

To suppress this warning, initialize varibles to NULL. This is safe
change as result of g_build_filename is stored to them before any usage.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 tests/test-logging.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 1e646f0..6387e49 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -114,8 +114,8 @@ static void test_logfile_write(gconstpointer data)
     QemuLogFile *logfile2;
     gchar const *dir =3D data;
     Error *err =3D NULL;
-    g_autofree gchar *file_path;
-    g_autofree gchar *file_path1;
+    g_autofree gchar *file_path =3D NULL;
+    g_autofree gchar *file_path1 =3D NULL;
     FILE *orig_fd;
=20
     /*
@@ -157,7 +157,7 @@ static void test_logfile_lock(gconstpointer data)
     FILE *logfile;
     gchar const *dir =3D data;
     Error *err =3D NULL;
-    g_autofree gchar *file_path;
+    g_autofree gchar *file_path =3D NULL;
=20
     file_path =3D g_build_filename(dir, "qemu_test_logfile_lock0.log", NUL=
L);
=20
--=20
1.8.3.1


