Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5905324F49
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:35:12 +0100 (CET)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEvH-0000TA-Rr
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELR-0004X0-9r
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:58:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELP-0006xS-Et
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWpvnpNWqbf4fsxYCvkc5JQlRB/986NNUaqzHGD3Ask=;
 b=AwEauFqJ5yDDGDnOZTyQS6B/tHS6nRW/F8wEudmC9/id7BlPYC63xw/8skSNbAyk4zciCI
 9snqqLyM0rdasJwesVpwg8j/C1Ffm4JTass9rejYMDkViZmSHOa8QgEifj3/AD2ZhKEBpB
 E43EGEP1odmHNHAFLAiBDW+rhQ9r0+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-NYov6jGMPgKF2Wf3bJsgng-1; Thu, 25 Feb 2021 05:58:04 -0500
X-MC-Unique: NYov6jGMPgKF2Wf3bJsgng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 787F618B6141;
 Thu, 25 Feb 2021 10:58:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45785D9D7;
 Thu, 25 Feb 2021 10:57:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 26/28] hw/arm/smmuv3: Allow MAP notifiers
Date: Thu, 25 Feb 2021 11:52:31 +0100
Message-Id: <20210225105233.650545-27-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now have all bricks to support nested paging. This
uses MAP notifiers to map the MSIs. So let's allow MAP
notifiers to be registered.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a61c1129d9..77d5fc2ec5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1618,14 +1618,6 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
         return -EINVAL;
     }
 
-    if (new & IOMMU_NOTIFIER_MAP) {
-        error_setg(errp,
-                   "device %02x.%02x.%x requires iommu MAP notifier which is "
-                   "not currently supported", pci_bus_num(sdev->bus),
-                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
-        return -EINVAL;
-    }
-
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         QLIST_INSERT_HEAD(&s->devices_with_notifiers, sdev, next);
-- 
2.26.2


