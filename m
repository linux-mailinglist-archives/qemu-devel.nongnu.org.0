Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DD12544EA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 14:24:38 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBGxJ-0000I2-Oq
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 08:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kBGu3-00056T-Oa
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:21:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57402
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kBGu1-0003Z4-TE
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 08:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598530872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbSzSoow6/kRln4luzSwvB2WGRnE1p1UFQnYpmEWyy4=;
 b=OvPUhxS1zgqBOGW7gPMFdbS5GEGTxIRqg0jRcG8o+rH4zyTt9J0oOix9Ub+lTyGBQdEv6a
 FbsR5w4TDaCQedLAOx0i+VpPMyUnQXA5trAWWzttvIigCtzMDxozbXfGHCLGHShn3zR3Es
 il+AzuUgQf7yGULiQEMRmzxdpI84Gac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-9n5ScJmzP0OHFSXxdYxWIg-1; Thu, 27 Aug 2020 08:21:10 -0400
X-MC-Unique: 9n5ScJmzP0OHFSXxdYxWIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3B8A189E614;
 Thu, 27 Aug 2020 12:21:08 +0000 (UTC)
Received: from localhost (ovpn-113-237.ams2.redhat.com [10.36.113.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED811972A;
 Thu, 27 Aug 2020 12:21:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/3] hw/vfio/ap: Plug memleak in vfio_ap_get_group()
Date: Thu, 27 Aug 2020 14:20:57 +0200
Message-Id: <20200827122057.232662-4-cohuck@redhat.com>
In-Reply-To: <20200827122057.232662-1-cohuck@redhat.com>
References: <20200827122057.232662-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Pierre Morel <pmorel@linux.ibm.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Missing g_error_free() in vfio_ap_get_group() error path. Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <20200814160241.7915-3-pannengyuan@huawei.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index b9330a8e6fc8..cec6fe159932 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -71,6 +71,7 @@ static VFIOGroup *vfio_ap_get_group(VFIOAPDevice *vapdev, Error **errp)
     if (!group_path) {
         error_setg(errp, "%s: no iommu_group found for %s: %s",
                    VFIO_AP_DEVICE_TYPE, vapdev->vdev.sysfsdev, gerror->message);
+        g_error_free(gerror);
         return NULL;
     }
 
-- 
2.25.4


