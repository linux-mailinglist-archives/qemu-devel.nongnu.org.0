Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA92E9E82
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Oct 2019 16:11:48 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPpdT-000439-Jb
	for lists+qemu-devel@lfdr.de; Wed, 30 Oct 2019 11:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1iPpIa-0005DM-6W
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 10:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1iPpIY-0007Vr-4R
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 10:50:12 -0400
Received: from mail-eopbgr690101.outbound.protection.outlook.com
 ([40.107.69.101]:31361 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1iPpIW-0007LI-2U
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 10:50:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIw66mkJNBoFRYHhqAImxwssNd30o7vOu7yOAOBJsrOWfewQSG6YDvDiFVUKeXHQO7K0eK5SyMSHZssO+0ioIEt2/PqbSTv7W1K1C/ACHkXNfvWfJFnehMwBZ1wzQSpBJc3MdArmeaBqp0efpi3GuJL2OZio74n6wNt8g42Dyp50BYpHTQlpCzB7IZI4vL1PQTwiqzg9xZjQ0Gm0hyyMUD1jkXD+bWBPCm5aQxOcA81Eh4nT6mbZNZ1MSt9+FquG4eyo1M+fOGu2BHX+TKsHCLcUBcyE1Tyy4+smvqkCvEOt0kTBmbg0BxqVfQZeIwknaZOqQZ+GavTaWDzJhSHpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAXQz6h6/9X+7GuJ+xQZdaSXny03a0CEDwVmzS5Zeuw=;
 b=TQeo4XTukJPzw/bZeqVw4HsIhWhFjyyOwo/67JgmGatgBJZEonGHmQVmjJCcyAfGAhURpiQAx83/xCp/b0yfUnHUdbPRQeMuhSHtX6UYSYIBFLKOBmyvcFFDsyFluX+yNLQWIRU/dBWoe9UokHDhvU0iHTg27EcWraovNFgT5Mv0YAxjlclf0FG+x08bgJoMfxBx1aXkJzWX4Gm8crn8vis/34tWch+/N3pkF6lufu1T5l//gpbnhfSZBF8wPaGyu7ds5z5dkbHg2WNfrxVIPMlqQOY8nfu6XRQ8PuZ/j2B004xSvF7lsZEQ8eYNzcW5bjgs3VueniOo8ZmKp+Aq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAXQz6h6/9X+7GuJ+xQZdaSXny03a0CEDwVmzS5Zeuw=;
 b=rgnH2FQXiI7XfjAgNpIJ26JoMPaZ7D1WWFo9ZO4EEK+z9va1Um3cduiXJStq/Ojq/TMyLObsYfrid51bS2g8DWeaYWhzxung4FiUnli3ss+Zn0a9QJ8swFlcgjCCbo+pKWHUuy5ic44YfDw33K3NAtnRlCO0DpBkbdNu4jay4mE=
Received: from MN2PR03MB4800.namprd03.prod.outlook.com (20.179.82.78) by
 MN2PR03MB4959.namprd03.prod.outlook.com (52.132.168.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Wed, 30 Oct 2019 14:50:02 +0000
Received: from MN2PR03MB4800.namprd03.prod.outlook.com
 ([fe80::344f:b88:26f0:9f66]) by MN2PR03MB4800.namprd03.prod.outlook.com
 ([fe80::344f:b88:26f0:9f66%7]) with mapi id 15.20.2387.028; Wed, 30 Oct 2019
 14:50:02 +0000
From: "Oleinik, Alexander" <alxndr@bu.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH v4 17/20] fuzz: add support for qos-assisted fuzz targets
Thread-Topic: [PATCH v4 17/20] fuzz: add support for qos-assisted fuzz targets
Thread-Index: AQHVjzFPm98fTh6hukadTxKDl351sg==
Date: Wed, 30 Oct 2019 14:50:02 +0000
Message-ID: <20191030144926.11873-18-alxndr@bu.edu>
References: <20191030144926.11873-1-alxndr@bu.edu>
In-Reply-To: <20191030144926.11873-1-alxndr@bu.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.23.0
x-originating-ip: [128.197.127.33]
x-clientproxiedby: DM5PR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:4:60::37) To MN2PR03MB4800.namprd03.prod.outlook.com
 (2603:10b6:208:101::14)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=alxndr@bu.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 649fa142-78aa-4e34-c950-08d75d48719b
