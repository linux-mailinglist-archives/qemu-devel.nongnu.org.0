Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9ED25434
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT6sC-0005Ca-Jb
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:40:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT6qn-0004aF-IR
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:38:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT6qm-0001G2-KS
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:38:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hT6qm-0001Fq-F2
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:38:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B358D308793E
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 15:38:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-26.ams2.redhat.com
	[10.36.112.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26C805D9CA;
	Tue, 21 May 2019 15:38:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 16:38:35 +0100
Message-Id: <20190521153835.23233-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 21 May 2019 15:38:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] qapi: report the default CPU type for each
 machine
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When user doesn't request any explicit CPU model with libvirt or QEMU,
a machine type specific CPU model is picked. Currently there is no way
to determine what this QEMU built-in default is, so libvirt cannot
report this back to the user in the XML config.

This extends the "query-machines" QMP command so that it reports the
default CPU model typename for each machine.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 qapi/misc.json | 6 +++++-
 vl.c           | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..0bb7995bd4 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2018,12 +2018,16 @@
 #
 # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
 #
+# @default-cpu-type: default CPU model typename if none is requested via
+#                    the -cpu argument. (since 4.2.0)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
-            'hotpluggable-cpus': 'bool'} }
+            'hotpluggable-cpus': 'bool',
+            '*default-cpu-type': 'str'} }
=20
 ##
 # @query-machines:
diff --git a/vl.c b/vl.c
index 201144b162..b2de329bd2 100644
--- a/vl.c
+++ b/vl.c
@@ -1519,6 +1519,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->name =3D g_strdup(mc->name);
         info->cpu_max =3D !mc->max_cpus ? 1 : mc->max_cpus;
         info->hotpluggable_cpus =3D mc->has_hotpluggable_cpus;
+        if (mc->default_cpu_type) {
+            info->default_cpu_type =3D g_strdup(mc->default_cpu_type);
+            info->has_default_cpu_type =3D true;
+        }
=20
         entry =3D g_malloc0(sizeof(*entry));
         entry->value =3D info;
--=20
2.21.0


