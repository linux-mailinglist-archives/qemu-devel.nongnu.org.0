Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FF14AFC3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 07:25:33 +0100 (CET)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwKJX-0002CF-Se
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 01:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIP-0000kf-Lj
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIO-0003d7-IX
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:21 -0500
Received: from [192.146.154.1] (port=59387 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1iwKIO-0003ct-Db
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 01:24:20 -0500
Received: from localhost.localdomain.com (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 24E361007D19;
 Tue, 28 Jan 2020 06:24:20 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH v2 1/3] Fixed assert in vhost_user_set_mem_table_postcopy
Date: Wed, 15 Jan 2020 21:57:04 -0500
Message-Id: <1579143426-18305-2-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
References: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
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
Cc: Peter Turschmid <peter.turschm@nutanix.com>, raphael.s.norwitz@gmail.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current vhost_user_set_mem_table_postcopy() implementation
populates each region of the VHOST_USER_SET_MEM_TABLE message without
first checking if there are more than VHOST_MEMORY_MAX_NREGIONS already
populated. This can cause memory corruption if too many regions are
added to the message during the postcopy step.

This change moves an existing assert up such that attempting to
construct a VHOST_USER_SET_MEM_TABLE message with too many memory
regions will gracefully bring down qemu instead of corrupting memory.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2e81f55..cce851a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -443,6 +443,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
                                      &offset);
         fd = memory_region_get_fd(mr);
         if (fd > 0) {
+            assert(fd_num < VHOST_MEMORY_MAX_NREGIONS);
             trace_vhost_user_set_mem_table_withfd(fd_num, mr->name,
                                                   reg->memory_size,
                                                   reg->guest_phys_addr,
@@ -455,7 +456,6 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
             msg.payload.memory.regions[fd_num].guest_phys_addr =
                 reg->guest_phys_addr;
             msg.payload.memory.regions[fd_num].mmap_offset = offset;
-            assert(fd_num < VHOST_MEMORY_MAX_NREGIONS);
             fds[fd_num++] = fd;
         } else {
             u->region_rb_offset[i] = 0;
-- 
1.8.3.1


