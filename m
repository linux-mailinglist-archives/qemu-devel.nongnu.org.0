Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65C312A99
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 07:14:48 +0100 (CET)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zot-0008Qp-Ip
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 01:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgW-0007tp-51; Mon, 08 Feb 2021 01:06:08 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46997 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgU-000639-27; Mon, 08 Feb 2021 01:06:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwVt2mp3z9sWQ; Mon,  8 Feb 2021 17:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764342;
 bh=rGrCUIDaja9zftftkqQIdjL/kYsYIfZR7xVO077v4wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AnWxRqvviaZUD7kIPhNWbtRxAjt3/WWEuf/bycf9gmjR+im/2Q/fmjha6oBz3eFKH
 jXrnF5HF1pYPnGWacmtFIbn5ZPDs3q+4injHA5V96M6yTeuAg/eDjinTf/43lJ/0RA
 txThkvKcyUNZjKOkpMptkHlBVCO8QMaGNEiBfiys=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, dgilbert@redhat.com, pair@us.ibm.com,
 qemu-devel@nongnu.org, brijesh.singh@amd.com
Subject: [PULL v9 12/13] confidential guest support: Alter virtio default
 properties for protected guests
Date: Mon,  8 Feb 2021 17:05:37 +1100
Message-Id: <20210208060538.39276-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, jun.nakajima@intel.com,
 andi.kleen@intel.com, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default behaviour for virtio devices is not to use the platforms normal
DMA paths, but instead to use the fact that it's running in a hypervisor
to directly access guest memory.  That doesn't work if the guest's memory
is protected from hypervisor access, such as with AMD's SEV or POWER's PEF.

So, if a confidential guest mechanism is enabled, then apply the
iommu_platform=on option so it will go through normal DMA mechanisms.
Those will presumably have some way of marking memory as shared with
the hypervisor or hardware so that DMA will work.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/core/machine.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f45a795478..970046f438 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,6 +33,8 @@
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 #include "exec/confidential-guest-support.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-pci.h"
 
 GlobalProperty hw_compat_5_2[] = {};
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
@@ -1196,6 +1198,17 @@ void machine_run_board_init(MachineState *machine)
          * areas.
          */
         machine_set_mem_merge(OBJECT(machine), false, &error_abort);
+
+        /*
+         * Virtio devices can't count on directly accessing guest
+         * memory, so they need iommu_platform=on to use normal DMA
+         * mechanisms.  That requires also disabling legacy virtio
+         * support for those virtio pci devices which allow it.
+         */
+        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legacy",
+                                   "on", true);
+        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_platform",
+                                   "on", false);
     }
 
     machine_class->init(machine);
-- 
2.29.2


