Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC348D601
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:48:05 +0100 (CET)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xeG-0001d6-CY
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7xVd-0003Z4-P7
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7xVO-0001N6-So
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642070332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i61MGdDaEZBSVJgLArAARMIoBrGXkQTMEmbVrvNOq8=;
 b=HpWt7BmOVNaIrO5LXFm0pcLRGeUfddgl6FDDIhrf2wtxeUwFiP7Lgp3MU3BeWN+YNePmeP
 zUjCJ8mJdJ8lOlzN+jmiV2osBlOpDOHp6+m9kL/VzH+yQ41qUAjjCjwL4vLcFGMbcpp3OE
 dYbE1IyZLkfyqPVGdBSyttC/JZMJzq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-dSjee1c6MyaPMj-AamaRSA-1; Thu, 13 Jan 2022 05:38:46 -0500
X-MC-Unique: dSjee1c6MyaPMj-AamaRSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F460101AFA9;
 Thu, 13 Jan 2022 10:38:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD48073152;
 Thu, 13 Jan 2022 10:38:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Date: Thu, 13 Jan 2022 11:37:56 +0100
Message-Id: <20220113103757.2801389-2-eric.auger@redhat.com>
In-Reply-To: <20220113103757.2801389-1-eric.auger@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Representing the CRB cmd/response buffer as a standard
RAM region causes some trouble when the device is used
with VFIO. Indeed VFIO attempts to DMA_MAP this region
as usual RAM but this latter does not have a valid page
size alignment causing such an error report:
"vfio_listener_region_add received unaligned region".
To allow VFIO to detect that failing dma mapping
this region is not an issue, let's use a ram_device
memory region type instead.

The change in meson.build is required to include the
cpu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/tpm/meson.build |  2 +-
 hw/tpm/tpm_crb.c   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 1c68d81d6a..3e74df945b 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -1,8 +1,8 @@
 softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
 
+specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c..25f8e685e4 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -25,6 +25,7 @@
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "sysemu/reset.h"
+#include "cpu.h"
 #include "tpm_prop.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -43,6 +44,7 @@ struct CRBState {
 
     bool ppi_enabled;
     TPMPPI ppi;
+    uint8_t *crb_cmd_buf;
 };
 typedef struct CRBState CRBState;
 
@@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
+                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
+
     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
         "tpm-crb-mmio", sizeof(s->regs));
-    memory_region_init_ram(&s->cmdmem, OBJECT(s),
-        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
+    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
+                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
+    vmstate_register_ram(&s->cmdmem, DEVICE(s));
 
     memory_region_add_subregion(get_system_memory(),
         TPM_CRB_ADDR_BASE, &s->mmio);
-- 
2.26.3


