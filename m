Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64D6AFC2F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMI-0005T5-3R; Tue, 07 Mar 2023 20:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMG-0005Gz-80
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiME-0001fz-F1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGE0Vk2WtPdgTDKtcdyiScwg+yF9hq4OjdBcilItQG0=;
 b=OmlXcveyCawPhP6bDwCib0it7AbsHNajXIf3+wkmOCMWL0ePsaYy3sgq1SBtPcwgsfqTVB
 oDwJOV5gsBx+88CsVgHSm/BxOOQQ6RL5Bi4+GPgsTE1B1rDDTZPcAUP/LcCWzOfy30abpb
 0scO1QWVL5M1QLwT6U07uM8y0nXCl0k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-f8cCBFS7OHm5hHLeOQTwlQ-1; Tue, 07 Mar 2023 20:12:39 -0500
X-MC-Unique: f8cCBFS7OHm5hHLeOQTwlQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so18678684edc.20
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGE0Vk2WtPdgTDKtcdyiScwg+yF9hq4OjdBcilItQG0=;
 b=ybTZgGmkspyzQTmPbxpYELGK8MGKVJyxcqpUhaaGgJlnSzDKM1DGfO1L8Tnumcd/rq
 REMRBMLq1ohKgOF2J+vdZXFJFpEqvJHiUBrOX7/txFfheB+QRPtAWIX4emgXrnwCvvi0
 7BJWtU/15mxEupMq1gPF7M9f2VDOXVznNN8pbTJvQbIogb8QKcyPwnjCnnb0AMmc6IJO
 xg2Ul8RxHsc6PrbkyIZC3X24ERKizMd2WgNgWprij4wHSkHq++PKlxz4ythPQSp/75E4
 VEetsJjIzIaHFfspBy15y+SKAxPCxLzPwfJmb4q3OX7pw8qdu6H+3gfijWrldtEWJMAc
 5CZw==
X-Gm-Message-State: AO0yUKU9N+Zllz5nSbc4QfO3zXpag2TWrd9d7TjYXSVdGDKmRE1fqnJl
 u8MMJa28GRdyaQw4r2GuAFeLoDfo77upe3pra9dYs5CkI2I+oI5xNydf4R8FiQqVap0aRVyU/PU
 JsSdUMEsp0B2zNZC+9HL/RzfbKIQaZ7gwUyqV5AXWJ1ax6+6KYYxURm5aayvTu43yTMFm
X-Received: by 2002:a17:906:6c84:b0:8aa:33c4:87d5 with SMTP id
 s4-20020a1709066c8400b008aa33c487d5mr15250512ejr.10.1678237957846; 
 Tue, 07 Mar 2023 17:12:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+HbeG14/mcfQ9ZLZqpOrdhyQarPsEilqhq1QIxkALHm6YLcW3SXLlByHXtv46hlJ8wFux9cQ==
X-Received: by 2002:a17:906:6c84:b0:8aa:33c4:87d5 with SMTP id
 s4-20020a1709066c8400b008aa33c487d5mr15250500ejr.10.1678237957520; 
 Tue, 07 Mar 2023 17:12:37 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 b4-20020a170906038400b008d4df095034sm6759795eja.195.2023.03.07.17.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:37 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 35/73] x86: pcihp: fix missing bridge AML when intermediate
 root-port has 'hotplug=off' set
Message-ID: <0e84fd3b98feb2bdbfea75b9f7ff7993b2d5300f.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

(I practice [1] hasn't broke anything since on hardware side we unset
hotplug_handler on such intermediate port => hotplug behind it has
never worked)

When deciding if bridge should be described, the original
condition was

  cold_plugged_bridge && pcihp_bridge_en

which was replaced [1] by

  bridge has ACPI_PCIHP_PROP_BSEL

the later however is not the same thing as the original
and flips to false if intermediate bridge has hotplug
turned off (root-port with 'hotplug=off' option).

Since we already in build_pci_bridge_aml(), the question
if it's bridge is answered. Use DeviceState::hotplugged
to make decision if bridge should describe its slots.

What's left out is pcihp_bridge_en, which tells us if
ACPI bridge hotplug is enabled.

With hotplug and non hotplug part now being mostly
separated, omitting this check will only lead to
colplugged bridges describe occupied slots in case
when ACPI bridge hotplug is disabled.
Which makes behavior consistent with occupied slots
on hostbridge.

Ex (pc/DSDT.hpbrroot diff):
  ...
               Device (S20)
               {
                   Name (_ADR, 0x00040000)  // _ADR: Address
  +                Device (S08)
  +                {
  +                    Name (_ADR, 0x00010000)  // _ADR: Address
  +                }
  +
  +                Device (S10)
  +                {
  +                    Name (_ADR, 0x00020000)  // _ADR: Address
  +                }
               }
  ...

PS:
testing shows that above doesn't affect adversely guest OS
behavior: i.e. if ACPI bridge hotplug is enabled it's
expected behaviour, and with ACPI bridge hotplug is disabled
(a.k. native hotplug), it doesn't break slot enumeration
nor native hotplug. (tested with RHEL9.0 and WS2022).

1)
Fixes: 6c36ec46b0d ("pcihp: make bridge describe itself using AcpiDevAmlIfClass:build_dev_aml")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pci-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 5f3ee5157f..4fbf6da6ad 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -21,7 +21,7 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     PCIBridge *br = PCI_BRIDGE(adev);
 
-    if (object_property_find(OBJECT(&br->sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+    if (!DEVICE(br)->hotplugged) {
         build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
     }
 }
-- 
MST


