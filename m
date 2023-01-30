Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BD681B85
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadg-0004O4-Ud; Mon, 30 Jan 2023 15:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadJ-0003IT-F6
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadG-0006uw-Jl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATHL4BpBWlmKIAM8BhIcfBqhKF1YwYVEjz9c7YNyRQ0=;
 b=flKzuC58/4WwXMKtdKoWu7efJ+gd7yQK06DqQfzMt6sWQMzoEfobfXEdSti2iMxO0C4Kqm
 Fxayf++nBrTOhkfs55OQ70ZUklO4H6osaPEeUl8vryv8O7u7zFVU/UosGajnbexpSNBIeL
 dkocgbwhCrN7gExodDKlkSKYcyv5OgY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-XGjQu2QgPbqlF95jqkHYzQ-1; Mon, 30 Jan 2023 15:20:00 -0500
X-MC-Unique: XGjQu2QgPbqlF95jqkHYzQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 t26-20020aa7d71a000000b004a244cc7ee8so2816623edq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATHL4BpBWlmKIAM8BhIcfBqhKF1YwYVEjz9c7YNyRQ0=;
 b=HYfJ9E3NWTZ5JfzutiCrWd6IIMCdQ+eL+nMUzJR+Auq2D+eGMEfHC7/I3iJ0PslbCb
 isHXAkxlty3V+pFMQEYkE4XewNq71+0uYaDPMX40olucTbEpSSiEMSKCGzvmvlHLAKnC
 RlODJ5a8UknyGYNQO0x4Adl/5Rq+1masVoRVReJoZxr/yeArtGiydRScXSr9CcZzPcLc
 WzrrHvhlNZdIQ5wv/opkkSqNL0LkCEFBZYOeDxviF4Ahw0A3mTRXRnQUGmBPYvYMMnQ4
 NbxgDNOZSzx8AY0jviwui9m/vLrYDy3fp+qM+CkpUBY3MFObeETJrZja9op/0+OSv4w9
 TflA==
X-Gm-Message-State: AFqh2kqMMQA2tL8gkyQ435AbUqgEGT9Sk9LiyhYJ5+C53raY7QbEoP87
 0J8t8ui9HqI1/csY5OaYLliWXT0QrYXX4ZBDyp18HvkUekxRceDNj56/Cy0i8wlJnZnft7wxUAw
 61IaWRnQ7N4GqJST4qIMsZeuQ9yf8utNlfHffkWTI8HMw9zdXad5PozHAY+vU
X-Received: by 2002:a17:907:874f:b0:870:7769:a907 with SMTP id
 qo15-20020a170907874f00b008707769a907mr59844521ejc.9.1675109998682; 
 Mon, 30 Jan 2023 12:19:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWuQu+iMvDgcY8Mleo4Jmb9tjhRmYpoF9KYQXnc/lrREfGe3odRZ+xUKevP1KofiTjvf6+5g==
X-Received: by 2002:a17:907:874f:b0:870:7769:a907 with SMTP id
 qo15-20020a170907874f00b008707769a907mr59844497ejc.9.1675109998329; 
 Mon, 30 Jan 2023 12:19:58 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 t26-20020a17090616da00b007aee7ca1199sm7425583ejd.10.2023.01.30.12.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:57 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 22/56] x86: pcihp: fix invalid AML PCNT calls to hotplugged
 bridges
Message-ID: <20230130201810.11518-23-mst@redhat.com>
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

When QEMU is started with hotplugged bridges (think migration):

  QEMU  -S -monitor stdio \
        -device pci-bridge,chassis_nr=1 \
        -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2

  (qemu) device_add pci-bridge,id=hpbr,bus=pci.1,addr=2.0,chassis_nr=3
  (qemu) cont

it will generate AML calls to hpbr's PCNT, which doesn't exists
since it's hotplugged bridge. As result DSDT becomes malformed,
with consequences that hotplug might stop working at best or
crash guest OS at worst, when it attempts to call non existing
PCNT method or during OS guest reboot when parsing DSDT again.

IASL de-compiles malformed AML of above config DSDT as:

   +    External (_SB_.PCI0.S18_.S10_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
   +    External (_SB_.PCI0.S18_.S19_.PCNT, MethodObj)    // Warning: Unknown method, guessing 2 arguments
   ...
                        BNUM = One
                        DVNT (PCIU, One)
                        DVNT (PCID, 0x03)
   -                    ^S08.PCNT ()
   +                    ^S19.PCNT (^S10.PCNT (^S08.PCNT ()))
                    }
                }

With BSEL assignment limited only to coldplugged bridges [1],
it should be possible to add PCNT call to a child bridge only
if the child has BSEL property, otherwise ignore it since it's
hotplugged. Which should fix the issue.

1) ("pci: acpihp: assign BSEL only to coldplugged bridges")

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8ba34d8fde..1c51ab01fc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -515,7 +515,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* Notify about child bus events in any case */
         if (pcihp_bridge_en) {
             QLIST_FOREACH(sec, &bus->child, sibling) {
-                if (pci_bus_is_root(sec)) {
+                if (pci_bus_is_root(sec) ||
+                    !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
                     continue;
                 }
 
-- 
MST


