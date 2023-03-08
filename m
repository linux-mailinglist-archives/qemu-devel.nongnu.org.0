Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1AE6AFBEC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM6-0003eR-JH; Tue, 07 Mar 2023 20:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLw-0003H3-GV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLu-0001ea-S8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2trXRR7GZlC7iwSMQlzM1Jn2Wy6O8R7FMtjsHnpZWNY=;
 b=eyHgkLXmalktQelKfu3tmXWU7EELZPgAsflpraZqly7e6xGhx8f150r/FY7gc39eG+YMzu
 6S3OG0NdT7grlCPcWFLT5roalg2f+2aFpGnRcSOhz0UR6gXDLDjQBubxyZg3ZOaG7QJ5JX
 GVGuPKYRUZDaRvdTWHCNorz2J9I9XjE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-zS43haidN1KLSbZnHCnCRA-1; Tue, 07 Mar 2023 20:12:21 -0500
X-MC-Unique: zS43haidN1KLSbZnHCnCRA-1
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso21407227edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2trXRR7GZlC7iwSMQlzM1Jn2Wy6O8R7FMtjsHnpZWNY=;
 b=0czZJomYifkXZ8aroBcHIdDFOn+0iZsEts87S1a72fcc4vhXeEsxSSF/fkKNAW/z6u
 D53B4fyVBc+3PyRg2ngJXWHVZXSuU8bE5+XrU1UEs5A5QazxZ2BkfULWelq6cGWC6oLC
 hmoAvwk0cRiquvKd3bryg8p1jvZPox/fKWTnhLxXOAgfQl7IhR+JjFdmaGckfGchkgMl
 ibnnqqIsUP5rO3THg1UdC1iBYQkjEz1ykbthhgtx3PRIy5tkdmJavQY1FeD7ohxEpeHH
 fVmZG35JwNRzU7v5FeJClBMI20leU+dLGh1Zg0usOjAJOnFia2/dC3o1X/7wae/i7lK6
 Q7nA==
X-Gm-Message-State: AO0yUKX7sXaLeFsr4BhXpSE6UG9S6hKZIXxXNCIFh0D0fqZUyFovoI1l
 cGoAP5BHlJYcllcRYJeEpnp4V8GUfMKZB3u1D3PRl4LAMv4X9vVrTioo8tuUrSY+4+Ob/NedEij
 1xI9B5nWFkHEVOrrpYDig4TXFxiPe5XqTI5loNPYfyfDs1Wtyy9520awkOG9OL54A+tRM
X-Received: by 2002:a17:907:888b:b0:877:573d:e919 with SMTP id
 rp11-20020a170907888b00b00877573de919mr16086776ejc.20.1678237939570; 
 Tue, 07 Mar 2023 17:12:19 -0800 (PST)
X-Google-Smtp-Source: AK7set95ysHUdGzP5I3kLkdB/efxQkaoV1Oe6VDvZ8pMOeBB+xNsoUAf5qcmS1tUdSTO2Byy7zfBCw==
X-Received: by 2002:a17:907:888b:b0:877:573d:e919 with SMTP id
 rp11-20020a170907888b00b00877573de919mr16086763ejc.20.1678237939362; 
 Tue, 07 Mar 2023 17:12:19 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 rp6-20020a170906d96600b008b9b4ab6ad1sm6810355ejb.102.2023.03.07.17.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:18 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 29/73] tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test
 and extend test_acpi_piix4_no_acpi_pci_hotplug
Message-ID: <b0b3b99e5fbf38c29fb00fb4e17199c20b7e6266.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

test bridge AML generator with ACPI PCI hotplug disabled
(i.e. with native hotplug enabled/disabled per bridge/root port)

PS:
while at make sure that devices on pci-bridge are starting
from addr=1.0 as slot 0 is not available there and test
passes only because of a bug in ACPI hotplug that will be
fixed by follow up patch

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 42 +++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d8c8cda58e..7828c6b7e6 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -949,9 +949,14 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-testdev,bus=pci.0 "
-                  "-device pci-testdev,bus=pci.1", &data);
+                  "-device pci-bridge,chassis_nr=1,addr=4.0 "
+                  "-device pci-testdev,bus=pci.0,addr=5.0 "
+                  "-device pci-testdev,bus=pci.0,addr=6.0,acpi-index=101 "
+                  "-device pci-testdev,bus=pci.1,addr=1.0 "
+                  "-device pci-testdev,bus=pci.1,addr=2.0,acpi-index=201 "
+                  "-device pci-bridge,id=nhpbr,chassis_nr=2,shpc=off,addr=7.0 "
+                  "-device pci-testdev,bus=nhpbr,addr=1.0,acpi-index=301 "
+                  , &data);
     free_test_data(&data);
 }
 
@@ -1002,6 +1007,35 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_no_acpi_hotplug(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".noacpihp";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    test_acpi_one("-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off"
+        " -device pci-testdev,bus=pcie.0,acpi-index=101,addr=3.0"
+        " -device pci-bridge,chassis_nr=1,id=shpcbr,addr=4.0"
+        " -device pci-testdev,bus=shpcbr,addr=1.0,acpi-index=201"
+        " -device pci-bridge,chassis_nr=2,shpc=off,id=noshpcbr,addr=5.0"
+        " -device pci-testdev,bus=noshpcbr,addr=1.0,acpi-index=301"
+        " -device pcie-root-port,id=hprp,port=0x0,chassis=1,addr=6.0"
+        " -device pci-testdev,bus=hprp,acpi-index=401"
+        " -device pcie-root-port,id=nohprp,port=0x0,chassis=2,hotplug=off,"
+                                 "addr=7.0"
+        " -device pci-testdev,bus=nohprp,acpi-index=501"
+        " -device pcie-root-port,id=nohprpint,port=0x0,chassis=3,hotplug=off,"
+                                 "addr=8.0"
+        " -device pcie-root-port,id=hprp2,port=0x0,chassis=4,bus=nohprpint,"
+                                 "addr=9.0"
+        " -device pci-testdev,bus=hprp2,acpi-index=601"
+        , &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_multif_bridge(void)
 {
     test_data data = {
@@ -2094,6 +2128,8 @@ int main(int argc, char *argv[])
                                test_acpi_q35_tcg_tpm12_tis);
             }
             qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/no-acpi-hotplug",
+                           test_acpi_q35_tcg_no_acpi_hotplug);
             qtest_add_func("acpi/q35/multif-bridge",
                            test_acpi_q35_multif_bridge);
             qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
MST


