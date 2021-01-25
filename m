Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3763029A5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:10:59 +0100 (CET)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46KI-0000s3-K6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bq-0001YH-Fo
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bm-0006mf-Vo
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlEMOdA1icJ2kgLpjxfqG5+bbZpxaLJO4PoxLpABNz0=;
 b=JwzxjdEwU+/PTwnhS9mjao8fJW2a6oy+Vm4sr4YcZiY5YY3KmAMs+h/ySbC3G/A2R2W0/d
 ZlfEr7CIHDXQpMoXdaHhSt92Lw1c6i9UgEGLhRtgFfEMTB+pocBSeEgb5M+RPKClRgr4VT
 Kb51dfCIniY4XujsmZhoHnkvkqajcVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-G4zK6IvgOhGXF71cQhHEuQ-1; Mon, 25 Jan 2021 13:02:07 -0500
X-MC-Unique: G4zK6IvgOhGXF71cQhHEuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93912107ACE3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:02:06 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A3260C62;
 Mon, 25 Jan 2021 18:01:52 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4931A225FCF; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 5/6] libvhost-user: Add support to start/stop/flush slave
 channel
Date: Mon, 25 Jan 2021 13:01:14 -0500
Message-Id: <20210125180115.22936-6-vgoyal@redhat.com>
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

This patch adds support to start/stop/flush slave channel functionality.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 103 ++++++++++++++++++++--
 subprojects/libvhost-user/libvhost-user.h |   8 +-
 2 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 7a56c56dc8..b4c795c63e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -140,6 +140,8 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_GET_MAX_MEM_SLOTS),
         REQ(VHOST_USER_ADD_MEM_REG),
         REQ(VHOST_USER_REM_MEM_REG),
+        REQ(VHOST_USER_START_SLAVE_CHANNEL),
+        REQ(VHOST_USER_STOP_SLAVE_CHANNEL),
         REQ(VHOST_USER_MAX),
     };
 #undef REQ
@@ -437,11 +439,11 @@ out:
     return result;
 }
 
-/* Returns true on success, false otherwise */
+/* slave mutex should be held. Will be unlocked upon return */
 static bool
-vu_message_slave_send_receive(VuDev *dev, VhostUserMsg *vmsg, uint64_t *payload)
+vu_message_slave_send_receive_locked(VuDev *dev, VhostUserMsg *vmsg,
+                                     uint64_t *payload)
 {
-    pthread_mutex_lock(&dev->slave_mutex);
     if (!vu_message_write(dev, dev->slave_fd, vmsg)) {
         pthread_mutex_unlock(&dev->slave_mutex);
         return false;
@@ -456,6 +458,46 @@ vu_message_slave_send_receive(VuDev *dev, VhostUserMsg *vmsg, uint64_t *payload)
     return vu_process_message_reply(dev, vmsg, payload);
 }
 
+/* Returns true on success, false otherwise */
+static bool
+vu_message_slave_send_receive(VuDev *dev, VhostUserMsg *vmsg,
+                                          uint64_t *payload)
+{
+    pthread_mutex_lock(&dev->slave_mutex);
+    if (!dev->slave_channel_open) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return false;
+    }
+    return vu_message_slave_send_receive_locked(dev, vmsg, payload);
+}
+
+static bool
+vu_finish_stop_slave(VuDev *dev)
+{
+    bool res;
+    uint64_t payload = 0;
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE,
+        .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
+        .size = sizeof(vmsg.payload.u64),
+        .payload.u64 = 0,
+    };
+
+    /*
+     * Once we get slave_mutex, this should make sure no other caller is
+     * currently in the process of sending or receiving message on slave_fd.
+     * And setting slave_channel_open to false now will make sure any new
+     * callers will not send message and instead get error back. So it
+     * is now safe to send stop finished message to master.
+     */
+    pthread_mutex_lock(&dev->slave_mutex);
+    dev->slave_channel_open = false;
+    /* This also drops slave_mutex */
+    res = vu_message_slave_send_receive_locked(dev, &vmsg, &payload);
+    res = res && (payload == 0);
+    return res;
+}
+
 /* Kick the log_call_fd if required. */
 static void
 vu_log_kick(VuDev *dev)
@@ -1529,6 +1571,35 @@ vu_set_slave_req_fd(VuDev *dev, VhostUserMsg *vmsg)
     return false;
 }
 
