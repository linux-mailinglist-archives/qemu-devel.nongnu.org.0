Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6211644531
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:00:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2YSk-0007iF-8F; Tue, 06 Dec 2022 08:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2YSg-0007eY-PF
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2YSd-0001IW-TJ
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670335094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5Nod84dhdn3rrvzT2Fre85eVhriPKkmvhn69z7RKgE=;
 b=jIoYbgU/7GQ1qi9CltxCNi+YrQ3DPdVkvqW90X44ogL3J8J/zFTGukyY43+rZy1WNhD2C0
 UeuIu1OlMQ0LD9pqNnh5CfwTH1KQ1kXuvTLk4YCgeC0BhcUCjpRzI5c7BHDiG9K9VFH/KC
 AYqPFZUiZikvO+6KCiXMCBEoatafU+0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-U4_0IhOYNfePrvmOtI1cmA-1; Tue, 06 Dec 2022 08:58:13 -0500
X-MC-Unique: U4_0IhOYNfePrvmOtI1cmA-1
Received: by mail-qk1-f200.google.com with SMTP id
 i21-20020a05620a405500b006fb25ba3e00so20589998qko.1
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 05:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5Nod84dhdn3rrvzT2Fre85eVhriPKkmvhn69z7RKgE=;
 b=WWHn+NoaLRBMDfOtDgCyS9M0w9yZNZ2eN2SqMWTWbo4nF6de6p2VoC0os8DXS12Yvm
 OH9c9JnrlvU8717Wq1vLIezei+j1M6yFES4UNfl2YwGbEuBEMDpZLUPKXmb7rhPf1wsR
 eI+nBDGGt6IHCJ54oaz7iuWkLvJC7gjAngScYVzwllz69PswnOHh6cAOCtvo+jvv3ahK
 YUjW04uDnR2uMEcWLh0voQl3s3YuqiGxt/8OTIQMMWB2Lv5UYI7Qy9XtQWdtwBFD+XG5
 hqmB0RYko1WkQqDTyjb+lSSweEPe03RcByihiT0tVn41y4GguKrFjmjK1lcECp0VxwX6
 +n1g==
X-Gm-Message-State: ANoB5pm5Whf4roy2XHS436FKDlUIl6uNnKsuSDWww28yEv4SZ0dKIE34
 Uar1HDCQRa1d20Qu9qBzuCKdzaz5/oScBiuihDSrR12uVzYb4JYKs3jLe7pJYNYN0dbadPjEpWI
 sH5DNhiAFwQUmLCk=
X-Received: by 2002:ae9:f11a:0:b0:6fc:a3a1:5e63 with SMTP id
 k26-20020ae9f11a000000b006fca3a15e63mr21756527qkg.5.1670335092958; 
 Tue, 06 Dec 2022 05:58:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BREAmlvtm27JAxsSdJQZcpVoZbln+POAiM79QJcQSC6wdW9okkpCBw84HT0kWvM7sL5XaRw==
X-Received: by 2002:ae9:f11a:0:b0:6fc:a3a1:5e63 with SMTP id
 k26-20020ae9f11a000000b006fca3a15e63mr21756512qkg.5.1670335092656; 
 Tue, 06 Dec 2022 05:58:12 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05620a318600b006fa16fe93bbsm14681601qkb.15.2022.12.06.05.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:58:11 -0800 (PST)
Date: Tue, 6 Dec 2022 08:58:10 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Message-ID: <Y49Kcr4ivGGZ2hhF@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
 <Y4jBMkNEFqUA7edN@x1n>
 <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
 <Y458YMavxao9XSwL@x1n>
 <CACGkMEut82E-c_w_0MUPOwYDLkcM+mt127dbs3bkhATDSr6JQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="4NQ7/8qolUM9ofjF"
Content-Disposition: inline
In-Reply-To: <CACGkMEut82E-c_w_0MUPOwYDLkcM+mt127dbs3bkhATDSr6JQg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


