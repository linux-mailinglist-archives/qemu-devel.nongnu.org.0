Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F123D6AFBE1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNL-0001tp-TF; Tue, 07 Mar 2023 20:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNI-0001lG-Jv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNG-0001yJ-Oh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEGZepK0Rp8JIhaQqMzWupcnrgzDBH5zuK/fgFSMHbY=;
 b=Rt/pT2HnpSqJGg6WFiLf5NJJPY/0pKRfXQwj5DT9kMqwDZuUZAGBkKVuZ4sss4/GxnEh8/
 7dDqep0i6dxVWGbWyFL3YobCEqyF7RZCXtJnaHxLjhSb/5/JmukBauHceNLUdCsDk0rdaA
 uTNcULqt+WTFCtoOPp5jS73hX0yaWhg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-ZBnRvrQBMVqafP9V2UoU-A-1; Tue, 07 Mar 2023 20:13:45 -0500
X-MC-Unique: ZBnRvrQBMVqafP9V2UoU-A-1
Received: by mail-ed1-f69.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso21255653edb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEGZepK0Rp8JIhaQqMzWupcnrgzDBH5zuK/fgFSMHbY=;
 b=6IedMM/OpAVFeigbWUsWHuEz5a/dib2wRmJSAbPkxBbiw7DOhXhGL8g5vkc1kG+epH
 MjS/lVfoQArXkKIJWpcCRzqy8HFQ/OC9hrXWXmytuDIKmAxe8CMTYxUPMyAnHrQU560F
 59IdPgqepU/J4MTCegaU4PHhRx9ZpVYEBdiCfN4yyjgSsYALSCKAAoyfUQmObIPdAsRK
 K7GiAqLLB0VoAp+JTahwTSpGRunqRswl6UyTlHXbUNJPkaeQHtLNw3SHtRzxJaBnQf5y
 o5g9L8BjM/1IQJgRJdLdh2LXhs1PpItnx0IvzvaVyG5iiPBpftYgD1F0/hpLDJaL2f+u
 jPpg==
X-Gm-Message-State: AO0yUKW97zBHKvoZKqJPZAlH5heWW10UXte3xXTNrx2h7XfuCzQaS6vS
 2gHAyjMZRjkmZTetMHyL+dbDKOHaHbUGcrNHJeT/NBPqOe1srmsWd+m6vqkp1KQEUdSA4Fu3ML+
 iHQ6yieNXEIpgE0IBjCbH4zR1j7pvhRzaFdRh5Zzkft9PYNwiEWTvTM3UFs0Uzd8fKDbX
X-Received: by 2002:a17:906:db0c:b0:909:3c55:a1b3 with SMTP id
 xj12-20020a170906db0c00b009093c55a1b3mr22181098ejb.38.1678238023585; 
 Tue, 07 Mar 2023 17:13:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+1W9Xvum+at7tU1bMNPJCbV56mbb8BVncyjTQXAeIY4OaoYVVkEx9KxBXrcpu9WpU+TiBMJw==
X-Received: by 2002:a17:906:db0c:b0:909:3c55:a1b3 with SMTP id
 xj12-20020a170906db0c00b009093c55a1b3mr22181084ejb.38.1678238023376; 
 Tue, 07 Mar 2023 17:13:43 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 d9-20020a17090648c900b008b17b0f5d07sm6762946ejt.217.2023.03.07.17.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:43 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 57/73] acpi: pci: move BSEL into build_append_pcihp_slots()
Message-ID: <62dd55fcf736994958eb5706cee5806480acfe25.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

Generic PCI enumeration code doesn't really need access to
BSEL value, it is only used as means to decide if hotplug
enumerator should be called.

Use stateless object_property_find() to do that, and move
the rest of BSEL handling into build_append_pcihp_slots()
where it belongs.

This cleans up generic code a bit from hotplug stuff
and follow up patch will remove remaining call to
build_append_pcihp_slots() from generic code, making
it possible to use without ACPI PCI hotplug dependencies.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-32-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce14866eda..0459acfbb4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -520,12 +520,14 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     return false;
 }
 
-static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
-                                     QObject *bsel)
+static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
 {
     int devfn;
     Aml *dev, *notify_method = NULL, *method;
+    QObject *bsel = object_property_get_qobject(OBJECT(bus),
+                        ACPI_PCIHP_PROP_BSEL, NULL);
     uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+    qobject_unref(bsel);
 
     aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
     notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
@@ -570,12 +572,9 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
-    QObject *bsel;
     int devfn;
     Aml *dev;
 
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
@@ -601,11 +600,9 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         aml_append(parent_scope, dev);
     }
 
-    if (bsel) {
-        build_append_pcihp_slots(parent_scope, bus, bsel);
+    if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(parent_scope, bus);
     }
-
-    qobject_unref(bsel);
 }
 
 static bool build_append_notfication_callback(Aml *parent_scope,
-- 
MST


