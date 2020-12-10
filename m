Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58D2D5AD2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:48:29 +0100 (CET)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLMy-00050f-Rk
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKqD-0003nq-Fu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKq1-0006vt-H6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skCVuGgQ5i6vpvP72F0TThaaxaTMpEC/Y2NtBY4sMCI=;
 b=EgpW35digOAExxmtr6SGkp452eZYIw4BiKircTtgGNYprb0dsbdedNps+I9v8kUdUWRnT2
 6ehGjMWSa6Z/W5+Bc7uqT0k0Dhk8jvX2uXwDThLKRxaouXUR3oOJUwOvgbdm1leXk/Oihd
 k6oL8bwwi1Hpv8QWFMbSUP5mvX1/PUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-wQv2qBIdPP20q_Uwuzrvig-1; Thu, 10 Dec 2020 07:14:22 -0500
X-MC-Unique: wQv2qBIdPP20q_Uwuzrvig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BB0803620;
 Thu, 10 Dec 2020 12:14:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0B806F971;
 Thu, 10 Dec 2020 12:14:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 12CA09D9F; Thu, 10 Dec 2020 13:14:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] tests/acpi: add ioapic2=on test for microvm
Date: Thu, 10 Dec 2020 13:13:57 +0100
Message-Id: <20201210121359.18320-10-kraxel@redhat.com>
In-Reply-To: <20201210121359.18320-1-kraxel@redhat.com>
References: <20201210121359.18320-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

APIC table changes:

 [034h 0052   1]                Subtable Type : 01 [I/O APIC]
 [035h 0053   1]                       Length : 0C
 [036h 0054   1]                  I/O Apic ID : 00
 [037h 0055   1]                     Reserved : 00
 [038h 0056   4]                      Address : FEC00000
 [03Ch 0060   4]                    Interrupt : 00000000

+[040h 0064   1]                Subtable Type : 01 [I/O APIC]
+[041h 0065   1]                       Length : 0C
+[042h 0066   1]                  I/O Apic ID : 01
+[043h 0067   1]                     Reserved : 00
+[044h 0068   4]                      Address : FEC10000
+[048h 0072   4]                    Interrupt : 00000018

DSDT table changes:

-        Device (VR07)
+        Device (VR23)
         {
             Name (_HID, "LNRO0005")  // _HID: Hardware ID
-            Name (_UID, 0x07)  // _UID: Unique ID
+            Name (_UID, 0x17)  // _UID: Unique ID
             Name (_CCA, One)  // _CCA: Cache Coherency Attribute
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 Memory32Fixed (ReadWrite,
-                    0xFEB00E00,         // Address Base
+                    0xFEB02E00,         // Address Base
                     0x00000200,         // Address Length
                     )
                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                 {
-                    0x00000017,
+                    0x0000002F,
                 }
             })
         }
     }

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20201203105423.10431-11-kraxel@redhat.com
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 61bf861ac91d..f2f79dd6a4a0 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1163,6 +1163,17 @@ static void test_acpi_microvm_pcie_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_microvm_ioapic2_tcg(void)
+{
+    test_data data;
+
+    test_acpi_microvm_prepare(&data);
+    data.variant = ".ioapic2";
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=on,rtc=off",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg_numamem(void)
 {
     test_data data = {
@@ -1323,6 +1334,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
+        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
-- 
2.27.0