+static bool
+vu_slave_channel_start(VuDev *dev, VhostUserMsg *vmsg)
+{
+    pthread_mutex_lock(&dev->slave_mutex);
+        dev->slave_channel_open = true;
+    pthread_mutex_unlock(&dev->slave_mutex);
+    /* Caller (vu_dispatch()) will send a reply */
+    return false;
+}
+
+static bool
+vu_slave_channel_stop(VuDev *dev, VhostUserMsg *vmsg, bool *reply_sent,
+                      bool *reply_status)
+{
+    vmsg_set_reply_u64(vmsg, 0);
+    *reply_sent = true;
+    *reply_status = false;
+    if (!vu_send_reply(dev, dev->sock, vmsg)) {
+        return false;
+    }
+
+    if (!vu_finish_stop_slave(dev)) {
+        return false;
+    }
+
+    *reply_status = true;
+    return false;
+}
+
 static bool
 vu_get_config(VuDev *dev, VhostUserMsg *vmsg)
 {
@@ -1823,7 +1894,8 @@ static bool vu_handle_get_max_memslots(VuDev *dev, VhostUserMsg *vmsg)
 }
 
 static bool
-vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
+vu_process_message(VuDev *dev, VhostUserMsg *vmsg, bool *reply_sent,
+                   bool *reply_status)
 {
     int do_reply = 0;
 
@@ -1843,6 +1915,14 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         DPRINT("\n");
     }
 
+    if (reply_sent) {
+        *reply_sent = false;
+    }
+
+    if (reply_status) {
+        *reply_status = false;
+    }
+
     if (dev->iface->process_msg &&
         dev->iface->process_msg(dev, vmsg, &do_reply)) {
         return do_reply;
@@ -1912,6 +1992,10 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_add_mem_reg(dev, vmsg);
     case VHOST_USER_REM_MEM_REG:
         return vu_rem_mem_reg(dev, vmsg);
+    case VHOST_USER_START_SLAVE_CHANNEL:
+        return vu_slave_channel_start(dev, vmsg);
+    case VHOST_USER_STOP_SLAVE_CHANNEL:
+        return vu_slave_channel_stop(dev, vmsg, reply_sent, reply_status);
     default:
         vmsg_close_fds(vmsg);
         vu_panic(dev, "Unhandled request: %d", vmsg->request);
@@ -1926,6 +2010,7 @@ vu_dispatch(VuDev *dev)
     VhostUserMsg vmsg = { 0, };
     int reply_requested;
     bool need_reply, success = false;
+    bool reply_sent = false, reply_status = false;
 
     if (!dev->read_msg(dev, dev->sock, &vmsg)) {
         goto end;
@@ -1933,7 +2018,14 @@ vu_dispatch(VuDev *dev)
 
     need_reply = vmsg.flags & VHOST_USER_NEED_REPLY_MASK;
 
-    reply_requested = vu_process_message(dev, &vmsg);
+    reply_requested = vu_process_message(dev, &vmsg, &reply_sent,
+                                         &reply_status);
+    /* reply has already been sent, if needed */
+    if (reply_sent) {
+        success = reply_status;
+        goto end;
+    }
+
     if (!reply_requested && need_reply) {
         vmsg_set_reply_u64(&vmsg, 0);
         reply_requested = 1;
@@ -2051,6 +2143,7 @@ vu_init(VuDev *dev,
     dev->log_call_fd = -1;
     pthread_mutex_init(&dev->slave_mutex, NULL);
     dev->slave_fd = -1;
+    dev->slave_channel_open = false;
     dev->max_queues = max_queues;
 
     dev->vq = malloc(max_queues * sizeof(dev->vq[0]));
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index ee75d4931f..1d0ef54f69 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -64,6 +64,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP = 16,
 
     VHOST_USER_PROTOCOL_F_MAX
 };
@@ -109,6 +110,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_START_SLAVE_CHANNEL = 39,
+    VHOST_USER_STOP_SLAVE_CHANNEL = 40,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -123,6 +126,7 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_FS_UNMAP = 7,
     VHOST_USER_SLAVE_FS_SYNC = 8,
     VHOST_USER_SLAVE_FS_IO = 9,
+    VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE = 10,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -405,9 +409,11 @@ struct VuDev {
     VuVirtq *vq;
     VuDevInflightInfo inflight_info;
     int log_call_fd;
-    /* Must be held while using slave_fd */
+    /* Must be held while using slave_fd, slave_channel_open */
     pthread_mutex_t slave_mutex;
     int slave_fd;
+    /* If not set, do not send more requests on slave fd. */
+    bool slave_channel_open;
     uint64_t log_size;
     uint8_t *log_table;
     uint64_t features;
-- 
2.25.4


