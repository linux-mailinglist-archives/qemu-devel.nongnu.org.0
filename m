Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACDE2CF4B4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:26:12 +0100 (CET)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klGiZ-00077Z-2s
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEci-0007Ux-Ou
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006fr-Fw
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sDhzY6wb0FRMqX2bi1v/ZtwCNqMbtyd0feL/O6U6EQ=;
 b=ZOvq7tU0LticZTFln1TeIqFgQj/eeBDfYzvGWkpUoMRCgDT6cvJPVCmi7bulJTgNAuM9Ge
 ZNsp0cHaoNHDH1A4eILTPU6Jj+wDnwu9sk181B+e3UVvJhR88mz+KocWnOFFiquadZCBCn
 v1V75LUVVydbKxKHceT0tjyuKuYD2Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329--AxKcLVvN2qIjW9H1uhbyQ-1; Fri, 04 Dec 2020 12:09:51 -0500
X-MC-Unique: -AxKcLVvN2qIjW9H1uhbyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 203621922022;
 Fri,  4 Dec 2020 17:09:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25EB3620D7;
 Fri,  4 Dec 2020 17:09:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug
Date: Fri,  4 Dec 2020 12:09:34 -0500
Message-Id: <20201204170939.1815522-4-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1f5c211245..9036e5594c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
     bool s4_disabled;
     bool pcihp_bridge_en;
     bool smi_on_cpuhp;
+    bool smi_on_cpu_unplug;
     bool pcihp_root_en;
     uint8_t s4_val;
     AcpiFadtData fadt;
@@ -197,6 +198,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     pm->pcihp_io_base = 0;
     pm->pcihp_io_len = 0;
     pm->smi_on_cpuhp = false;
+    pm->smi_on_cpu_unplug = false;
 
     assert(obj);
     init_common_fadt_data(machine, obj, &pm->fadt);
@@ -220,6 +222,8 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
         pm->smi_on_cpuhp =
             !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
+        pm->smi_on_cpu_unplug =
+            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     }
 
     /* The above need not be conditional on machine type because the reset port
-- 
2.27.0


