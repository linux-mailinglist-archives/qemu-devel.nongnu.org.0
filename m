Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992514F02F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:53:57 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYcG-0002mZ-9V
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXzN-0006X9-GK
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXzL-0007Xe-N4
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:45 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33323
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXzL-0007Uy-IL
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0L2eSmfRc1BYzX/g9odh+BLEI88CeNpYtPOcxjWdfo=;
 b=D7mxH8fu+SD564hBvu+QZI+7LQsDMvkvIt7zgK4icVn14olSF6R1Y3EeeZ1nMDHbDhJrF7
 5QL/Rv0VeoX0M2KYuvu07eEUK3F7sFG3KfDjjZUNQsb9+ZA1cyVcFrcl2Yd4KNxHepUhlp
 eHI1ZErwDDuh+W3NchBYXRY0AL2wfGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-v1v3BVpLPv21QCxzTiHDuw-1; Fri, 31 Jan 2020 10:13:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E60800D48
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90CB589E8E
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 79/80] tests/numa-test: make top level args dynamic and
 g_autofree(cli) cleanups
Date: Fri, 31 Jan 2020 16:09:49 +0100
Message-Id: <1580483390-131164-80-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: v1v3BVpLPv21QCxzTiHDuw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use GString to pass argument to make_cli() so that it would be easy
to dynamically change test case arguments from main(). The follow up
patch will use it to change RAM size options depending on target.

While at it cleanup 'cli' freeing, using g_autofree annotation.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
v3:
  * s/strcmp/g_str_equal/
    (Thomas Huth <thuth@redhat.com>)
  * use pair make_cli/qtest_init instead of qtest_initf
PS:
  made as a separate patch so it won't clutter followup testcase changes.
v4:
  * use g_string_new(NULL) instead of g_string_new("")
    (Thomas Huth <thuth@redhat.com>)
---
 tests/qtest/numa-test.c | 108 ++++++++++++++++++++++++--------------------=
----
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 17dd807..35999ea 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -14,16 +14,16 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
=20
-static char *make_cli(const char *generic_cli, const char *test_cli)
+static char *make_cli(const GString *generic_cli, const char *test_cli)
 {
-    return g_strdup_printf("%s %s", generic_cli ? generic_cli : "", test_c=
li);
+    return g_strdup_printf("%s %s", generic_cli->str, test_cli);
 }
