Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F86A7CC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHM-0005k4-3u; Thu, 02 Mar 2023 03:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH9-0005g2-Ou
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGr-0002aG-0H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LzDUIaTuNEevHNuAn+p1xusIpzBBwqLlx1bsRJPHkfQ=;
 b=gi3yebCUS8UMAJndrK1QY6pUxYLzq27q4k8Ct4W6QQce34QMpqOrirXpf0g9YRA0kvV2/y
 L+/9m/aTjdrh+wCE+pSLoLGs9Drk/uw1XuVcOLbLi+/0U8/kPrSj0NwjUJH8CH4kSOHNkX
 eZ3Gup7ZZtTP+4oJc9M/WdxWcH2KO8Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-n_OWyf5xNMiw5Z1G94iufQ-1; Thu, 02 Mar 2023 03:26:35 -0500
X-MC-Unique: n_OWyf5xNMiw5Z1G94iufQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so2990333wrb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzDUIaTuNEevHNuAn+p1xusIpzBBwqLlx1bsRJPHkfQ=;
 b=q6ELmqlzIWlnnnmNHmnZebtmTTjqBuXWvhyzYqyVxuNwYYLInI+ATZ5YXEJhn45caP
 TQVdjBWfjViWCoN4XHNJBjx78urm+0Ndv/XPj2uP0Xp14LfIyiD9FFRpsKCIaXccij98
 i2EUBt3Q/nq1vqrIANOWC2TR6PORMaLy9n2uLsobFliHuflBV/2xXyPyciZLQHfMkGRO
 ZP2baTmI5LeE8lasdnXkr2U3HWuY1EhRiLDFkDaENLlhbEI2desVOdlxW2QjrmoahIsF
 hZ4s3+zqgQSWxPAxEsmDbLLgZc7A726YDwJoXpgr/0oBiDaodr24R0ce0n4Ey74R6cH1
 F58g==
X-Gm-Message-State: AO0yUKVyXgcWL7Exa8s6DVJhhSSBZ5C1I5an8xx6HQxWeV0JCPZukjSL
 pq1S9tz70J91fXOfrE8+QqmFZ4FxMYNrp9Zsc7M2fQ1t02cBjaG4EIYUFkMUY6E+8aBNWW550rF
 796yN1HiqxyP2ZitebmJyYN/VGGeKM+IWfrwCnARxlpQSV3zIXdTGvH5F2OeMAkYMfA==
X-Received: by 2002:a05:600c:3c81:b0:3df:fcbd:3159 with SMTP id
 bg1-20020a05600c3c8100b003dffcbd3159mr816530wmb.3.1677745593538; 
 Thu, 02 Mar 2023 00:26:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8Z2QWGjPu0PX+qOTVsmQgyxRnrHjBCzUvbAETBgq6f1laiG8bVBLHq0mkpjbLESj8Woik0/A==
X-Received: by 2002:a05:600c:3c81:b0:3df:fcbd:3159 with SMTP id
 bg1-20020a05600c3c8100b003dffcbd3159mr816515wmb.3.1677745593288; 
 Thu, 02 Mar 2023 00:26:33 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 hn30-20020a05600ca39e00b003e21f01c426sm2124351wmb.9.2023.03.02.00.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:32 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/53] memory: introduce
 memory_region_unmap_iommu_notifier_range()
Message-ID: <20230302082343.560446-40-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

This patch introduces a new helper to unmap the range of a specific
IOMMU notifier.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-4-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index da7d846619..4699ba55ec 100644
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
MST


