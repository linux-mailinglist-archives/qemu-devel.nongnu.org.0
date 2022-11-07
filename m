Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC262039B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzy-0005RP-0o; Mon, 07 Nov 2022 17:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzo-0005Kh-IS
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzn-0002Hw-53
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=G1zMR+O8oEvmTyKVNwVrnyXGu4VbjV+k9fdCYcjkJKka1y7eSvgrminDEss/F3BJqVZM8M
 DcQZfQqWY0hXgmNX+hJn1FKs8wlh/01PcDAEcBEsGaNlPfKlQruKuhL3nsCC1sGYzN/SOK
 XroK4RSEldFS/sJF+9ncc+9W9SKMOEA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-46e91bCYOnmzXDcmVbAUyQ-1; Mon, 07 Nov 2022 17:53:33 -0500
X-MC-Unique: 46e91bCYOnmzXDcmVbAUyQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 on28-20020a056214449c00b004bbf12d7976so8525885qvb.18
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=ROqFQqDx50C3xhVFGL8W8CGdWZMUgoNidQTy7qlHf70V6cCCG2h2N+oFexMAZqWHHJ
 kpem82/TbL/wHAsZIkUm/2OM13Lv0B1KLQbrK7QxonJlG4A8uxpLFvQONc9oZUBZQjpM
 4XKkkpZrEanSsT8raSmOYUcNeS16R88/11pZkuQsii61A1czJoe7GY2PEXuFgfBPUcrf
 XFGaXY37dOBEnsYTBT6t4PIM31jhljNWTZQ+MYhTTKPkFAlW6YzzWzOfTfzivg65wHB6
 XOsmVdINKeoOw8ybLWq04k0za/xhHkQuEiUxUNbpxK2AGoMCqip/QdS/ncE8RhJTE9IB
 xfNQ==
X-Gm-Message-State: ACrzQf04picjh7pAPCQLmMykwDTOgSPNzTrLOyWXylYnHUZkfykv7ye9
 EUfTkkTU3rBQ8MnOV+vOCXllXORT1+2GNuLiT6P9O3FEGm/2NvC4QBJtO9KXZEzvXIcXGORiuuX
 O4nEi74rATgDd4xsFKc+GmdgpsUKNbf7Gw8LJgTqMT01DV+DLi2oY3TFQutVp
X-Received: by 2002:a05:622a:8cb:b0:3a5:5987:42be with SMTP id
 i11-20020a05622a08cb00b003a5598742bemr18204808qte.311.1667861612594; 
 Mon, 07 Nov 2022 14:53:32 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5ZwIit7plgoPB7HsJcFeoo9OYwClifmM178ZJOwKF6R5wwGxmfDyOcL0Eun7lTlp/W1woRmw==
X-Received: by 2002:a05:622a:8cb:b0:3a5:5987:42be with SMTP id
 i11-20020a05622a08cb00b003a5598742bemr18204786qte.311.1667861612219; 
 Mon, 07 Nov 2022 14:53:32 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 y22-20020a05620a44d600b006f9c2be0b4bsm7984672qkp.135.2022.11.07.14.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:31 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v4 71/83] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20221107224600.934080-72-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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

We use to warn on wrong rid2pasid entry. But this error could be
triggered by the guest and could happens during initialization. So
let's don't warn in this case.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221028061436.30093-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6524c2ee32..271de995be 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
     if (s->root_scalable) {
         ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
         if (ret) {
-            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
-                              __func__, ret);
+            /*
+             * This error is guest triggerable. We should assumt PT
+             * not enabled for safety.
+             */
             return false;
         }
         return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
@@ -1569,14 +1571,12 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
 {
     IntelIOMMUState *s;
     VTDContextEntry ce;
-    int ret;
 
     assert(as);
 
     s = as->iommu_state;
-    ret = vtd_dev_to_context_entry(s, pci_bus_num(as->bus),
-                                   as->devfn, &ce);
-    if (ret) {
+    if (vtd_dev_to_context_entry(s, pci_bus_num(as->bus), as->devfn,
+                                 &ce)) {
         /*
          * Possibly failed to parse the context entry for some reason
          * (e.g., during init, or any guest configuration errors on
-- 
MST


