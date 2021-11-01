Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9662744227B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:17:21 +0100 (CET)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhegC-0000qb-5W
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdV2-0005YV-ID
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdV0-0002jY-Cg
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635796901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qI5CvlH8YPl1p5CI+i2q45DarTLXC1xrwlVlQvJ0MoA=;
 b=RMKhB+qNhwocJCylWqU1zVEQdotBj1c8LUkej4+Okw4VXL5JEUZsz5hgD2Tb6SJoe4c+fa
 zGfj5u2Blzry6PlWby9L5KDsZRiJ+DxFevqkRrWjbt+yqh4wphxqhr181dzYIbJslujbOc
 CSRmMPt11vPsg9kP5Is7rUcmon1eTLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-I5qe4z_EO7u9SXDkactuqQ-1; Mon, 01 Nov 2021 16:01:37 -0400
X-MC-Unique: I5qe4z_EO7u9SXDkactuqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12F558066EB;
 Mon,  1 Nov 2021 20:01:37 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-113-78.phx2.redhat.com [10.3.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A18A119C79;
 Mon,  1 Nov 2021 20:01:32 +0000 (UTC)
Subject: [PULL 2/2] vfio/common: Add a trace point when a MMIO RAM section
 cannot be mapped
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 01 Nov 2021 14:01:32 -0600
Message-ID: <163579689244.3486201.18245166328398379088.stgit@omen>
In-Reply-To: <163579674962.3486201.2525541279968158386.stgit@omen>
References: <163579674962.3486201.2525541279968158386.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.williamson@redhat.com, Kunkun Jiang <jiangkunkun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kunkun Jiang <jiangkunkun@huawei.com>

The MSI-X structures of some devices and other non-MSI-X structures
may be in the same BAR. They may share one host page, especially in
the case of large page granularity, such as 64K.

For example, MSIX-Table size of 82599 NIC is 0x30 and the offset in
Bar 3(size 64KB) is 0x0. vfio_listener_region_add() will be called
to map the remaining range (0x30-0xffff). If host page size is 64KB,
it will return early at 'int128_ge((int128_make64(iova), llend))'
without any message. Let's add a trace point to inform users like commit
5c08600547c0 ("vfio: Use a trace point when a RAM section cannot be DMA mapped")
did.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Link: https://lore.kernel.org/r/20211027090406.761-3-jiangkunkun@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a784b219e6d4..dd387b0d3959 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -893,6 +893,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
     llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
+        if (memory_region_is_ram_device(section->mr)) {
+            trace_vfio_listener_region_add_no_dma_map(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                int128_getlo(section->size),
+                qemu_real_host_page_size);
+        }
         return;
     }
     end = int128_get64(int128_sub(llend, int128_one()));



