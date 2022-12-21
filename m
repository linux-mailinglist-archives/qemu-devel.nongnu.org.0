Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A1B653151
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymH-0004Or-Rx; Wed, 21 Dec 2022 08:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymF-0004Lq-9b
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymD-0003xA-JR
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8r+UfXDR9XgvwCY4Mgc5xJd4ZNuxduWvXYRuwGCgCEU=;
 b=gqS+ConrN4Ez/ZI/fKVHw2wQxUNv5so4xRM04y7PQrabNTsEg3C3uICKEt1UESBnDQ4uKC
 65zBWWNvXQs2UdjgFAy4+vN9aBmfR8K0u6oV3kN+jhz6hrSJS92cu7NrTtrel/zCLcaY9P
 7wSskeXxXZHy7KpPpu4Xy5eJeubsmyY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-ItCSRoLZMCWfitsRqt9lFQ-1; Wed, 21 Dec 2022 08:04:49 -0500
X-MC-Unique: ItCSRoLZMCWfitsRqt9lFQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso7098919ejc.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8r+UfXDR9XgvwCY4Mgc5xJd4ZNuxduWvXYRuwGCgCEU=;
 b=PXGS8w/fImnTEk75oUlmqQ2ivStPCy6oyhG1AbABOCc/zIt0heYqXKEGMr4JuARgKK
 uRIl1Ejba9yVE29Cf0488ylDCr/3vj06fRFo/KI1TV31MGjr2bS58aWLs+AWOlcW5G7g
 Kjk1WOZF2blWwruNHyJyhFJC282lc6upq26J2L+utsE1KqnIGwEcVc8SnHaj++n2o8uf
 h21p8wr79gSPvZDEjmFa5NIE7eZXreybx1osBBMUZ336iSF/vGmDlqQAOs/Wkph/T6zl
 wjT85V/ltObGO1ZmUBTfJeq7cC9N+ZRCZgPfPn//7SBge/x6G3LEe1WsxsgAsPDCjn3H
 0cgg==
X-Gm-Message-State: AFqh2krxea13T9dQ1z6QWpMJNLidBfIXudD8lqsEUBP2mKC8w//DrLIj
 ocp3OhulOFRYVIA3+toajjJR0VmwojICwJeodObv1kgocf35vc5laKu3hmrnmY0VUfBhqZDMQcd
 c9dGAv4GzhAr1BX/kWXj8milclEBVpV9SCW8rm57rWMjG5dC8fcxmF4RN2Mlc
X-Received: by 2002:a17:907:7e84:b0:7a4:bbce:ddae with SMTP id
 qb4-20020a1709077e8400b007a4bbceddaemr1658620ejc.59.1671627887463; 
 Wed, 21 Dec 2022 05:04:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzNJJOn7iiQ/de+Y+9vcZX+vghpop2VeDwq0DEbii/UUhs+DQL+6twypwbEpcOO6SMjn/fcg==
X-Received: by 2002:a17:907:7e84:b0:7a4:bbce:ddae with SMTP id
 qb4-20020a1709077e8400b007a4bbceddaemr1658592ejc.59.1671627887190; 
 Wed, 21 Dec 2022 05:04:47 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d4f87000000b00236576c8eddsm15154042wru.12.2022.12.21.05.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:46 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 07/41] ich9: honour 'enable_tco' property
Message-ID: <20221221130339.1234592-8-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

From: Daniel P. Berrangé <berrange@redhat.com>

An 'ICH9-LPC.enable_tco' property has been exposed for a
very long time, but attempts to set it have never been
honoured.

Originally, any user provided 'enable_tco' value was force
replaced by a value passed from the machine type setup
code that was determine by machine type compat properties.

  commit d6b304ba924b95d12edfddaac99777b577301309
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:10 2016 -0200

    machine: Remove no_tco field

    The field is always set to zero, so it is not necessary anymore.

After legacy Q35 machine types were deleted in:

  commit 86165b499edf8b03bb2d0e926d116c2f12a95bfe
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:09 2016 -0200

    q35: Remove old machine versions

the machine type code ended up just unconditionally passing
'true', all the time, so this was further simplified in

  commit d6b304ba924b95d12edfddaac99777b577301309
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:10 2016 -0200

    machine: Remove no_tco field

    The field is always set to zero, so it is not necessary anymore.

  commit 18d6abae3ea092950629e5d26aff1dcfc9a2d78e
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:11 2016 -0200

    ich9: Remove enable_tco arguments from init functions

    The enable_tco arguments are always true, so they are not needed
    anymore.

Leaving the ich9_pm_init to just force set 'enable_tco' to true.
This still overrides any user specified property. The initialization
of property defaults should be done when properties are first
registered, rather than during object construction.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221216125749.596075-6-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/ich9.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index bd9bbade70..ea4182256d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -316,8 +316,9 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
 
     pm->smm_enabled = smm_enabled;
 
-    pm->enable_tco = true;
-    acpi_pm_tco_init(&pm->tco_regs, &pm->io);
+    if (pm->enable_tco) {
+        acpi_pm_tco_init(&pm->tco_regs, &pm->io);
+    }
 
     if (pm->use_acpi_hotplug_bridge) {
         acpi_pcihp_init(OBJECT(lpc_pci),
@@ -440,6 +441,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->s4_val = 2;
     pm->use_acpi_hotplug_bridge = true;
     pm->keep_pci_slot_hpc = true;
+    pm->enable_tco = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
-- 
MST


