Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F4492A4F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:09:13 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9r2l-0008RE-Ng
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9qWd-0001hE-G6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9qWb-0003Ky-1h
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642520156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00rxdDtZp4ypd4IvqGnNUnI3QI6holEBprmZvrNofxs=;
 b=DcdpI1u6++wA7zIrTfrJGiGkBLq4lAyde2Wr02jmzOIjEVdJwpyhRDdsV1FuZBcjlF8Q09
 9RZSHxbqplr5sfg4Wq/dBYcohT+xv0tIqE1PdyuJGYn2Cf7lDJu/VJrD2v3JVbDQGMjYkV
 qBbtuW1txmtKdeOD2tLnR8MUySV2woA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-hD3TA7gQPL-Lx_Uo6Ucw2g-1; Tue, 18 Jan 2022 10:35:53 -0500
X-MC-Unique: hD3TA7gQPL-Lx_Uo6Ucw2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A5088EF01;
 Tue, 18 Jan 2022 15:33:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5420C4F87A;
 Tue, 18 Jan 2022 15:33:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH v2 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Date: Tue, 18 Jan 2022 16:33:05 +0100
Message-Id: <20220118153306.282681-2-eric.auger@redhat.com>
In-Reply-To: <20220118153306.282681-1-eric.auger@redhat.com>
References: <20220118153306.282681-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Tested-by: Stefan Berger <stefanb@linux.ibm.com>

---

v1 -> v2:
- Add tpm_crb_unrealize
---
 hw/tpm/meson.build |  2 +-
 hw/tpm/tpm_crb.c   | 22 ++++++++++++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

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
index 58ebd1469c..6ec19a9911 100644
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
@@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
     qemu_register_reset(tpm_crb_reset, dev);
 }
 
+static void tpm_crb_unrealize(DeviceState *dev)
+{
+    CRBState *s = CRB(dev);
+
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


