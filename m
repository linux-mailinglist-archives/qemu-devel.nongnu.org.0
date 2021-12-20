Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E047B402
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:55:02 +0100 (CET)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOkP-0003FM-Mt
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzNNl-0006bt-Ve
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 13:27:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mzNNj-000860-25
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 13:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640024847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TYzrk8fF4zPGy+Y5njXzh6GgWsjxe/DdVho+YC8leYI=;
 b=HrdMO9/9BCk9ZrBGv94tmWg9e6Wtpu3/hfYp5XzrrXEFNx/bvWdK7+6cwU32mfMDbHFqk1
 1muCwewyoMmiEAalu15fmkhUcV8/HV1pOill3894zOVX/6GDB8vhpUaezZ3cZMAxa8e5Im
 a4pnuuO37NzdGZuMeVCq+OwsIJ6YaBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-3dC52F5MPIarL3UL6MSEPQ-1; Mon, 20 Dec 2021 13:27:25 -0500
X-MC-Unique: 3dC52F5MPIarL3UL6MSEPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2256760C4;
 Mon, 20 Dec 2021 18:27:24 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2EA15BD28;
 Mon, 20 Dec 2021 18:27:00 +0000 (UTC)
Subject: [PATCH] pci: Skip power-off reset when pending unplug
From: Alex Williamson <alex.williamson@redhat.com>
To: mst@redhat.com, qemu-devel@nongnu.org
Date: Mon, 20 Dec 2021 11:26:59 -0700
Message-ID: <164002480875.2328622.7843917444941101286.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The below referenced commit introduced a change where devices under a
root port slot are reset in response to removing power to the slot.
This improves emulation relative to bare metal when the slot is powered
off, but introduces an unnecessary step when devices under that slot
are slated for removal.

In the case of an assigned device, there are mandatory delays
associated with many device reset mechanisms which can stall the hot
unplug operation.  Also, in cases where the unplug request is triggered
via a release operation of the host driver, internal device locking in
the host kernel may result in a failure of the device reset mechanism,
which generates unnecessary log warnings.

Skip the reset for devices that are slated for unplug.

Cc: qemu-stable@nongnu.org
Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/pci/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef52b..f594da410797 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2869,7 +2869,7 @@ void pci_set_power(PCIDevice *d, bool state)
     memory_region_set_enabled(&d->bus_master_enable_region,
                               (pci_get_word(d->config + PCI_COMMAND)
                                & PCI_COMMAND_MASTER) && d->has_power);
-    if (!d->has_power) {
+    if (!d->has_power && !d->qdev.pending_deleted_event) {
         pci_device_reset(d);
     }
 }



