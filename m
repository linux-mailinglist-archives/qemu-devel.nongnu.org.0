Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934F4D2042
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:29:20 +0100 (CET)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReaF-0006Zp-3R
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:29:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReWB-0007Zq-KM
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReW8-0003zq-78
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646763903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ietZbyI29vSajRMQnOuq1MmdCcl/JxjvJCJZnRqbAYI=;
 b=f55WTWo9NmvGwN6fgezHTQ5PWN8mEIkxGrnE+w2DriqX0sSreVy1C36boXUErVnC0k5lXp
 Ksd4ogsbJwLqo9CyPuPJB4V7ORVaSpMrhgITEWSzDGh8xOkyV6OVKicWZrHsAYgXOWMZH6
 aZl0BYY+w+iwSYDlMoAAmSz8IY5JDeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-qRDPGujSPdKEew95vIBxqQ-1; Tue, 08 Mar 2022 13:25:01 -0500
X-MC-Unique: qRDPGujSPdKEew95vIBxqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994DA1800D50;
 Tue,  8 Mar 2022 18:25:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D606586C53;
 Tue,  8 Mar 2022 18:24:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GICV3_TCG is unset
Date: Tue,  8 Mar 2022 19:24:52 +0100
Message-Id: <20220308182452.223473-3-eric.auger@redhat.com>
In-Reply-To: <20220308182452.223473-1-eric.auger@redhat.com>
References: <20220308182452.223473-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
CONFIG_ARM_GICV3_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GICV3_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- Use module_object_class_by_name() and refer to the renamed
  CONFIG_ARM_GICV3_TCG config
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..39790d29d2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,7 +1852,12 @@ static void finalize_gic_version(VirtMachineState *vms)
         vms->gic_version = VIRT_GIC_VERSION_2;
         break;
     case VIRT_GIC_VERSION_MAX:
-        vms->gic_version = VIRT_GIC_VERSION_3;
+        if (module_object_class_by_name("arm-gicv3")) {
+            /* CONFIG_ARM_GICV3_TCG was set */
+            vms->gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            vms->gic_version = VIRT_GIC_VERSION_2;
+        }
         break;
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
-- 
2.26.3


