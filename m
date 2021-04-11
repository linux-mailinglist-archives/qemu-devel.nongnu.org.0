Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E535B41D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:25:21 +0200 (CEST)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZ9U-00035q-Ho
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYw9-0000ur-9U
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYw5-0002sv-JP
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Juxygx0ZahKoX9dkpcphJMlyD90QA2iTHOK0zCkgjBQ=;
 b=S7/AepYB3p3/MS4jhHeJubXG2fglTjUNg6pP4+KVMd1x6I+5iu4Tfe5R/gHhJj0+WRdU0e
 SVBigUHfFOjZ78pOjjNqlRb0VgY6vtW3w7e427ymAwtgGEGGXdxVDUTIDowvkXjGH8Vaks
 CCS6cYOzHMG5SF4pME8eqgQK8NhMLqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600--F0YtxVlMDSeFPKA0XzOPw-1; Sun, 11 Apr 2021 08:11:27 -0400
X-MC-Unique: -F0YtxVlMDSeFPKA0XzOPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A61B80D69E;
 Sun, 11 Apr 2021 12:11:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E68610023B2;
 Sun, 11 Apr 2021 12:11:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 10/29] iommu: Introduce generic header
Date: Sun, 11 Apr 2021 14:08:53 +0200
Message-Id: <20210411120912.15770-11-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This header is meant to exposes data types used by
several IOMMU devices such as struct for SVA and
nested stage configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/hw/iommu/iommu.h

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
new file mode 100644
index 0000000000..12092bda7b
--- /dev/null
+++ b/include/hw/iommu/iommu.h
@@ -0,0 +1,28 @@
+/*
+ * common header for iommu devices
+ *
+ * Copyright Red Hat, Inc. 2019
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_HW_IOMMU_IOMMU_H
+#define QEMU_HW_IOMMU_IOMMU_H
+#ifdef __linux__
+#include <linux/iommu.h>
+#endif
+
+typedef struct IOMMUConfig {
+    union {
+#ifdef __linux__
+        struct iommu_pasid_table_config pasid_cfg;
+#endif
+          };
+} IOMMUConfig;
+
+
+#endif /* QEMU_HW_IOMMU_IOMMU_H */
-- 
2.26.3


