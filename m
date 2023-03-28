Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1E6CBEE3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:18:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8GA-0004Vh-1R; Tue, 28 Mar 2023 08:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph8Fz-0004VX-4q
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ph8Fx-0002ad-6p
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680005811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSkCFW4wL2EsLBPbx5zLzMjda8/A20LAS/Qu2EACO6Q=;
 b=WCn2GfZpbKnaMqsjTtJwaXuIFoZUESYBtFNb+8mvivy1jce0RNBQeM9nGxisaeycM0upfg
 4M5OlP9YW/F6UcRMJu5mOBoT+HEfXb8TO4IMWqqXDW6GZ5uqG+kyr9E93ElY4GJNZF9xpd
 HZ+V/bVQXqmaO86onoJFF9/VA4AQTsU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-OICzRgceOiOPIX6zOW2pvQ-1; Tue, 28 Mar 2023 08:16:50 -0400
X-MC-Unique: OICzRgceOiOPIX6zOW2pvQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so17323718edf.16
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680005809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSkCFW4wL2EsLBPbx5zLzMjda8/A20LAS/Qu2EACO6Q=;
 b=2e3SRApsEKlr68EaSYnY0Jm2UJyxTYR0KG3If62FVDqFPAfkxa/YX/BqtQiNZIkw3x
 gbyIQMV/8qPIwaGuLGZBR8441T8/5Caqe0S5NlcxSY4O2AxL5mY0QtUrIPh+iBcA2uX0
 klDd8l8oj7ry+jSXb74SQS1cRgcC1mT9dBz2N+VShBdt68L2lbndGKiQCSt3msp+s9bi
 IJ3tvK2L1GpRQGVnZlkYOHeXrsOeS+2E1Be24Xk5daLqjwdyf4pAuV4g5iGK3VEv5YAZ
 8XIjx/XasgbTIiShs/hhu99zakls5wuefQE00jYpimX/2kLjUK4jdQoaz13omVgnBwrT
 8XvQ==
X-Gm-Message-State: AAQBX9f1W3Jqy3H4GZEupWEFmmd4emaHeWtctVnHhRBKpBEvob/FOzFJ
 MMJ67USbOJuymvmaHvRBCc/MHbWMuNElnYK0ZpaGRvGEesyAPseE0O+ptI7DZHLaiI0En2o7WoV
 E2+zEWYRQVzeFGgY=
X-Received: by 2002:a17:907:3188:b0:8b1:781d:f9a4 with SMTP id
 xe8-20020a170907318800b008b1781df9a4mr18273999ejb.21.1680005809082; 
 Tue, 28 Mar 2023 05:16:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350biOrqSWy5lS7cQ8Cwb1MVW98oCgCm5rnHCbu9kZOZFiyS58DePY8rTAxhyX/SKubhsR84isQ==
X-Received: by 2002:a17:907:3188:b0:8b1:781d:f9a4 with SMTP id
 xe8-20020a170907318800b008b1781df9a4mr18273973ejb.21.1680005808806; 
 Tue, 28 Mar 2023 05:16:48 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090607d100b0093a768b3dddsm9815429ejc.216.2023.03.28.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:16:48 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:16:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, jusual@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: limit warning on acpi table size to pc
 machines older than version 2.3
Message-ID: <20230328141647.554ec2e7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230320112902.90160-1-anisinha@redhat.com>
References: <20230320112902.90160-1-anisinha@redhat.com>
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

On Mon, 20 Mar 2023 16:59:02 +0530
Ani Sinha <anisinha@redhat.com> wrote:

> i440fx machine versions 2.3 and newer and q35 machines supports dynamic ram
> resizing. Please see commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
> Hence the warning when the ACPI table size exceeds a pre-defined value does
> not apply to those machines. Add a check limiting the warning message to only
> those machines that does not support expandable ram blocks, that is, i440fx
> machines with version 2.2 and older.
So q35 is not affected at all? If yes, then mention it here.

> 
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---
>  hw/i386/acpi-build.c | 6 ++++--
>  hw/i386/pc.c         | 1 +
>  hw/i386/pc_piix.c    | 1 +
>  include/hw/i386/pc.h | 3 +++
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b19fb4259e..2311bea082 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          int legacy_table_size =
>              ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>                       ACPI_BUILD_ALIGN_SIZE);
> -        if (tables_blob->len > legacy_table_size) {
> +        if ((tables_blob->len > legacy_table_size) &&
> +            !pcmc->resizable_ram_block) {
>              /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> @@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          g_array_set_size(tables_blob, legacy_table_size);
>      } else {
>          /* Make sure we have a buffer in case we need to resize the tables. */
> -        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> +        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
> +            !pcmc->resizable_ram_block) {
>              /* As of QEMU 2.1, this fires with 160 VCPUs and 255 memory slots.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7bebea57e3..822d5de333 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>      pcmc->pvh_enabled = true;
>      pcmc->kvmclock_create_always = true;
> +    pcmc->resizable_ram_block = true;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = pc_get_hotplug_handler;
>      mc->hotplug_allowed = pc_hotplug_allowed;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2f16011bab..3c74dfcfb4 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -745,6 +745,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
>      compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
>      compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
>      pcmc->rsdp_in_ram = false;
> +    pcmc->resizable_ram_block = false;
>  }
>  
>  DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 8206d5405a..3427a35f73 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -127,6 +127,9 @@ struct PCMachineClass {
>  
>      /* create kvmclock device even when KVM PV features are not exposed */
>      bool kvmclock_create_always;
> +
> +    /* resizable memory block compat */
> +    bool resizable_ram_block;
perhaps more specific
   resizeable_acpi_blob
would be better

>  };
>  
>  #define TYPE_PC_MACHINE "generic-pc-machine"


