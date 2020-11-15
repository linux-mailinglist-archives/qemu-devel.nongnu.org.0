Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380DD2B39DF
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:29:26 +0100 (CET)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQWT-0001cy-9P
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUU-0008Qx-6m
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUQ-0001Xk-3u
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sut9Fzws5tusu6SI48So6UTIt/7CxEKNGpGPWzrkgbI=;
 b=eGskbal9uJi1wiAM4iDaDnPGRQ5PQlv3Ye4a5F7okWsOP3vug0ZQR9mcF6LHpFB0lo4Qus
 PtEjtA63+pLnXTSeMC8qgZW360TGCcDXseDu/0STXtvrtwC5JSWlIEoj8Xi8GLhmv1/R/0
 nR9wg8PNjZliJshGn73ysOvKtQVFOwY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-2Vgj7XAZMAiAbYun4g4r8w-1; Sun, 15 Nov 2020 17:27:14 -0500
X-MC-Unique: 2Vgj7XAZMAiAbYun4g4r8w-1
Received: by mail-wr1-f71.google.com with SMTP id w5so7727220wrm.22
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sut9Fzws5tusu6SI48So6UTIt/7CxEKNGpGPWzrkgbI=;
 b=HEja4vkY18UwT3HgYdR240dPecUpamG4QX/JJEtbyX8j7TmuWaIpVgfsflh+aSLATj
 9XJZKrmbPSkJvO7pVgRL33bivti6LgKfXj+UyW+B25O8BPk/JVR6/IjkM+5ootMs1GnT
 Cu2fD+saQiJUUTdvMZMW/Jd6VUlKSGkSiuGEGzsvJ7falBHzGCBRFw11QTCqr0YH4D2N
 F3V/sInEM3M4vfYKVHJLkhFstIX5TY5oorRNCTsHHIJEq8bbEdTQhuEGwrqvbU9THcd6
 oLiLVZBzauoYaRhNA9/D8ZXnFjIH0fclZOespREXM41O+IPRvF2hZTxjiW1f+/20+aWx
 1dZg==
X-Gm-Message-State: AOAM531+2gq6vatds9urslHsuMFW9XZRWwUZ07r0RdjdGtlqOnVX4hqV
 T15LKUnPi4R8pvLyqSSDakRw31FRbD6a0mqBC9oje1qXhKMlLWieR6SmTWJKY4W/dunVaBKekr7
 n5Mubxtl0Kwo7scK+aqgrCy/V5Uc2HTIN6ex/d41qnKLPOfCoFo6mUsWkemRv
X-Received: by 2002:adf:e607:: with SMTP id p7mr15578431wrm.93.1605479233267; 
 Sun, 15 Nov 2020 14:27:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7lFqC02l6oIJYz5BVUD12zuDh8Eu7bQGMBxFHvmK48jnVJK4If9GT/3iOOv2UfPG9cUdQmQ==
X-Received: by 2002:adf:e607:: with SMTP id p7mr15578413wrm.93.1605479233027; 
 Sun, 15 Nov 2020 14:27:13 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id c8sm19306759wrv.26.2020.11.15.14.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:12 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] vhost-user: fix VHOST_USER_ADD/REM_MEM_REG truncation
Message-ID: <20201115220740.488850-2-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

QEMU currently truncates the mmap_offset field when sending
VHOST_USER_ADD_MEM_REG and VHOST_USER_REM_MEM_REG messages. The struct
layout looks like this:

  typedef struct VhostUserMemoryRegion {
      uint64_t guest_phys_addr;
      uint64_t memory_size;
      uint64_t userspace_addr;
      uint64_t mmap_offset;
  } VhostUserMemoryRegion;

  typedef struct VhostUserMemRegMsg {
      uint32_t padding;
      /* WARNING: there is a 32-bit hole here! */
      VhostUserMemoryRegion region;
  } VhostUserMemRegMsg;

