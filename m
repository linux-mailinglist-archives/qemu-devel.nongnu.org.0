Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049670084F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:43:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS50-0007eq-T3; Fri, 12 May 2023 08:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4y-0007dx-3I
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4w-0006SJ-GV
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xQAXtMPdmj+EhnsOx5jBo5h+S+Tq/OMiEpXn9KYpDE=;
 b=IE7kbEJl28gVpYt8qCeOOpGX/l6UOF76BwkGW48O6EsnMEYvQrRG4bgbNEzbZt76BQUOBT
 fnqCxNWlB7ZitxFhcpL/CczGKc25kuYY4esSLKEjFy91DZW5kCxNJGMWu5wqnPrB2R7yP8
 3ToC8mEDERe1hhAQdJqAITDaiJJxKP8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-qu3dANHsP9-seiyDtuDRGQ-1; Fri, 12 May 2023 08:40:56 -0400
X-MC-Unique: qu3dANHsP9-seiyDtuDRGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 900D82A59555;
 Fri, 12 May 2023 12:40:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8149A1121314;
 Fri, 12 May 2023 12:40:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/18] hw/sparc64/sun4u: Use MachineClass->default_nic and
 MachineClass->no_parallel
Date: Fri, 12 May 2023 14:40:25 +0200
Message-Id: <20230512124033.502654-11-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Announce the default NIC via MachineClass->default_nic and set up
MachineClass->no_parallel according to the availability of the
"isa-parallel" device, so that the Sun machines also work when
QEMU has been configured with "--without-default-devices".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sparc64/sun4u.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index eae7589462..e2858a0331 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -553,6 +553,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                         MachineState *machine,
                         const struct hwdef *hwdef)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     SPARCCPU *cpu;
     Nvram *nvram;
     unsigned int i;
@@ -645,15 +646,15 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
         PCIBus *bus;
         nd = &nd_table[i];
 
-        if (!nd->model || strcmp(nd->model, "sunhme") == 0) {
+        if (!nd->model || strcmp(nd->model, mc->default_nic) == 0) {
             if (!onboard_nic) {
                 pci_dev = pci_new_multifunction(PCI_DEVFN(1, 1),
-                                                   true, "sunhme");
+                                                   true, mc->default_nic);
                 bus = pci_busA;
                 memcpy(&macaddr, &nd->macaddr.a, sizeof(MACAddr));
                 onboard_nic = true;
             } else {
-                pci_dev = pci_new(-1, "sunhme");
+                pci_dev = pci_new(-1, mc->default_nic);
                 bus = pci_busB;
             }
         } else {
@@ -816,6 +817,8 @@ static void sun4u_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
     mc->ignore_boot_device_suffixes = true;
     mc->default_display = "std";
+    mc->default_nic = "sunhme";
+    mc->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
     fwc->get_dev_path = sun4u_fw_dev_path;
 }
 
@@ -840,6 +843,8 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
     mc->default_display = "std";
+    mc->default_nic = "sunhme";
+    mc->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
 }
 
 static const TypeInfo sun4v_type = {
-- 
2.31.1


