Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39E65B133
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJ0a-000768-Sm; Mon, 02 Jan 2023 06:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0X-00075W-Bj
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pCJ0U-0007zM-JO
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672658969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rg2tCcT43+3vmkteMsseQruJpL8Y15BaZz8dD3ypJ3M=;
 b=MaDMfnE0QK76eJAD7CWv99+xfQB8gGc1XF5S8O5P52gALpW1dhqVNUbnLDknjFhJ5pBrhL
 5WaMtzAN2tayr/gtF+OfF6a8fm5+PyV4mGlgAhXtTk6mRG8Phm/tK5Q4mtPzcnkmG/XZFw
 bhEKCR1LdxQPRO3nDG/TXabuuAtXWH4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-EOWNG0W2PGet9Xz5DFWUbg-1; Mon, 02 Jan 2023 06:29:28 -0500
X-MC-Unique: EOWNG0W2PGet9Xz5DFWUbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30A5380670D;
 Mon,  2 Jan 2023 11:29:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6188C40C2064;
 Mon,  2 Jan 2023 11:29:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [GIT PULL 1/4] virtio-mem: Fix the bitmap index of the section offset
Date: Mon,  2 Jan 2023 12:29:18 +0100
Message-Id: <20230102112921.68077-2-david@redhat.com>
In-Reply-To: <20230102112921.68077-1-david@redhat.com>
References: <20230102112921.68077-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 hw/virtio/virtio-mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d96bde1fab..5c22c4b876 100644
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
2.39.0


