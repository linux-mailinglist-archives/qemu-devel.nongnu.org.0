Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE416F1476
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:46:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKeN-0003vT-MH; Fri, 28 Apr 2023 05:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeG-0003h8-3X
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeE-0007b0-Nz
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1QbZqFwlfjUvJkqidyl0uI2ij2XfXvL/SUhnRwssbI=;
 b=EtkNhCK3yehZF0qfxw7UtYCcRMaut0gTzL/z9v//K9qrOCsfLb1e3lvSIfisoeMaj80tl8
 2ayB/ZYtOt4XSxeqOSMllPzzr68boPPMGHnmx3AXg2/tk/Vv7H5vfe4hVBvTA3qKJOiwXB
 fCsa1j5SsMenyooHH7L3gIRh4pNCW6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-okYBEW-lOiGuZmTMAuD4Lg-1; Fri, 28 Apr 2023 05:44:11 -0400
X-MC-Unique: okYBEW-lOiGuZmTMAuD4Lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 601B485A5B1;
 Fri, 28 Apr 2023 09:44:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B9D1410F1C;
 Fri, 28 Apr 2023 09:44:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 12/13] raven: disable reentrancy detection for iomem
Date: Fri, 28 Apr 2023 11:43:45 +0200
Message-Id: <20230428094346.1292054-13-thuth@redhat.com>
In-Reply-To: <20230428094346.1292054-1-thuth@redhat.com>
References: <20230428094346.1292054-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alexander Bulekov <alxndr@bu.edu>

As the code is designed for re-entrant calls from raven_io_ops to
pci-conf, mark raven_io_ops as reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20230427211013.2994127-8-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-host/raven.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 072ffe3c5e..9a11ac4b2b 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -294,6 +294,13 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
+    /*
+     * Raven's raven_io_ops use the address-space API to access pci-conf-idx
+     * (which is also owned by the raven device). As such, mark the
+     * pci_io_non_contiguous as re-entrancy safe.
+     */
+    s->pci_io_non_contiguous.disable_reentrancy_guard = true;
+
     /* CPU address space */
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
                                 &s->pci_io);
-- 
2.31.1


