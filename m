Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80A5ACC3C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 09:28:13 +0200 (CEST)
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV6Wi-0007jS-AW
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 03:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV6US-00067U-W1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:25:53 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oV6UQ-0003c9-8S
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 03:25:52 -0400
Received: by mail-pf1-x436.google.com with SMTP id q15so7829390pfn.11
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=gs22vWON6RUgaJ4SjYt/9qKUGTgiN0Tv98etehxFICg=;
 b=IUYO7csCfeAARPHvWMjusnV530KKzVcQ32um2gCSnFWnGvV3VglU+RUdytPjDPgvl5
 LIEpV0Po5becS7UWXh8TRaXPlc7ccXmZh9lix82YXYaGTKteLFNCyKHgITGfj7SB3IPU
 9Z7vFv5INORj1DdNmuaynOwf9n5hd/6k/UCgpgDHqT1a7yUgooeUJZ2B2Wq+tkO192RF
 WYqjxUhd8MMMhXo3iOkDnbmpx6v1kTMfpIpOojS2qniDf2RON+hjt4Q0m1a53NVeqlbh
 xAbZIC9QlhUCkqQajSXQCTGKxS4S1OBA6zoAE5DJfYI4APzzPr8twBW7vrSbK2lbxJRb
 3y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=gs22vWON6RUgaJ4SjYt/9qKUGTgiN0Tv98etehxFICg=;
 b=KvNrO47vC1eNABB5+pGFi2WZOp7SM0euAS9QBdrKxFnu8t9bEmV0uPYKrmSaD8Q0Hp
 tBKQYTG57t5NNwYvyStjdKnRltcJk8JhqATK5/0uzK455Fo/k+0lURC6GMBAeWCjfiFO
 AYahUHJeqeb+bX7KTmaXT2hWLaSHKBzXG33zJhQQINr0h0Y2j9tUp1VDYdSMZWEzJoTr
 6r0tG3j7+j65bBlIv1LY8c341ZulgpjLRzL+bXJ+OpWwLO/tLqTp+lgaWsLRDuxBUnqu
 QZJjDtwYFcgR7v82Ny6rhSSFkiBbtfrK8Nnx15zNIKpga9PFzD2fdF2nYK/phXHqHmp+
 dK1w==
X-Gm-Message-State: ACgBeo0CgFMHOoNqVxOjb0yUrwjBBnJNDR5z1c76AsUB8fR8pPrR0qbn
 kpFbrzqQw6XZndV5bL9ngj/STQ==
X-Google-Smtp-Source: AA6agR50cfOZVepDZD4dETNB7i//E8KgvZt+lU+6DSrtSKV6ZKT3eWOzYjGPkm/7hdg3TkwzcgTebw==
X-Received: by 2002:a63:e156:0:b0:42b:5541:80d4 with SMTP id
 h22-20020a63e156000000b0042b554180d4mr39724065pgk.183.1662362747604; 
 Mon, 05 Sep 2022 00:25:47 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.134.171])
 by smtp.googlemail.com with ESMTPSA id
 b8-20020a17090aa58800b0020063e7d63asm1406933pjq.30.2022.09.05.00.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 00:25:47 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, kkostiuk@redhat.com, yvugenfi@redhat.com,
 yiwei@redhat.com, ybendito@redhat.com, jusual@redhat.com
Subject: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug when
 acpi hotplug is enabled
Date: Mon,  5 Sep 2022 12:55:31 +0530
Message-Id: <20220905072531.8059-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Possible fix for https://bugzilla.redhat.com/show_bug.cgi?id=2089545

Change in AML:

@@ -47,33 +47,39 @@
     Scope (_SB)
     {
         Device (PCI0)
         {
             Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
             Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
             Name (_ADR, Zero)  // _ADR: Address
             Name (_UID, Zero)  // _UID: Unique ID
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
             {
                 CreateDWordField (Arg3, Zero, CDW1)
                 If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
                     Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    Local0 &= 0x1E
+                    Local0 &= 0x1F
+                    Local1 = (CDW3 & One)
+                    If ((One == Local1))
+                    {
+                        CDW1 |= 0x12
+                    }
+
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

                     If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

                     CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
                 }
**

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0355bd3dda..3dc9379f27 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
 {
     Aml *if_ctx;
     Aml *if_ctx2;
+    Aml *if_ctx3;
     Aml *else_ctx;
     Aml *method;
     Aml *a_cwd1 = aml_name("CDW1");
     Aml *a_ctrl = aml_local(0);
+    Aml *a_pcie_nhp_ctl = aml_local(1);
 
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
     aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
@@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
     /*
      * Always allow native PME, AER (no dependencies)
      * Allow SHPC (PCI bridges can have SHPC controller)
-     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
      */
-    aml_append(if_ctx, aml_and(a_ctrl,
-        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
 
+    /*
+     * if ACPI PCI Hot-plug is enabled, do not let OSPM set OSC PCIE
+     * Native hotplug ctrl bit.
+     */
+    if (!enable_native_pcie_hotplug) {
+        /* check if the ACPI native hotplug bit is set by the OS in DWORD3 */
+        aml_append(if_ctx, aml_and(aml_name("CDW3"),
+                                   aml_int(0x01), a_pcie_nhp_ctl));
+        if_ctx3 = aml_if(aml_equal(aml_int(1), a_pcie_nhp_ctl));
+        /*
+         * ACPI spec 5.1, section 6.2.11
+         * bit 1 in first DWORD - _OSC failure
+         * bit 4 in first DWORD - capabilities masked
+         */
+        aml_append(if_ctx3, aml_or(a_cwd1, aml_int(0x12), a_cwd1));
+        aml_append(if_ctx, if_ctx3);
+    }
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
     aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
-- 
2.34.1


