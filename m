Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B631A49D0AB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:25:49 +0100 (CET)
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCm3I-0001TM-9r
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:25:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nClpk-00045G-Ch
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:11:53 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nClpi-0001OM-1z
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:11:47 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-cniQWjvfOzKDGXvi6JSRmw-1; Wed, 26 Jan 2022 12:11:40 -0500
X-MC-Unique: cniQWjvfOzKDGXvi6JSRmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B93E1083F61;
 Wed, 26 Jan 2022 17:11:39 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8045D708D9;
 Wed, 26 Jan 2022 17:11:37 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Date: Wed, 26 Jan 2022 18:11:36 +0100
Message-Id: <20220126171136.672657-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The template pointer in virtio_9p_create_local_test_dir() is leaked.
Add the g_autofree annotation to fix that. While here, convert the
rest of the virtio 9p test code to using g_autofree or g_autoptr
where possible, since this is the preferred approach to avoid potential
leaks in the future.

Based-on: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss=
@crudebyte.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/libqos/virtio-9p.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.=
c
index ef96ef006adc..0a0d0d16709b 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -40,14 +40,13 @@ static char *concat_path(const char* a, const char* b)
 void virtio_9p_create_local_test_dir(void)
 {
     struct stat st;
-    char *pwd =3D g_get_current_dir();
-    char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
+    g_autofree char *pwd =3D g_get_current_dir();
+    g_autofree char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX"=
);
=20
     local_test_path =3D mkdtemp(template);
     if (!local_test_path) {
         g_test_message("mkdtemp('%s') failed: %s", template, strerror(errn=
o));
     }
-    g_free(pwd);
=20
     g_assert(local_test_path !=3D NULL);
=20
@@ -60,12 +59,11 @@ void virtio_9p_create_local_test_dir(void)
 void virtio_9p_remove_local_test_dir(void)
 {
     g_assert(local_test_path !=3D NULL);
-    char *cmd =3D g_strdup_printf("rm -fr '%s'\n", local_test_path);
+    g_autofree char *cmd =3D g_strdup_printf("rm -fr '%s'\n", local_test_p=
ath);
     int res =3D system(cmd);
     if (res < 0) {
         /* ignore error, dummy check to prevent compiler error */
     }
-    g_free(cmd);
 }
=20
 char *virtio_9p_test_path(const char *path)
@@ -209,8 +207,8 @@ static void *virtio_9p_pci_create(void *pci_bus, QGuest=
Allocator *t_alloc,
 static void regex_replace(GString *haystack, const char *pattern,
                           const char *replace_fmt, ...)
 {
-    GRegex *regex;
-    char *replace, *s;
+    g_autoptr(GRegex) regex =3D NULL;
+    g_autofree char *replace =3D NULL, *s =3D NULL;
     va_list argp;
=20
     va_start(argp, replace_fmt);
@@ -220,9 +218,6 @@ static void regex_replace(GString *haystack, const char=
 *pattern,
     regex =3D g_regex_new(pattern, 0, 0, NULL);
     s =3D g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NULL);
     g_string_assign(haystack, s);
-    g_free(s);
-    g_regex_unref(regex);
-    g_free(replace);
 }
=20
 void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)
--=20
2.34.1


