Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB54A4B13
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:55:39 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZ1m-0007hL-Ah
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYsB-0000lj-S6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nEYs9-00021T-6G
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643643940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpRJz7RNL1WFg1veTk/fgw6KOLNib+clA4ww5erziqM=;
 b=Lh+NefZqpkGyqhFdIipy5lSgcJTnigrN1oC82A+EXgER/4EN/i6n+Jp7kE8oIpgyI9mVSk
 Rx0/pnB0ErF+SK0DoSnJhOf0yDxjangppNTx7ueEPLzcbvNYWCFPa6cvX1/9IrgOI+xgP9
 hSGq4aXsG8nI5cd5XZyYWg405OJ8Dq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-qypN66jaP_WqblSSSjwobA-1; Mon, 31 Jan 2022 10:45:39 -0500
X-MC-Unique: qypN66jaP_WqblSSSjwobA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 207058519E0;
 Mon, 31 Jan 2022 15:45:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96FB97B9E6;
 Mon, 31 Jan 2022 15:45:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
 f4bug@amsat.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Subject: [PATCH 1/2] hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GIC_TCG
 is unset
Date: Mon, 31 Jan 2022 16:45:30 +0100
Message-Id: <20220131154531.429533-2-eric.auger@redhat.com>
In-Reply-To: <20220131154531.429533-1-eric.auger@redhat.com>
References: <20220131154531.429533-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In TCG mode, if gic-version=max we always select GICv3 even if
CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GIC_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 141350bf21..2f1d4d0230 100644
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


