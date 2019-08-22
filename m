Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF799EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 20:40:13 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0s0K-0003RS-Uc
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 14:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0rux-0006u9-71
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 14:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0ruv-0006Cn-VP
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 14:34:39 -0400
Received: from [192.146.154.1] (port=20719 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0ruv-0006Ap-Mw
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 14:34:37 -0400
Received: from raphael-norwitz.dev.nutanix.com (unknown [10.41.25.241])
 by mcp01.nutanix.com (Postfix) with ESMTP id 93A2F100E956;
 Thu, 22 Aug 2019 18:34:36 +0000 (UTC)
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 11:34:25 -0700
Message-Id: <1566498865-55506-2-git-send-email-raphael.norwitz@nutanix.com>
X-Mailer: git-send-email 1.9.4
In-Reply-To: <1566498865-55506-1-git-send-email-raphael.norwitz@nutanix.com>
References: <1566498865-55506-1-git-send-email-raphael.norwitz@nutanix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
Subject: [Qemu-devel] [PATCH 2/2] backends/vhost-user.c: prevent using
 uninitialized vqs
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar rational to: e6cc11d64fc998c11a4dfcde8fda3fc33a74d844

For vhost scsi and vhost-user-scsi an issue was observed
where, of the 3 virtqueues, seabios would only set cmd,
leaving ctrl and event without a physical address.
This can caused vhost_verify_ring_part_mapping to return
ENOMEM, causing the following logs:

qemu-system-x86_64: Unable to map available ring for ring 0
qemu-system-x86_64: Verify ring failure on region 0

The issue has already been fixed elsewhere, but it was noted
that in backends/vhost-user.c, the vhost_user_backend_dev_init()
function, which other vdevs use in their realize() to initialize
their vqs, was not being properly zeroing out the queues. This
commit ensures hardware modules using the
vhost_user_backend_dev_init() API properly zero out their vqs on
initialization.

Suggested-by: Philippe Mathieu-Daude <philmd@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 backends/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 0a13506..2bf3406 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -46,7 +46,7 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
 
     b->vdev = vdev;
     b->dev.nvqs = nvqs;
-    b->dev.vqs = g_new(struct vhost_virtqueue, nvqs);
+    b->dev.vqs = g_new0(struct vhost_virtqueue, nvqs);
 
     ret = vhost_dev_init(&b->dev, &b->vhost_user, VHOST_BACKEND_TYPE_USER, 0);
     if (ret < 0) {
-- 
1.9.4


