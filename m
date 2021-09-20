Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E364C410FA0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:50:08 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD7v-00043H-T9
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5U-0001B1-8l
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD5S-0001MM-IL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso14438395pji.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukvYbyvQxNBGBSYlEotz3ASU1rMqrJHd68qZpJMK8HY=;
 b=fTDtSMDBXgjQuVWVWflf/aEDjj0tWn8vLROm8m0p69eNQyjnYqglzeOKngjJCbK/1N
 wOL+fgxIM8F62Fdn4K24ADnQEzA/WIx29zYhAw0n9Rq2XGyiZkR5XebYS9Qcxja4zMNk
 dKpkzIt+XC6Kus2QLAqWye/0tY8UK1JLmlx/fLX7Pdm0HMniKMD2Rp6zZZtRLMrkIWqf
 830hCXK4aMgPndoFMIfSC3NoG7bScf0fEMFt0Ar3bYtKjaBnIC+YAMNCtt44dmpBGhYn
 1UYYRJ4JJIIWX2EAEz/R2uM/rE8p6Le7Ezb6nDQF4qoJx4T0sVO7SX6H131Txih9zdy9
 TA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukvYbyvQxNBGBSYlEotz3ASU1rMqrJHd68qZpJMK8HY=;
 b=ZaJr2zgyvAYhGmvX5qkhJkglxSfaFfRpm7fk5vLE9Yl5IMf3Dg0CnxvorZaShpz8Mn
 OetVRPAkJPacj3yb0FO1U8sYH7+hAkhn85eKJOdq80VsuHNQrkNYNM6DiNpoTe516eiF
 w5/RkAdBK+yR/hggXUOEb42FoRKMO//17Xfjrg8FkVB/6/0bW+SSMGdOhtxm3S3KyX/N
 IkwmLClzFN3kqlyYsx6X+M7BZZYChYC5BuHbnqYbQ27fJ75bsT/sUAO8AjLG8wsPrwzV
 BYT1TlWyZBydzrZ3oL6TJKcNA62tShRITuZXO1GTxZqOdNGZKrqbS2l0N050NGRpqQyK
 1KCg==
X-Gm-Message-State: AOAM5337OJGPI2b4P0LlIPQNWNbzR0ahln0YosfGMLHsMjjbFkkbidmg
 gGqI9V4r36bDrQ/bW1iG1h1I61QO+/Dx4g==
X-Google-Smtp-Source: ABdhPJyuwi21+ARLxMECsPXlFLnFb8/d/pRZIGZitRr4CMug/P9qoY5QVsBrkBNTpd0GMeOHBgrGbw==
X-Received: by 2002:a17:90a:514e:: with SMTP id
 k14mr36231825pjm.154.1632120452939; 
 Sun, 19 Sep 2021 23:47:32 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id u24sm13400752pfm.85.2021.09.19.23.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:47:32 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Mon, 20 Sep 2021 12:16:32 +0530
Message-Id: <20210920064633.3936409-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920064633.3936409-1-ani@anisinha.ca>
References: <20210920064633.3936409-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of /tmp/aml-7A7890, Sat Sep 18 13:13:29 2021
+ * Disassembly of /tmp/aml-PE4S90, Sat Sep 18 13:08:54 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000206A (8298)
+ *     Length           0x000020F3 (8435)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x59
+ *     Checksum         0x1B
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -20,28 +20,6 @@
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
-    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
-
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
@@ -3280,9 +3258,45 @@
                 }
             }

+            Device (S09)
+            {
+                Name (_ADR, 0x00010001)  // _ADR: Address
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
-                ^S09.PCNT (^S08.PCNT ())
+                ^S09.PCNT ()
+                ^S08.PCNT ()
             }
         }
     }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..d4cd77ea02 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -859,6 +859,23 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_multif_bridge(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".multi-bridge",
+    };
+    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
+                  "multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
+                  "-device pcie-root-port,id=pcie-root-port-1,"
+                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
+                  "-device virtio-balloon,id=balloon0,"
+                  "bus=pcie.0,addr=0x1.0x2",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_mmio64(void)
 {
     test_data data = {
@@ -1534,6 +1551,7 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-- 
2.25.1


