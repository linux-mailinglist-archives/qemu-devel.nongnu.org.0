Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC76A7CAF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHd-0006T9-4q; Thu, 02 Mar 2023 03:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHC-0005gW-RM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGx-0002b6-En
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wXVLWL/BesuAOOm6vpOl2pfhgEhXIwPZXi20f0iQFYo=;
 b=Ew8ryN5NC4HeruOzW7VSTf/PMg760FoTdI1uq4U/p4wDYS16WqDec9OUD2N94ffK9MeAjC
 3yysympD39MVYNSI2M/L80N73RXGUfEUsMSV452IjE3eYuSst+9gpOREwXAbfg85HiDVc9
 IM6axZWvVd/xf9NYjvoQRB8WoZBL43c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-8m4FxOs5OAmRKIbQZxplEw-1; Thu, 02 Mar 2023 03:26:41 -0500
X-MC-Unique: 8m4FxOs5OAmRKIbQZxplEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so950742wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXVLWL/BesuAOOm6vpOl2pfhgEhXIwPZXi20f0iQFYo=;
 b=lTxcRHjHmKJDXgamBSO8xBajuuDEPrynqN6UETtk9/wBdbzbOWdt/XsWZ55XiXfYDO
 rJIhwiYzd/ewkczj/aqsd0dIxYLtBH/qIViuoUKETweA8inSOXDsbL5XmmkStuEGvNCB
 hoDwd17/Vq2ONsjSrFUbApMJocv0MWN0sDBxMPXiLWQdCxZijFVqduA+Hu7kpY+TiXH9
 a8F8xVK4TJV0Z3JCo+Ctj7Dr6lnpZ1cnd14qhRH3d68olQBrhRWh/NWTOt/LSjIivIP3
 v3dNkg2gqqrN345tRxUKdoP1bh3Cn3NjdFsLnACmyzhSFLXz3R7TQPCOJLW7ISXrR0Dl
 KZag==
X-Gm-Message-State: AO0yUKXl3mnTBiQaohtxKIOEk/sBp7W/Fezr0aKYSIuC0DMid6COv03x
 qCAJQi/TRSC78S13RGPElyapeiQhl/uaE6yV5Ft5jT/SLEXjFlXa+nqaohttP22ZOI8g6B6torm
 9U4gcT/Dfa2q+DtJ49EFrbcomWoGncqSJdhJ/jllgOy42/1/j5Hbq9EWVUwb1na34PA==
X-Received: by 2002:a5d:6805:0:b0:2c8:42b5:8025 with SMTP id
 w5-20020a5d6805000000b002c842b58025mr7760476wru.47.1677745599985; 
 Thu, 02 Mar 2023 00:26:39 -0800 (PST)
X-Google-Smtp-Source: AK7set90GREJXlJhKKuj/HJeAFX/2M0aKO9VxIzkVIEb9j53QKW66V46tXPq1Qnpx5rxNJ5zV6jBNw==
X-Received: by 2002:a5d:6805:0:b0:2c8:42b5:8025 with SMTP id
 w5-20020a5d6805000000b002c842b58025mr7760459wru.47.1677745599624; 
 Thu, 02 Mar 2023 00:26:39 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 q6-20020a1ce906000000b003e0015c8618sm2112909wmc.6.2023.03.02.00.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:39 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 41/53] intel-iommu: send UNMAP notifications for domain or
 global inv desc
Message-ID: <20230302082343.560446-42-mst@redhat.com>
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

From: Peter Xu <peterx@redhat.com>

We don't send UNMAP notification upon domain or global invalidation
which will lead the notifier can't work correctly. One example is to
use vhost remote IOTLB without enabling device IOTLB.

Fixing this by sending UNMAP notification.

Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-6-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a6b35b07d2..faade7def8 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1530,13 +1530,17 @@ static int vtd_sync_shadow_page_table_range(VTDAddressSpace *vtd_as,
     return vtd_page_walk(s, ce, addr, addr + size, &info, vtd_as->pasid);
 }
 
-static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
+static int vtd_address_space_sync(VTDAddressSpace *vtd_as)
 {
     int ret;
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
-    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+    /* If no MAP notifier registered, we simply invalidate all the cache */
+    if (!vtd_as_has_map_notifier(vtd_as)) {
+        IOMMU_NOTIFIER_FOREACH(n, &vtd_as->iommu) {
+            memory_region_unmap_iommu_notifier_range(n);
+        }
         return 0;
     }
 
@@ -2000,7 +2004,7 @@ static void vtd_iommu_replay_all(IntelIOMMUState *s)
     VTDAddressSpace *vtd_as;
 
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
-        vtd_sync_shadow_page_table(vtd_as);
+        vtd_address_space_sync(vtd_as);
     }
 }
 
@@ -2082,7 +2086,7 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
              * framework will skip MAP notifications if that
              * happened.
              */
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
@@ -2140,7 +2144,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
             domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
-- 
MST


