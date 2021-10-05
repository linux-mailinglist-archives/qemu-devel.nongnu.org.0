Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6942215C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:56:24 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgFL-0001aT-4k
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCa-0007gg-Uh
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCZ-0007RW-Bf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633424009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFF9WCg6eW0t4jCJokyRdtkGwM3wwBPBTh6l2Ycdux4=;
 b=QqjQLaY4JQ2ggqDJ7CJc/kGhi7V3jq5MeMQokds0Kl0/X2ye+Sg0bEMMs+SzYJ0uofn/tp
 FllXfw+kAYVDTRhSJxKdTfZH7fOedRW9KG8A7ww1z2cO4vQiHN4xXy7JFQLrPSTv5rPyqg
 nfGy9IlZ9r0gFuK4Hv+nzMMOnqxCInY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21--pgYKao-MjKl9aBW7g73AA-1; Tue, 05 Oct 2021 04:53:28 -0400
X-MC-Unique: -pgYKao-MjKl9aBW7g73AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C4081006AA3;
 Tue,  5 Oct 2021 08:53:27 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7169F60843;
 Tue,  5 Oct 2021 08:53:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot config
 DSM #5
Date: Tue,  5 Oct 2021 10:53:12 +0200
Message-Id: <20211005085313.493858-2-eric.auger@redhat.com>
In-Reply-To: <20211005085313.493858-1-eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a 'preserve_config' field in struct GPEXConfig and
if set generate the DSM #5 for preserving PCI boot configurations.
The DSM presence is needed to expose RMRs.

At the moment the DSM generation is not yet enabled.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/pci-host/gpex.h |  1 +
 hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index fcf8b63820..3f8f8ec38d 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -64,6 +64,7 @@ struct GPEXConfig {
     MemMapEntry pio;
     int         irq;
     PCIBus      *bus;
+    bool        preserve_config;
 };
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..7dab259379 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
             }
 
+            if (cfg->preserve_config) {
+                method = aml_method("_DSM", 5, AML_SERIALIZED);
+                aml_append(method, aml_return(aml_int(0)));
+                aml_append(dev, method);
+            }
+
             acpi_dsdt_add_pci_route_table(dev, cfg->irq);
 
             /*
@@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
+    if (cfg->preserve_config) {
+        method = aml_method("_DSM", 5, AML_SERIALIZED);
+        aml_append(method, aml_return(aml_int(0)));
+        aml_append(dev, method);
+    }
+
     acpi_dsdt_add_pci_route_table(dev, cfg->irq);
 
     method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
-- 
2.26.3


