Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6066A7CC1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:33:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHc-0006RO-Pq; Thu, 02 Mar 2023 03:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHB-0005gI-5L
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGu-0002ac-CP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mK9tqXrZVANih9PF7PI/TwHTz75DueFW9hq/Lbg2GQE=;
 b=gtuA2hlqQ9ntTe/W8dS+4yg+yUnDE927woLquQzERv9b0i3KySbuL7hi//ClJuIew4Oz1C
 JebRZKf+2ZjO3tzYW+VDHQMquj4nOqJWRYbY4Mp9cpyQEoNqNGTshPnNQmzqQQWTPH1Bxi
 FSJbNw2MqJ9sNHRPopKS/oAogU2fxzE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-S3TabqArMNe8TkJmt05DzQ-1; Thu, 02 Mar 2023 03:26:38 -0500
X-MC-Unique: S3TabqArMNe8TkJmt05DzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5463061wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745596;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mK9tqXrZVANih9PF7PI/TwHTz75DueFW9hq/Lbg2GQE=;
 b=Y+SezVq/+l1+IyDx23YF7PSv65Snys3HZTwQhDrKV/NcaS3mDgqGbI21H0VkMBd5AR
 5W68lGFozuj+c5DPm7ul81r7ROPSCupuOS94DXveNs8zNypCeBJD8w9iQwXzIvT3iJkf
 q/0tyUKPkQBxkwgP9pVX1spuspa0Yzbx5qBM94PTDIPTORYubSum0Q9vvyGFm4N9dHen
 sl51i0VhH5zpmHVf3uEZPh3ljNujDeyJ8i+okQeIcnf3JS2vQwXM1BJ97IZuybzkpJ/x
 BDQ59k4kVBkH5mkDYIunJfPrtPz/k+E+qJwvwMtxQiD6qY16e9Jg96UZJivvjI38gDSE
 qpXw==
X-Gm-Message-State: AO0yUKWwiUcBEn9lA77Y2FFNusKen4dJx0l1pFaOS4cUFSX9WvuhjqtQ
 y/KIzHOVgzBe5ZdvuXHWk5l6pWcWyRsTTT+SCeGzJgmPd+bXn5ZzFOrKWRo60PYStxhiHjbl9bD
 e4N5jvIXH6w14iT9v4c4ttL/gijof7ijQOnTxao1+TKp1mZ8mc3bTt/WFTs8p+I50OQ==
X-Received: by 2002:a05:6000:88:b0:2c7:6a6c:c72a with SMTP id
 m8-20020a056000008800b002c76a6cc72amr6324009wrx.48.1677745596474; 
 Thu, 02 Mar 2023 00:26:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+8FPsC/pNLqD46HoPf4jhkeTGQITbrehqYZFaHz6vtjjxtHEW1Czsqh8HP970Y2Sd38/efgQ==
X-Received: by 2002:a05:6000:88:b0:2c7:6a6c:c72a with SMTP id
 m8-20020a056000008800b002c76a6cc72amr6323995wrx.48.1677745596224; 
 Thu, 02 Mar 2023 00:26:36 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c2f0f00b003eae73f0fc1sm2157736wmn.18.2023.03.02.00.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:35 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 40/53] smmu: switch to use
 memory_region_unmap_iommu_notifier_range()
Message-ID: <20230302082343.560446-41-mst@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-5-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/smmu-common.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0a5a60ca1e..e7f1c1f219 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -467,20 +467,6 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     return NULL;
 }
 
-/* Unmap the whole notifier's range */
-static void smmu_unmap_notifier_range(IOMMUNotifier *n)
-{
-    IOMMUTLBEvent event;
-
-    event.type = IOMMU_NOTIFIER_UNMAP;
-    event.entry.target_as = &address_space_memory;
-    event.entry.iova = n->start;
-    event.entry.perm = IOMMU_NONE;
-    event.entry.addr_mask = n->end - n->start;
-
-    memory_region_notify_iommu_one(n, &event);
-}
-
 /* Unmap all notifiers attached to @mr */
 static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
@@ -488,7 +474,7 @@ static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 
     trace_smmu_inv_notifiers_mr(mr->parent_obj.name);
     IOMMU_NOTIFIER_FOREACH(n, mr) {
-        smmu_unmap_notifier_range(n);
+        memory_region_unmap_iommu_notifier_range(n);
     }
 }
 
-- 
MST


