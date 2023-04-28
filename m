Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E826F1469
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKeP-00043E-49; Fri, 28 Apr 2023 05:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeH-0003jH-Sh
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKeG-0007bD-DJ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbPjeDO6vsYu84ovSpLwdv+hX/+uCLtMSABu1oR4v8I=;
 b=B0fdjmTlE5vXnpPF6P5lC8fhcDnRzOTyF3wGtCPV/2fEgoSFLApHEtGXGXVgfApcFQOxzR
 Lde6JirffY7MMeqNmbIhIPKXamKsAuqZRQ/MlPf25eaA2EkK2FL4Ft5Zw0qv+RBZXarNcC
 VT7AYV6/fK/9zUJktwDRsJVfanBabSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-zf8oAUsvMqWmvVi44j93dA-1; Fri, 28 Apr 2023 05:44:10 -0400
X-MC-Unique: zf8oAUsvMqWmvVi44j93dA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7CE818E0921;
 Fri, 28 Apr 2023 09:44:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F38281410F1E;
 Fri, 28 Apr 2023 09:44:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 11/13] bcm2835_property: disable reentrancy detection for iomem
Date: Fri, 28 Apr 2023 11:43:44 +0200
Message-Id: <20230428094346.1292054-12-thuth@redhat.com>
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

As the code is designed for re-entrant calls from bcm2835_property to
bcm2835_mbox and back into bcm2835_property, mark iomem as
reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230427211013.2994127-7-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..de056ea2df 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -382,6 +382,13 @@ static void bcm2835_property_init(Object *obj)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
+
+    /*
+     * bcm2835_property_ops call into bcm2835_mbox, which in-turn reads from
+     * iomem. As such, mark iomem as re-entracy safe.
+     */
+    s->iomem.disable_reentrancy_guard = true;
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
 }
-- 
2.31.1


