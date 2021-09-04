Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8D8400D1E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:39:51 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdOA-0003o2-0K
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKf-0003jg-UB
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKe-0000oB-9N
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYHzA7budtkHT237yd0sQgTDt9WNd03nKuIvCS+MnNE=;
 b=azHDe6swDx0pKz3a4wgX4Fx8+ywVuegjMQWEvaPwEMXB+EBooYDjWBQtk1bVLgrk2m2GoO
 etcX8WKsbyZ6gLNKvDz2tb+zcb3abjFWALMwLf5Jm3fBBhos4JbxCl6r5ZcDaNTO8pwbjT
 sosatFBCUSXhqdP/ZjAELuBa/jL2cFI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-trMns-AqPgW16SsjsM_FJg-1; Sat, 04 Sep 2021 17:36:10 -0400
X-MC-Unique: trMns-AqPgW16SsjsM_FJg-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so865153ejb.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VYHzA7budtkHT237yd0sQgTDt9WNd03nKuIvCS+MnNE=;
 b=X0GSGmHANFklBJsXuhVzbsqLHLuGIOTzwdhipuyKXQNX0jqyJhY2/0rBmlCIPcx80o
 27X/UHNF8LCh/R+0MOK/rMpWsMXaG85oRv6YM3AMcifA7SIWdi0cCm7XHIBiuwTc62KQ
 cib0wcc62iJX1E1W2CGYlHlnTNXyp2EL4EJk6qZ8jTMenTlD56dvN8LxIs1r8pwmMyHA
 +KZiaSSO1mQLMnd68s2NAii6W/e5qJardzZjjPgqYKzaJNjX1SYT7xE9h+ma1GbFqZMf
 yfuFEGhHivsrpdbjkuEJq7yGIFOA33rr0fTxtDoVXilakp6mGx8lIz0DrFBS+YyXO8Qa
 JcvQ==
X-Gm-Message-State: AOAM530DSZ+i93gPksrQHVUPM1JTKv39YU9OzVB1UKMhFeOoEas65JFM
 EKlRV1cCqt8Hgfj6ovNpG3rPtzZx9eRd6mUqWg/Id3TmFeU+tFgywmbBT2rXQEpzppLf4WooxKU
 BfW5aycKwfVOuvO8IHw7xa5lzoSlLNUjIlEeXWiYzRgyqDz/Vm5a8q4qAcHjE
X-Received: by 2002:a17:906:7848:: with SMTP id
 p8mr6018815ejm.212.1630791369006; 
 Sat, 04 Sep 2021 14:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXJ7NKx63JhEM7bjcrhbnsrs6qPQvpjSmzkA1S+MukIFv2ahlOovDq0IGKdabR1wrSo6RVVQ==
X-Received: by 2002:a17:906:7848:: with SMTP id
 p8mr6018792ejm.212.1630791368796; 
 Sat, 04 Sep 2021 14:36:08 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id e22sm1923376edu.35.2021.09.04.14.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:08 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] hw/acpi: define PIIX4 acpi pci hotplug property strings
 at a single place
Message-ID: <20210904213506.486886-5-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Now that we have "acpi-pci-hotplug-with-bridge-support" PIIX4 PM property being
used for both q35 and i440fx machine types, it is better that we defined this
property string at a single place within a header file like other PIIX4
properties. We can then use this single definition at all the places that needs
it instead of duplicating the string everywhere. While at it, this change also
adds a definition for "acpi-root-pci-hotplug" PIIX4 PM property and uses
this definition at all places that were formally using the string value.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20210816083214.105740-1-ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi.h | 2 ++
 hw/acpi/ich9.c         | 2 +-
 hw/acpi/piix4.c        | 4 ++--
 hw/i386/acpi-build.c   | 4 ++--
 hw/i386/pc.c           | 4 ++--
 hw/i386/pc_q35.c       | 2 +-
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 9e8a76f2e2..cc0d370745 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -47,6 +47,8 @@
 #define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
 #define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
 #define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
+#define ACPI_PM_PROP_ACPI_PCIHP_BRIDGE "acpi-pci-hotplug-with-bridge-support"
+#define ACPI_PM_PROP_ACPI_PCI_ROOTHP "acpi-root-pci-hotplug"
 
 /* PM Timer ticks per second (HZ) */
 #define PM_TIMER_FREQUENCY  3579545
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 778e27b659..1ee2ba2c50 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -451,7 +451,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
                              ich9_pm_get_enable_tco,
                              ich9_pm_set_enable_tco);
-    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+    object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ich9_pm_get_acpi_pci_hotplug,
                              ich9_pm_set_acpi_pci_hotplug);
 }
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 48f7a1edbc..f0b5fac44a 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -647,9 +647,9 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S3_DISABLED, PIIX4PMState, disable_s3, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
-    DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
+    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, PIIX4PMState,
                      use_acpi_hotplug_bridge, true),
-    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
+    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCI_ROOTHP, PIIX4PMState,
                      use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e..6c27e12e2a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -267,10 +267,10 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     qobject_unref(o);
 
     pm->pcihp_bridge_en =
-        object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+        object_property_get_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                  NULL);
     pm->pcihp_root_en =
-        object_property_get_bool(obj, "acpi-root-pci-hotplug",
+        object_property_get_bool(obj, ACPI_PM_PROP_ACPI_PCI_ROOTHP,
                                  NULL);
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1276bfeee4..22aa598d50 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -101,7 +101,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
-    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
@@ -313,7 +313,7 @@ const size_t pc_compat_2_0_len = G_N_ELEMENTS(pc_compat_2_0);
 GlobalProperty pc_compat_1_7[] = {
     PC_CPU_MODEL_IDS("1.7.0")
     { TYPE_USB_DEVICE, "msos-desc", "no" },
-    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "PIIX4_PM", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
     { "hpet", HPET_INTCAP, "4" },
 };
 const size_t pc_compat_1_7_len = G_N_ELEMENTS(pc_compat_1_7);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 565fadce54..46cd542d17 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -238,7 +238,7 @@ static void pc_q35_init(MachineState *machine)
                              OBJECT(lpc), &error_abort);
 
     acpi_pcihp = object_property_get_bool(OBJECT(lpc),
-                                          "acpi-pci-hotplug-with-bridge-support",
+                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                           NULL);
 
     if (acpi_pcihp) {
-- 
MST