=20
 static void test_mon_explicit(const void *data)
 {
-    char *s;
-    char *cli;
     QTestState *qts;
+    g_autofree char *s =3D NULL;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 8 "
                    "-numa node,nodeid=3D0,cpus=3D0-3 "
@@ -33,17 +33,15 @@ static void test_mon_explicit(const void *data)
     s =3D qtest_hmp(qts, "info numa");
     g_assert(strstr(s, "node 0 cpus: 0 1 2 3"));
     g_assert(strstr(s, "node 1 cpus: 4 5 6 7"));
-    g_free(s);
=20
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void test_mon_default(const void *data)
 {
-    char *s;
-    char *cli;
     QTestState *qts;
+    g_autofree char *s =3D NULL;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 8 -numa node -numa node");
     qts =3D qtest_init(cli);
@@ -51,17 +49,15 @@ static void test_mon_default(const void *data)
     s =3D qtest_hmp(qts, "info numa");
     g_assert(strstr(s, "node 0 cpus: 0 2 4 6"));
     g_assert(strstr(s, "node 1 cpus: 1 3 5 7"));
-    g_free(s);
=20
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void test_mon_partial(const void *data)
 {
-    char *s;
-    char *cli;
     QTestState *qts;
+    g_autofree char *s =3D NULL;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 8 "
                    "-numa node,nodeid=3D0,cpus=3D0-1 "
@@ -71,10 +67,8 @@ static void test_mon_partial(const void *data)
     s =3D qtest_hmp(qts, "info numa");
     g_assert(strstr(s, "node 0 cpus: 0 1 2 3 6 7"));
     g_assert(strstr(s, "node 1 cpus: 4 5"));
-    g_free(s);
=20
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static QList *get_cpus(QTestState *qts, QDict **resp)
@@ -87,11 +81,11 @@ static QList *get_cpus(QTestState *qts, QDict **resp)
=20
 static void test_query_cpus(const void *data)
 {
-    char *cli;
     QDict *resp;
     QList *cpus;
     QObject *e;
     QTestState *qts;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 8 -numa node,cpus=3D0-3 -numa node,cpus=
=3D4-7");
     qts =3D qtest_init(cli);
@@ -120,16 +114,15 @@ static void test_query_cpus(const void *data)
=20
     qobject_unref(resp);
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void pc_numa_cpu(const void *data)
 {
-    char *cli;
     QDict *resp;
     QList *cpus;
     QObject *e;
     QTestState *qts;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-cpu pentium -smp 8,sockets=3D2,cores=3D2,thre=
ads=3D2 "
         "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
@@ -174,16 +167,15 @@ static void pc_numa_cpu(const void *data)
=20
     qobject_unref(resp);
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void spapr_numa_cpu(const void *data)
 {
-    char *cli;
     QDict *resp;
     QList *cpus;
     QObject *e;
     QTestState *qts;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 4,cores=3D4 "
         "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
@@ -220,16 +212,15 @@ static void spapr_numa_cpu(const void *data)
=20
     qobject_unref(resp);
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void aarch64_numa_cpu(const void *data)
 {
-    char *cli;
     QDict *resp;
     QList *cpus;
     QObject *e;
     QTestState *qts;
+    g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 2 "
         "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
@@ -264,7 +255,6 @@ static void aarch64_numa_cpu(const void *data)
=20
     qobject_unref(resp);
     qtest_quit(qts);
-    g_free(cli);
 }
=20
 static void pc_dynamic_cpu_cfg(const void *data)
@@ -273,9 +263,10 @@ static void pc_dynamic_cpu_cfg(const void *data)
     QDict *resp;
     QList *cpus;
     QTestState *qs;
+    g_autofree char *cli =3D NULL;
=20
-    qs =3D qtest_initf("%s -nodefaults --preconfig -smp 2",
-                     data ? (char *)data : "");
+    cli =3D make_cli(data, "-nodefaults --preconfig -smp 2");
+    qs =3D qtest_init(cli);
=20
     /* create 2 numa nodes */
     g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-node',"
@@ -329,16 +320,19 @@ static void pc_dynamic_cpu_cfg(const void *data)
=20
 static void pc_hmat_build_cfg(const void *data)
 {
-    QTestState *qs =3D qtest_initf("%s -nodefaults --preconfig -machine hm=
at=3Don "
-                     "-smp 2,sockets=3D2 "
-                     "-m 128M,slots=3D2,maxmem=3D1G "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm0 "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm1 "
-                     "-numa node,nodeid=3D0,memdev=3Dm0 "
-                     "-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 "
-                     "-numa cpu,node-id=3D0,socket-id=3D0 "
-                     "-numa cpu,node-id=3D0,socket-id=3D1",
-                     data ? (char *)data : "");
+    QTestState *qs;
+    g_autofree char *cli =3D NULL;
+
+    cli =3D make_cli(data, "-nodefaults --preconfig -machine hmat=3Don "
+                         "-smp 2,sockets=3D2 "
+                         "-m 128M,slots=3D2,maxmem=3D1G "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm0 "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm1 "
+                         "-numa node,nodeid=3D0,memdev=3Dm0 "
+                         "-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 =
"
+                         "-numa cpu,node-id=3D0,socket-id=3D0 "
+                         "-numa cpu,node-id=3D0,socket-id=3D1");
+    qs =3D qtest_init(cli);
=20
     /* Fail: Initiator should be less than the number of nodes */
     g_assert_true(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-nod=
e',"
@@ -455,13 +449,16 @@ static void pc_hmat_build_cfg(const void *data)
=20
 static void pc_hmat_off_cfg(const void *data)
 {
-    QTestState *qs =3D qtest_initf("%s -nodefaults --preconfig "
-                     "-smp 2,sockets=3D2 "
-                     "-m 128M,slots=3D2,maxmem=3D1G "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm0 "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm1 "
-                     "-numa node,nodeid=3D0,memdev=3Dm0",
-                     data ? (char *)data : "");
+    QTestState *qs;
+    g_autofree char *cli =3D NULL;
+
+    cli =3D make_cli(data, "-nodefaults --preconfig "
+                         "-smp 2,sockets=3D2 "
+                         "-m 128M,slots=3D2,maxmem=3D1G "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm0 "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm1 "
+                         "-numa node,nodeid=3D0,memdev=3Dm0");
+    qs =3D qtest_init(cli);
=20
     /*
      * Fail: Enable HMAT with -machine hmat=3Don
@@ -491,16 +488,19 @@ static void pc_hmat_off_cfg(const void *data)
=20
 static void pc_hmat_erange_cfg(const void *data)
 {
-    QTestState *qs =3D qtest_initf("%s -nodefaults --preconfig -machine hm=
at=3Don "
-                     "-smp 2,sockets=3D2 "
-                     "-m 128M,slots=3D2,maxmem=3D1G "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm0 "
-                     "-object memory-backend-ram,size=3D64M,id=3Dm1 "
-                     "-numa node,nodeid=3D0,memdev=3Dm0 "
-                     "-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 "
-                     "-numa cpu,node-id=3D0,socket-id=3D0 "
-                     "-numa cpu,node-id=3D0,socket-id=3D1",
-                     data ? (char *)data : "");
+    QTestState *qs;
+    g_autofree char *cli =3D NULL;
+
+    cli =3D make_cli(data, "-nodefaults --preconfig -machine hmat=3Don "
+                         "-smp 2,sockets=3D2 "
+                         "-m 128M,slots=3D2,maxmem=3D1G "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm0 "
+                         "-object memory-backend-ram,size=3D64M,id=3Dm1 "
+                         "-numa node,nodeid=3D0,memdev=3Dm0 "
+                         "-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 =
"
+                         "-numa cpu,node-id=3D0,socket-id=3D0 "
+                         "-numa cpu,node-id=3D0,socket-id=3D1");
+    qs =3D qtest_init(cli);
=20
     /* Can't store the compressed latency */
     g_assert_false(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-no=
de',"
@@ -539,11 +539,11 @@ static void pc_hmat_erange_cfg(const void *data)
=20
 int main(int argc, char **argv)
 {
-    const char *args =3D NULL;
+    g_autoptr(GString) args =3D g_string_new(NULL);
     const char *arch =3D qtest_get_arch();
=20
-    if (strcmp(arch, "aarch64") =3D=3D 0) {
-        args =3D "-machine virt";
+    if (g_str_equal(arch, "aarch64")) {
+        g_string_append(args, " -machine virt");
     }
=20
     g_test_init(&argc, &argv, NULL);
--=20
2.7.4


