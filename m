Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E16EDD12
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOR-0001tc-IN; Tue, 25 Apr 2023 03:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNc-0000tu-Bn
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNY-0006r7-JB
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+LmbV+KcWhotCY4TFXNF71hZn8TnJdbAxdQ6GLDJM0=;
 b=Tdfo0vuGXarHx1Swd/Wx1pOdNNJrFM0mG+eFuqecTMcOfwNsfI/0L338rMfogTVAnt4CKI
 9yloJ6wN8bICgbuwbB+btgF8xtpKUhokbVImGLXmIm8aFjmHJ0CnL8VuZfn/JdDikf16DT
 +X9LGy/MeMbLka/zWRQbUW29bal3r84=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-QMjxjaV0PFq5qjVXrhxEog-1; Tue, 25 Apr 2023 03:46:22 -0400
X-MC-Unique: QMjxjaV0PFq5qjVXrhxEog-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f18b63229bso51543525e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408776; x=1685000776;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+LmbV+KcWhotCY4TFXNF71hZn8TnJdbAxdQ6GLDJM0=;
 b=i23isKLx7B+tCKAT9ZiccEEV+omBMGFwBDFaaXf3YZ58ZO+4ujwxD86BhEonhHwxG+
 G7mKDq7Esbw2ZZ6jzgyr+rJQ5RZi3aCZz7AWg0jVDVBD2dYUQ+94Fsp5rm1VlP4TkOLL
 TuZr0pnU6SFfbKeo1hqC1RUVKo27KMaxIf20RD6YFdheKJ7/yx/5wH93/AFfTKU+A7TU
 E4zWMr2PEO2AMJlpFtN32e1QzTzI8vfZN4juwyToZ+TjnSMcSHURsrKTH4Qs6OAiveY4
 zx1gzTAbvF3gjC5LEo77w6oPpN7lCjTOAEOjWh74InG8piSSplpVQY7giFi0rR7codFf
 VpTg==
X-Gm-Message-State: AAQBX9ehxS7gjbTqL+hLlh/FYZyfTRTgeGYmtjfo9SiCona2RnVgJg+D
 izQSO/mNIGgoykulM5WplWloCxtqytK3HApowOiY2g2wYXqcznXRRJvPZu3IIDWU40wo4b9ssKH
 wEF3u0i7gUsq+calv8fSoatsFLROGwaiaz40J4mTbSuItSb4O6Agzomo9djRCyIn/F2Sg
X-Received: by 2002:adf:f10e:0:b0:2ff:3605:e1e9 with SMTP id
 r14-20020adff10e000000b002ff3605e1e9mr11631025wro.17.1682408776672; 
 Tue, 25 Apr 2023 00:46:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3GS+jHf+uZdTqE7EQqYAIWnobZ8r6SKeSlADspyez1uDF9NY0dwOx9gj5CZgT6SRaCYyDlA==
X-Received: by 2002:adf:f10e:0:b0:2ff:3605:e1e9 with SMTP id
 r14-20020adff10e000000b002ff3605e1e9mr11630998wro.17.1682408776387; 
 Tue, 25 Apr 2023 00:46:16 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm12452357wrf.36.2023.04.25.00.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:15 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:12 -0400
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


