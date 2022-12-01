Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB463F53F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0mN9-0000jL-Tf; Thu, 01 Dec 2022 11:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0mN7-0000j9-Oy
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0mN3-0005eL-VN
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669911906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VvYQ6YCMEIaHw+PjdWjLbM1f+iFkdB02qf3mT8RigOw=;
 b=deLHDk2VLYLMx4htSlpkOopNEjlUIKzwe9VBnX3ndNSFO3IUXUAN+3Plu3S/xvelnK3Zcv
 uKVV5OLIkIahCS2NXnGmirreaJKGTwNSygRS7dJNrjMUbfOXq4t9sB9XZHemf7xk3CvfUy
 vh5VZfBKTSvoW0OXk3iQPmJa5hfMTWo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-0KTpFpNeNja04FMB77dLCw-1; Thu, 01 Dec 2022 11:25:04 -0500
X-MC-Unique: 0KTpFpNeNja04FMB77dLCw-1
Received: by mail-qt1-f197.google.com with SMTP id
 i4-20020ac813c4000000b003a5044a818cso5597156qtj.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 08:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvYQ6YCMEIaHw+PjdWjLbM1f+iFkdB02qf3mT8RigOw=;
 b=fZlNca2ImUlTwH8g4cEhkXtDyQ+Ql7v4+XhLrOpmnFSqezrFm6EUwj2jeyo8Dfkc9i
 L42nfRk6JgqvC6nkZrbQHQJp1r4s/KX9wrAKD6eaGEfqV/qT3VnZFZ3vmhP5ewC2RQ+q
 xxpMHEV28HxwZAoW/1umBDAM/XuxPfIXgLMsgPSe3qqLHk1q37xKF6MwkXuL6u5VsuLV
 Sds9ooRsKiE/eKwol2rEi7FW1xYRtR4mB5dZaC4iOAnPONK3Z+/iI0JGePjGXQR9ZkFv
 4DGo5jX13InPE2WT5QRmrti6x7RDB3LuSaL0PzR3yMilBrr8ZgZkRBjKnWVcjmjDCSUi
 NgnQ==
X-Gm-Message-State: ANoB5pm3+z1nNz9tyAiASHminHPI+EqBM8DdtboMGdFUdUtiM/mWmrYk
 KG7yIFQqZ87+vHQmhx12kjGCXPaxXA32rHo3qYckbcttN8A1RXLnSkoXxWiDcOqvO8nPcEvRCsM
 SluG+pogY0j0DppHS62CxyPcicPgf1dOFoSxE8LTTSAH7tWHYakQEsl+pFMa7RSYi
X-Received: by 2002:a37:91c6:0:b0:6fa:28c5:e2b with SMTP id
 t189-20020a3791c6000000b006fa28c50e2bmr42430753qkd.403.1669911903701; 
 Thu, 01 Dec 2022 08:25:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vz3cCzKt1oHPjT6q/qpCvuQRf7xPYMAJqRpNc0tcw32op/o0cD3JtgwQdhdqPX/YYrHnUig==
X-Received: by 2002:a37:91c6:0:b0:6fa:28c5:e2b with SMTP id
 t189-20020a3791c6000000b006fa28c50e2bmr42430717qkd.403.1669911903364; 
 Thu, 01 Dec 2022 08:25:03 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006ee949b8051sm3788041qkn.51.2022.12.01.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 08:25:02 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 peterx@redhat.com, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH] intel-iommu: Document iova_tree
Date: Thu,  1 Dec 2022 11:25:01 -0500
Message-Id: <20221201162501.3864692-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
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

It seems not super clear on when iova_tree is used, and why.  Add a rich
comment above iova_tree to track why we needed the iova_tree, and when we
need it.

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 46d973e629..8d130ab2e3 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -109,7 +109,35 @@ struct VTDAddressSpace {
     QLIST_ENTRY(VTDAddressSpace) next;
     /* Superset of notifier flags that this address space has */
     IOMMUNotifierFlag notifier_flags;
-    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
+    /*
+     * @iova_tree traces mapped IOVA ranges.
+     *
+     * The tree is not needed if no MAP notifiers is registered with
+     * current VTD address space, because all UNMAP (including iotlb or
+     * dev-iotlb) events can be transparently delivered to !MAP iommu
+     * notifiers.
+     *
+     * The tree OTOH is required for MAP typed iommu notifiers for a few
+     * reasons.
+     *
+     * Firstly, there's no way to identify whether an PSI event is MAP or
+     * UNMAP within the PSI message itself.  Without having prior knowledge
+     * of existing state vIOMMU doesn't know whether it should notify MAP
+     * or UNMAP for a PSI message it received.
+     *
+     * Secondly, PSI received from guest driver (or even a large PSI can
+     * grow into a DSI at least with Linux intel-iommu driver) can be
+     * larger in range than the newly mapped ranges for either MAP or UNMAP
+     * events. If it directly pass-throughs any such event it may confuse
+     * the registered drivers (e.g. vfio-pci) on either: (1) trying to map
+     * the same region more than once (for VFIO_IOMMU_MAP_DMA, -EEXIST will
+     * trigger), or (2) trying to UNMAP a range that is still partially
+     * mapped.  That accuracy is not required for UNMAP-only notifiers, but
+     * it is a must-to-have for MAP-inclusive notifiers, because the vIOMMU
+     * needs to make sure the shadow page table is always in sync with the
+     * guest IOMMU pgtables for a device.
+     */
+    IOVATree *iova_tree;
 };
 
 struct VTDIOTLBEntry {
-- 
2.37.3


