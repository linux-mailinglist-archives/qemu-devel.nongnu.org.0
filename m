Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11071D9657
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 14:31:59 +0200 (CEST)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb1Pb-0000Zo-32
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 08:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+16159052-3d09-qemu-devel=nongnu.org@sendgrid.net>)
 id 1jb1Jn-0000eL-Al
 for qemu-devel@nongnu.org; Tue, 19 May 2020 08:25:59 -0400
Received: from o1.dev.nutanix.com ([198.21.4.205]:6829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+16159052-3d09-qemu-devel=nongnu.org@sendgrid.net>)
 id 1jb1Jm-0003CL-1U
 for qemu-devel@nongnu.org; Tue, 19 May 2020 08:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=smtpapi; bh=y1EHDOQ5D2TU/nllYOH5y/Xh7lZzL/tO7x+t5Cla2Oo=;
 b=YQHwfpvmwfxUwImJ3UbNqdd15Gh/UxNfjrDdxhhaWd3uJIgQR0kaw5rCg/kSLGSup3QM
 iQn3cHB8wHjAUjTmcJB0FczfPSHhJ3aa0WT5ejG5RZdvX+gj9L9o/KVJmpXUiO8FNQcMUB
 QVfsvsTLmXCtoJDD+4IcJi+PtZHFw3gvE=
Received: by filterdrecv-p3iad2-8ddf98858-c27gg with SMTP id
 filterdrecv-p3iad2-8ddf98858-c27gg-18-5EC3D053-88
 2020-05-19 12:25:56.116234719 +0000 UTC m=+324675.679348021
Received: from localhost.localdomain.com (unknown)
 by ismtpd0002p1lon1.sendgrid.net (SG) with ESMTP
 id kubwUuABSI-_NdnbSTg37g Tue, 19 May 2020 12:25:55.845 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PATCH v3 10/10] Lift max ram slots limit in libvhost-user
Date: Tue, 19 May 2020 12:25:56 +0000 (UTC)
Message-Id: <1588473683-27067-11-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588473683-27067-1-git-send-email-raphael.norwitz@nutanix.com>
References: <1588473683-27067-1-git-send-email-raphael.norwitz@nutanix.com>
X-SG-EID: =?us-ascii?Q?YCLURHX+pjNDm1i7d69iKyMnQi=2FdvWah9veFa8nllaoUC0ScIWrCgiaWGu43Vg?=
 =?us-ascii?Q?xFdB4istXUBpN9H93OJgc8zTB=2FtRiFyPxoyC7xM?=
 =?us-ascii?Q?5ZNSQMuAO7r0c1GZ+Xemwz=2FLtIP3fFqCVg9+LMY?=
 =?us-ascii?Q?bLC0ecIDDiabrHd0mwUnYXsDGjWYfE8Bvf4fNbf?=
 =?us-ascii?Q?gnG4PSuGEbn503mdIhZdq7KCB5+QPNlrQZa3mbV?=
 =?us-ascii?Q?kHZRobDga5PllvrkaBqzHXWpdWMNx5H7xi9cJfL?=
 =?us-ascii?Q?pgYDGb4hRA1uX5FSYb0Sw=3D=3D?=
To: qemu-devel@nongnu.org, mst@redhat.com, marcandre.lureau@redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=198.21.4.205;
 envelope-from=bounces+16159052-3d09-qemu-devel=nongnu.org@sendgrid.net;
 helo=o1.dev.nutanix.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 08:25:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: raphael.s.norwitz@gmail.com, marcandre.lureau@gmail.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Historically, VMs with vhost-user devices could hot-add memory a maximum
of 8 times. Now that the VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS
protocol feature has been added, VMs with vhost-user backends which
support this new feature can support a configurable number of ram slots
up to the maximum supported by the target platform.

This change adds VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support for
backends built with libvhost-user, and increases the number of supported
ram slots from 8 to 32.

