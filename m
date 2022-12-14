Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB464CE4B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu9-00051g-7m; Wed, 14 Dec 2022 11:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utz-0004vp-42
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utx-0002Oj-9w
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjQettXu9x2DlkZGFL9oZvcJrEMmh0ugIEH1vvJx+LU=;
 b=aByKnQLO4N14+WLg+w0ooD/l2pE2EmiT+5rgmry+SIaeRfhTxUFr/WNDtD8oiC1+u2dTGu
 4WmQsaCrEPAcMSENe3EfrMb95jjB96Eim4LqjXov8QBT/sWR4QD1Wq2yphvNrHKSahO/Vq
 xhsot5DXVmbs8KIjZ2MwiY3sc9ZZDfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-l_ErAzSyOJ21qcpuZI6KGw-1; Wed, 14 Dec 2022 11:46:32 -0500
X-MC-Unique: l_ErAzSyOJ21qcpuZI6KGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851FC8030A0;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C33514171C0;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38B8721E6930; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 03/14] error: Drop a few superfluous ERRP_GUARD()
Date: Wed, 14 Dec 2022 17:46:18 +0100
Message-Id: <20221214164629.919880-4-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

include/qapi/error.h on ERRP_GUARD():

 * It must be used when the function dereferences @errp or passes
 * @errp to error_prepend(), error_vprepend(), or error_append_hint().
 * It is safe to use even when it's not needed, but please avoid
 * cluttering the source with useless code.

Clean up some of this clutter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-3-armbru@redhat.com>
---
 block/copy-before-write.c | 1 -
 dump/dump.c               | 2 --
 hw/core/qdev.c            | 2 --
 hw/pci/msi.c              | 1 -
 hw/remote/vfio-user-obj.c | 1 -
 ui/util.c                 | 1 -
 6 files changed, 8 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4abaa7339e..6f0157244f 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -522,7 +522,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
-    ERRP_GUARD();
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     QDict *opts;
diff --git a/dump/dump.c b/dump/dump.c
index df117c847f..c9afc30ce2 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -357,7 +357,6 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
 
 static void write_elf_phdr_note(DumpState *s, Error **errp)
 {
-    ERRP_GUARD();
     Elf32_Phdr phdr32;
     Elf64_Phdr phdr64;
     void *phdr;
@@ -773,7 +772,6 @@ static void dump_iterate(DumpState *s, Error **errp)
 static void dump_end(DumpState *s, Error **errp)
 {
     int rc;
-    ERRP_GUARD();
 
     if (s->elf_section_data_size) {
         s->elf_section_data = g_malloc0(s->elf_section_data_size);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0145501904..67be2feaf3 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -493,8 +493,6 @@ void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
 
 bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
 {
-    ERRP_GUARD();
-
     if (dev->unplug_blockers) {
         error_propagate(errp, error_copy(dev->unplug_blockers->data));
         return true;
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..1cadf150bc 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -317,7 +317,6 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
 
 void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
 {
-    ERRP_GUARD();
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
     uint32_t irq_state, vector_mask, pending;
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 4e36bb8bcf..6d0310cec9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -719,7 +719,6 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
  */
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
-    ERRP_GUARD();
     DeviceState *dev = NULL;
     vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
     int ret;
diff --git a/ui/util.c b/ui/util.c
index 7e8fc1ea53..907d60e032 100644
--- a/ui/util.c
+++ b/ui/util.c
@@ -51,7 +51,6 @@ bool qemu_console_fill_device_address(QemuConsole *con,
                                       size_t size,
                                       Error **errp)
 {
-    ERRP_GUARD();
     DeviceState *dev = DEVICE(object_property_get_link(OBJECT(con),
                                                        "device",
                                                        &error_abort));
-- 
2.37.3


