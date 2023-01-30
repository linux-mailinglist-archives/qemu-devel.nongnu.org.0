Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC755681B81
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:29:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadf-00049X-DI; Mon, 30 Jan 2023 15:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadE-0003Ah-RO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadD-0006uU-3P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FzpFZUOzYqsVB74DHdam1waxerdjBb53bUIdTG9m9w=;
 b=JtiE0/rwD+tX04HPUZmIxuyMKCWNVVSkq3eh0lH2hP1wRVQ8MvJ33sgPtUzn8XlB9wQl4S
 /KGslO8Sb3FSVcyVUBtFdOXm5XzicNn9+8bWrmAYMCb68W+rzWTC5v2VDQtgXYmJqdxUs/
 bdeiU3oClzOlgvNRotbDiNO3qTsIh/k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-EYc_zOWhPcmvOfMHKF8xhw-1; Mon, 30 Jan 2023 15:19:56 -0500
X-MC-Unique: EYc_zOWhPcmvOfMHKF8xhw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z6-20020aa7cf86000000b0049f95687b88so8965509edx.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FzpFZUOzYqsVB74DHdam1waxerdjBb53bUIdTG9m9w=;
 b=a9x3S8AOYE/oVfXIwvnroAkSYSC+N59fucm5fAT7mJfH9HRQeSVyRL+uCbB6MX1V86
 hoXWUzvNvpDh7C0ExA962CFdQt5KGBswXjzBsgq3LKXraT+76TXwi4u/E7NcPP/wjAIu
 Qxrmc9J2fO6REKp9oyhzF7qCxUd/WromfBsVt/lx+u9OOm4JrCyRxeYjiSrS4FCZItUg
 uR2tqaPiwzUc3eJrrdnFZVOPAVHFkl5uwAsOgrGfPeFLGsMnDc96Z8RkWjxQQgcOReu6
 KtleHPhm6VJOOYAem4N+WCW/ARTfbfnnLeOFMfcywobLmWCYery7Koim1YI22jl6sOQR
 VWIA==
X-Gm-Message-State: AFqh2kpyHmOet6bw7vNb9u/Ua0KjQ918p2hZZhaaz06LRJ0Z32CdBLHU
 SIcfY9klDfcXh8j/1HHgI4gV4LDs/B/B05E0+R8uY+fiXa5/jnw7SJ1oDjxNMRb0LaRZXqYk6gw
 tfrIvLzPC6fwPIlPLD/9EQojCITTo3Wsd9gsLtDzE74Ls3I9n43TS1ZLDx7oa
X-Received: by 2002:a17:907:6c16:b0:86f:5636:4712 with SMTP id
 rl22-20020a1709076c1600b0086f56364712mr61330745ejc.7.1675109995051; 
 Mon, 30 Jan 2023 12:19:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcb+gMHXuYqkEVaagPeASiXT0mnjYGlzbWGHl29MGvIiwJJKav2MOHKqMFj2yTwJxtWvtwWw==
X-Received: by 2002:a17:907:6c16:b0:86f:5636:4712 with SMTP id
 rl22-20020a1709076c1600b0086f56364712mr61330722ejc.7.1675109994734; 
 Mon, 30 Jan 2023 12:19:54 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 p2-20020a1709060e8200b008786675d086sm7226106ejf.29.2023.01.30.12.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:54 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 21/56] pci: acpihp: assign BSEL only to coldplugged bridges
Message-ID: <20230130201810.11518-22-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

ACPI PCI hotplug would broken after bridge hotplug and then migration
if hotplugged bridge were specified on target at command line.
Currently it's not possible since, 'hotplugged' property was made
read-only for some time now.

The issue would happen due to BSEL being assigned to all bridges
during 1st 'reset':
 source seq:
   1. start 'pc' machine => sets BSEL to 0 on pci.0 (host-bridge)
   2. hotplug bridge, no bsel is assigned (so far is ok)
 target seq:
   1. start 'pc' machine with
        -S -device pci-bridge,id=hp_br,hotplugged=on
      BSEL gets assigned to as follows
        hp_br: 0
        pci.0: 1
as result hotplug requests with migrated AML generated on source
would be misdirected to 'hp_br' instead of intended pci.0

While it's not issue at the moment, it's based on implicit assumptions
 * 'hotplugged' property is read-only
 * 1st reset happens before QEMU drops into monitor mode
   which lets add hotplugged on source bridges as hotplugged ones
   (anything added at that stage counts as hotplugged
    (yet another assumption))

All of it looks too fragile to me, so lets restrict BSEL only
to cold-plugged bridges explicitly.

Migration wise it shouldn't break anything since assignment order
stays the same:
  * user can't specify 'hotplugged=on' on CLI
  * user can't specify 'hotplugged=off' at monitor stage or later
on older QEMU versions where 'hotplugged' is RW, hotplug is broken
after migration anyways and we cannot do anything to fix that.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-12-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 99a898d9ae..5dc7377411 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -85,31 +85,40 @@ static int acpi_pcihp_get_bsel(PCIBus *bus)
     }
 }
 
-/* Assign BSEL property to all buses.  In the future, this can be changed
- * to only assign to buses that support hotplug.
- */
+typedef struct {
+    unsigned bsel_alloc;
+    bool has_bridge_hotplug;
+} BSELInfo;
+
+/* Assign BSEL property only to buses that support hotplug. */
 static void *acpi_set_bsel(PCIBus *bus, void *opaque)
 {
-    unsigned *bsel_alloc = opaque;
+    BSELInfo *info = opaque;
     unsigned *bus_bsel;
+    DeviceState *br = bus->qbus.parent;
+    bool is_bridge = IS_PCI_BRIDGE(br);
 
+    /* hotplugged bridges can't be described in ACPI ignore them */
     if (qbus_is_hotpluggable(BUS(bus))) {
-        bus_bsel = g_malloc(sizeof *bus_bsel);
+        if (!is_bridge || (!br->hotplugged && info->has_bridge_hotplug)) {
+            bus_bsel = g_malloc(sizeof *bus_bsel);
 
-        *bus_bsel = (*bsel_alloc)++;
-        object_property_add_uint32_ptr(OBJECT(bus), ACPI_PCIHP_PROP_BSEL,
-                                       bus_bsel, OBJ_PROP_FLAG_READ);
+            *bus_bsel = info->bsel_alloc++;
+            object_property_add_uint32_ptr(OBJECT(bus), ACPI_PCIHP_PROP_BSEL,
+                                           bus_bsel, OBJ_PROP_FLAG_READ);
+        }
     }
 
-    return bsel_alloc;
+    return info;
 }
 
-static void acpi_set_pci_info(void)
+static void acpi_set_pci_info(bool has_bridge_hotplug)
 {
     static bool bsel_is_set;
     Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
-    unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
+    BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
+                      .has_bridge_hotplug = has_bridge_hotplug };
 
     if (bsel_is_set) {
         return;
@@ -123,7 +132,7 @@ static void acpi_set_pci_info(void)
     bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
-        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
+        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &info);
     }
 }
 
@@ -287,7 +296,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     if (acpihp_root_off) {
         acpi_pcihp_disable_root_bus();
     }
-    acpi_set_pci_info();
+    acpi_set_pci_info(!s->legacy_piix);
     acpi_pcihp_update(s);
 }
 
-- 
MST


