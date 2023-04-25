Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B16EDD9A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:05:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDf0-00037l-De; Tue, 25 Apr 2023 04:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDex-00037d-VD
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDew-0001Pu-CK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682409861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+LmbV+KcWhotCY4TFXNF71hZn8TnJdbAxdQ6GLDJM0=;
 b=L0Qhf7xQ9Y4PBgRsAtRHr7G7jF/TQlIBDxZSAkh2IVMAbpM+Ta6Di91U5BP7tD4J+A0hxo
 q+Tc15zQh0KXvlWJwXiFFQMgP4uQBu4qWeQDAAKybZisI1sxXkzdjQrn5uncs7XOgbAkeR
 b4nBxjuJMXf9wr+PEpMq8P7am3h8Y6Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Y5YOVUzuPDCX78GMcvgQtA-1; Tue, 25 Apr 2023 04:04:20 -0400
X-MC-Unique: Y5YOVUzuPDCX78GMcvgQtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51832345e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682409858; x=1685001858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+LmbV+KcWhotCY4TFXNF71hZn8TnJdbAxdQ6GLDJM0=;
 b=EH5YNTsZ1dkNRHjl4QNw5XiVH6Uxx8VUNhfx7DWdC1DZHbduCzGFHDblLgcMMHprtD
 kpTPP7yBt3xOJ5gituWi8q2qrB/9OuFl9R89u8BVo8hDl1noIBQ7XiZBmwBjN/eP+84t
 grZmc2aqJc21G/plykMdkTR43k9dN0UNHD0KhrUeWekyWGTKAmLX7eSZmTA+lOGqVIe5
 gxPpkH6lafU3RtR6A129i75WmshYWDBHEgSGzqqgOEX6otlc9tC8mY9dU601TK3QUxey
 ttQWQIRy00yIoDLQ17kotpRWaOp+U+CwICwZkVDQCX7AHu6HZ9R5NM2KpkTgmVuYsejL
 bRzw==
X-Gm-Message-State: AAQBX9eMie8j0sCoLYcNo4r0eCTtYOIBJpRTWRtpYlUJU3Y1tOJ+mSvp
 VoL13qq6NiS5le8bXXAwdlJcLKpEWlFfyoC11o+A/qMIS2BdVM6QeUH7X59+EpWvDUqjHuxQ3Xi
 4qBMB2ZROYnmdtEgi4WX/fMgjD3/8vX1Y9OVcxy33B21Os1FvSh7PmhAp3W2lHld143wi
X-Received: by 2002:a05:600c:5114:b0:3f1:6fb4:5645 with SMTP id
 o20-20020a05600c511400b003f16fb45645mr10285889wms.1.1682409858412; 
 Tue, 25 Apr 2023 01:04:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOd1aKhWeiEVi9gTGhPC+eAukBo1SCb5TU1Haj59F8fQc8w4I/TW+7zMRRM0dG6CGjd8BwGg==
X-Received: by 2002:a05:600c:5114:b0:3f1:6fb4:5645 with SMTP id
 o20-20020a05600c511400b003f16fb45645mr10285858wms.1.1682409858043; 
 Tue, 25 Apr 2023 01:04:18 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 u8-20020a7bc048000000b003f1952a4bdesm10381071wmc.26.2023.04.25.01.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:04:17 -0700 (PDT)
Date: Tue, 25 Apr 2023 04:04:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 23/31] intel_iommu: refine iotlb hash calculation
Message-ID: <ec1a78cee97001b0ed25b5866e92dae058eb5877.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
account when calculating iotlb hash like:

static guint vtd_iotlb_hash(gconstpointer v)
{
    const struct vtd_iotlb_key *key = v;

    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
           (key->level) << VTD_IOTLB_LVL_SHIFT |
           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
}

This turns out to be problematic since:

- the shift will lose bits if not converting to uint64_t
- level should be off by one in order to fit into 2 bits
- VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
  some bits
- the hash result is uint64_t so we will lose bits when converting to
  guint

So this patch fixes them by

- converting the keys into uint64_t before doing the shift
- off level by one to make it fit into two bits
- change the sid, lvl and pasid shift to 26, 42 and 44 in order to
  take the full width of uint64_t
- perform an XOR to the top 32bit with the bottom 32bit for the final
  result to fit guint

Fixes: Coverity CID 1508100
Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230412073510.7158-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h | 6 +++---
 hw/i386/intel_iommu.c          | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index f090e61e11..2e61eec2f5 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -114,9 +114,9 @@
                                      VTD_INTERRUPT_ADDR_FIRST + 1)
 
 /* The shift of source_id in the key of IOTLB hash table */
-#define VTD_IOTLB_SID_SHIFT         20
-#define VTD_IOTLB_LVL_SHIFT         28
-#define VTD_IOTLB_PASID_SHIFT       30
+#define VTD_IOTLB_SID_SHIFT         26
+#define VTD_IOTLB_LVL_SHIFT         42
+#define VTD_IOTLB_PASID_SHIFT       44
 #define VTD_IOTLB_MAX_SIZE          1024    /* Max size of the hash table */
 
 /* IOTLB_REG */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a62896759c..94d52f4205 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -64,8 +64,8 @@ struct vtd_as_key {
 struct vtd_iotlb_key {
     uint64_t gfn;
     uint32_t pasid;
-    uint32_t level;
     uint16_t sid;
+    uint8_t level;
 };
 
 static void vtd_address_space_refresh_all(IntelIOMMUState *s);
@@ -221,10 +221,11 @@ static gboolean vtd_iotlb_equal(gconstpointer v1, gconstpointer v2)
 static guint vtd_iotlb_hash(gconstpointer v)
 {
     const struct vtd_iotlb_key *key = v;
+    uint64_t hash64 = key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
+        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
+        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
 
-    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
-           (key->level) << VTD_IOTLB_LVL_SHIFT |
-           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
+    return (guint)((hash64 >> 32) ^ (hash64 & 0xffffffffU));
 }
 
 static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
-- 
MST


