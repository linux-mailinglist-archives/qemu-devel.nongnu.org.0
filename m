Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D992A48D2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:00:32 +0100 (CET)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZxnS-0003t6-VL
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxOn-0004hN-PV
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kZxOl-0006Wt-RE
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604414099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERBcIzJjq9q9CekQaOnDD1IPGOplWp3LnON28jdWCRA=;
 b=XUJqmSod9j/kouwF45ZfM8gR5iVRvoMjD+e40ygQXAJKtP7jslSs5Q8BlWjFTHFG5guwWE
 FwM/nBHcLlpBlaukp5AGxZyyc/FHVEkStdr7ZIU+40CkJIUPxZqx8fOglRBBXjXHnbYT8y
 I4gF8FVxq+LpHaA6rH5m5Xo5grKKYLA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-C14vhzHKMuGSyGDO_yAorQ-1; Tue, 03 Nov 2020 09:34:57 -0500
X-MC-Unique: C14vhzHKMuGSyGDO_yAorQ-1
Received: by mail-wm1-f72.google.com with SMTP id y187so1889106wmy.3
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 06:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ERBcIzJjq9q9CekQaOnDD1IPGOplWp3LnON28jdWCRA=;
 b=DjHQk/XGH9j984619wcLfIGd3wSe1TTaJ4qlHGnOkx17znQVN/ElOHiWEdo3YImuN2
 GgUxzzMGJDdSCfIs4pcIFnlMe245GEmNaZCs6GpEsI0Gu8Gh2zkrkkIOS17s75wU3mYO
 iXC3nG9R43wRYWt+cVm5I2whBt4epg0DibESe9b/G5+aA2WfOIG/qh80WbOUp6nzozfF
 TPtiipjdNnsutVWaZe2ftb9sLzmMNfzJzFJNNe/W1tVa0k1JqmcwvlV89g5Z3YQ/au2j
 97vEI6A0YOp1QZh6p9jNjE3DNYFoto4TVb/w7cA2e+fhYVRRt8E4p0DmKy97+s6HzPHf
 ZoiA==
X-Gm-Message-State: AOAM530VjqrTO+/0MVH4OEF5Fp/jnBBIC89Thr9iDyF/V+yAMycCeW53
 p9eN7O4HHe4K4qq5WwLXA1oA55EgsGY08nQlGA2v+R/T3CKoXmwpbZ98S0L9FWH4W3X74aJ+SSz
 eifuXS/1oWW4dEQE=
X-Received: by 2002:a1c:f314:: with SMTP id q20mr68057wmq.104.1604414095707;
 Tue, 03 Nov 2020 06:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH8Ki+OZRu0zKldRQeSTbtWlJ6LaH0Mb9PhA7MyiLAYbXtj24RrsGQN2ISpmxtBCtWvLI33g==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr68044wmq.104.1604414095572;
 Tue, 03 Nov 2020 06:34:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id s188sm3103699wmf.45.2020.11.03.06.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:34:54 -0800 (PST)
Date: Tue, 3 Nov 2020 09:34:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/38] vfio: Set IOMMU page size as per host supported page size
Message-ID: <20201103142306.71782-21-mst@redhat.com>
References: <20201103142306.71782-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103142306.71782-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bharat Bhushan <bbhushan2@marvell.com>

Set IOMMU supported page size mask same as host Linux supported page
size mask.

Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20201030180510.747225-9-jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index e18ea2cf91..35895b18a6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -789,6 +789,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             int128_get64(llend),
                             iommu_idx);
 
+        ret = memory_region_iommu_set_page_size_mask(giommu->iommu,
+                                                     container->pgsizes,
+                                                     &err);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
-- 
MST