x-ms-traffictypediagnostic: MN2PR03MB4959:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR03MB49590252A3F7C05DE332E5D0BA600@MN2PR03MB4959.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(136003)(199004)(189003)(102836004)(386003)(6506007)(66946007)(66446008)(64756008)(66476007)(2616005)(186003)(2351001)(446003)(26005)(36756003)(66556008)(3846002)(6116002)(14444005)(2501003)(14454004)(11346002)(66066001)(256004)(4326008)(6916009)(305945005)(1076003)(6486002)(486006)(5660300002)(71190400001)(50226002)(71200400001)(476003)(86362001)(88552002)(7736002)(52116002)(76176011)(2906002)(478600001)(99286004)(786003)(316002)(8676002)(81166006)(5640700003)(81156014)(25786009)(6436002)(75432002)(8936002)(6512007)(6306002)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR03MB4959;
 H:MN2PR03MB4800.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bu.edu does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZcDE+JZEjWJyCM5sGOjhmg6ywULBMOgENnEqvwD9FDI9RCm9y8lGRU6aC4CvbIucTHVm+ZMJuJ4CRzsYIlguqc50mYEnNvHD2QWrrlrNqNekcFXoF8EYE1dyIT7U66remmFzZdZeq5blSxvTJIMxdUtK4Xy2e06vguvyVjO+O1Qxm1nXFG+PZxRCewG1HwVvGoMs91sYWKPrn4S5LCPd9Vu7GNaQi0yXGKDZNvB9eLYZg9wXqlK2g1KHYKg02Lij2hdW5T45L1+XdIART2UZaR0nDHcwQJ00TktQtghixSVWncv4OEsmgLOOnTkC1WqY8RtGYWc8fE3jQ10bodJ2ED4Z0M3OK0xAUStCBkoNAwHUBR4pqreRDA2gG+NESM8p7AGAZfQofPL96Ctv0KZFnV6cTJumM1oty8jZ4qRLjLvYD+732u/FGtjMPZ02uaeHRCiI5ZYgjxDJp6qxFFnfbS0MCzyBxCaRoVhXAtUpm8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 649fa142-78aa-4e34-c950-08d75d48719b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 14:50:02.3956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2rBck+0L8gCyYRwBSmCGOXb+rW02CWbwgYBYjz0hxMyUYLpYI0KWeH36sJEpyQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.69.101
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
Cc: "Oleinik, Alexander" <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Oleinik <alxndr@bu.edu>

Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
---
 tests/fuzz/qos_fuzz.c | 232 ++++++++++++++++++++++++++++++++++++++++++
 tests/fuzz/qos_fuzz.h |  33 ++++++
 2 files changed, 265 insertions(+)
 create mode 100644 tests/fuzz/qos_fuzz.c
 create mode 100644 tests/fuzz/qos_fuzz.h

