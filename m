Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840CE6B0FC6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxE0-0003sb-D3; Wed, 08 Mar 2023 12:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDY-00032c-Ns; Wed, 08 Mar 2023 12:04:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDU-0005XR-Fc; Wed, 08 Mar 2023 12:04:44 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 62570400B6;
 Wed,  8 Mar 2023 19:58:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 121C91FE;
 Wed,  8 Mar 2023 19:58:16 +0300 (MSK)
Received: (nullmailer pid 2098258 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Chenyi Qiang <chenyi.qiang@intel.com>,
 David Hildenbrand <david@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 03/47] virtio-mem: Fix the bitmap index of the section offset
Date: Wed,  8 Mar 2023 19:57:06 +0300
Message-Id: <20230308165815.2098148-3-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Chenyi Qiang <chenyi.qiang@intel.com>

vmem->bitmap indexes the memory region of the virtio-mem backend at a
granularity of block_size. To calculate the index of target section offset,
the block_size should be divided instead of the bitmap_size.

Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20221216062231.11181-1-chenyi.qiang@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
(cherry picked from commit b11cf32e07a2f7ff0d171b89497381a04c9d07e0)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio-mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index ed170def48..e19ee817fe 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -235,7 +235,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
     uint64_t offset, size;
     int ret = 0;
 
-    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = s->offset_within_region / vmem->block_size;
     first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
     while (first_bit < vmem->bitmap_size) {
         MemoryRegionSection tmp = *s;
@@ -267,7 +267,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
     uint64_t offset, size;
     int ret = 0;
 
-    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = s->offset_within_region / vmem->block_size;
     first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
     while (first_bit < vmem->bitmap_size) {
         MemoryRegionSection tmp = *s;
-- 
2.30.2


