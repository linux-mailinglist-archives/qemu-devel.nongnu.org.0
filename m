Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987DC1F7A52
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:07:09 +0200 (CEST)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlGu-0008P8-Kz
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2z-00009P-Bs
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33680
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2x-0001YZ-F9
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=afqjR/PPKF3RnnjVexEnd3gC/JLrRCP0cPSdSL7aizY=;
 b=Cbcv5eIanoOT8keYsRK5a4GxE+EZyiAMZ9XQL3MiesZ/uxSmCM7txRdCu9saAZGC6t7xdV
 +YP3+ifgFh+S/4o2io75gmf70N6Bv5K0ujRZRPYjvgjxxoupxy+gI+WT5q6kDbyzYwpWmI
 IT0YJujybS92Eu0+ywfe1BcblQkrbnw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-lTV86TTNPeSE4v6-Z_Rhzw-1; Fri, 12 Jun 2020 10:52:41 -0400
X-MC-Unique: lTV86TTNPeSE4v6-Z_Rhzw-1
Received: by mail-wr1-f69.google.com with SMTP id z10so4017971wrs.2
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=afqjR/PPKF3RnnjVexEnd3gC/JLrRCP0cPSdSL7aizY=;
 b=l7NCyvsd5uX/e5OgNINXjB40FuTuk/5TXX1L8AbQRQruTJG+x19CPOAtksyrxQLO5s
 H3xDoxirkiCOOhgIxJXPJWy9zoyukRU9fzvHeUCjoDBQHdCytzDD/q4vzy4KLgBdw+/e
 ijdXDzumYzMtP1R3kHQ7jSmCzCyxfkdUfKeyc0emHxrCBdnLY80e8GyENy+CptOA+5nE
 AXEei7UkBo0EGN6WOxhPdsevmo5U3CttfLVaAn9U+YiE5j8fXMCC0PWOsmEZ1E0D2tlD
 qYSIzmGLzCO4UR0Cs1vpF/epi1R/CL7PrHhx91W8cAz6IG7mslnJTjMYwoSuf6lcwI09
 /lzQ==
X-Gm-Message-State: AOAM533Ejepf6nGQRuTzkhp5LbB4uOpuV8+UkS6cmJl8XHW23LKDCy96
 P8C7QlkzJ2IeQt3ytDrDW7H23j9jT/KFcfQwqNqcNAxP0TptjMCIvmj7jxQguPGWeMpiV3nmaJF
 R3Yqzeve73von08I=
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr14535457wmj.95.1591973559571; 
 Fri, 12 Jun 2020 07:52:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZkqGBN4wgoKnbyCFQkJ4OdT6nvvU7M7/gk7smqNXXxfznN9vb6tsxK8UD2Is36tP+mCABGQ==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr14535421wmj.95.1591973559046; 
 Fri, 12 Jun 2020 07:52:39 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id a1sm9047842wmj.29.2020.06.12.07.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:38 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 43/58] Support adding individual regions in libvhost-user
Message-ID: <20200612141917.9446-44-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 09:30:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Johannes Berg <johannes.berg@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

When the VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS is enabled, qemu will
transmit memory regions to a backend individually using the new message
VHOST_USER_ADD_MEM_REG. With this change vhost-user backends built with
libvhost-user can now map in new memory regions when VHOST_USER_ADD_MEM_REG
messages are received.

