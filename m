Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52C681B8E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahQ-0001tf-3Y; Mon, 30 Jan 2023 15:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaes-0007J9-TY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeY-0007QR-M5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m1k1+HOV117cvjkUT6vnzQaM5DmTDJxllURIT5CtwE4=;
 b=FB2a4HwcFyp/QyCj6Vr+Y/H4kvkJYy4DTquDBoBK77zSnSoMZO0mnXH9YoiojIsDml0PvQ
 2Lij9sDqWq0VdA95S5gvGiH1wJwtHRvOsT2RRJdEFvG2QWXU3wdgIXGL/kKoi7XnBWYNJ+
 vfJZud9wbJzM5HL7AGQM6wMs0i8vQZQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-bjU9dE06M261m5wCE3nkcg-1; Mon, 30 Jan 2023 15:21:20 -0500
X-MC-Unique: bjU9dE06M261m5wCE3nkcg-1
Received: by mail-ej1-f71.google.com with SMTP id
 d10-20020a170906640a00b008787d18c373so7037202ejm.17
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1k1+HOV117cvjkUT6vnzQaM5DmTDJxllURIT5CtwE4=;
 b=Q6mypoK3c0b5O0jZE1XhXCLZFLIKpmeB56SNBwupzZNYF0MU6Gfzmdbptf9C3qIg9C
 VMxr5PXrLW3CEpSWs+tgGzmSmaFOMLUyBLbzvznjYCcrOA0Sy2egNmHlAddk5t+2c3wZ
 JCmkubbPKJIZc5FOgYGDe6xgjYwefABjj/ozz9CmoUBWzQyECXHu4f4YnLTiGpJPuqTU
 e1hL4+jdp7CofLATsozsoFgm37G4m98uy2GZbC8Txx98bmriuPPrBufXC/UrZaMDLv70
 vT/r2KPLqYPMzrPg7aCHXs3c0pjtVpZD3K7BrGAmqNrgaBz+re7I0pDgGT+2F73q4VSk
 gUyw==
X-Gm-Message-State: AO0yUKW5mSqISR1J4A8NdpfZOa1uH6GYxDSw/Gv9VHAziFHQ+0TAtbFY
 xTVpBbR/gJ0aQ+mWGz8+ucDEH0n1jkRcX/3xoWDZjzNkY7gs/1KMcxJ8LTsDNSPxZSSFZ5s6a/F
 fyIpkEu3Re33HQ59Z6ncsgff15nv1B7PJE2ZPeEErvGQZhcvvsdwCNlUS9Lr6
X-Received: by 2002:a17:906:dfeb:b0:88b:a30:25e9 with SMTP id
 lc11-20020a170906dfeb00b0088b0a3025e9mr1743386ejc.10.1675110078472; 
 Mon, 30 Jan 2023 12:21:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/v7fytX8RFNSP1ViJTXLx1EUI9v8KqmmE/fpGNaoCPCbcZEuKQCJP4Z3ACy3CETez6+fDabg==
X-Received: by 2002:a17:906:dfeb:b0:88b:a30:25e9 with SMTP id
 lc11-20020a170906dfeb00b0088b0a3025e9mr1743368ejc.10.1675110078201; 
 Mon, 30 Jan 2023 12:21:18 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 z3-20020a170906434300b0088bd01105eesm182294ejm.188.2023.01.30.12.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:17 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 46/56] pcihp: acpi: ignore coldplugged bridges when composing
 hotpluggable slots
Message-ID: <20230130201810.11518-47-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

coldplugged bridges are not unpluggable, so there is no need
to describe slots where they are plugged as hotpluggable. To
that effect we have a condition that marks slot as non-hotpluggable
if it's populated by coldplugged bridge and prevents generation
_SUN/_EJ0 objects for it. That leaves dynamic _DSM method on
such slot (which also depends on BSEL and pcihp hardware).
This _DSM method provides only dynamic acpi-index support so far,
which is not actually used/supported by linux kernel for bridges
and it's doubtful there will be need for it at all.

So it's rather pointless to generate acpi-index related AML
for bridges and we can simplify hotplug slots generator a bit
more by completely ignoring coldplugged bridges on hotplug path.

Another point in favor of dropping dynamic _DSM support, is
that we can replace it with static _DSM if necessary since
a slot with bridge can't change during VM runtime and without
any dependency on ACPI PCI hotplug at that.
Later I plan to implement bridge specific static _DSM
   PCI Firmware Specification 3.2
   4.6.5.  _DSM for Ignoring PCI Boot Configurations
part of spec, to fix longstanding issue with fixed IO/MEM
resource assignment that often leads to hotplugged device
being in-operational within the guest due limited IO/MEM
windows programmed on bridge at boot time.

Expected change when coldplugged bridge is ignored by hotplug
code, should look like:
-            Scope (S18)
-            {
-                Name (ASUN, 0x03)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Local0 = Package (0x02)
-                        {
-                            BSEL,
-                            ASUN
-                        }
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
-                }
-            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-37-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2077efbee4..a02608c215 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -409,8 +409,11 @@ static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
 
 static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
 {
-    if (bus->devices[devfn]) {
-        return is_devfn_ignored_generic(devfn, bus);
+    PCIDevice *pdev = bus->devices[devfn];
+    if (pdev) {
+        return is_devfn_ignored_generic(devfn, bus) ||
+               /* Cold plugged bridges aren't themselves hot-pluggable */
+               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
     } else { /* non populated slots */
          /*
          * hotplug is supported only for non-multifunction device
@@ -445,14 +448,7 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
         }
 
         if (pdev) {
-            /*
-             * Cold plugged bridges aren't themselves hot-pluggable.
-             * Hotplugged bridges *are* hot-pluggable.
-             */
-            bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
-                                  !DEVICE(pdev)->hotplugged;
-            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable &&
-                                !cold_plugged_bridge;
+            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable;
             dev = aml_scope("S%.02X", devfn);
         } else {
             dev = aml_device("S%.02X", devfn);
-- 
MST


