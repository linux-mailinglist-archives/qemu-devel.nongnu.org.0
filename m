Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA7681B45
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadX-0003ZX-Ij; Mon, 30 Jan 2023 15:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadA-0002oX-Em
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad9-0006uG-1B
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yoc4PeYKa4uMfa8YZNqso6vpVCYwL/ByH6Sg8tE0xSo=;
 b=bVDiv1pknjd97q3jCSPyM4C+do809T3GWf17yLcLGu3kJuPYwTyRx/LTTFdktxvAXQFMnq
 054X4p7zG8Giec84zCXe2XsLjc/acwM5phc3tuDpNYqh+82EVV1W//PzXQBM8yUiSCTW6A
 FCjfO3Yifm5nFrpeulzMOCJYiSmmbTo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-idkVzVS6Mlmm7MJ2wUrL8A-1; Mon, 30 Jan 2023 15:19:53 -0500
X-MC-Unique: idkVzVS6Mlmm7MJ2wUrL8A-1
Received: by mail-ej1-f71.google.com with SMTP id
 kt9-20020a1709079d0900b00877f4df5aceso8155024ejc.21
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yoc4PeYKa4uMfa8YZNqso6vpVCYwL/ByH6Sg8tE0xSo=;
 b=YBBqk30HRi0W4ydYH4AHU75o2/TXh7fqC0EJ/EbDK5+Rje2Z3O0lBZ5kvPvIX67i0C
 /5SIwF+vnNb5srw3FiMN9vaJEv2Ckl+mSqXjBEgdB9TiXg2OXsaCZNI7SKyrF87Urgg0
 2ye31r/Yfs5ln4eFndwV/g7gU6umpseqDwRGwW7z2eq82unKj9Ovc1sUN9M4+5YDJM7g
 uH3KzPugCyDD+JXgRBpcYk35jsPCGiE4bvxxE+1HXwz1xlVByWxj/+/Y9jmwxp29JWOU
 OSud9nOHNj7MRVujHF8NPAjjnag9uqcHZRE2iU//V1IOlO5G4rEJNzhWkdh9Rn013ICa
 lkFg==
X-Gm-Message-State: AO0yUKVdBV8jl0+XNrqEIS1RrVGZmKlufFtFQuylf4Ydb0K4JQgUeFz8
 sGqZ2wlKn7hzipQyIXblt9kS02JGntHhGIXr24VeT4bpyC5Di2tbx06gw197SFIkw1cEkNju6xs
 ujnqDSkJRUQAl97eTzyIoPCu/hCKXontTVoi6LSznNt8clqRJ1smDvL+VHoYg
X-Received: by 2002:a17:906:9719:b0:878:79a4:26b6 with SMTP id
 k25-20020a170906971900b0087879a426b6mr16828646ejx.74.1675109991615; 
 Mon, 30 Jan 2023 12:19:51 -0800 (PST)
X-Google-Smtp-Source: AK7set9E4axD0UDYEN22x41qx7ylBD5SIw2Zg80Wczr0WFT7BL40zz+c4NHY5IcGpmGhrpAFxbDtig==
X-Received: by 2002:a17:906:9719:b0:878:79a4:26b6 with SMTP id
 k25-20020a170906971900b0087879a426b6mr16828623ejx.74.1675109991392; 
 Mon, 30 Jan 2023 12:19:51 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b0049be07c9ff5sm7343218edr.4.2023.01.30.12.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:50 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 20/56] pcihp: piix4: do not call acpi_pcihp_reset() when ACPI
 PCI hotplug is disabled
Message-ID: <20230130201810.11518-21-mst@redhat.com>
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

piix4_pm_reset() is calling acpi_pcihp_reset() when ACPI PCI hotplug
is disabled, which leads to assigning BSEL properties to bridges on path
   acpi_set_bsel()
       ...
       if (qbus_is_hotpluggable(BUS(bus))) {
          // above happens to be true by default (though it's SHPC hotplug handler)
          // set BSEL
       }

At the moment the issue is masked by the fact that we use not only BSEL,
to decide if we should generated hoplug AML but also pcihp_bridge_en knob.
However the later patches will drop dependency on pcihp_bridge_en,
and use only BSEL exclusively to decide if hotplug AML for slots should be built,
which exposes issue.

We should not ever call acpi_pcihp_reset() if ACPI PCI hotplug is disabled,
make it so.

PS:
 * Q35 does the right thing (i.e. it calls acpi_pcihp_reset only when pcihp is enabled)
 * the issue also makes acpi_pcihp_update() logic run on SHPC enabled bridges,
   which seems to be harmless

Fixes: 3d7e78aa777 ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/piix4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 2ab4930f11..724294b378 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -304,7 +304,9 @@ static void piix4_pm_reset(DeviceState *dev)
     acpi_update_sci(&s->ar, s->irq);
 
     pm_io_space_update(s);
-    acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
+        acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    }
 }
 
 static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
-- 
MST


