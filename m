Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89659442E60
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:41:04 +0100 (CET)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht67-0004hh-Ms
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhsbd-0003rF-W7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhsbb-0002Cn-7I
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kfrl3dEzqlp5G5UVl3ulrEAfyjK21oCQYJBbPUUBO9w=;
 b=X5ObwbCtS+kUP1gS9LjJwtEli7TEODSK1056Bxp0L+iAvXV3oIybXAVqAQn7+YtAPP0EU+
 nUT8XUlifGpZEfRHmyE7xfRtliGj9TlLl4MCgn2rXGEt757j6efWD2SMT5vJF4eroqRwtY
 TIJCBiA2F1nEcpd4Me1rQfuOIK6IH2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-8SBAjqIVOiu7VnLqOkuBhg-1; Tue, 02 Nov 2021 08:09:29 -0400
X-MC-Unique: 8SBAjqIVOiu7VnLqOkuBhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02548801107;
 Tue,  2 Nov 2021 12:09:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-241.phx2.redhat.com
 [10.3.112.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 170A65F4EF;
 Tue,  2 Nov 2021 12:09:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8920180092D; Tue,  2 Nov 2021 13:09:21 +0100 (CET)
Date: Tue, 2 Nov 2021 13:09:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211102120921.4whl6owqm5swt74r@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211018113535-mutt-send-email-mst@kernel.org>
 <20211019052144.q4cy2qrvdh34rxml@sirius.home.kraxel.org>
 <20211019014209-mutt-send-email-mst@kernel.org>
 <20211019062919.35wnhiwimr7l3574@sirius.home.kraxel.org>
 <20211101174531-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211101174531-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > So in theory the guest turning off slot power quickly should work just
> > fine and speed up the unplug process in the common case (guest is
> > up'n'running and responsitive).  Down to 1-2 secs instead of 5-7.
> > Didn't actually test that though.

Tried mean while, test patch (not polished yet) below.

> Even if this speeds up unplug, hotplug remains slow, right?

Notplug never was slow for me ...

take care,
  Gerd

From 074627a24a54203f2b4baf787fd4110c78222e23 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 19 Oct 2021 09:12:22 +0200
Subject: [PATCH] pciehp: fast virtual unplug for VMs

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/pci/hotplug/pciehp.h      |  3 +++
 drivers/pci/hotplug/pciehp_core.c |  5 +++++
 drivers/pci/hotplug/pciehp_ctrl.c | 10 +++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pciehp.h b/drivers/pci/hotplug/pciehp.h
index 69fd401691be..131ffec2e947 100644
--- a/drivers/pci/hotplug/pciehp.h
+++ b/drivers/pci/hotplug/pciehp.h
@@ -79,6 +79,7 @@ extern int pciehp_poll_time;
  * @request_result: result of last user request submitted to the IRQ thread
  * @requester: wait queue to wake up on completion of user request,
  *	used for synchronous slot enable/disable request via sysfs
+ * @is_virtual: virtual machine pcie port.
  *
  * PCIe hotplug has a 1:1 relationship between controller and slot, hence
  * unlike other drivers, the two aren't represented by separate structures.
@@ -109,6 +110,8 @@ struct controller {
 	unsigned int ist_running;
 	int request_result;
 	wait_queue_head_t requester;
+
+	bool is_virtual;
 };
 
 /**
diff --git a/drivers/pci/hotplug/pciehp_core.c b/drivers/pci/hotplug/pciehp_core.c
index ad3393930ecb..28867ec33f5b 100644
--- a/drivers/pci/hotplug/pciehp_core.c
+++ b/drivers/pci/hotplug/pciehp_core.c
@@ -227,6 +227,11 @@ static int pciehp_probe(struct pcie_device *dev)
 		goto err_out_shutdown_notification;
 	}
 
+	if (dev->port->vendor == PCI_VENDOR_ID_REDHAT &&
+	    dev->port->device == 0x000c)
+		/* qemu pcie root port */
+		ctrl->is_virtual = true;
+
 	pciehp_check_presence(ctrl);
 
 	return 0;
diff --git a/drivers/pci/hotplug/pciehp_ctrl.c b/drivers/pci/hotplug/pciehp_ctrl.c
index 529c34808440..c0a05bbdb948 100644
--- a/drivers/pci/hotplug/pciehp_ctrl.c
+++ b/drivers/pci/hotplug/pciehp_ctrl.c
@@ -21,6 +21,10 @@
 #include <linux/pci.h>
 #include "pciehp.h"
 
+static bool fast_virtual_unplug = true;
+module_param(fast_virtual_unplug, bool, 0644);
+MODULE_PARM_DESC(fast_virtual_unplug, "Fast unplug (don't wait 5 seconds) for virtual machines.");
+
 /* The following routines constitute the bulk of the
    hotplug controller logic
  */
@@ -176,7 +180,11 @@ void pciehp_handle_button_press(struct controller *ctrl)
 		/* blink power indicator and turn off attention */
 		pciehp_set_indicators(ctrl, PCI_EXP_SLTCTL_PWR_IND_BLINK,
 				      PCI_EXP_SLTCTL_ATTN_IND_OFF);
-		schedule_delayed_work(&ctrl->button_work, 5 * HZ);
+		if (ctrl->is_virtual && fast_virtual_unplug) {
+			schedule_delayed_work(&ctrl->button_work, 1);
+		} else {
+			schedule_delayed_work(&ctrl->button_work, 5 * HZ);
+		}
 		break;
 	case BLINKINGOFF_STATE:
 	case BLINKINGON_STATE:
-- 
2.31.1


