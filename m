Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC2A0A02
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 20:55:14 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3369-0007rf-7B
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 14:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i32sY-0002Sz-TD
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i32sW-0003k1-Vz
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i32sV-0003hK-6g
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BE1E3082B41;
 Wed, 28 Aug 2019 18:41:06 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AC19194B2;
 Wed, 28 Aug 2019 18:41:05 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2019 15:40:24 -0300
Message-Id: <20190828184026.5840-11-ehabkost@redhat.com>
In-Reply-To: <20190828184026.5840-1-ehabkost@redhat.com>
References: <20190828184026.5840-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 28 Aug 2019 18:41:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 10/12] qapi: report the default CPU type for
 each machine
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

When user doesn't request any explicit CPU model with libvirt or QEMU,
a machine type specific CPU model is picked. Currently there is no way
to determine what this QEMU built-in default is, so libvirt cannot
report this back to the user in the XML config.

This extends the "query-machines" QMP command so that it reports the
default CPU model typename for each machine.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Message-Id: <20190822100412.23746-1-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/machine.json          | 5 ++++-
 hw/core/machine-qmp-cmds.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index de5c742d72..ca26779f1a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -348,13 +348,16 @@
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
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 15cf7c62e3..eed5aeb2f7 100644
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
--=20
2.21.0


