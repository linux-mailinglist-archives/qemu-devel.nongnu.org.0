Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F384302990
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:07:36 +0100 (CET)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46H1-0005hC-LG
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bl-0001SU-2c
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46BY-0006kk-V4
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVU4Q6xMtVOhCV7Mcgnky2YsorHb7GhIScj9GdyYhiE=;
 b=K3xhMG1xXE/EFvMb3cND7amcacKnOVd5cXM4HHOcFMcclPkzozuTYetem9tPEu6T2TjRa4
 EqJltnuRNpbbShF+CYfH2UP+OUFT4VA2gKui3Tap/jDQ7Sycxck2Hfn5yFiO67CNatVDvG
 /dNt9B9aJu9sXlmEJvobWfb1QCjJT2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Sun8uxuYMC-1aNJlQhanOg-1; Mon, 25 Jan 2021 13:01:52 -0500
X-MC-Unique: Sun8uxuYMC-1aNJlQhanOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45E11842149
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:01:51 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B070B71D4F;
 Mon, 25 Jan 2021 18:01:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 44BF7225FCE; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 4/6] qemu,
 vhost-user: Extend protocol to start/stop/flush slave channel
Date: Mon, 25 Jan 2021 13:01:13 -0500
Message-Id: <20210125180115.22936-5-vgoyal@redhat.com>
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we don't have a mechanism to flush slave channel while shutting
down vhost-user device and that can result a deadlock. Consider following
scenario.

1. Slave gets a request from guest on virtqueue (say index 1, vq1), to map
   a portion of file in qemu address space.

2. Thread serving vq1 receives this request and sends a message to qemu on
   slave channel/fd and gets blocked in waiting for a response from qemu.

3. In the mean time, user does "echo b > /proc/sysrq-trigger" in guest. This
   leads to qemu reset and ultimately in main thread we end up in
   vhost_dev_stop() which is trying to shutdown virtqueues for the device.

4. Slave gets VHOST_USER_GET_VRING_BASE message to shutdown a virtqueue on
   unix socket being used for communication.

5. Slave tries to shutdown the thread serving vq1 and waits for it to
   terminate. But vq1 thread can't terminate because it is waiting for
   a response from qemu on slave_fd. And qemu is not processing slave_fd
   anymore as qemu is ressing (and not running main event loop anymore)
   and is waiting for a response to VHOST_USER_GET_VRING_BASE.

So we have a deadlock. Qemu is waiting on slave to response to
VHOST_USER_GET_VRING_BASE message and slave is waiting on qemu to
respond to request it sent on slave_fd.

I can reliably reproduce this race with virtio-fs.

Hence here is the proposal to solve this problem. Enhance vhost-user
protocol to properly shutdown slave_fd channel. And if there are pending
requests, flush the channel completely before sending the request to
shutdown virtqueues.

New workflow to shutdown slave channel is.

- Qemu sends VHOST_USER_STOP_SLAVE_CHANNEL request to slave. It waits
  for an reply from guest.

- Then qemu sits in a tight loop waiting for
  VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message from slave on slave_fd.
  And while waiting for this message, qemu continues to process requests
  on slave_fd to flush any pending requests. This will unblock threads
  in slave and allow slave to shutdown slave channel.

- Once qemu gets VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message, it knows
  no more requests will come on slave_fd and it can continue to shutdown
  virtqueues now.

- Once device starts again, qemu will send VHOST_USER_START_SLAVE_CHANNEL
  message to slave to open the slave channel and receive requests.

IOW, this allows for proper shutdown of slave channel, making sure
no threads in slave are blocked on sending/receiving message. And
this in-turn allows for shutting down of virtqueues, hence resolving
the deadlock.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 hw/virtio/vhost-user.c | 108 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 867cac034f..56be61d4e2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -80,6 +80,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
     /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP = 16,
     VHOST_USER_PROTOCOL_F_MAX
 };
 
@@ -125,6 +126,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_START_SLAVE_CHANNEL = 39,
+    VHOST_USER_STOP_SLAVE_CHANNEL = 40,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -139,6 +142,7 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_FS_UNMAP = 7,
     VHOST_USER_SLAVE_FS_SYNC = 8,
     VHOST_USER_SLAVE_FS_IO = 9,
