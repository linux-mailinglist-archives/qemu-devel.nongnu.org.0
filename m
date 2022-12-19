Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E0650F43
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQU-0002fx-Ie; Mon, 19 Dec 2022 10:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQK-0002Xs-F2
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQH-0000Zm-RM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5B3X7HdMqjBsciArRVyj+6wZin8F5Pe0ky9uO3x24k=;
 b=Yn2DVGSYzY1KaJkukwyz26evXmgDTWg73MB1DqXShxHNq/RhiPfIMfJTc6+7ZA5ioMl3yT
 Z1vJlAbnhCam1MErzCL+Ywgq7tq6XStlmwwSTM1IQmzn3P1yWWOGuK7irRo8812ZrczqUT
 aJTRNZitvFeZa2AdiNNcsS0xb653Z5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-FyLxK9uKMb2MRr0SOSjjVQ-1; Mon, 19 Dec 2022 10:51:23 -0500
X-MC-Unique: FyLxK9uKMb2MRr0SOSjjVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F0AC1C09C87;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0366D2026D4B;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F3DD21E668F; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 05/13] pci: Build hw/pci/pci-hmp-cmds.c only when CONFIG_PCI
Date: Mon, 19 Dec 2022 16:51:12 +0100
Message-Id: <20221219155120.2273041-6-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
!CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221201121133.3813857-6-armbru@redhat.com>
---
 hw/pci/pci-stub.c  | 5 +++++
 hw/pci/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index f29ecc999e..01d20a2f67 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/qapi-commands-pci.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
@@ -34,6 +35,10 @@ PciInfoList *qmp_query_pci(Error **errp)
     return NULL;
 }
 
+void hmp_info_pci(Monitor *mon, const QDict *qdict)
+{
+}
+
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "PCI devices not supported\n");
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index e42a133f3a..4fcd888b27 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -5,6 +5,7 @@ pci_ss.add(files(
   'pci.c',
   'pci_bridge.c',
   'pci_host.c',
+  'pci-hmp-cmds.c',
   'pci-qmp-cmds.c',
   'pcie_sriov.c',
   'shpc.c',
@@ -20,4 +21,3 @@ softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
 softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
-softmmu_ss.add(files('pci-hmp-cmds.c'))
-- 
2.37.3


