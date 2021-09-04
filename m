Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB32400D1B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:38:06 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdMT-0006Ue-F8
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKc-0003ZR-9n
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKa-0000lV-AZ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3NXmvXOOKi/tunk/Hq6HEtfFMZdnhsYQiE7ckdleGA4=;
 b=Blv2ldGq0k0D0mkl4iV4fhYlBC9ec42q+ZGIBiHzSsV7JhwF4AVih3jplU3tE+pMjkr5l5
 83ygGFaPDSwr6QHicwZqRuYsUBZyiSD9ihmeifE9e4jfPYRGqeImF/kizufDRmblOqt4RJ
 tv6HSJFggNUxfkGPKh02NBjwrSJQ3C8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-dRW1tzFtOfuqENl7PfvUYg-1; Sat, 04 Sep 2021 17:36:06 -0400
X-MC-Unique: dRW1tzFtOfuqENl7PfvUYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 j13-20020aa7ca4d000000b003c44c679d73so1500813edt.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3NXmvXOOKi/tunk/Hq6HEtfFMZdnhsYQiE7ckdleGA4=;
 b=c0sVlzke8qsJ5QzLMeVu6qhQFooYKhy6QjK+s5Dn8M34r7KkW+Sd4OaueJRO9EsDsZ
 YUAQBmqeybpLFMFSZREZbwvjEdwYKQzthJzBeqJM1R6I8WPW1J37t5EpV124nwYQwEmr
 jpq9RCQwlTRIb1l2+s/9FB678ROSU1vz2oNNVMUP5jNij8QAXW7XMQSdroPUotYU/8wL
 pmeu+33aToBHsJWCrRYlGSjCrGJFtXgNa1JUXOZJFmwbvnHRqJm7GoxQtZlLD5jjFVEH
 PCd9C85OKlwCAr4BIQLAtHiFBWt52IU30WrlRaf7NR/goSVVe7evfSE5J59vavKAAy9r
 wvEQ==
X-Gm-Message-State: AOAM530f7yz6V7q9U9/J+lseb52EIP2AOFALExy6oJKk4vL1GjAZZp8i
 01zIZSZOofEmdsojfcpMwzgoham9YXG3xjUNButXlbWJnxjGem5g9FqFkoiaYS8vSmLKVw52DGi
 yIvXR0ZtMwiUvbcWUXUs9L0yC2caJfvy6dJIJIeLP+HH+jPUgjCXaxQsoDldB
X-Received: by 2002:a17:906:d8ce:: with SMTP id
 re14mr5722685ejb.364.1630791364839; 
 Sat, 04 Sep 2021 14:36:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWeVAzqfo3+eFTi3ei5TCBtFrbVe7pAtKW5lxy9IhPnoTJRWfEuZPA9loiumVURc1r15KOMw==
X-Received: by 2002:a17:906:d8ce:: with SMTP id
 re14mr5722671ejb.364.1630791364614; 
 Sat, 04 Sep 2021 14:36:04 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id r22sm1537264ejj.91.2021.09.04.14.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:04 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Message-ID: <20210904213506.486886-4-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <den-plotnikov@yandex-team.ru>

On vhost-user-blk migration, qemu normally sends a number of commands
to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
data logging.
The issue is that qemu doesn't wait for reply from the vhost daemon
for these commands which may result in races between qemu expectation
of logging starting and actual login starting in vhost daemon.

The race can appear as follows: on migration setup, qemu enables dirty page
logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
vhost-user-blk daemon immediately and the daemon needs some time to turn the
logging on internally. If qemu doesn't wait for reply, after sending the
command, qemu may start migrateing memory pages to a destination. At this time,
the logging may not be actually turned on in the daemon but some guest pages,
which the daemon is about to write to, may have already been transferred
without logging to the destination. Since the logging wasn't turned on,
those pages won't be transferred again as dirty. So we may end up with
corrupted data on the destination.
The same scenario is applicable for "used ring" data logging, which is
turned on with VHOST_USER_SET_VRING_ADDR command.

