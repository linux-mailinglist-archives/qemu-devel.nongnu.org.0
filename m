Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E963BB45
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvhe-0006zX-Ko; Tue, 29 Nov 2022 03:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhX-0006zL-7b
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhV-0006j5-RK
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669709445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HG+N90FwLrQ2whSx9bC5In4uxn/OKmNqGGKG43bm6/Y=;
 b=MWU6M9pT6F0rcpkOrUlzspUvF1+4WICiVGlhMMRzUxOBr9KUjSSrqxZG3zbFi4vqVAk9bH
 Rd4IOJoSYfistqpY9KE5hAe5WDXxSZjMVyhPvQqNjD3bsxkGeDaihadeRwIBY3WUcnYsYt
 rCzbEl99FLCIg3ORQdFHFp+etlzJO4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-d2t4V3vROZyz6QV_dRS2og-1; Tue, 29 Nov 2022 03:10:43 -0500
X-MC-Unique: d2t4V3vROZyz6QV_dRS2og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D6903C3C16A;
 Tue, 29 Nov 2022 08:10:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-181.pek2.redhat.com
 [10.72.13.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACC79C15BBD;
 Tue, 29 Nov 2022 08:10:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
Date: Tue, 29 Nov 2022 16:10:34 +0800
Message-Id: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

Hi All:

According to ATS, device should work if ATS is disabled. This is not
correctly implemented in the current intel-iommu since it doesn't
handle the UNMAP notifier correctly. This breaks the vhost-net +
vIOMMU without dt.

The root casue is that the when there's a device IOTLB miss (note that
it's not specific to PCI so it can work without ATS), Qemu doesn't
build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
won't trigger the UNMAP notifier.

Fixing by build IOVA tree during IOMMU translsation.

Thanks

Jason Wang (3):
  intel-iommu: fail MAP notifier without caching mode
  intel-iommu: fail DEVIOTLB_UNMAP without dt mode
  intel-iommu: build iova tree during IOMMU translation

 hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

-- 
2.25.1


