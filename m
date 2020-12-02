Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329272CB7D9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:58:00 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNxX-0002gq-87
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCb-00034C-5z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCH-0003hQ-PX
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehmt36+3Lwhgf0Ky3LnraRhcYFEtG4dcMjc9yTu0Sj8=;
 b=dZyubq+aUThgZw729DX+MfXKGBxmfiqebQ2ArHIVH8mmw7/wy+jLOQBXAllOSdOPfcx1ai
 +/mLC46GW83Ie08avRHJ7O1hnPKQSE8CVXB0boQVS5IKw0boW1IoA8oITczjX14XCp+sUl
 puCuJuw/MZa3XZET14fT77Yin8Q3YUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-DbCUJwwTOTyRbL3M0UcQmQ-1; Wed, 02 Dec 2020 03:09:07 -0500
X-MC-Unique: DbCUJwwTOTyRbL3M0UcQmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 957B8185E48D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 623051346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 045/113] ppc: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:41 -0500
Message-Id: <20201202080849.4125477-46-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties instead.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/prep.c      | 2 +-
 hw/ppc/spapr_vio.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index c6b9d1ddcb..7e72f6e4a9 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -420,7 +420,7 @@ static void ibm_40p_init(MachineState *machine)
 
     /* Prepare firmware configuration for Open Hack'Ware */
     if (m48t59) {
-        PPC_NVRAM_set_params(m48t59, NVRAM_SIZE, "PREP", ram_size,
+        PPC_NVRAM_set_params(m48t59, NVRAM_SIZE, "PREP", machine->ram_size,
                              boot_device,
                              kernel_base, kernel_size,
                              machine->kernel_cmdline,
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 5d6c56473f..3cc9421526 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -525,10 +525,10 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
         uint32_t liobn = SPAPR_VIO_LIOBN(dev->reg);
 
         memory_region_init(&dev->mrroot, OBJECT(dev), "iommu-spapr-root",
-                           ram_size);
+                           MACHINE(spapr)->ram_size);
         memory_region_init_alias(&dev->mrbypass, OBJECT(dev),
                                  "iommu-spapr-bypass", get_system_memory(),
-                                 0, ram_size);
+                                 0, MACHINE(spapr)->ram_size);
         memory_region_add_subregion_overlap(&dev->mrroot, 0, &dev->mrbypass, 1);
         address_space_init(&dev->as, &dev->mrroot, qdev->id);
 
-- 
2.26.2



