Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678E22490F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 09:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSzJX-0007jb-8o
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 03:35:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSzI5-0006uL-NZ
	for qemu-devel@nongnu.org; Tue, 21 May 2019 03:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSzI4-0002t3-P1
	for qemu-devel@nongnu.org; Tue, 21 May 2019 03:34:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hSzI2-0002ZJ-BJ; Tue, 21 May 2019 03:34:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6844D7FDC9;
	Tue, 21 May 2019 07:33:55 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDD621001E6F;
	Tue, 21 May 2019 07:33:49 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 09:33:48 +0200
Message-Id: <20190521073348.29657-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 May 2019 07:34:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] numa: improve cpu hotplug error message
 with a wrong node-id
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On pseries, core-ids are strongly binded to a node-id by the command
line option. If an user tries to add a CPU to the wrong node, he has
an error but it is not really helpful:

  qemu-system-ppc64 ... -smp 1,maxcpus=3D64,cores=3D1,threads=3D1,sockets=
=3D1 \
                        -numa node,nodeid=3D0 -numa node,nodeid=3D1 ...

  (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=3D30,node-id=3D1
  Error: node-id=3D1 must match numa node specified with -numa option

This patch improves this error message by giving to the user the good
topology information (node-id, socket-id and thread-id if they are
available) to use with the core-id he's providing:

  Error: core-id 30 can only be plugged into node-id 0

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: display full topology in the error message

 numa.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index 3875e1efda3a..7413f821e2bb 100644
--- a/numa.c
+++ b/numa.c
@@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **err=
p)
     set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
 }
=20
+static char *cpu_topology_to_string(const CPUArchId *cpu)
+{
+    GString *s =3D g_string_new(NULL);
+    if (cpu->props.has_socket_id) {
+        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket=
_id);
+    }
+    if (cpu->props.has_node_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id)=
;
+    }
+    if (cpu->props.has_thread_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread=
_id);
+    }
+    return g_string_free(s, false);
+}
+
 void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **=
errp)
 {
     int node_id =3D object_property_get_int(OBJECT(dev), "node-id", &err=
or_abort);
@@ -470,8 +491,11 @@ void numa_cpu_pre_plug(const CPUArchId *slot, Device=
State *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id !=3D slot->props.node_id) {
-        error_setg(errp, "node-id=3D%d must match numa node specified "
-                   "with -numa option", node_id);
+        char *topology =3D cpu_topology_to_string(slot);
+        error_setg(errp,
+                   "core-id %"PRId64" can only be plugged into %s",
+                   slot->props.core_id, topology);
+        g_free(topology);
     }
 }
=20
--=20
2.20.1