The payload size is calculated as follows when sending the message in
hw/virtio/vhost-user.c:

  msg->hdr.size = sizeof(msg->payload.mem_reg.padding) +
      sizeof(VhostUserMemoryRegion);

This calculation produces an incorrect result of only 36 bytes.
sizeof(VhostUserMemRegMsg) is actually 40 bytes.

The consequence of this is that the final field, mmap_offset, is
truncated. This breaks x86_64 TCG guests on s390 hosts. Other guest/host
combinations may get lucky if either of the following holds:
1. The guest memory layout does not need mmap_offset != 0.
2. The host is little-endian and mmap_offset <= 0xffffffff so the
   truncation has no effect.

Fix this by extending the existing 32-bit padding field to 64-bit. Now
the padding reflects the actual compiler padding. This can be verified
using pahole(1).

Also document the layout properly in the vhost-user specification.  The
vhost-user spec did not document the exact layout. It would be
impossible to implement the spec without looking at the QEMU source
code.

Existing vhost-user frontends and device backends continue to work after
this fix has been applied. The only change in the wire protocol is that
QEMU now sets hdr.size to 40 instead of 36. If a vhost-user
implementation has a hardcoded size check for 36 bytes, then it will
fail with new QEMUs. Both QEMU and DPDK/SPDK don't check the exact
payload size, so they continue to work.

Fixes: f1aeb14b0809e313c74244d838645ed25e85ea63 ("Transmit vhost-user memory regions individually")
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201109174355.1069147-1-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: f1aeb14b0809 ("Transmit vhost-user memory regions individually")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 contrib/libvhost-user/libvhost-user.h |  2 +-
 hw/virtio/vhost-user.c                |  5 ++---
 docs/interop/vhost-user.rst           | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index a1539dbb69..7d47f1364a 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -136,7 +136,7 @@ typedef struct VhostUserMemory {
 } VhostUserMemory;
 
 typedef struct VhostUserMemRegMsg {
-    uint32_t padding;
+    uint64_t padding;
     VhostUserMemoryRegion region;
 } VhostUserMemRegMsg;
 
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 9c5b4f7fbc..2fdd5daf74 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -149,7 +149,7 @@ typedef struct VhostUserMemory {
 } VhostUserMemory;
 
 typedef struct VhostUserMemRegMsg {
-    uint32_t padding;
+    uint64_t padding;
     VhostUserMemoryRegion region;
 } VhostUserMemRegMsg;
 
@@ -800,8 +800,7 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
     uint64_t shadow_pcb[VHOST_USER_MAX_RAM_SLOTS] = {};
     int nr_add_reg, nr_rem_reg;
 
-    msg->hdr.size = sizeof(msg->payload.mem_reg.padding) +
-        sizeof(VhostUserMemoryRegion);
+    msg->hdr.size = sizeof(msg->payload.mem_reg);
 
     /* Find the regions which need to be removed or added. */
     scrub_shadow_regions(dev, add_reg, &nr_add_reg, rem_reg, &nr_rem_reg,
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 988f154144..6d4025ba6a 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -131,6 +131,23 @@ A region is:
 
 :mmap offset: 64-bit offset where region starts in the mapped memory
 
+Single memory region description
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
++---------+---------------+------+--------------+-------------+
+| padding | guest address | size | user address | mmap offset |
++---------+---------------+------+--------------+-------------+
+
+:padding: 64-bit
+
+:guest address: a 64-bit guest address of the region
+
+:size: a 64-bit size
+
+:user address: a 64-bit user address
+
+:mmap offset: 64-bit offset where region starts in the mapped memory
+
 Log description
 ^^^^^^^^^^^^^^^
 
@@ -1281,7 +1298,7 @@ Master message types
 ``VHOST_USER_ADD_MEM_REG``
   :id: 37
   :equivalent ioctl: N/A
-  :slave payload: memory region
+  :slave payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1296,7 +1313,7 @@ Master message types
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
-  :slave payload: memory region
+  :slave payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
-- 
MST


