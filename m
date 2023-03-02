Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A126A8436
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjyH-0003i4-MM; Thu, 02 Mar 2023 09:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXjyB-0003Vs-Om
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXjy8-0000tE-UV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677767499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=La9vQ2mE1bajEncz77INlr7fEpP/qsSZU5MH4aARx34=;
 b=R0dtcYHXeaBzpwAJ29k7y8+FbH5cVI5yksJipGB/bZUzRVh8CNztv4iJqSqbhGOB7eA983
 Y5QUR5OnLJ3pgiWqw1OZ5LGbK7SAxMxyXSdAKfiV0pZjqyseFv7G8sNXcAfrxlv9LjxcvF
 cV3kxs3LHNheREDY9WcnKp3kHfKK2pA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-H4ptnTQCMK6NWDiAHQRBEQ-1; Thu, 02 Mar 2023 09:31:29 -0500
X-MC-Unique: H4ptnTQCMK6NWDiAHQRBEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5818153wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677767487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=La9vQ2mE1bajEncz77INlr7fEpP/qsSZU5MH4aARx34=;
 b=c6Xdz7fbkkn7sm9ALmDtkCmMkCJdXhRqFhhKQewKTReKGV+pSqjrlIlliQzg2cW4Xz
 G0e7rCvlEsxjG65KShPDZztdUILLm3kKUe0Vw2oNB4O6gn5f/gn5QC/7xhI+KiPn18bd
 GIMw4ciEhF9VW1YvLwbG0pZ+Ex02axiOMGdbFL+MK/wQ0O9g+z+UgUUAa1jKNA7f8ACk
 39ihgxa5S4AY1MTOcFaFqw0bsCw9qMUxhPiTtzn3dQYu8+FfTSsm2/IjEVIHI8c9phfg
 epDA0uCUd1Ak0PYMxjNsa7y917TvG2O0EVSMtkKvveLcahh6+Sps3h3YxtwIvsO3OxMR
 CzZA==
X-Gm-Message-State: AO0yUKWVm8tJ/UAGlGXhHUZzB4Rv3jgVplKpArMpdFiUJBEkaVjcEQgT
 dxT+JU6sQeYa8PCDfD/+Nv1ZZ29qfLcMG5rpwxz939p4iYVbolCDXAcMqXx1PA1+DzkAc2vNxgF
 JG3maema2iCQ/zyI=
X-Received: by 2002:a05:600c:3318:b0:3df:e4b4:de69 with SMTP id
 q24-20020a05600c331800b003dfe4b4de69mr7777306wmp.27.1677767487518; 
 Thu, 02 Mar 2023 06:31:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/X86aChDTYTRO5+oG2gKjbnAvSzfeGuGrwW4YBcE3VbiHc+3dY/OtMpD4L5uWcFqEQIQ8U0Q==
X-Received: by 2002:a05:600c:3318:b0:3df:e4b4:de69 with SMTP id
 q24-20020a05600c331800b003dfe4b4de69mr7777286wmp.27.1677767487230; 
 Thu, 02 Mar 2023 06:31:27 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003e2052bad94sm3502916wms.33.2023.03.02.06.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:31:26 -0800 (PST)
Date: Thu, 2 Mar 2023 15:31:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 5/7] hw/acpi/piix4: Fix offset of GPE0 registers
Message-ID: <20230302153125.2b8c7a07@imammedo.users.ipa.redhat.com>
In-Reply-To: <BC12A842-2845-49DE-B88D-C5A1009BBD80@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-6-shentey@gmail.com>
 <20230125165501.00672bc0@imammedo.users.ipa.redhat.com>
 <BC12A842-2845-49DE-B88D-C5A1009BBD80@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Sun, 29 Jan 2023 14:55:06 +0000
Bernhard Beschow <shentey@gmail.com> wrote:

