Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967941D2F8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:00:06 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp6z-0007s9-8S
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosF-0001AG-Gc; Thu, 30 Sep 2021 01:44:51 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:60507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosC-0003Zh-UA; Thu, 30 Sep 2021 01:44:51 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR28wgz4xbp; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=osUuIllG/VpPXwOFez6W8Xy8H94lWynoV66kLii3ISg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HP1Ve530tE/gwXctgA3TZgq7r2hDRxVnlnWdheYX4YJ2E1DEWJg6UKmhHETeOD7U8
 Ydz5+sbUCioTXAUsgEc7QLF6qegDvD3D0phdfeAbfUQlOPr3Q+Vw87ilTml0yfZHow
 kS+Nm9jJp5Lgm57kuVryF4V3He5WUPInTJMiAngc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/44] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in
 acpi_memory_hotplug_write()
Date: Thu, 30 Sep 2021 15:44:02 +1000
Message-Id: <20210930054426.357344-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

MEM_UNPLUG_ERROR is deprecated since the introduction of
DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
MEM_UNPLUG_ERROR is pending.

CC: Michael S. Tsirkin <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210907004755.424931-8-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/acpi/memory_hotplug.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 6a71de408b..d0fffcf787 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
@@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
+
+                /*
+                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ERROR
+                 * while the deprecation of MEM_UNPLUG_ERROR is
+                 * pending.
+                 */
                 qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
+                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+                                                          dev->canonical_path);
                 error_free(local_err);
                 break;
             }
-- 
2.31.1


