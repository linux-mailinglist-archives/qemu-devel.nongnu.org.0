Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB02AF3CF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:39:45 +0100 (CET)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrHk-0007Tw-7h
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcrD0-0003JX-UX
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:34:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kcrCz-0004kU-Bw
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605105288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=evmH/zd1WgDle1PKcNM4t5SArloxCeaBBVoNfNLvu5A=;
 b=g5DPBNXsemenjX8iq4BQmwomaHlF3bpKf8wdO2X1RgH1pqDNDdpdecNwYrSs4ru+i+aJ6h
 slOZAVylxYeCBPM04qawUeBX/t89YMIJdOkA4lx+awm/Ehz0vAkrGHKV8Y5aqiXSEG+WiM
 LK9/jiiqDf4ofQn8cjY1A6YpUMRemsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-WR7tkhIPP2yTiRMbaLbj5w-1; Wed, 11 Nov 2020 09:34:44 -0500
X-MC-Unique: WR7tkhIPP2yTiRMbaLbj5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32586D584;
 Wed, 11 Nov 2020 14:34:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F8281002C34;
 Wed, 11 Nov 2020 14:34:41 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
Date: Wed, 11 Nov 2020 15:34:40 +0100
Message-Id: <20201111143440.112763-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Miroslav Rezanina <mrezanin@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The removal of the selection of A15MPCORE from ARM_VIRT also
removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.

Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d022eeefdbc..e69a9009cf0a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    select ARM_GIC
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.26.2


