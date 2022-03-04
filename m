Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD344CDC21
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:02 +0100 (CET)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCV7-0000Me-GI
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQC0c-0005HF-5K
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQC0Z-0004Mg-BF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646415984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7nv2biZSgEAimGz4TdIQjTFrLBElgXwLSI6iJaqjUH4=;
 b=ELJ5B7ZI3vT7izTK4T7akldzXbud7bln5h+LLmE77oRnTTGMJs8TnkBJ2uJrLxoQi6jO7p
 GYUxstkBal23VvNWS080ubDgWzXn7uC9Zjm66ilFCW9gnGUiSOh9VfwGePiBayX+UGiOQX
 YP2FfkEXzzB750w7oSRUw2Zv4TH9h1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-FYC6UZwnMT6bQfloCOBeMw-1; Fri, 04 Mar 2022 12:46:20 -0500
X-MC-Unique: FYC6UZwnMT6bQfloCOBeMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE91A824FA6;
 Fri,  4 Mar 2022 17:46:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3D8C1062254;
 Fri,  4 Mar 2022 17:46:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GIC_TCG
 is unset
Date: Fri,  4 Mar 2022 18:45:59 +0100
Message-Id: <20220304174559.55645-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In TCG mode, if gic-version=max we always select GICv3 even if
CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GIC_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")

---

v1 -> v2:
- added Drew's R-b
- dropped PATCH 2/2 for the time being (requires more discussions)
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..f29779c951 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
         vms->gic_version = VIRT_GIC_VERSION_2;
         break;
     case VIRT_GIC_VERSION_MAX:
+#ifdef CONFIG_ARM_GIC_TCG
         vms->gic_version = VIRT_GIC_VERSION_3;
+#else
+        vms->gic_version = VIRT_GIC_VERSION_2;
+#endif
         break;
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
-- 
2.26.3