Memory hot-add, hot-remove and postcopy migration were tested with
the vhost-user-bridge sample.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 contrib/libvhost-user/libvhost-user.c | 17 +++++++++--------
 contrib/libvhost-user/libvhost-user.h | 15 +++++++++++----
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 635cfb1..eeb6899 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -269,7 +269,7 @@ have_userfault(void)
 static bool
 vu_message_read(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
 {
-    char control[CMSG_SPACE(VHOST_MEMORY_MAX_NREGIONS * sizeof(int))] = { };
+    char control[CMSG_SPACE(VHOST_MEMORY_BASELINE_NREGIONS * sizeof(int))] = {};
     struct iovec iov = {
         .iov_base = (char *)vmsg,
         .iov_len = VHOST_USER_HDR_SIZE,
@@ -340,7 +340,7 @@ vu_message_write(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
 {
     int rc;
     uint8_t *p = (uint8_t *)vmsg;
-    char control[CMSG_SPACE(VHOST_MEMORY_MAX_NREGIONS * sizeof(int))] = { };
+    char control[CMSG_SPACE(VHOST_MEMORY_BASELINE_NREGIONS * sizeof(int))] = {};
     struct iovec iov = {
         .iov_base = (char *)vmsg,
         .iov_len = VHOST_USER_HDR_SIZE,
@@ -353,7 +353,7 @@ vu_message_write(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
     struct cmsghdr *cmsg;
 
     memset(control, 0, sizeof(control));
-    assert(vmsg->fd_num <= VHOST_MEMORY_MAX_NREGIONS);
+    assert(vmsg->fd_num <= VHOST_MEMORY_BASELINE_NREGIONS);
     if (vmsg->fd_num > 0) {
         size_t fdsize = vmsg->fd_num * sizeof(int);
         msg.msg_controllen = CMSG_SPACE(fdsize);
@@ -780,7 +780,7 @@ static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     int i, j;
     bool found = false;
-    VuDevRegion shadow_regions[VHOST_MEMORY_MAX_NREGIONS] = {};
+    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
     VhostUserMemoryRegion *msg_region = &vmsg->payload.memreg.region;
 
     DPRINT("Removing region:\n");
@@ -813,7 +813,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
 
     if (found) {
         memcpy(dev->regions, shadow_regions,
-               sizeof(VuDevRegion) * VHOST_MEMORY_MAX_NREGIONS);
+               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
         DPRINT("Successfully removed a region\n");
         dev->nregions--;
         vmsg_set_reply_u64(vmsg, 0);
@@ -1394,7 +1394,8 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
                         1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ |
                         1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER |
                         1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD |
-                        1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK;
+                        1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK |
+                        1ULL << VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS;
 
     if (have_userfault()) {
         features |= 1ULL << VHOST_USER_PROTOCOL_F_PAGEFAULT;
@@ -1732,14 +1733,14 @@ static bool vu_handle_get_max_memslots(VuDev *dev, VhostUserMsg *vmsg)
 {
     vmsg->flags = VHOST_USER_REPLY_MASK | VHOST_USER_VERSION;
     vmsg->size  = sizeof(vmsg->payload.u64);
-    vmsg->payload.u64 = VHOST_MEMORY_MAX_NREGIONS;
+    vmsg->payload.u64 = VHOST_USER_MAX_RAM_SLOTS;
     vmsg->fd_num = 0;
 
     if (!vu_message_write(dev, dev->sock, vmsg)) {
         vu_panic(dev, "Failed to send max ram slots: %s\n", strerror(errno));
     }
 
-    DPRINT("u64: 0x%016"PRIx64"\n", (uint64_t) VHOST_MEMORY_MAX_NREGIONS);
+    DPRINT("u64: 0x%016"PRIx64"\n", (uint64_t) VHOST_USER_MAX_RAM_SLOTS);
 
     return false;
 }
diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index f843971..844c37c 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -28,7 +28,13 @@
 
 #define VIRTQUEUE_MAX_SIZE 1024
 
-#define VHOST_MEMORY_MAX_NREGIONS 8
+#define VHOST_MEMORY_BASELINE_NREGIONS 8
+
+/*
+ * Set a reasonable maximum number of ram slots, which will be supported by
+ * any architecture.
+ */
+#define VHOST_USER_MAX_RAM_SLOTS 32
 
 typedef enum VhostSetConfigType {
     VHOST_SET_CONFIG_TYPE_MASTER = 0,
@@ -55,6 +61,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
 
     VHOST_USER_PROTOCOL_F_MAX
 };
@@ -123,7 +130,7 @@ typedef struct VhostUserMemoryRegion {
 typedef struct VhostUserMemory {
     uint32_t nregions;
     uint32_t padding;
-    VhostUserMemoryRegion regions[VHOST_MEMORY_MAX_NREGIONS];
+    VhostUserMemoryRegion regions[VHOST_MEMORY_BASELINE_NREGIONS];
 } VhostUserMemory;
 
 typedef struct VhostUserMemRegMsg {
@@ -190,7 +197,7 @@ typedef struct VhostUserMsg {
         VhostUserInflight inflight;
     } payload;
 
-    int fds[VHOST_MEMORY_MAX_NREGIONS];
+    int fds[VHOST_MEMORY_BASELINE_NREGIONS];
     int fd_num;
     uint8_t *data;
 } VU_PACKED VhostUserMsg;
@@ -368,7 +375,7 @@ typedef struct VuDevInflightInfo {
 struct VuDev {
     int sock;
     uint32_t nregions;
-    VuDevRegion regions[VHOST_MEMORY_MAX_NREGIONS];
+    VuDevRegion regions[VHOST_USER_MAX_RAM_SLOTS];
     VuVirtq *vq;
     VuDevInflightInfo inflight_info;
     int log_call_fd;
-- 
1.8.3.1


