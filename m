Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95814685A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:48:13 +0100 (CET)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubu7-0002hL-Uo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuauO-0000yA-Qm
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuauN-0005Wi-EN
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:44:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40649
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuauN-0005We-Al
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONGRb2H7xwKxLjc0yEDl8AhQd6ixqikOmhtSaklR8po=;
 b=WXsxUZ6XY6oitfy6Y3vcQhC+zQVI4lgGYzpvLcebukZQzl98NTdri4KkwIUKfu9HuTSMdL
 V1YnCEbsjZ8VpZVOLqKdI26ZChiTQp1+9JEyl3VbAlHqeHnLVhDgdS3nJCZKfDulIbbwGc
 7a3450JWmI0/yW9TivaOzfgit8pfo+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-uHmyv-KSMHW6pZ7PrhKrLw-1; Thu, 23 Jan 2020 06:44:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3E648010E0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:44:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF82710372F9;
 Thu, 23 Jan 2020 11:44:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 80/80] tests:numa-test: use explicit memdev to
 specify node RAM
Date: Thu, 23 Jan 2020 12:38:45 +0100
Message-Id: <1579779525-20065-81-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: uHmyv-KSMHW6pZ7PrhKrLw-1
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
Cc: lvivier@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow up patches will remove automatic RAM distribution
between nodes and will make default machine types require
"memdev" option instead of legacy "mem" option.

Make tests to follow new rules and add an additional test
for legacy "mem" option on old machine type, to make sure
it won't regress in the future.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
   * s/strcmp/g_str_equal/
   * put -object lines before -m
     (Thomas Huth <thuth@redhat.com>)
   * drop new test_pc_legacy_mem(), due to dropping
      "numa: forbid '-numa node,mem' for 5.0 and newer machine types"
     it will be posted later, when libvirt side is prepared for
     disabled '-numa node,mem' (hopefully 5.1)

CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/numa-test.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 0bb4897..bc9c6be 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -25,9 +25,8 @@ static void test_mon_explicit(const void *data)
     g_autofree char *s =3D NULL;
     g_autofree char *cli =3D NULL;
=20
-    cli =3D make_cli(data, "-smp 8 "
-                   "-numa node,nodeid=3D0,cpus=3D0-3 "
-                   "-numa node,nodeid=3D1,cpus=3D4-7 ");
+    cli =3D make_cli(data, "-smp 8 -numa node,nodeid=3D0,memdev=3Dram,cpus=
=3D0-3 "
+                         "-numa node,nodeid=3D1,cpus=3D4-7");
     qts =3D qtest_init(cli);
=20
     s =3D qtest_hmp(qts, "info numa");
@@ -37,13 +36,13 @@ static void test_mon_explicit(const void *data)
     qtest_quit(qts);
 }
=20
-static void test_mon_default(const void *data)
+static void test_def_cpu_split(const void *data)
 {
     QTestState *qts;
     g_autofree char *s =3D NULL;
     g_autofree char *cli =3D NULL;
=20
-    cli =3D make_cli(data, "-smp 8 -numa node -numa node");
+    cli =3D make_cli(data, "-smp 8 -numa node,memdev=3Dram -numa node");
     qts =3D qtest_init(cli);
=20
     s =3D qtest_hmp(qts, "info numa");
@@ -60,7 +59,7 @@ static void test_mon_partial(const void *data)
     g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 8 "
-                   "-numa node,nodeid=3D0,cpus=3D0-1 "
+                   "-numa node,nodeid=3D0,memdev=3Dram,cpus=3D0-1 "
                    "-numa node,nodeid=3D1,cpus=3D4-5 ");
     qts =3D qtest_init(cli);
=20
@@ -87,7 +86,8 @@ static void test_query_cpus(const void *data)
     QTestState *qts;
     g_autofree char *cli =3D NULL;
=20
-    cli =3D make_cli(data, "-smp 8 -numa node,cpus=3D0-3 -numa node,cpus=
=3D4-7");
+    cli =3D make_cli(data, "-smp 8 -numa node,memdev=3Dram,cpus=3D0-3 "
+                         "-numa node,cpus=3D4-7");
     qts =3D qtest_init(cli);
     cpus =3D get_cpus(qts, &resp);
     g_assert(cpus);
@@ -125,7 +125,7 @@ static void pc_numa_cpu(const void *data)
     g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-cpu pentium -smp 8,sockets=3D2,cores=3D2,thre=
ads=3D2 "
-        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
+        "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
         "-numa cpu,node-id=3D1,socket-id=3D0 "
         "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D0 "
         "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D1,thread-id=3D0 "
@@ -178,7 +178,7 @@ static void spapr_numa_cpu(const void *data)
     g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 4,cores=3D4 "
-        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
+        "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
         "-numa cpu,node-id=3D0,core-id=3D0 "
         "-numa cpu,node-id=3D0,core-id=3D1 "
         "-numa cpu,node-id=3D0,core-id=3D2 "
@@ -223,7 +223,7 @@ static void aarch64_numa_cpu(const void *data)
     g_autofree char *cli =3D NULL;
=20
     cli =3D make_cli(data, "-smp 2 "
-        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
+        "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
         "-numa cpu,node-id=3D1,thread-id=3D0 "
         "-numa cpu,node-id=3D0,thread-id=3D1");
     qts =3D qtest_init(cli);
@@ -270,7 +270,7 @@ static void pc_dynamic_cpu_cfg(const void *data)
=20
     /* create 2 numa nodes */
     g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-node',"
-        " 'arguments': { 'type': 'node', 'nodeid': 0 } }")));
+        " 'arguments': { 'type': 'node', 'nodeid': 0, 'memdev': 'ram' } }"=
)));
     g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-node',"
         " 'arguments': { 'type': 'node', 'nodeid': 1 } }")));
=20
@@ -542,13 +542,19 @@ int main(int argc, char **argv)
     g_autoptr(GString) args =3D g_string_new("");
     const char *arch =3D qtest_get_arch();
=20
+    if (g_str_equal(arch, "ppc64")) {
+        g_string_append(args, " -object memory-backend-ram,id=3Dram,size=
=3D512M");
+    } else {
+        g_string_append(args, " -object memory-backend-ram,id=3Dram,size=
=3D128M");
+    }
+
     if (g_str_equal(arch, "aarch64")) {
         g_string_append(args, " -machine virt");
     }
=20
     g_test_init(&argc, &argv, NULL);
=20
-    qtest_add_data_func("/numa/mon/default", args, test_mon_default);
+    qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split=
);
     qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit=
);
     qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
     qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus=
);
--=20
2.7.4


