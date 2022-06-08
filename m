Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3723543244
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:13:28 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywR5-0002vp-VW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8B-0001AM-BF
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw89-0004LC-OD
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYEJEWvBcCHnlvwJhL/5WHvh5ynjhLa4YtDtrpzjP3Q=;
 b=FAZWLDPDpQM2dVNsdbMDNhtRyB7/0mXq5hAMWLPSvRrMcC7FxNZ7jR02JL7XvM7QCQyymA
 Gm5HLkUqwvueSmTG4Ahk8pGm/nTdltqVnmTGrbx2E/4MUGEC78/7C3azgfBgwpbxXHr9zc
 213Y3s0pmvDj+Q1xsdHPb4aCPCCMQeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-HU5RaEJAMt2URyRyEf5UwA-1; Wed, 08 Jun 2022 09:53:51 -0400
X-MC-Unique: HU5RaEJAMt2URyRyEf5UwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82C5F101E989
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:51 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2823C28119;
 Wed,  8 Jun 2022 13:53:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 10/35] tests: acpi: q35: add test for smbus-ipmi device
Date: Wed,  8 Jun 2022 09:53:15 -0400
Message-Id: <20220608135340.3304695-11-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

expected new device node:

    Device (MI1)
    {
        Name (_HID, EisaId ("IPI0001"))  // _HID: Hardware ID
        Name (_STR, "ipmi_smbus")  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
                AddressingMode7Bit, "\\_SB.PCI0.SMB0",
                0x00, ResourceProducer, , Exclusive,
                )
        })
        Name (_IFT, 0x04)  // _IFT: IPMI Interface Type
        Name (_SRV, 0x0200)  // _SRV: IPMI Spec Revision
    }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a4a46e97f0..d896840270 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -955,6 +955,21 @@ static void test_acpi_q35_tcg_ipmi(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_smbus_ipmi(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".ipmismbus";
+    data.required_struct_types = ipmi_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(ipmi_required_struct_types);
+    test_acpi_one("-device ipmi-bmc-sim,id=bmc0"
+                  " -device smbus-ipmi,bmc=bmc0",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg_ipmi(void)
 {
     test_data data;
@@ -1743,6 +1758,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+        qtest_add_func("acpi/q35/smbus/ipmi", test_acpi_q35_tcg_smbus_ipmi);
         qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
         qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
         qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-- 
2.31.1