diff --git a/tests/fuzz/qos_fuzz.c b/tests/fuzz/qos_fuzz.c
new file mode 100644
index 0000000000..07015da4ca
--- /dev/null
+++ b/tests/fuzz/qos_fuzz.c
@@ -0,0 +1,232 @@
+/*
+ * QOS-assisted fuzzing helpers
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail=
.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licens=
es/>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+
+#include <wordexp.h>
+
+#include "libqos/malloc.h"
+#include "libqos/qgraph.h"
+#include "libqos/qgraph_internal.h"
+
+#include "fuzz.h"
+#include "qos_fuzz.h"
+#include "tests/libqos/qgraph.h"
+#include "tests/libqos/qos_external.h"
+#include "tests/libqtest.h"
+
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qmp/qlist.h"
+
+
+void *fuzz_qos_obj;
+QGuestAllocator *fuzz_qos_alloc;
+
+static const char *fuzz_target_name;
+static char **fuzz_path_vec;
+
+/*
+ * Replaced the qmp commands with direct qmp_marshal calls.
+ * Probably there is a better way to do this
+ */
+static void qos_set_machines_devices_available(void)
+{
+    QDict *req =3D qdict_new();
+    QObject *response;
+    QDict *args =3D qdict_new();
+    QList *lst;
+    Error *err =3D NULL;
+
+    qmp_marshal_query_machines(NULL, &response, &err);
+    assert(!err);
+    lst =3D qobject_to(QList, response);
+    apply_to_qlist(lst, true);
+
+    qobject_unref(response);
+
+
+    qdict_put_str(req, "execute", "qom-list-types");
+    qdict_put_str(args, "implements", "device");
+    qdict_put_bool(args, "abstract", true);
+    qdict_put_obj(req, "arguments", (QObject *) args);
+
+    qmp_marshal_qom_list_types(args, &response, &err);
+    assert(!err);
+    lst =3D qobject_to(QList, response);
+    apply_to_qlist(lst, false);
+    qobject_unref(response);
+    qobject_unref(req);
+}
+
+static char **current_path;
+
+void *qos_allocate_objects(QTestState *qts, QGuestAllocator **p_alloc)
+{
+    return allocate_objects(qts, current_path + 1, p_alloc);
+}
+
+static char *qos_build_main_args()
+{
+    char **path =3D fuzz_path_vec;
+    QOSGraphNode *test_node;
+    GString *cmd_line =3D g_string_new(path[0]);
+    void *test_arg;
+
+    /* Before test */
+    current_path =3D path;
+    test_node =3D qos_graph_get_node(path[(g_strv_length(path) - 1)]);
+    test_arg =3D test_node->u.test.arg;
+    if (test_node->u.test.before) {
+        test_arg =3D test_node->u.test.before(cmd_line, test_arg);
+    }
+    /* Prepend the arguments that we need */
+    g_string_prepend(cmd_line,
+            "qemu-system-i386 -display none -machine accel=3Dqtest -m 64 "=
);
+    return cmd_line->str;
+}
+
+/*
+ * This function is largely a copy of qos-test.c:walk_path. Since walk_pat=
h
+ * is itself a callback, its a little annoying to add another argument/lay=
er of
+ * indirection
+ */
+static void walk_path(QOSGraphNode *orig_path, int len)
+{
+    QOSGraphNode *path;
+    QOSGraphEdge *edge;
+
+    /* etype set to QEDGE_CONSUMED_BY so that machine can add to the comma=
nd line */
+    QOSEdgeType etype =3D QEDGE_CONSUMED_BY;
+
+    /* twice QOS_PATH_MAX_ELEMENT_SIZE since each edge can have its arg */
+    char **path_vec =3D g_new0(char *, (QOS_PATH_MAX_ELEMENT_SIZE * 2));
+    int path_vec_size =3D 0;
+
+    char *after_cmd, *before_cmd, *after_device;
+    GString *after_device_str =3D g_string_new("");
+    char *node_name =3D orig_path->name, *path_str;
+
+    GString *cmd_line =3D g_string_new("");
+    GString *cmd_line2 =3D g_string_new("");
+
+    path =3D qos_graph_get_node(node_name); /* root */
+    node_name =3D qos_graph_edge_get_dest(path->path_edge); /* machine nam=
e */
+
+    path_vec[path_vec_size++] =3D node_name;
+    path_vec[path_vec_size++] =3D qos_get_machine_type(node_name);
+
+    for (;;) {
+        path =3D qos_graph_get_node(node_name);
+        if (!path->path_edge) {
+            break;
+        }
+
+        node_name =3D qos_graph_edge_get_dest(path->path_edge);
+
+        /* append node command line + previous edge command line */
+        if (path->command_line && etype =3D=3D QEDGE_CONSUMED_BY) {
+            g_string_append(cmd_line, path->command_line);
+            g_string_append(cmd_line, after_device_str->str);
+            g_string_truncate(after_device_str, 0);
+        }
+
+        path_vec[path_vec_size++] =3D qos_graph_edge_get_name(path->path_e=
dge);
+        /* detect if edge has command line args */
+        after_cmd =3D qos_graph_edge_get_after_cmd_line(path->path_edge);
+        after_device =3D qos_graph_edge_get_extra_device_opts(path->path_e=
dge);
+        before_cmd =3D qos_graph_edge_get_before_cmd_line(path->path_edge)=
;
+        edge =3D qos_graph_get_edge(path->name, node_name);
+        etype =3D qos_graph_edge_get_type(edge);
+
+        if (before_cmd) {
+            g_string_append(cmd_line, before_cmd);
+        }
+        if (after_cmd) {
+            g_string_append(cmd_line2, after_cmd);
+        }
+        if (after_device) {
+            g_string_append(after_device_str, after_device);
+        }
+    }
+
+    path_vec[path_vec_size++] =3D NULL;
+    g_string_append(cmd_line, after_device_str->str);
+    g_string_free(after_device_str, true);
+
+    g_string_append(cmd_line, cmd_line2->str);
+    g_string_free(cmd_line2, true);
+
+    /*
+     * here position 0 has <arch>/<machine>, position 1 has <machine>.
+     * The path must not have the <arch>, qtest_add_data_func adds it.
+     */
+    path_str =3D g_strjoinv("/", path_vec + 1);
+
+    /* Check that this is the test we care about: */
+    char *test_name =3D strrchr(path_str, '/') + 1;
+    if (strcmp(test_name, fuzz_target_name) =3D=3D 0) {
+        /*
+         * put arch/machine in position 1 so run_one_test can do its work
+         * and add the command line at position 0.
+         */
+        path_vec[1] =3D path_vec[0];
+        path_vec[0] =3D g_string_free(cmd_line, false);
+
+        fuzz_path_vec =3D path_vec;
+    } else {
+        g_free(path_vec);
+    }
+
+    g_free(path_str);
+}
+
+static char *qos_get_cmdline(FuzzTarget *t)
+{
+    /*
+     * Set a global variable that we use to identify the qos_path for our
+     * fuzz_target
+     */
+    fuzz_target_name =3D t->name;
+    qos_set_machines_devices_available();
+    qos_graph_foreach_test_path(walk_path);
+    return qos_build_main_args();
+}
+
+void fuzz_add_qos_target(
+        FuzzTarget *fuzz_opts,
+        const char *interface,
+        QOSGraphTestOptions *opts
+        )
+{
+    qos_add_test(fuzz_opts->name, interface, NULL, opts);
+    fuzz_opts->get_init_cmdline =3D qos_get_cmdline;
+    fuzz_add_target(fuzz_opts);
+}
+
+void qos_init_path(QTestState *s)
+{
+    fuzz_qos_obj =3D qos_allocate_objects(s , &fuzz_qos_alloc);
+}
diff --git a/tests/fuzz/qos_fuzz.h b/tests/fuzz/qos_fuzz.h
new file mode 100644
index 0000000000..6c280f07c5
--- /dev/null
+++ b/tests/fuzz/qos_fuzz.h
@@ -0,0 +1,33 @@
+/*
+ * QOS-assisted fuzzing helpers
+ *
+ * Copyright Red Hat Inc., 2019
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef _QOS_FUZZ_H_
+#define _QOS_FUZZ_H_
+
+#include "tests/fuzz/fuzz.h"
+#include "tests/libqos/qgraph.h"
+
+int qos_fuzz(const unsigned char *Data, size_t Size);
+void qos_setup(void);
+
+extern void *fuzz_qos_obj;
+extern QGuestAllocator *fuzz_qos_alloc;
+
+void fuzz_add_qos_target(
+        FuzzTarget *fuzz_opts,
+        const char *interface,
+        QOSGraphTestOptions *opts
+        );
+
+void qos_init_path(QTestState *);
+
+#endif
--=20
2.23.0