> Am 25. Januar 2023 15:55:01 UTC schrieb Igor Mammedov <imammedo@redhat.com>:
> >On Sun, 22 Jan 2023 18:07:22 +0100
> >Bernhard Beschow <shentey@gmail.com> wrote:
> >  
> >> The PIIX4 datasheet defines the GPSTS register to be at offset 0x0c of the
> >> power management I/O register block. This register block is represented
> >> in the device model by the io attribute. So make io_gpe a child memory
> >> region of io at offset 0x0c.  
> >
> >to what end?
> >  
> >> Note that SeaBIOS sets the base address of the register block to 0x600,
> >> resulting in the io_gpe block to start at 0x60c. GPE_BASE is defined as
> >> 0xafe0 which is 0xa9d4 bytes off. In order to preserve compatibilty,
> >> create an io_gpe_qemu memory region alias at GPE_BASE.  
> >
> >qemu's io_gpe != piix4(GPSTS)
> >QEMU simply doesn't implement piix4(GPSTS), instead it has implemented
> >custom GPE registers block at 0xafe0 for its hotplug purposes.
> >Bits in both GPE blocks have different meaning,
> >so moving io_gpe to PMBASE+0x0c, would be a bug.
> >
> >Interesting question is what guest gets now when it reads
> >PMBASE+0x0c ?
> >
> >If reads return -1 and guest uses these
> >registers it might get confused since all STS/EN bits
> >are set and writes are ignored. We likely get away
> >with it since these registers aren't used by non ACPI guests
> >(non x86 ones) and x86 ones fetch GPE block from FADT
> >table => not using piix4(GPSTS) at all.
> >So It's a bug to fix (at least make it read as 0s)  
> 
> I see. This wasn't obvious to me and I'll drop this patch.
> 
> How about renaming io_gpe to something communicating that this is purely a "Frankenstein" functionality, e.g. to io_gpe_qemu or io_gpe_hotplug? Any preferences?

I don't think it's worth of effort, io_gpe is not worse that others.

> 
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  include/hw/acpi/piix4.h | 1 +
> >>  hw/acpi/piix4.c         | 9 +++++++--
> >>  2 files changed, 8 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
> >> index 62e1925a1f..4e6cad9e8c 100644
> >> --- a/include/hw/acpi/piix4.h
> >> +++ b/include/hw/acpi/piix4.h
> >> @@ -40,6 +40,7 @@ struct PIIX4PMState {
> >>  
> >>      MemoryRegion io;
> >>      MemoryRegion io_gpe;
> >> +    MemoryRegion io_gpe_qemu;
> >>      ACPIREGS ar;
> >>  
> >>      APMState apm;
> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >> index 2e9bc63fca..836f9026b1 100644
> >> --- a/hw/acpi/piix4.c
> >> +++ b/hw/acpi/piix4.c
> >> @@ -49,6 +49,7 @@
> >>  #include "qom/object.h"
> >>  
> >>  #define GPE_BASE 0xafe0
> >> +#define GPE_OFS 0xc
> >>  #define GPE_LEN 4
> >>  
> >>  #define ACPI_PCIHP_ADDR_PIIX4 0xae00
> >> @@ -429,7 +430,7 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
> >>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_CMD,
> >>                                    &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
> >>      object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
> >> -                                   &s->io_gpe.addr, OBJ_PROP_FLAG_READ);
> >> +                                   &s->io_gpe_qemu.addr, OBJ_PROP_FLAG_READ);
> >>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
> >>                                    &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
> >>      object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
> >> @@ -558,7 +559,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> >>  {
> >>      memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
> >>                            "acpi-gpe0", GPE_LEN);
> >> -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> >> +    memory_region_add_subregion(&s->io, GPE_OFS, &s->io_gpe);
> >> +
> >> +    memory_region_init_alias(&s->io_gpe_qemu, OBJECT(s), "acpi-gpe0-qemu",
> >> +                             &s->io_gpe, 0, memory_region_size(&s->io_gpe));
> >> +    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe_qemu);
> >>  
> >>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
> >>          acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,  
> >  
> 


