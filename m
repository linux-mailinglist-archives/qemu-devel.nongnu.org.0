Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F614ADCA0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:28:11 +0100 (CET)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSPa-0005Lj-72
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQaj-0003d8-DP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQag-0004GM-Ry
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644327090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCouyISLHtncrjGAGOUM6+LEW5CHw90BeT7ntnmYUZ0=;
 b=YUms/uAV5K7RhzlS2WYm8ydbFKo8s8TyCc3mF7NZw0AvIZUpi7amGRuV5VLgJvp4TpHIbo
 m6g+vlmNE9C+ASzfuA/WWamzDEHoBZe8MOPMbUHxPnIyEjp2fU0JO+MFsGCLuQ4K/eYvMU
 SZkWZLC/tc/Y5LMU5akQa9KoJFRcmkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-BtfAnch0MZ2naDDsc1xuPw-1; Tue, 08 Feb 2022 08:31:27 -0500
X-MC-Unique: BtfAnch0MZ2naDDsc1xuPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948CC8143EB;
 Tue,  8 Feb 2022 13:31:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E48F72B4C2;
 Tue,  8 Feb 2022 13:31:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH v3 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Date: Tue,  8 Feb 2022 14:31:16 +0100
Message-Id: <20220208133117.111833-2-eric.auger@redhat.com>
In-Reply-To: <20220208133117.111833-1-eric.auger@redhat.com>
References: <20220208133117.111833-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
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

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Stefan Berger <stefanb@linux.ibm.com>
[PMD: Keep tpm_crb.c in meson's softmmu_ss]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

v3 -> v4:
-  call vmstate_unregister_ram
---
 hw/tpm/tpm_crb.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c3..668f969b409 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -25,6 +25,7 @@
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "sysemu/reset.h"
+#include "exec/cpu-common.h"
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
+    vmstate_register_ram(&s->cmdmem, dev);
 
     memory_region_add_subregion(get_system_memory(),
         TPM_CRB_ADDR_BASE, &s->mmio);
@@ -309,12 +315,25 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
     qemu_register_reset(tpm_crb_reset, dev);
 }
 
+static void tpm_crb_unrealize(DeviceState *dev)
+{
+    CRBState *s = CRB(dev);
+
+    vmstate_unregister_ram(&s->cmdmem, dev);
+    qemu_vfree(s->crb_cmd_buf);
+
+    if (s->ppi_enabled) {
+        qemu_vfree(s->ppi.buf);
+    }
+}
+
 static void tpm_crb_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
 
     dc->realize = tpm_crb_realize;
+    dc->unrealize = tpm_crb_unrealize;
     device_class_set_props(dc, tpm_crb_properties);
     dc->vmsd  = &vmstate_tpm_crb;
     dc->user_creatable = true;
-- 
2.26.3


