Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36808680B35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRgB-00081l-Cw; Mon, 30 Jan 2023 05:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pMRfr-0007Ud-58
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pMRfp-0001zD-GF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjKj0y7uXqGjS+52+f7Qk7Ez5ymAv2OB9BrFeKHd9lo=;
 b=HkLbxIY6xcxTIp4hA3UO5ofGkfJ7sjCAu/wQgEXmeIxSnEFJC4chpzyINJQLaR/tZtVYjt
 tTbz/Lfft+zken7thmFTMep6UHRK/6Ii+rksrTkBcXuLKppYtb61XkUzNhvUKq3/AkCzsg
 q+buFMr5cUOeGwfTjrrtJwkdcCXw1Lg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-9tVMRzEBOkKbbwS9rpihKA-1; Mon, 30 Jan 2023 05:45:58 -0500
X-MC-Unique: 9tVMRzEBOkKbbwS9rpihKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A551E29ABA03;
 Mon, 30 Jan 2023 10:45:57 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0040E40C2064;
 Mon, 30 Jan 2023 10:45:55 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 stephen@networkplumber.org, chenbo.xia@intel.com, thomas@monjalon.net,
 dmarchan@redhat.com
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PATCH 2/3] libvhost-user: Adopt new backend naming
Date: Mon, 30 Jan 2023 11:45:47 +0100
Message-Id: <20230130104548.13262-3-maxime.coquelin@redhat.com>
In-Reply-To: <20230130104548.13262-1-maxime.coquelin@redhat.com>
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

In order to get rid of harmful language, the Vhost-user
specification changed features and requests naming from
_SLAVE_ to _BACKEND_.

This patch adopts the new naming convention.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 20 ++++++++++----------
 subprojects/libvhost-user/libvhost-user.h | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fc69783d2b..f661af7c85 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -140,7 +140,7 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_SET_VRING_ENABLE),
         REQ(VHOST_USER_SEND_RARP),
         REQ(VHOST_USER_NET_SET_MTU),
-        REQ(VHOST_USER_SET_SLAVE_REQ_FD),
+        REQ(VHOST_USER_SET_BACKEND_REQ_FD),
         REQ(VHOST_USER_IOTLB_MSG),
         REQ(VHOST_USER_SET_VRING_ENDIAN),
         REQ(VHOST_USER_GET_CONFIG),
@@ -1365,7 +1365,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
     int qidx = vq - dev->vq;
     int fd_num = 0;
     VhostUserMsg vmsg = {
-        .request = VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
+        .request = VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG,
         .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
         .size = sizeof(vmsg.payload.area),
         .payload.area = {
@@ -1383,7 +1383,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
 
     vmsg.fd_num = fd_num;
 
-    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD)) {
         return false;
     }
 
@@ -1461,9 +1461,9 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
      */
     uint64_t features = 1ULL << VHOST_USER_PROTOCOL_F_MQ |
                         1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD |
-                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ |
+                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_REQ |
                         1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER |
-                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD |
+                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD |
                         1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK |
                         1ULL << VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS;
 
@@ -1494,7 +1494,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
 
     if (vu_has_protocol_feature(dev,
                                 VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
-        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ) ||
+        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ) ||
          !vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
         /*
          * The use case for using messages for kick/call is simulation, to make
@@ -1507,7 +1507,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
          * that actually enables the simulation case.
          */
         vu_panic(dev,
-                 "F_IN_BAND_NOTIFICATIONS requires F_SLAVE_REQ && F_REPLY_ACK");
+                 "F_IN_BAND_NOTIFICATIONS requires F_BACKEND_REQ && F_REPLY_ACK");
         return false;
     }
 
@@ -1910,7 +1910,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_get_queue_num_exec(dev, vmsg);
     case VHOST_USER_SET_VRING_ENABLE:
         return vu_set_vring_enable_exec(dev, vmsg);
-    case VHOST_USER_SET_SLAVE_REQ_FD:
+    case VHOST_USER_SET_BACKEND_REQ_FD:
         return vu_set_slave_req_fd(dev, vmsg);
     case VHOST_USER_GET_CONFIG:
         return vu_get_config(dev, vmsg);
@@ -2416,9 +2416,9 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
     if (vq->call_fd < 0 &&
         vu_has_protocol_feature(dev,
                                 VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
-        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
+        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
         VhostUserMsg vmsg = {
-            .request = VHOST_USER_SLAVE_VRING_CALL,
+            .request = VHOST_USER_BACKEND_VRING_CALL,
             .flags = VHOST_USER_VERSION,
             .size = sizeof(vmsg.payload.state),
             .payload.state = {
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 8cda9b8f57..8c5a2719e3 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -54,12 +54,12 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_RARP = 2,
     VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
     VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
     VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
     VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
     VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
     VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
@@ -92,7 +92,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_VRING_ENABLE = 18,
     VHOST_USER_SEND_RARP = 19,
     VHOST_USER_NET_SET_MTU = 20,
-    VHOST_USER_SET_SLAVE_REQ_FD = 21,
+    VHOST_USER_SET_BACKEND_REQ_FD = 21,
     VHOST_USER_IOTLB_MSG = 22,
     VHOST_USER_SET_VRING_ENDIAN = 23,
     VHOST_USER_GET_CONFIG = 24,
@@ -113,13 +113,13 @@ typedef enum VhostUserRequest {
 } VhostUserRequest;
 
 typedef enum VhostUserSlaveRequest {
-    VHOST_USER_SLAVE_NONE = 0,
-    VHOST_USER_SLAVE_IOTLB_MSG = 1,
-    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
-    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
-    VHOST_USER_SLAVE_VRING_CALL = 4,
-    VHOST_USER_SLAVE_VRING_ERR = 5,
-    VHOST_USER_SLAVE_MAX
+    VHOST_USER_BACKEND_NONE = 0,
+    VHOST_USER_BACKEND_IOTLB_MSG = 1,
+    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
+    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
+    VHOST_USER_BACKEND_VRING_CALL = 4,
+    VHOST_USER_BACKEND_VRING_ERR = 5,
+    VHOST_USER_BACKEND_MAX
 }  VhostUserSlaveRequest;
 
 typedef struct VhostUserMemoryRegion {
-- 
2.39.1