+    VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE = 10,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -246,6 +250,7 @@ struct vhost_user {
     /* Shared between vhost devs of the same virtio device */
     VhostUserState *user;
     int slave_fd;
+    bool slave_channel_open;
     NotifierWithReturn postcopy_notifier;
     struct PostCopyFD  postcopy_fd;
     uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS];
@@ -1511,6 +1516,10 @@ static int do_slave_read(void *opaque)
         ret = vhost_user_fs_slave_io(dev, &payload.fs, fd[0]);
         break;
 #endif
+    case VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE:
+        u->slave_channel_open = false;
+        ret = 0;
+        break;
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
         ret = (uint64_t)-EINVAL;
@@ -1580,6 +1589,70 @@ static void slave_read(void *opaque)
     do_slave_read(opaque);
 }
 
+static int vhost_start_slave_channel(struct vhost_dev *dev)
+{
+    struct vhost_user *u = dev->opaque;
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_START_SLAVE_CHANNEL,
+        .hdr.flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
+    };
+    int ret = 0;
+
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP)) {
+        return 0;
+    }
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret) {
+        return ret;
+    }
+
+    ret = process_message_reply(dev, &msg);
+    if (ret)
+        return ret;
+
+    u->slave_channel_open = true;
+    return ret;
+}
+
+static int vhost_stop_slave_channel(struct vhost_dev *dev)
+{
+    struct vhost_user *u = dev->opaque;
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_STOP_SLAVE_CHANNEL,
+        .hdr.flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
+    };
+    int ret = 0;
+
+    if (!virtio_has_feature(dev->protocol_features,
+                            VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP)) {
+        return 0;
+    }
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret) {
+        return ret;
+    }
+
+    ret = process_message_reply(dev, &msg);
+    if (ret) {
+        return ret;
+    }
+
+    /*
+     * Wait for flush finish message from slave. And continue to process
+     * slave messages till we get flush finish.
+     */
+    while (u->slave_channel_open) {
+        ret = do_slave_read(dev);
+        if (ret)
+            break;
+    }
+
+    return ret;
+}
+
 static int vhost_setup_slave_channel(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
@@ -1860,6 +1933,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
     u = g_new0(struct vhost_user, 1);
     u->user = opaque;
     u->slave_fd = -1;
+    u->slave_channel_open = false;
     u->dev = dev;
     dev->opaque = u;
 
@@ -1934,6 +2008,17 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
 
             u->user->memory_slots = MIN(ram_slots, VHOST_USER_MAX_RAM_SLOTS);
         }
+
+        if (virtio_has_feature(dev->protocol_features,
+                               VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP) &&
+                !(virtio_has_feature(dev->protocol_features,
+                    VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
+                 virtio_has_feature(dev->protocol_features,
+                    VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
+            error_report("Slave channel start/stop support requires reply-ack"
+                         " and slave-req protocol features.");
+            return -1;
+        }
     }
 
     if (dev->migration_blocker == NULL &&
@@ -1949,6 +2034,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
         if (err < 0) {
             return err;
         }
+        err = vhost_start_slave_channel(dev);
+        if (err < 0) {
+            return err;
+        }
     }
 
     u->postcopy_notifier.notify = vhost_user_postcopy_notifier;
@@ -2408,6 +2497,24 @@ void vhost_user_cleanup(VhostUserState *user)
     user->chr = NULL;
 }
 
+static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
+{
+    int ret;
+
+    if (!started) {
+        ret = vhost_stop_slave_channel(dev);
+        if (ret < 0) {
+            return ret;
+        }
+    } else {
+        ret = vhost_start_slave_channel(dev);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+    return 0;
+}
+
 const VhostOps user_ops = {
         .backend_type = VHOST_BACKEND_TYPE_USER,
         .vhost_backend_init = vhost_user_backend_init,
@@ -2434,6 +2541,7 @@ const VhostOps user_ops = {
         .vhost_net_set_mtu = vhost_user_net_set_mtu,
         .vhost_set_iotlb_callback = vhost_user_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_user_send_device_iotlb_msg,
+        .vhost_dev_start = vhost_user_dev_start,
         .vhost_get_config = vhost_user_get_config,
         .vhost_set_config = vhost_user_set_config,
         .vhost_crypto_create_session = vhost_user_crypto_create_session,
-- 
2.25.4


