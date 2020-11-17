Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65B2B6B77
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:15:24 +0100 (CET)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Zf-000181-Ep
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kf4F5-0003GG-A6
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kf4F1-0007K0-Or
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605632041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y4o3s9ejNVx1IUie8C1SfuX/g4e20xz8EV0i3FT5lJg=;
 b=WLRss/bxhZ/jvexhtP24YMfDkvJgds3yvswcjCojZNW1duGfMsyIHs/DkjVnAp3KDo0tC9
 jeTlZBSIXT3zHCeJbvKkIiZ8qehv1x5BgOGqjCE9xwksRvwr19I2DOkKgyF6deIwreP7Wx
 a8FZtJ1E28DGH6bBgYsiQeRnHB764Jg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-JT1G7RB9NpKc_YmfqsSVZg-1; Tue, 17 Nov 2020 11:53:59 -0500
X-MC-Unique: JT1G7RB9NpKc_YmfqsSVZg-1
Received: by mail-wr1-f72.google.com with SMTP id h11so13149822wrq.20
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y4o3s9ejNVx1IUie8C1SfuX/g4e20xz8EV0i3FT5lJg=;
 b=mLUmqPQ956/qiOb0fOE6pfMLgNWOUrk3sfZ8jpkgCASNb6rzW1BVlZ8Gr3VAIl5GCZ
 4BwYMFrFtN8YD9VwwLOMU/Fa99c/TqEWBbxLVU4cZHG04x+gR6dzctZXzSgWGQNdcqz0
 OsxxVqZhEN9fqFOi5Y7xzfjZjl/qPWeGYc5AAhoVLtOwGxkmKpXoSNLTtTGWjx8JuO3e
 W+g8VkrkTo9kFEBJgh6NF6Ts8reOcre+2qacpThI7iWPCPLQB0y/y4SHzVkIcCCWeKqs
 4gZahOre1bFnfexPNMAlfuHuQ9LGH4fXuVQ8dwwvqpSL3co7tIJDxia68KmsTXdH+DvJ
 DSBw==
X-Gm-Message-State: AOAM532LsEcML6LRO3nEYN+QZzN3cS2oxzbHx/WzHDYg7fHuwCWuXtbs
 QzFIqwZqWaYtleTTFz0jRJtHMx6NWJMEszZWB7MYCJlEX7/Y2v9GtHW5yfz5ENFYgaOb5sV11GH
 uFtVpLdVhEvHd0Kw=
X-Received: by 2002:a5d:5450:: with SMTP id w16mr379966wrv.425.1605632038191; 
 Tue, 17 Nov 2020 08:53:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCYfr1tysM4EmMCJQZZ4bUk6FIpOVBMOTONZ1BuwtXOOgfkItKrOy84NoEu569szIxZ3Gp/g==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr379938wrv.425.1605632037672; 
 Tue, 17 Nov 2020 08:53:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id c5sm18888868wrb.64.2020.11.17.08.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:56 -0800 (PST)
Date: Tue, 17 Nov 2020 11:53:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Erich Mcmillan <erich.mcmillan@hp.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Message-ID: <20201117115329-mutt-send-email-mst@kernel.org>
References: <20200925175751.4017-1-erich.mcmillan@hp.com>
MIME-Version: 1.0
In-Reply-To: <20200925175751.4017-1-erich.mcmillan@hp.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, kraxel@redhat.com,
 imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 05:57:51PM +0000, Erich Mcmillan wrote:
> From: Erich McMillan <erich.mcmillan@hp.com>
> 
> At Hewlett Packard Inc. we have a need for increased fw size to enable testing of our custom fw.
> Move return statement for early return
> 
> Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>

My bad that I dropped it by mistake before code freeze.
I will queue it for the next release.

> ---
> 
> Changes since v5:
> 
>      Move return statement for pc_machine_set_max_fw_size() to follow error_setg() as early return.
> 
>  hw/i386/pc.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_sysfw.c   | 13 ++---------
>  include/hw/i386/pc.h |  2 ++
>  3 files changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d11daacc23..70c8c9adcf 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1869,6 +1869,50 @@ static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
>      pcms->max_ram_below_4g = value;
>  }
>  
> +static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    uint64_t value = pcms->max_fw_size;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    Error *error = NULL;
> +    uint64_t value;
> +
> +    visit_type_size(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    /*
> +    * We don't have a theoretically justifiable exact lower bound on the base
> +    * address of any flash mapping. In practice, the IO-APIC MMIO range is
> +    * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
> +    * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
> +    * size.
> +    */
> +    if (value > 16 * MiB) {
> +        error_setg(errp,
> +                   "User specified max allowed firmware size %" PRIu64 " is "
> +                   "greater than 16MiB. If combined firwmare size exceeds "
> +                   "16MiB the system may not boot, or experience intermittent"
> +                   "stability issues.",
> +                   value);
> +        return;
> +    }
> +
> +    pcms->max_fw_size = value;
> +}
> +
>  static void pc_machine_initfn(Object *obj)
>  {
>      PCMachineState *pcms = PC_MACHINE(obj);
> @@ -1884,6 +1928,7 @@ static void pc_machine_initfn(Object *obj)
>      pcms->smbus_enabled = true;
>      pcms->sata_enabled = true;
>      pcms->pit_enabled = true;
> +    pcms->max_fw_size = 8 * MiB;
>  
>      pc_system_flash_create(pcms);
>      pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
> @@ -2004,6 +2049,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>  
>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>          pc_machine_get_pit, pc_machine_set_pit);
> +
> +    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
> +        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
> +        "Maximum combined firmware size");
>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index b6c0822fe3..22450ba0ef 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -39,15 +39,6 @@
>  #include "hw/block/flash.h"
>  #include "sysemu/kvm.h"
>  
> -/*
> - * We don't have a theoretically justifiable exact lower bound on the base
> - * address of any flash mapping. In practice, the IO-APIC MMIO range is
> - * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
> - * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
> - * size.
> - */
> -#define FLASH_SIZE_LIMIT (8 * MiB)
> -
>  #define FLASH_SECTOR_SIZE 4096
>  
>  static void pc_isa_bios_init(MemoryRegion *rom_memory,
> @@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
>          }
>          if ((hwaddr)size != size
>              || total_size > HWADDR_MAX - size
> -            || total_size + size > FLASH_SIZE_LIMIT) {
> +            || total_size + size > pcms->max_fw_size) {
>              error_report("combined size of system firmware exceeds "
>                           "%" PRIu64 " bytes",
> -                         FLASH_SIZE_LIMIT);
> +                         pcms->max_fw_size);
>              exit(1);
>          }
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index fe52e165b2..f7c8e7cbfe 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -43,6 +43,7 @@ struct PCMachineState {
>      bool smbus_enabled;
>      bool sata_enabled;
>      bool pit_enabled;
> +    uint64_t max_fw_size;
>  
>      /* NUMA information: */
>      uint64_t numa_nodes;
> @@ -59,6 +60,7 @@ struct PCMachineState {
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
> +#define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
>  
>  /**
>   * PCMachineClass:
> -- 
> 2.25.1


