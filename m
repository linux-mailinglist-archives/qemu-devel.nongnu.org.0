Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20D26F6E0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 09:27:17 +0200 (CEST)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJAnc-0006rm-B1
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 03:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJAkY-00037j-Bc
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:24:06 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJAkW-0003KI-Ee
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:24:06 -0400
Received: by mail-pf1-x441.google.com with SMTP id o20so2864457pfp.11
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ughGQhnpv0vI//S8mrXDQnorJKmr6CWqkbIT0eqOuAw=;
 b=kuq2kv/CqWYivGm8CJHjIej4xNk1ZtzsMLnea0Pg0729OOmhI3R3PuUlYpsomq46di
 xOgL9FmShXX89bi5QC6sgV6ztn8tFArTL2cQpjt4G/3TLiynWmrwlPD3QPH3jTS6PdWM
 VvGkZiN2t/5SOq4RmwOwc9ugQudxEbA96kEtIVlLeUoIvekVRp75oi95EqCTbrgjFu3b
 +KHQhlKJWMzfSZZo1ilJu5/ToJh9lGerVYN+DhUn9sFNFf++DM54YV0FtxtHYCOtboYQ
 Msi77Z32lEtdNU60glaAW2UGRr41YYSwmuNPu9xEMX1pMGaDxOeXaX5p5c1TJHaWrqEF
 BIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ughGQhnpv0vI//S8mrXDQnorJKmr6CWqkbIT0eqOuAw=;
 b=EmPcaBn+FF6XYttb/Mr5rtFZ2El3GVi4yjupX6NfKbZXkGztEgR6onxL8PCB6x9TDS
 6UUY10KT3a0YGU3xhAOMS3o+z+pgbVC6ZewqEIIg4BPLkmJOgQSeVIxBGjHzDnb3cCrV
 GtBlqcYJIuB5XxkWWfeVaQcSqHy60nPYAcwYJbJjxwOZpVyeBUpoivmm7/gRkOGzb4UK
 qeJuud2UZkkp2XLymSmo0J/J8qT5U5PAKTR4TMQD5hcDEWUyFr1Y/vQ1js5P/XKM4+lS
 nRaJsVWSN6rOoTYEFCCrpS47hlcA9d/zds6fqDDM7sRKMGuId5UULvTcDTtGNnISyK4P
 alqg==
X-Gm-Message-State: AOAM533auJMSNY/TyzUfGDbUbUMxeai7S73MSh1VQgI3ShPSfWlxdT4a
 JFY2231obJ0aUNqx8f74QheBPrvzb5fgOBTv
X-Google-Smtp-Source: ABdhPJx+hKHund/ZjzM0eDgMdqtpAfbb9PSskgasbKpi1kErnb+PDYek2381lMbWDSS7y8arBA0ONQ==
X-Received: by 2002:a63:e741:: with SMTP id j1mr26037747pgk.422.1600413842633; 
 Fri, 18 Sep 2020 00:24:02 -0700 (PDT)
Received: from localhost.localdomain ([115.96.124.157])
 by smtp.googlemail.com with ESMTPSA id b18sm2010782pfr.4.2020.09.18.00.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 00:24:01 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 05/13] i440fx/acpi: do not add hotplug related amls for
 cold plugged bridges
Date: Fri, 18 Sep 2020 12:53:17 +0530
Message-Id: <20200918072325.9933-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918072325.9933-1-ani@anisinha.ca>
References: <20200918072325.9933-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::441;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cold plugged bridges are not hot unpluggable, even when their hotplug
property (acpi-pci-hotplug-with-bridge-support) is turned off. Please see
the function acpi_pcihp_pc_no_hotplug(). However, with
the current implementaton, Windows would try to hot-unplug a pci bridge when
it's hotplug switch is off. This is regardless of whether there are devices
attached to the bridge. This is because we add ACPI code like _EJ0 etc for the
pci slot where the bridge is cold plugged.

In this fix, we identify a cold plugged bridge and for cold plugged bridges,
we do not add the appropriate ACPI methods that are used by the OS
to identify a hot-pluggable/unpluggable pci device. After this change, Windows
does not detect the cold plugged pci bridge as ejectable.

As a result of the patch, the following are the changes to the DSDT ACPI
table:

@@ -858,38 +858,33 @@
                     Return (Zero)
                 }

                 Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                 {
                     Return (Zero)
                 }

                 Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                 {
                     Return (Zero)
                 }
             }

             Device (S18)
             {
-                Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
-                {
-                    PCEJ (BSEL, _SUN)
-                }
             }

             Device (S20)
             {
                 Name (_SUN, 0x04)  // _SUN: Slot User Number
                 Name (_ADR, 0x00040000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                 {
                     PCEJ (BSEL, _SUN)
                 }
             }

             Device (S28)
             {
                 Name (_SUN, 0x05)  // _SUN: Slot User Number
                 Name (_ADR, 0x00050000)  // _ADR: Address
@@ -1148,37 +1143,32 @@
                     PCEJ (BSEL, _SUN)
                 }
             }

             Device (SF8)
             {
                 Name (_SUN, 0x1F)  // _SUN: Slot User Number
                 Name (_ADR, 0x001F0000)  // _ADR: Address
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                 {
                     PCEJ (BSEL, _SUN)
                 }
             }

             Method (DVNT, 2, NotSerialized)
             {
-                If ((Arg0 & 0x08))
-                {
-                    Notify (S18, Arg1)
-                }
-
                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)
                 }

                 If ((Arg0 & 0x20))
                 {
                     Notify (S28, Arg1)
                 }

                 If ((Arg0 & 0x40))
                 {
                     Notify (S30, Arg1)
                 }

                 If ((Arg0 & 0x80))

While at it, I have also updated a stale comment.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Suggested-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7a5a8b3521..e079b686f5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -359,6 +359,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         int slot = PCI_SLOT(i);
         bool hotplug_enabled_dev;
         bool bridge_in_acpi;
+        bool cold_plugged_bridge;
 
         if (!pdev) {
             if (bsel) { /* add hotplug slots for non present devices */
@@ -380,15 +381,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         pc = PCI_DEVICE_GET_CLASS(pdev);
         dc = DEVICE_GET_CLASS(pdev);
 
-        /* When hotplug for bridges is enabled, bridges are
-         * described in ACPI separately (see build_pci_bus_end).
-         * In this case they aren't themselves hot-pluggable.
+        /*
+         * Cold plugged bridges aren't themselves hot-pluggable.
          * Hotplugged bridges *are* hot-pluggable.
          */
-        bridge_in_acpi = pc->is_bridge && pcihp_bridge_en &&
-            !DEVICE(pdev)->hotplugged;
+        cold_plugged_bridge = pc->is_bridge && !DEVICE(pdev)->hotplugged;
+        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
 
-        hotplug_enabled_dev = bsel && dc->hotpluggable && !bridge_in_acpi;
+        hotplug_enabled_dev = bsel && dc->hotpluggable && !cold_plugged_bridge;
 
         if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
             continue;
-- 
2.17.1


