Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6F3A27A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 01:37:16 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZkte-0004yT-TE
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 19:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hZkra-0003wh-0p
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hZkrZ-0006aJ-3A
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hZkrY-0006Yq-Td
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 19:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27F373082145;
 Sat,  8 Jun 2019 23:35:02 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33493608A5;
 Sat,  8 Jun 2019 23:34:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  8 Jun 2019 20:34:47 -0300
Message-Id: <20190608233447.27970-2-ehabkost@redhat.com>
In-Reply-To: <20190608233447.27970-1-ehabkost@redhat.com>
References: <20190608233447.27970-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Sat, 08 Jun 2019 23:35:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/1] qmp: Add deprecation information to
 query-machines
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export machine type deprecation status through the query-machines
QMP command.  With this, libvirt and management software will be
able to show this information to users and/or suggest changes to
VM configuration to avoid deprecated machines.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Take a much simpler approach: add a simple `deprecated` bool
  field, instead of including a human-readable message and
  suggested alternatives
---
 qapi/misc.json | 7 ++++++-
 vl.c           | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..fca793d39c 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2018,12 +2018,17 @@
 #
 # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
 #
+# @deprecated: if true, the machine type is deprecated and may be removed
+#              in future versions of QEMU according to the QEMU deprecation
+#              policy (since 4.1.0)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
-            'hotpluggable-cpus': 'bool'} }
+            'hotpluggable-cpus': 'bool',
+            'deprecated': 'bool' } }
 
 ##
 # @query-machines:
diff --git a/vl.c b/vl.c
index cd1fbc4cdc..f825d2159c 100644
--- a/vl.c
+++ b/vl.c
@@ -1428,6 +1428,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->name = g_strdup(mc->name);
         info->cpu_max = !mc->max_cpus ? 1 : mc->max_cpus;
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
+        info->deprecated = !!mc->deprecation_reason;
 
         entry = g_malloc0(sizeof(*entry));
         entry->value = info;
-- 
2.18.0.rc1.1.g3f1ff2140


