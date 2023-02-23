Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528416A0304
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5a5-0007S0-Ip; Thu, 23 Feb 2023 01:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5a2-0007QK-S5
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5Zx-0007yS-SW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xesQp6pZHlpNDrX2aVp+NhWkGjKbdxyW9FP/g1FhVtE=;
 b=O8i7ZeWyKiBvvW5ehLLTyga2mrCBN3xthHcLeIIY9IkdkKxYNUJMLA1bStQm4s5yyVsX0F
 BvuvX0/pNbsizx12/R63/mhi6issHoh8VX2q9/Nxc7rdAGL8q6Fpx+c8SPgEfvLju7fLfk
 vmSgFzxGzAy/HRLgvp1B2F+6g8AdFrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-vAb4Y8bKNymqLFw7GtUYaQ-1; Thu, 23 Feb 2023 01:59:41 -0500
X-MC-Unique: vAb4Y8bKNymqLFw7GtUYaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90675802C18;
 Thu, 23 Feb 2023 06:59:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-177.pek2.redhat.com
 [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB22492C14;
 Thu, 23 Feb 2023 06:59:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 lvivier@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V2 3/5] memory: introduce
 memory_region_unmap_iommu_notifier_range()
Date: Thu, 23 Feb 2023 14:59:22 +0800
Message-Id: <20230223065924.42503-4-jasowang@redhat.com>
In-Reply-To: <20230223065924.42503-1-jasowang@redhat.com>
References: <20230223065924.42503-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

This patch introduces a new helper to unmap the range of a specific
IOMMU notifier.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/exec/memory.h | 10 ++++++++++
 softmmu/memory.c      | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..6fa0b071f0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1731,6 +1731,16 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                                     IOMMUTLBEvent *event);
 
+/**
+ * memory_region_unmap_iommu_notifier_range: notify a unmap for an IOMMU
+ *                                           translation that covers the
+ *                                           range of a notifier
+ *
+ * @notifier: the notifier to be notified
+ */
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
+
+
 /**
  * memory_region_register_iommu_notifier: register a notifier for changes to
  * IOMMU translation entries.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..ba43b4474e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1996,6 +1996,19 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
     }
 }
 
+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
+{
+    IOMMUTLBEvent event;
+
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.iova = n->start;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.addr_mask = n->end - n->start;
+
+    memory_region_notify_iommu_one(n, &event);
+}
+
 void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 int iommu_idx,
                                 IOMMUTLBEvent event)
-- 
2.25.1


