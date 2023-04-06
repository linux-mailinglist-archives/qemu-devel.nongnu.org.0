Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66DF6D8F51
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:23:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJ10-0001ob-Fp; Thu, 06 Apr 2023 02:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pkJ0s-0001oA-KC
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pkJ0q-0003Ui-OQ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680762143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJb4t8TvCUEcRPoOfCv39K3OPAdKPFx7O9PLrxsnDmw=;
 b=eQokO06jiUXBeLuFSogTsKNecBp12Kdf69/AljjmWJZMxg2V0dCTrlxhCqTIPwIoDUYe+4
 eBx7tkuvJE351tZg+vYM8hUO9DPmXk7dw/lgLa3LJgWE5Qu+RCw/VVKHJnJq6rM97ChhwA
 N1QdxcuGL47dUUZJGl8iNmatdyVfwFA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-Wvn-iFKSMSKz7HgJwbstdA-1; Thu, 06 Apr 2023 02:22:14 -0400
X-MC-Unique: Wvn-iFKSMSKz7HgJwbstdA-1
Received: by mail-pg1-f197.google.com with SMTP id
 d34-20020a630e22000000b005039e28b68cso11562687pgl.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 23:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680762132;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJb4t8TvCUEcRPoOfCv39K3OPAdKPFx7O9PLrxsnDmw=;
 b=3gGZK7XqK0T9nUhyWpamLyVqxoSgeDLd7dnqcMsktso/0m3lzpiCxeAPxBATrX+N/U
 O23NZ1m7z9OaPT6p08zXDYGkE/vUYehtO64zIvC3GNEh1RUvhRNesqSC9e7U+anxHWhs
 yYd5a8BQKJTfesCkuINGHTTeGVfLr52Bi9mzCagSkhPJZXD0GkJGa3JpXoKD0z3nv4L9
 K4zOoxUAuAfaXtIARWEAKCbY0e9mZ70T8rIhAJkET/UFv4p5z/LahuZexfSJwdOZsOSy
 Y86v1MAs9zV104HR1FJC81dSHVG/ggFJYTs12FdxAAyBc/ieduQoFw0lfU18+aF2VXMO
 YUig==
X-Gm-Message-State: AAQBX9dyAnNFTmaj/qIkoHdm59vf8WaPFjmGBXwyTHM7xt+JCxZoX2Wo
 LP4oZFh0w1DI49PozMm4rd7q35RGhbLaRrgHz4nCytqmmm6JeR9HSpyZnHmvG60IfDDYdscM3ul
 7hDCHLD5aTFdutSo=
X-Received: by 2002:a17:90b:685:b0:23f:58a2:7d6d with SMTP id
 m5-20020a17090b068500b0023f58a27d6dmr10021859pjz.6.1680762132518; 
 Wed, 05 Apr 2023 23:22:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYcqohx98lzlOR8fU6lgmk1vKvbZO24qw6N74Ixhql5uWftZExWbJ6gjKVssSDMu+bZ9ILbw==
X-Received: by 2002:a17:90b:685:b0:23f:58a2:7d6d with SMTP id
 m5-20020a17090b068500b0023f58a27d6dmr10021843pjz.6.1680762132199; 
 Wed, 05 Apr 2023 23:22:12 -0700 (PDT)
Received: from fc37-ani ([115.96.127.238])
 by smtp.googlemail.com with ESMTPSA id
 cm16-20020a17090afa1000b0023d3845b02bsm84583pjb.45.2023.04.05.23.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 23:22:11 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:52:06 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/acpi: limit warning on acpi table size to pc
 machines older than version 2.3
In-Reply-To: <20230329045726.14028-1-anisinha@redhat.com>
Message-ID: <600015c2-e8ec-f444-15ff-0c3e97170da7@redhat.com>
References: <20230329045726.14028-1-anisinha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
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

Ping ...

On Wed, 29 Mar 2023, Ani Sinha wrote:

> i440fx machine versions 2.3 and newer supports dynamic ram
> resizing. See commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
> Currently supported all q35 machine types (versions 2.4 and newer) supports
> resizable RAM/ROM blocks.Therefore the warning generated when the ACPI table
> size exceeds a pre-defined value does not apply to those machine versions.
> Add a check limiting the warning message to only those machines that does not
> support expandable ram blocks (that is, i440fx machines with version 2.2
> and older).
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
> index b19fb4259e..91be76e61f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          int legacy_table_size =
>              ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>                       ACPI_BUILD_ALIGN_SIZE);
> -        if (tables_blob->len > legacy_table_size) {
> +        if ((tables_blob->len > legacy_table_size) &&
> +            !pcmc->resizable_acpi_blob) {
>              /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> @@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          g_array_set_size(tables_blob, legacy_table_size);
>      } else {
>          /* Make sure we have a buffer in case we need to resize the tables. */
> -        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> +        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
> +            !pcmc->resizable_acpi_blob) {
>              /* As of QEMU 2.1, this fires with 160 VCPUs and 255 memory slots.  */
>              warn_report("ACPI table size %u exceeds %d bytes,"
>                          " migration may not work",
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7bebea57e3..2b66985013 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>      pcmc->pvh_enabled = true;
>      pcmc->kvmclock_create_always = true;
> +    pcmc->resizable_acpi_blob = true;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = pc_get_hotplug_handler;
>      mc->hotplug_allowed = pc_hotplug_allowed;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2f16011bab..8f7b3ae11b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -745,6 +745,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
>      compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
>      compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
>      pcmc->rsdp_in_ram = false;
> +    pcmc->resizable_acpi_blob = false;
>  }
>
>  DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 8206d5405a..6008eb045a 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -127,6 +127,9 @@ struct PCMachineClass {
>
>      /* create kvmclock device even when KVM PV features are not exposed */
>      bool kvmclock_create_always;
> +
> +    /* resizable acpi blob compat */
> +    bool resizable_acpi_blob;
>  };
>
>  #define TYPE_PC_MACHINE "generic-pc-machine"
> --
> 2.39.2
>
>