Qemu only sends VHOST_USER_ADD_MEM_REG messages when the
VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS feature is negotiated, and
since it is not yet supported in libvhost-user, this new functionality
is not yet used.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <1588533678-23450-9-git-send-email-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.h |   7 ++
 contrib/libvhost-user/libvhost-user.c | 103 ++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index 88ef40d26a..60ef7fd13e 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -98,6 +98,7 @@ typedef enum VhostUserRequest {
     VHOST_USER_GPU_SET_SOCKET = 33,
     VHOST_USER_VRING_KICK = 35,
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
+    VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -124,6 +125,11 @@ typedef struct VhostUserMemory {
     VhostUserMemoryRegion regions[VHOST_MEMORY_MAX_NREGIONS];
 } VhostUserMemory;
 
+typedef struct VhostUserMemRegMsg {
+    uint32_t padding;
+    VhostUserMemoryRegion region;
+} VhostUserMemRegMsg;
+
 typedef struct VhostUserLog {
     uint64_t mmap_size;
     uint64_t mmap_offset;
@@ -176,6 +182,7 @@ typedef struct VhostUserMsg {
         struct vhost_vring_state state;
         struct vhost_vring_addr addr;
         VhostUserMemory memory;
+        VhostUserMemRegMsg memreg;
         VhostUserLog log;
         VhostUserConfig config;
         VhostUserVringArea area;
diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 9f039b707e..d8ee7a23a3 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -138,6 +138,7 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_GPU_SET_SOCKET),
         REQ(VHOST_USER_VRING_KICK),
         REQ(VHOST_USER_GET_MAX_MEM_SLOTS),
+        REQ(VHOST_USER_ADD_MEM_REG),
         REQ(VHOST_USER_MAX),
     };
 #undef REQ
@@ -662,6 +663,106 @@ generate_faults(VuDev *dev) {
     return true;
 }
 
+static bool
+vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
+    int i;
+    bool track_ramblocks = dev->postcopy_listening;
+    VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
+    VuDevRegion *dev_region = &dev->regions[dev->nregions];
+    void *mmap_addr;
+
+    /*
+     * If we are in postcopy mode and we receive a u64 payload with a 0 value
+     * we know all the postcopy client bases have been recieved, and we
+     * should start generating faults.
+     */
+    if (track_ramblocks &&
+        vmsg->size == sizeof(vmsg->payload.u64) &&
+        vmsg->payload.u64 == 0) {
+        (void)generate_faults(dev);
+        return false;
+    }
+
+    DPRINT("Adding region: %d\n", dev->nregions);
+    DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
+           msg_region->guest_phys_addr);
+    DPRINT("    memory_size:     0x%016"PRIx64"\n",
+           msg_region->memory_size);
+    DPRINT("    userspace_addr   0x%016"PRIx64"\n",
+           msg_region->userspace_addr);
+    DPRINT("    mmap_offset      0x%016"PRIx64"\n",
+           msg_region->mmap_offset);
+
+    dev_region->gpa = msg_region->guest_phys_addr;
+    dev_region->size = msg_region->memory_size;
+    dev_region->qva = msg_region->userspace_addr;
+    dev_region->mmap_offset = msg_region->mmap_offset;
+
+    /*
+     * We don't use offset argument of mmap() since the
+     * mapped address has to be page aligned, and we use huge
+     * pages.
+     */
+    if (track_ramblocks) {
+        /*
+         * In postcopy we're using PROT_NONE here to catch anyone
+         * accessing it before we userfault.
+         */
+        mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
+                         PROT_NONE, MAP_SHARED,
+                         vmsg->fds[0], 0);
+    } else {
+        mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
+                         PROT_READ | PROT_WRITE, MAP_SHARED, vmsg->fds[0],
+                         0);
+    }
+
+    if (mmap_addr == MAP_FAILED) {
+        vu_panic(dev, "region mmap error: %s", strerror(errno));
+    } else {
+        dev_region->mmap_addr = (uint64_t)(uintptr_t)mmap_addr;
+        DPRINT("    mmap_addr:       0x%016"PRIx64"\n",
+               dev_region->mmap_addr);
+    }
+
+    close(vmsg->fds[0]);
+
+    if (track_ramblocks) {
+        /*
+         * Return the address to QEMU so that it can translate the ufd
+         * fault addresses back.
+         */
+        msg_region->userspace_addr = (uintptr_t)(mmap_addr +
+                                                 dev_region->mmap_offset);
+
+        /* Send the message back to qemu with the addresses filled in. */
+        vmsg->fd_num = 0;
+        if (!vu_send_reply(dev, dev->sock, vmsg)) {
+            vu_panic(dev, "failed to respond to add-mem-region for postcopy");
+            return false;
+        }
+
+        DPRINT("Successfully added new region in postcopy\n");
+        dev->nregions++;
+        return false;
+
+    } else {
+        for (i = 0; i < dev->max_queues; i++) {
+            if (dev->vq[i].vring.desc) {
+                if (map_ring(dev, &dev->vq[i])) {
+                    vu_panic(dev, "remapping queue %d for new memory region",
+                             i);
+                }
+            }
+        }
+
+        DPRINT("Successfully added new region\n");
+        dev->nregions++;
+        vmsg_set_reply_u64(vmsg, 0);
+        return true;
+    }
+}
+
 static bool
 vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
 {
@@ -1668,6 +1769,8 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_handle_vring_kick(dev, vmsg);
     case VHOST_USER_GET_MAX_MEM_SLOTS:
         return vu_handle_get_max_memslots(dev, vmsg);
+    case VHOST_USER_ADD_MEM_REG:
+        return vu_add_mem_reg(dev, vmsg);
     default:
         vmsg_close_fds(vmsg);
         vu_panic(dev, "Unhandled request: %d", vmsg->request);
-- 
MST


