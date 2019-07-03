Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2262C5EC05
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 20:55:48 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hikPz-0007Nu-9l
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 14:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56719)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hijgQ-0004pz-MP
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hijgO-0000mU-Qa
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47154)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hijgO-0000lK-K5
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A030130821FA;
 Wed,  3 Jul 2019 18:08:38 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC4B383789;
 Wed,  3 Jul 2019 18:08:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 15:07:13 -0300
Message-Id: <20190703180726.31267-31-ehabkost@redhat.com>
In-Reply-To: <20190703180726.31267-1-ehabkost@redhat.com>
References: <20190703180726.31267-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 03 Jul 2019 18:08:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v4 30/43] qmp: Add deprecation information to
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export machine type deprecation status through the query-machines
QMP command.  With this, libvirt and management software will be
able to show this information to users and/or suggest changes to
VM configuration to avoid deprecated machines.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190608233447.27970-2-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/misc.json | 7 ++++++-
 vl.c           | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index ccd56c9191..733ffefa40 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2017,12 +2017,17 @@
 # @numa-mem-supported: true if '-numa node,mem' option is supported by
 #                      the machine type and false otherwise (since 4.1)
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
-            'hotpluggable-cpus': 'bool', 'numa-mem-supported': 'bool'} }
+            'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
+            'deprecated': 'bool' } }
 
 ##
 # @query-machines:
diff --git a/vl.c b/vl.c
index 23fe3e753b..28cc6c4c93 100644
--- a/vl.c
+++ b/vl.c
@@ -1362,6 +1362,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->cpu_max = !mc->max_cpus ? 1 : mc->max_cpus;
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
         info->numa_mem_supported = mc->numa_mem_supported;
+        info->deprecated = !!mc->deprecation_reason;
 
         entry = g_malloc0(sizeof(*entry));
         entry->value = info;
-- 
2.18.0.rc1.1.g3f1ff2140


