Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253D6F146F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:46:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKeO-0003yo-3x; Fri, 28 Apr 2023 05:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeI-0003is-8A
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeF-0007b5-MQ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX47Kf3s97RcELPUzLROVGmeEF0jq/IGw6qkUYrWSGs=;
 b=IMz+ciPjnoJB3+q9gfW7pRNw9HF99LeblmH7TZ3TQU/uGwoKAx1SV18ouPLDZ5tTe5gYii
 M66jRTBFkvYgsdyn48BKcLYxl5SdJh9JFr2W9uWtX/2SKg/YoKlSchgLFHZiHARWZXmfvj
 ++cSxDggc2r0CL6hzfjADWbfF4WWuuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-Osdc_kZyPjirIb5lxcZbWA-1; Fri, 28 Apr 2023 05:44:09 -0400
X-MC-Unique: Osdc_kZyPjirIb5lxcZbWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AD56885620;
 Fri, 28 Apr 2023 09:44:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C52D61410F1E;
 Fri, 28 Apr 2023 09:44:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>, Fiona Ebner <f.ebner@proxmox.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PULL 10/13] lsi53c895a: disable reentrancy detection for script RAM
Date: Fri, 28 Apr 2023 11:43:43 +0200
Message-Id: <20230428094346.1292054-11-thuth@redhat.com>
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

As the code is designed to use the memory APIs to access the script ram,
disable reentrancy checks for the pseudo-RAM ram_io MemoryRegion.

In the future, ram_io may be converted from an IO to a proper RAM MemoryRegion.

Reported-by: Fiona Ebner <f.ebner@proxmox.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20230427211013.2994127-6-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/scsi/lsi53c895a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index af93557a9a..db27872963 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2302,6 +2302,12 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&s->io_io, OBJECT(s), &lsi_io_ops, s,
                           "lsi-io", 256);
 
+    /*
+     * Since we use the address-space API to interact with ram_io, disable the
+     * re-entrancy guard.
+     */
+    s->ram_io.disable_reentrancy_guard = true;
+
     address_space_init(&s->pci_io_as, pci_address_space_io(dev), "lsi-pci-io");
     qdev_init_gpio_out(d, &s->ext_irq, 1);
 
-- 
2.31.1


