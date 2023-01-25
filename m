Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7370E67B66F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKi7F-0001dh-HL; Wed, 25 Jan 2023 10:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKi7C-0001W2-93
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKi79-0006my-Sd
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674662106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWQOXjPTXrLgxWIeEISC5CPg8YGtnTOMj7w0xqs/Xmw=;
 b=OSmFClNlT9h9RSMuZw9htukUTeDCC+he6ojVil3NOxb5KV+KPXDflJl4FcCzwd+fy+MajE
 cuaP8IIvs4r2XLxkY0tkWlEBHPrriWZmg4/lnhZ0yTTY+EYjTcJctfDZt217BYSFDlrVJT
 ql8Ha8Z79SEsaI9E8r/ZjUVJTaKqPB0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-ZevrErErOKuqyWoJnZ02pA-1; Wed, 25 Jan 2023 10:55:04 -0500
X-MC-Unique: ZevrErErOKuqyWoJnZ02pA-1
Received: by mail-ej1-f71.google.com with SMTP id
 nd38-20020a17090762a600b00871ff52c6b5so12207025ejc.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 07:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWQOXjPTXrLgxWIeEISC5CPg8YGtnTOMj7w0xqs/Xmw=;
 b=oIHdE+a+gLwmtX9Q27b1YZYTyG9i392yZ0W3WRXiT4dYnxgTB/qdRteBtnFBfKQCX7
 TF2Vi6ZO4S7QSRYH7fUZdZHAi6+LuSbxapgutHTpWBl6sKAfOsjRZkPsnQnb35JcgDSU
 XVrnz+Pu0jFnvMyiTqcyS3cS3Ebla2Quot3IDrQe+PxM+zIzV7d5torJYUStR9sIGgt5
 gTYXXjEhF2myUFkthjTfyCtCImiE4AisA1NVn4XZfvIA6S64M6OeDpLDqYBqAO1ApvZp
 ALjqO7MJ8UzuHQ5B+eOTXJYMz8tlqe0n6T7nDSCxTNYcaJcIwN63dlbGNM+SkwsRO6qj
 oVYw==
X-Gm-Message-State: AFqh2kr7TwA2xDZC4MzbglFLqjcCkfBBQsUyDAtmWZ97LkKkmJplk7DU
 SxfSr6PDdT5U2wxk6QnI8E5VM6dDo03mhPuhWSRw34CFusjwD4eHxXNWXPxKGdQtSe44/MQNbO4
 run4DB/q65tIxYhw=
X-Received: by 2002:a05:6402:1bdd:b0:499:376e:6b35 with SMTP id
 ch29-20020a0564021bdd00b00499376e6b35mr32226397edb.25.1674662103385; 
 Wed, 25 Jan 2023 07:55:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv/2jVq582CS5HbRx9JXyHVPLzDejWB0Pbp47Sb0UjjIzMfX7rGYBxTd/TnRFsLpxqwRmJtBw==
X-Received: by 2002:a05:6402:1bdd:b0:499:376e:6b35 with SMTP id
 ch29-20020a0564021bdd00b00499376e6b35mr32226382edb.25.1674662103174; 
 Wed, 25 Jan 2023 07:55:03 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa7de81000000b00488117821ffsm2539946edv.31.2023.01.25.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 07:55:02 -0800 (PST)
Date: Wed, 25 Jan 2023 16:55:01 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 5/7] hw/acpi/piix4: Fix offset of GPE0 registers
Message-ID: <20230125165501.00672bc0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230122170724.21868-6-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-6-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Sun, 22 Jan 2023 18:07:22 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The PIIX4 datasheet defines the GPSTS register to be at offset 0x0c of the
> power management I/O register block. This register block is represented
> in the device model by the io attribute. So make io_gpe a child memory
> region of io at offset 0x0c.

to what end?

> Note that SeaBIOS sets the base address of the register block to 0x600,
> resulting in the io_gpe block to start at 0x60c. GPE_BASE is defined as
> 0xafe0 which is 0xa9d4 bytes off. In order to preserve compatibilty,
> create an io_gpe_qemu memory region alias at GPE_BASE.

qemu's io_gpe != piix4(GPSTS)
QEMU simply doesn't implement piix4(GPSTS), instead it has implemented
custom GPE registers block at 0xafe0 for its hotplug purposes.
Bits in both GPE blocks have different meaning,
so moving io_gpe to PMBASE+0x0c, would be a bug.

Interesting question is what guest gets now when it reads
PMBASE+0x0c ?

If reads return -1 and guest uses these
registers it might get confused since all STS/EN bits
are set and writes are ignored. We likely get away
with it since these registers aren't used by non ACPI guests
(non x86 ones) and x86 ones fetch GPE block from FADT
table => not using piix4(GPSTS) at all.
So It's a bug to fix (at least make it read as 0s)


> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/acpi/piix4.h | 1 +
>  hw/acpi/piix4.c         | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
> index 62e1925a1f..4e6cad9e8c 100644
> --- a/include/hw/acpi/piix4.h
> +++ b/include/hw/acpi/piix4.h
> @@ -40,6 +40,7 @@ struct PIIX4PMState {
>  
>      MemoryRegion io;
>      MemoryRegion io_gpe;
> +    MemoryRegion io_gpe_qemu;
>      ACPIREGS ar;
>  
>      APMState apm;
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 2e9bc63fca..836f9026b1 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -49,6 +49,7 @@
>  #include "qom/object.h"
>  
>  #define GPE_BASE 0xafe0
> +#define GPE_OFS 0xc
>  #define GPE_LEN 4
>  
>  #define ACPI_PCIHP_ADDR_PIIX4 0xae00
> @@ -429,7 +430,7 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_ACPI_DISABLE_CMD,
>                                    &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
>      object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK,
> -                                   &s->io_gpe.addr, OBJ_PROP_FLAG_READ);
> +                                   &s->io_gpe_qemu.addr, OBJ_PROP_FLAG_READ);
>      object_property_add_uint8_ptr(OBJECT(s), ACPI_PM_PROP_GPE0_BLK_LEN,
>                                    &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
>      object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
> @@ -558,7 +559,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>  {
>      memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
>                            "acpi-gpe0", GPE_LEN);
> -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> +    memory_region_add_subregion(&s->io, GPE_OFS, &s->io_gpe);
> +
> +    memory_region_init_alias(&s->io_gpe_qemu, OBJECT(s), "acpi-gpe0-qemu",
> +                             &s->io_gpe, 0, memory_region_size(&s->io_gpe));
> +    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe_qemu);
>  
>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
>          acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,


