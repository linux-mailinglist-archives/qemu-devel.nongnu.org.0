Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2174349A5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:03:26 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9NV-0002Km-ML
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8in-0005ab-QC
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8im-0004Gz-0h
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ysZp7mMPII4pmn1rmH7HJMbN4B1aNJgaVcvJsZja2WQ=;
 b=CEdBr0bjaDV7mF43NopmMr4BtZxi6o5EeVR1foEGXLleEMJvd/tsVDsIzlKvVStp35J3xB
 o2WtspDu7GLNZ8V/kat09/D39gVadpcz+rYDOobf7605zy1NO7ZelzblGq7mNuSmrr2p86
 QAg78oYxPCINv0NwHprtQ97B1fwXXus=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-JKOb20bYMA2tgsPUjMn2SA-1; Wed, 20 Oct 2021 06:21:17 -0400
X-MC-Unique: JKOb20bYMA2tgsPUjMn2SA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso20621027edv.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ysZp7mMPII4pmn1rmH7HJMbN4B1aNJgaVcvJsZja2WQ=;
 b=YktdIFagQDPYsQojeNUOkJf9Ff+4F8+AiIN6/0h9uN0WrfTx7Cwb6usZj65KTNeAEe
 ii0YE6vTpPLaR5bxO1Sz36rHaclJJBj9TmcuAQsKm92BX/Vkig4WPeE6xOBgXpT0i0Bi
 6A51i28JtyXtSjaO8yHwPwGI0DqYu8xW0oIOLJrVWJzfhiiX9fIvx97kcEXCFcSQc3Gf
 ayJeTkysRZVc9jLzC4G+EvBCQlSVCfs9Z9MhOfcOlX/j+sNmxCbPvysyDFLkTU//91xs
 b67XUuODyqCCw/nfVhd53MAMuI5GXROqzrH6dRACIzDrA8BTEDlhsyZudPnrgOxex0ox
 Qagg==
X-Gm-Message-State: AOAM5312UbOqI8DiaEKpWI2FN3W6UA4c75JNiohIG+dAiUH7csQNpuDD
 LEDNjEZWqmS09rt/dIUK1PJFOBfKH4OCVScekdvhOE2YeNOIC2xgiGDdnnK8/aGtv2LWedkCxFQ
 mTe71mIyPi5UYR9znQP+Qpvy6utJ2HZewGmAGxwUdVlLuI0+nqeUZ89Pv/49r
X-Received: by 2002:a17:906:8397:: with SMTP id
 p23mr46609789ejx.43.1634725276218; 
 Wed, 20 Oct 2021 03:21:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCm9HB2iyexI9c5CfYq0QjIZXEcE9/5hEcKY7cLzNK+Yag9nhR6gR0Oq4P/V485gxtMDlGig==
X-Received: by 2002:a17:906:8397:: with SMTP id
 p23mr46609762ejx.43.1634725275942; 
 Wed, 20 Oct 2021 03:21:15 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p10sm949683edj.91.2021.10.20.03.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:21:15 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:21:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 43/44] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Message-ID: <20211020101844.988480-44-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
added ACPI hotplug descriptions for cold plugged bridges for functions other
than 0. For all other devices, the ACPI hotplug descriptions are limited to
function 0 only. This change adds unit tests for this feature.

This test adds the following devices to qemu and then checks the changes
introduced in the DSDT table due to the addition of the following devices:

(a) a multifunction bridge device
(b) a bridge device with function 1
(c) a non-bridge device with function 2

In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
For (a) we should find a hotplug AML description for function 0.

The following diff compares the DSDT table AML with the new unit test before
and after the change d7346e614f4ec is introduced. In other words,
this diff reflects the changes that occurs in the DSDT table due to the change
d7346e614f4ec .

@@ -1,60 +1,38 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.multi-bridge, Thu Oct  7 18:56:05 2021
+ * Disassembly of /tmp/aml-AN0DA1, Thu Oct  7 18:56:05 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000020FE (8446)
+ *     Length           0x00002187 (8583)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xDE
+ *     Checksum         0x8D
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
-    /*
-     * iASL Warning: There was 1 external control method found during
-     * disassembly, but only 0 were resolved (1 unresolved). Additional
-     * ACPI tables may be required to properly disassemble the code. This
-     * resulting disassembler output file may not compile because the
-     * disassembler did not know how many arguments to assign to the
-     * unresolved methods. Note: SSDTs can be dynamically loaded at
-     * runtime and may or may not be available via the host OS.
-     *
-     * In addition, the -fe option can be used to specify a file containing
-     * control method external declarations with the associated method
-     * argument counts. Each line of the file must be of the form:
-     *     External (<method pathname>, MethodObj, <argument count>)
-     * Invocation:
-     *     iasl -fe refs.txt -d dsdt.aml
-     *
-     * The following methods were unresolved and many not compile properly
-     * because the disassembler had to guess at the number of arguments
-     * required for each:
-     */
-    External (_SB_.PCI0.S19_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
-
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

         Method (DBUG, 1, NotSerialized)
         {
             ToHexString (Arg0, Local0)
             ToBuffer (Local0, Local0)
             Local1 = (SizeOf (Local0) - One)
             Local2 = Zero
             While ((Local2 < Local1))
             {
@@ -3322,24 +3300,60 @@
                 Method (DVNT, 2, NotSerialized)
                 {
                     If ((Arg0 & One))
                     {
                         Notify (S00, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = One
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

+            Device (S19)
+            {
+                Name (_ADR, 0x00030001)  // _ADR: Address
+                Name (BSEL, Zero)
+                Device (S00)
+                {
+                    Name (_SUN, Zero)  // _SUN: Slot User Number
+                    Name (_ADR, Zero)  // _ADR: Address
+                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                    {
+                        PCEJ (BSEL, _SUN)
+                    }
+
+                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                    {
+                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    }
+                }
+
+                Method (DVNT, 2, NotSerialized)
+                {
+                    If ((Arg0 & One))
+                    {
+                        Notify (S00, Arg1)
+                    }
+                }
+
+                Method (PCNT, 0, NotSerialized)
+                {
+                    BNUM = Zero
+                    DVNT (PCIU, One)
+                    DVNT (PCID, 0x03)
+                }
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
-                ^S19.PCNT (^S10.PCNT ())
+                ^S19.PCNT ()
+                ^S10.PCNT ()
             }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211007135750.1277213-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 798f68c737..258874167e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -870,6 +870,23 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_multif_bridge(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".multi-bridge",
+    };
+    test_acpi_one("-device pcie-root-port,id=pcie-root-port-0,"
+                  "multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x2,bus=pcie.0 "
+                  "-device pcie-root-port,id=pcie-root-port-1,"
+                  "port=0x1,chassis=2,addr=0x3.0x1,bus=pcie.0 "
+                  "-device virtio-balloon,id=balloon0,"
+                  "bus=pcie.0,addr=0x4.0x2",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_mmio64(void)
 {
     test_data data = {
@@ -1581,6 +1598,7 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-- 
MST


