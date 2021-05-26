Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C933F391246
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 10:26:42 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llosD-00054H-3L
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 04:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lloqj-0002gg-5u
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lloqg-0006ri-CD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 04:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622017505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=NGxnL58cZ7J0FpLILJVl5iGWIs/UZR1ZMuS4cpTk2M0=;
 b=eygNGUm4n4kI7ZMna0cXQwP7PUIthsVdfV+iOhear+PZHfMTLaWSNXimGQ8QDBJ/4kT54G
 SHY4vcA2yCEuzr8UfMJCX443zACUhCImkiCxQlfOtF1la/yGMcYP9fGKFkfQHujK+1lXZ9
 FyBikv5B7MJbqTnABBCAPssBTP9QWrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-oKAXSK2YNj-qCJfZ7Fuovg-1; Wed, 26 May 2021 04:25:01 -0400
X-MC-Unique: oKAXSK2YNj-qCJfZ7Fuovg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6675C180FD77;
 Wed, 26 May 2021 08:25:00 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-159.pek2.redhat.com
 [10.72.13.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C984C6A046;
 Wed, 26 May 2021 08:24:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 2/3] virtio-net: failover: add missing
 remove_migration_state_change_notifier()
Date: Wed, 26 May 2021 16:24:51 +0800
Message-Id: <1622017492-7770-3-git-send-email-jasowang@redhat.com>
In-Reply-To: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
References: <1622017492-7770-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

In the failover case configuration, virtio_net_device_realize() uses an
add_migration_state_change_notifier() to add a state notifier, but this
notifier is not removed by the unrealize function when the virtio-net
card is unplugged.

If the card is unplugged and a migration is started, the notifier is
called and as it is not valid anymore QEMU crashes.

This patch fixes the problem by adding the
remove_migration_state_change_notifier() in virtio_net_device_unrealize().

The problem can be reproduced with:

  $ qemu-system-x86_64 -enable-kvm -m 1g -M q35 \
    -device pcie-root-port,slot=4,id=root1 \
    -device pcie-root-port,slot=5,id=root2 \
    -device virtio-net-pci,id=net1,mac=52:54:00:6f:55:cc,failover=on,bus=root1 \
    -monitor stdio disk.qcow2
  (qemu) device_del net1
  (qemu) migrate "exec:gzip -c > STATEFILE.gz"

  Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
  0x0000000000000000 in ?? ()
  (gdb) bt
  #0  0x0000000000000000 in  ()
  #1  0x0000555555d726d7 in notifier_list_notify (...)
      at .../util/notify.c:39
  #2  0x0000555555842c1a in migrate_fd_connect (...)
      at .../migration/migration.c:3975
  #3  0x0000555555950f7d in migration_channel_connect (...)
      error@entry=0x0) at .../migration/channel.c:107
  #4  0x0000555555910922 in exec_start_outgoing_migration (...)
      at .../migration/exec.c:42

Reported-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff4..914051f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3373,6 +3373,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
 
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
+        remove_migration_state_change_notifier(&n->migration_state);
     }
 
     max_queues = n->multiqueue ? n->max_queues : 1;
-- 
2.7.4


