Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFF6AFC19
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMO-0006T6-Hx; Tue, 07 Mar 2023 20:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiML-0006Ml-8U
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMJ-0001gd-GO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SephERjw7iPJOmXRt8b/SpRqtuCQhkw927GRfe/TcY4=;
 b=G0u6goz4vsasN3AsqUxYvAtz/S4cw1uMBm7Jyqhltco1lqdmxGDEFMRO3kUVc6ZYkaMpyV
 udTYCeiwHTJTV6Fv0PF7HcRBbIihRXYERbqIqDxPEDQQE7U7ZvjK/OjhYeQH48nhOR/0i/
 qQAoCna0fZtoXXT1b2eN1yUFCg4Y/7Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-gupfG9AWM06EborXIGTm4w-1; Tue, 07 Mar 2023 20:12:45 -0500
X-MC-Unique: gupfG9AWM06EborXIGTm4w-1
Received: by mail-ed1-f69.google.com with SMTP id
 u10-20020a056402064a00b004c689813557so21166349edx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SephERjw7iPJOmXRt8b/SpRqtuCQhkw927GRfe/TcY4=;
 b=lM/VDz3YVtN5aP9z02Tvl0RkRlmd5qc+mqOzjQiBya1YA/LENGNvaMUaqEa/K30YSJ
 0qVz3sVdykv3j7gOWt1wWH1E61i2zvsnyYBWE3gcypbFq0RfoyKn4ZWdPWDP15kFfceA
 UOx6LhvvJjapr2n7t35BJ5Q85NZA+8q4VuRnMS1yQLigoNZQKR850FTVaMfdUsEFeFm5
 w+RAr1PMJ8ELE3eMIi//fjgJ3uVcDB0eddnwGuQLhyNgch2lmrlMJwn4BQZxXFYMSuQs
 uMc3v5Ev7uCmlwcTp4qfIck8mwz6yFxiXN3x/rNP/kU7BbPCoOVn3v//oComU+njqt1q
 TFzw==
X-Gm-Message-State: AO0yUKUtMbh9A3rTCnA9nNrEsdLxP5Yht8naQOtbroEdgDsdG7/Y7/nI
 jqRlDR2ABc0RZH+vkVMdLEITq5FQJtjaXabibTQ45sQAKaOCLY4QpE6Kf0uS9hBq4fEgsdP7OCK
 TMn/5OGREUfiqbch5rDl9va40tbE9Z0wI8w8DHQrCJXmcWMNN2iXU55c2lg4U2wIcS2J/
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id
 k24-20020a17090666d800b00872b17a9b59mr16182066ejp.38.1678237963372; 
 Tue, 07 Mar 2023 17:12:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/bYBqRfSLJdrM7wI4B5rg6EB99+A0jE60xTbboSTZ6k33MU3fsKmW93QnbjBRDHeRni+jHbg==
X-Received: by 2002:a17:906:66d8:b0:872:b17a:9b59 with SMTP id
 k24-20020a17090666d800b00872b17a9b59mr16182051ejp.38.1678237963108; 
 Tue, 07 Mar 2023 17:12:43 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 r25-20020a1709067fd900b008e125ee7be4sm6816227ejs.176.2023.03.07.17.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:42 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 37/73] pcihp: piix4: do not redirect hotplug controller to
 piix4 when ACPI hotplug is disabled
Message-ID: <f40e6a4cc10cdb7901c172edaf34eaab7fe212b2.1678237635.git.mst@redhat.com>
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

commit [1] added ability to disable ACPI PCI hotplug
on hostbridge but forgot to take into account that it
should disable all ACPI hotplug machinery in case both
hostbridge and bridge hotplug are disabled.

Commit [2] tried to fix that, however it forgot to
remove hotplug_handler override which hands hotplug
control over to piix4 hotplug controller
(uninitialized after [2]).

As result at the time bridge is plugged in, its default
(SHPC) hotplug handler is replaced by piix4 one in
  acpi_pcihp_device_plug_cb()
    ...
    if (!s->legacy_piix &&
       ...
       qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));

which is acting on uninitialized s->legacy_piix value
(0 by default) that was supposed to be initialized by
acpi_pcihp_init(), that is no longer called due to
following condition being false:

  piix4_acpi_system_hot_add_init()
    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {

and the bridge ends up with piix4 as hotplug handler
instead of shpc one.

Followup hotplug on that bridge as result yields
piix4 specific error:

  Error: Unsupported bus. Bus doesn't have property 'acpi-pcihp-bsel' set

1) 3d7e78aa777 (Introduce a new flag for i440fx to disable PCI hotplug on the root bus)
2) df4008c9c59 (piix4: don't reserve hw resources when hotplug is off globally)

Fixes: df4008c9c59 (piix4: don't reserve hw resources when hotplug is off globally)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-12-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index eac2125abd..8fc422829a 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -492,7 +492,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
-    qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
 
     piix4_pm_add_properties(s);
 }
@@ -564,6 +563,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
                         s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
+        qbus_set_hotplug_handler(BUS(pci_get_bus(PCI_DEVICE(s))), OBJECT(s));
     }
 
     s->cpu_hotplug_legacy = true;
-- 
MST


