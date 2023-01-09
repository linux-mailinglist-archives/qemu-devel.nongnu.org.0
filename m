Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BE66238B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:59:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEprD-0007MX-Oh; Mon, 09 Jan 2023 05:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEprB-0007M8-4Y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEpr9-0007Fq-IC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673261898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZDdjmrpuEhfTRzWrefHovYGzSLMjiuSeX2Pg2X83V1M=;
 b=MdN0q3Ibof63aQaZMddECJkVfIhqCScEbSQ4KeesXCq0hdOtvRe8PbJ4MmwzmuAA/abwT9
 14qgtEduwdOITM8cKb/QjS3GtOcnqHaUWXnsoayub2K/K6VWFizKYkdZrmbSy2JK64HiO3
 vCnZoBpt9iv90A4oJvFehySspCwn/VM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-FmcqKOOhOgCjJtjF-yDgrw-1; Mon, 09 Jan 2023 05:58:16 -0500
X-MC-Unique: FmcqKOOhOgCjJtjF-yDgrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85CA23C0F661;
 Mon,  9 Jan 2023 10:58:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82CAF1121318;
 Mon,  9 Jan 2023 10:58:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, eduardo@habkost.net,
 stefanha@redhat.com, david.daney@fungible.com
Subject: [PATCH] virtio-rng-pci: fix migration compat for vectors
Date: Mon,  9 Jan 2023 10:58:09 +0000
Message-Id: <20230109105809.163975-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Fixup the migration compatibility for existing machine types
so that they do not enable msi-x.

Symptom:

(qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
qemu: Failed to load PCIDevice:config
qemu: Failed to load virtio-rng:virtio
qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
qemu: load of migration failed: Invalid argument

Note: This fix will break migration from 7.2->7.2-fixed with this patch

bz: https://bugzilla.redhat.com/show_bug.cgi?id=2155749
Fixes: 9ea02e8f1 ("virtio-rng-pci: Allow setting nvectors, so we can use MSI-X")

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f589b92909..45459d1cef 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
+    { "virtio-rng-pci", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
-- 
2.39.0