To resolve this issue, this patch makes qemu wait for the command result
explicitly if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and logging enabled.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>

Message-Id: <20210809104824.78830-1-den-plotnikov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 145 ++++++++++++++++++++++++++++-------------
 1 file changed, 101 insertions(+), 44 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 33002300c2..a4eb6cde7e 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1095,23 +1095,6 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
-static int vhost_user_set_vring_addr(struct vhost_dev *dev,
-                                     struct vhost_vring_addr *addr)
-{
-    VhostUserMsg msg = {
-        .hdr.request = VHOST_USER_SET_VRING_ADDR,
-        .hdr.flags = VHOST_USER_VERSION,
-        .payload.addr = *addr,
-        .hdr.size = sizeof(msg.payload.addr),
-    };
-
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
-}
-
 static int vhost_user_set_vring_endian(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
@@ -1288,33 +1271,6 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
-static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
-{
-    VhostUserMsg msg = {
-        .hdr.request = request,
-        .hdr.flags = VHOST_USER_VERSION,
-        .payload.u64 = u64,
-        .hdr.size = sizeof(msg.payload.u64),
-    };
-
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
-}
-
-static int vhost_user_set_features(struct vhost_dev *dev,
-                                   uint64_t features)
-{
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
-}
-
-static int vhost_user_set_protocol_features(struct vhost_dev *dev,
-                                            uint64_t features)
-{
-    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
-}
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 {
@@ -1360,6 +1316,107 @@ static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
     return 0;
 }
 
+static int enforce_reply(struct vhost_dev *dev,
+                         const VhostUserMsg *msg)
+{
+    uint64_t dummy;
+
+    if (msg->hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, msg);
+    }
+
+   /*
+    * We need to wait for a reply but the backend does not
+    * support replies for the command we just sent.
+    * Send VHOST_USER_GET_FEATURES which makes all backends
+    * send a reply.
+    */
+    return vhost_user_get_features(dev, &dummy);
+}
+
+static int vhost_user_set_vring_addr(struct vhost_dev *dev,
+                                     struct vhost_vring_addr *addr)
+{
+    VhostUserMsg msg = {
+        .hdr.request = VHOST_USER_SET_VRING_ADDR,
+        .hdr.flags = VHOST_USER_VERSION,
+        .payload.addr = *addr,
+        .hdr.size = sizeof(msg.payload.addr),
+    };
+
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+
+    /*
+     * wait for a reply if logging is enabled to make sure
+     * backend is actually logging changes
+     */
+    bool wait_for_reply = addr->flags & (1 << VHOST_VRING_F_LOG);
+
+    if (reply_supported && wait_for_reply) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
+    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+        return -1;
+    }
+
+    if (wait_for_reply) {
+        return enforce_reply(dev, &msg);
+    }
+
+    return 0;
+}
+
+static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
+                              bool wait_for_reply)
+{
+    VhostUserMsg msg = {
+        .hdr.request = request,
+        .hdr.flags = VHOST_USER_VERSION,
+        .payload.u64 = u64,
+        .hdr.size = sizeof(msg.payload.u64),
+    };
+
+    if (wait_for_reply) {
+        bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
+        if (reply_supported) {
+            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+        }
+    }
+
+    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+        return -1;
+    }
+
+    if (wait_for_reply) {
+        return enforce_reply(dev, &msg);
+    }
+
+    return 0;
+}
+
+static int vhost_user_set_features(struct vhost_dev *dev,
+                                   uint64_t features)
+{
+    /*
+     * wait for a reply if logging is enabled to make sure
+     * backend is actually logging changes
+     */
+    bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
+
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+                              log_enabled);
+}
+
+static int vhost_user_set_protocol_features(struct vhost_dev *dev,
+                                            uint64_t features)
+{
+    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
+                              false);
+}
+
 static int vhost_user_set_owner(struct vhost_dev *dev)
 {
     VhostUserMsg msg = {
-- 
MST


