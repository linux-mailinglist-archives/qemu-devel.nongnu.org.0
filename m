Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374799057
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 12:06:07 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0jyo-00015l-70
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 06:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i0jx6-0007mW-HZ
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i0jx4-0005on-92
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:04:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44162)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i0jx3-0005n7-SW
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 06:04:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 945A28D5BA6;
 Thu, 22 Aug 2019 10:04:14 +0000 (UTC)
Received: from dhcp-16-132.lcy.redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363D0600CD;
 Thu, 22 Aug 2019 10:04:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 11:04:12 +0100
Message-Id: <20190822100412.23746-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 22 Aug 2019 10:04:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3] qapi: report the default CPU type for each
 machine
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When user doesn't request any explicit CPU model with libvirt or QEMU,
a machine type specific CPU model is picked. Currently there is no way
to determine what this QEMU built-in default is, so libvirt cannot
report this back to the user in the XML config.

This extends the "query-machines" QMP command so that it reports the
default CPU model typename for each machine.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 4 ++++
 qapi/machine.json          | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 526fbd5ced..033b76f7bd 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -230,6 +230,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->hotpluggable_cpus =3D mc->has_hotpluggable_cpus;
         info->numa_mem_supported =3D mc->numa_mem_supported;
         info->deprecated =3D !!mc->deprecation_reason;
+        if (mc->default_cpu_type) {
+            info->default_cpu_type =3D g_strdup(mc->default_cpu_type);
+            info->has_default_cpu_type =3D true;
+        }
=20
         entry =3D g_malloc0(sizeof(*entry));
         entry->value =3D info;
diff --git a/qapi/machine.json b/qapi/machine.json
index 6db8a7e2ec..bd9cfb02da 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -325,13 +325,16 @@
 #              in future versions of QEMU according to the QEMU deprecat=
ion
 #              policy (since 4.1.0)
 #
+# @default-cpu-type: default CPU model typename if none is requested via
+#                    the -cpu argument. (since 4.2)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
-            'deprecated': 'bool' } }
+            'deprecated': 'bool', '*default-cpu-type': 'str' } }
=20
 ##
 # @query-machines:
--=20
2.21.0