--4NQ7/8qolUM9ofjF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Dec 06, 2022 at 11:18:03AM +0800, Jason Wang wrote:
> On Tue, Dec 6, 2022 at 7:19 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > Jason,
> >
> > On Mon, Dec 05, 2022 at 12:12:04PM +0800, Jason Wang wrote:
> > > I'm fine to go without iova-tree. Would you mind to post patches for
> > > fix? I can test and include it in this series then.
> >
> > One sample patch attached, only compile tested.
> 
> I don't see any direct connection between the attached patch and the
> intel-iommu?

Sorry!  Wrong tree dumped...  Trying again.

> 
> >
> > I can also work on this but I'll be slow in making progress, so I'll add it
> > into my todo.  If you can help to fix this issue it'll be more than great.
> 
> Ok, let me try but it might take some time :)

Sure. :)

I'll also add it into my todo (and I think the other similar one has been
there for a while.. :( ).

-- 
Peter Xu

--4NQ7/8qolUM9ofjF
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-intel-iommu-Send-unmap-notifications-for-domain-or-g.patch"

From 37c743761d20c16891856c5bef2e7b3fb89893b6 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Mon, 5 Dec 2022 18:11:36 -0500
Subject: [PATCH] intel-iommu: Send unmap notifications for domain or global
 inv desc
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a08ee85edf..2c6ca68df0 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -206,6 +206,23 @@ static inline gboolean vtd_as_has_map_notifier(VTDAddressSpace *as)
     return as->notifier_flags & IOMMU_NOTIFIER_MAP;
 }
 
+static void vtd_as_notify_unmap(VTDAddressSpace *as, hwaddr iova,
+                                hwaddr addr_mask)
+{
+    IOMMUTLBEvent event = {
+        .type = IOMMU_NOTIFIER_UNMAP,
+        .entry = {
+            .target_as = &address_space_memory,
+            .iova = iova,
+            .translated_addr = 0,
+            .addr_mask = addr_mask,
+            .perm = IOMMU_NONE,
+        },
+    };
+
+    memory_region_notify_iommu(&as->iommu, 0, event);
+}
+
 /* GHashTable functions */
 static gboolean vtd_iotlb_equal(gconstpointer v1, gconstpointer v2)
 {
@@ -1530,13 +1547,15 @@ static int vtd_sync_shadow_page_table_range(VTDAddressSpace *vtd_as,
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
+        vtd_as_notify_unmap(vtd_as, 0, HWADDR_MAX);
         return 0;
     }
 
@@ -2000,7 +2019,7 @@ static void vtd_iommu_replay_all(IntelIOMMUState *s)
     VTDAddressSpace *vtd_as;
 
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
-        vtd_sync_shadow_page_table(vtd_as);
+        vtd_address_space_sync(vtd_as);
     }
 }
 
@@ -2082,7 +2101,7 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
              * framework will skip MAP notifications if that
              * happened.
              */
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
@@ -2140,7 +2159,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
             domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
-            vtd_sync_shadow_page_table(vtd_as);
+            vtd_address_space_sync(vtd_as);
         }
     }
 }
@@ -2174,17 +2193,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                  * page tables.  We just deliver the PSI down to
                  * invalidate caches.
                  */
-                IOMMUTLBEvent event = {
-                    .type = IOMMU_NOTIFIER_UNMAP,
-                    .entry = {
-                        .target_as = &address_space_memory,
-                        .iova = addr,
-                        .translated_addr = 0,
-                        .addr_mask = size - 1,
-                        .perm = IOMMU_NONE,
-                    },
-                };
-                memory_region_notify_iommu(&vtd_as->iommu, 0, event);
+                vtd_as_notify_unmap(vtd_as, addr, size - 1);
             }
         }
     }
-- 
2.37.3


--4NQ7/8qolUM9ofjF--


