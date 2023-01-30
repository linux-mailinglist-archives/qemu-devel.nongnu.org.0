Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C5681B88
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaiZ-0003r1-JF; Mon, 30 Jan 2023 15:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeu-0007Ka-Tx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaep-0007TQ-NF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+Cb3vXl1fpQEI2y2/OxkPT/k9MpHs9866vAhPGYmTs=;
 b=f3BtcfUZ5dgPCkmvnEF0xQObqe+HM9FODM2qyt63FLwLvwB0Nyb5Y7+mWU7X4duyTApZrH
 TCzcISDUJxxDwg7m/8c6maJDARhOXmHrK30T91/zxLj+oyrevDW6pi1lWRfNiaTZz1dQqZ
 h4Xw2bgsyyt0fzjGQOHBtw0DFLrX1Mo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-I2phwKpnOVW6HkM0P7G0WA-1; Mon, 30 Jan 2023 15:21:38 -0500
X-MC-Unique: I2phwKpnOVW6HkM0P7G0WA-1
Received: by mail-ed1-f70.google.com with SMTP id
 o21-20020aa7dd55000000b004a245f58006so2756226edw.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r+Cb3vXl1fpQEI2y2/OxkPT/k9MpHs9866vAhPGYmTs=;
 b=GQKtPSDC96S0jDk7N0aT5bt63vpZahCnzPDK6J3Lul0eoILy97NOx0P9JHJVCQ97yr
 O3Bz19FVOarW5FgzL+SRRlZ4WQNxUqCcKSiJOP305Y9Q0WWXhB71N1mnGytkdbqAg5+R
 dHsTs97NF1SMQl4wcSZo5vaAC7j0HDVrvCOLqvnX6ayK8OUaijgpK0akzZ8HJBqdFUtc
 0O5zXuKVmH3onIuVRl2BJ18ESjFHqxHgSXGICA2gbPiev4phcQhI5Wg/Nq1mBicaYTOp
 belfhic4nEK4WNKKcMyomulYEPfBwDYQrPmj7Ydg0x2eoe4HZ9yj412JoGdPCYQXys6e
 2ZXQ==
X-Gm-Message-State: AO0yUKVuVMLZ8QldWG5PHvCMKyNmYFv46mbRCXDnDUVaOVQX9LnCUqG2
 vZOCKMYfjNR5+f2TqFwIpFzvLW/b2cDOsrhFJLpe4o/dSOf6Z6SgsM9uV5k5PdjIvqf+1I2caGl
 dAKPnBWzUhg/J8sGz108t+m8tdA52TLdmHwCe+nrZ9BAr++qBc8vOOhdqOSfL
X-Received: by 2002:a17:906:c350:b0:888:33a:e359 with SMTP id
 ci16-20020a170906c35000b00888033ae359mr5793585ejb.38.1675110096308; 
 Mon, 30 Jan 2023 12:21:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/13J4FE2M2jAMpcY62dXmrZJboZ9cKG1l1Vl6Xr9U2fsh+NvM0uRcA5YOdxsz2Jq2GwTKjSw==
X-Received: by 2002:a17:906:c350:b0:888:33a:e359 with SMTP id
 ci16-20020a170906c35000b00888033ae359mr5793570ejb.38.1675110096025; 
 Mon, 30 Jan 2023 12:21:36 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 v18-20020a1709064e9200b0084c7f96d023sm7408399eju.147.2023.01.30.12.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:35 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 52/56] hw: Use TYPE_PCI_BUS definition where appropriate
Message-ID: <20230130201810.11518-53-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use the proper QOM type definition instead of magic string.
This also helps during eventual refactor while using git-grep.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230117193014.83502-1-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c     | 3 ++-
 hw/virtio/virtio-iommu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..733c964778 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
 
 static Property smmu_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
-    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 23c470977e..1cd258135d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
 };
 
 static Property virtio_iommu_properties[] = {
-    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
MST


