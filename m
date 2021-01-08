Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892272EF668
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:25:03 +0100 (CET)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvVW-0007Sb-Kp
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxvJy-0001W8-TA
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:13:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxvJw-00054f-Kz
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610125983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IE9TS/vpPpTp5y2Ek4nW1NSZCOzppGB66j51BLT4u+k=;
 b=Dk7M8QtTgjI1DV9wE9R+9vJfbU0DcR0v4jueZJauPcMnzdsUt8I1XPun1UDPVPriB87RJW
 tL5l3JcNoGu5KI9w4B567aSx8zUYvF5pYkP8J2zdKWksJLzAB1akPbtklLnJnjrRfmrCCP
 kXLKQBWkCUFThSdOzM3VrpOsjycDZ4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-fc343Ln-MY-BNWtm_IOGtw-1; Fri, 08 Jan 2021 12:12:59 -0500
X-MC-Unique: fc343Ln-MY-BNWtm_IOGtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 817DE59;
 Fri,  8 Jan 2021 17:12:58 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85FCD5B6A7;
 Fri,  8 Jan 2021 17:12:53 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Date: Fri,  8 Jan 2021 18:12:52 +0100
Message-Id: <20210108171252.209502-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mdroth@linux.vnet.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
set to true by default.
To allow the migration, we set this property to false in the hw_compat,
but in the wrong place (hw_compat_4_1).

Since commit 9d7bd0826f was released with QEMU 5.0, we move
'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
will have the pre-patch behavior and the migration can work.

The issue was discovered with vhost-vsock device and 4.2 machine
type without running any kernel in the VM:
    $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
        -device vhost-vsock-pci,guest-cid=4 \
        -monitor stdio -incoming tcp:0:3333

    $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
        -device vhost-vsock-pci,guest-cid=3 \
        -monitor stdio
    (qemu) migrate -d tcp:0:3333

    # qemu-4.2 output
    qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
    qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
    qemu-system-x86_64: load of migration failed: No such file or directory

Reported-by: Jing Zhao <jinzhao@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
Cc: mdroth@linux.vnet.ibm.com
CC: qemu-stable@nongnu.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index de3b8f1b31..5d6163ab70 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
     { "qxl", "revision", "4" },
     { "qxl-vga", "revision", "4" },
     { "fw_cfg", "acpi-mr-restore", "false" },
+    { "virtio-device", "use-disabled-flag", "false" },
 };
 const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
 
 GlobalProperty hw_compat_4_1[] = {
     { "virtio-pci", "x-pcie-flr-init", "off" },
-    { "virtio-device", "use-disabled-flag", "false" },
 };
 const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
 
-- 
2.26.2


