Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4D435D94
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:06:49 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdU2C-0001qk-32
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyP-0007SG-9p
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyM-0006Sa-Ha
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806969;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxNV/kgRX5CB4LWX4jPNIHeznfnOIBPM1aW11lE4BRs=;
 b=hWbcPWWQu/+HBxhGZrTqL/Z+sLrWqNJbA4Lpt1fXT3lkL6IePoLRMGHUrfMiAcoqd6vXaH
 FkJPo7mLM9XA5PNO7FRPqKU+5w7yJl8YfIOHS8UQ9MGf9r07JKpxXhEa4h34wvNDUhUaWc
 plXPWLAqgrbgE5GdtcyJ9h8Tcg6n/5k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-Tj3aAmAHOiqNBf87rh1_ow-1; Thu, 21 Oct 2021 05:02:48 -0400
X-MC-Unique: Tj3aAmAHOiqNBf87rh1_ow-1
Received: by mail-wr1-f72.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso4105283wrj.20
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oxNV/kgRX5CB4LWX4jPNIHeznfnOIBPM1aW11lE4BRs=;
 b=j3ofcV+e7QizxTb53AvWeOXUrjuMg2Nyoi5Cr6EYmqnPN6koHc/+yN9w4914g/Gb+K
 kSrVUS/Q4EpwB2Rlp64qLr6Q8itpJQSanNNREtDeApJnW8iFeaMdd9buWoVeokQNKEB7
 08/NJ5lFwxyT2HrsF212msuBIfU67E5IrPRKZFwcY9ALQCRHMAv6LHgQqD/apnFyjbOj
 SZkLdjW4/oGoKHa6IjQsuA9y7SR24Wqc8gpwG/pSlTZSgPVZqV9xMNHC3ZBLe+zqEKXN
 P61hXguAKInlqtAixk50xLnr2igKclY37lOKKI02MOztdBNe0/JLrVEIjBzNpRjY8Ckf
 Xg+A==
X-Gm-Message-State: AOAM531PgfPfcagtnax07qg26JEBsvoSacc0uWouCHBrYjMM7F/ASNhy
 kEEQZ0Hk83CritXefGSVB57FN2k4gY0/pKrQt5jkoehNC1W6IQ9MbHQD1wi8/P0zAhS4jJ1DaIg
 c8BIY/6Yj2tqJXZw=
X-Received: by 2002:adf:a294:: with SMTP id s20mr5813480wra.34.1634806967132; 
 Thu, 21 Oct 2021 02:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQB05sO1gHcW7RZkYklWPY2qcFm6noLG2Oe0gv22PNSVna2srXW7kAR6YR7ZiuMJtYVYpGDA==
X-Received: by 2002:adf:a294:: with SMTP id s20mr5813439wra.34.1634806966858; 
 Thu, 21 Oct 2021 02:02:46 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y191sm8434109wmc.36.2021.10.21.02.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:46 -0700 (PDT)
Subject: Re: [PATCH v5 02/12] hw/i386/pc: Remove x86_iommu_get_type()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6dd6fc1d-1698-274c-82d4-468433e3db5f@redhat.com>
Date: Thu, 21 Oct 2021 11:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-3-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
> instead of a special IommuType value.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Looks good to me

Thanks

Eric

> ---
>  include/hw/i386/x86-iommu.h | 12 ------------
>  hw/i386/acpi-build.c        | 20 +++++++++-----------
>  hw/i386/amd_iommu.c         |  2 --
>  hw/i386/intel_iommu.c       |  3 ---
>  hw/i386/x86-iommu-stub.c    |  5 -----
>  hw/i386/x86-iommu.c         |  5 -----
>  6 files changed, 9 insertions(+), 38 deletions(-)
>
> diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
> index 9de92d33a1..5ba0c056d6 100644
> --- a/include/hw/i386/x86-iommu.h
> +++ b/include/hw/i386/x86-iommu.h
> @@ -33,12 +33,6 @@ OBJECT_DECLARE_TYPE(X86IOMMUState, X86IOMMUClass, X86_IOMMU_DEVICE)
>  typedef struct X86IOMMUIrq X86IOMMUIrq;
>  typedef struct X86IOMMU_MSIMessage X86IOMMU_MSIMessage;
>  
> -typedef enum IommuType {
> -    TYPE_INTEL,
> -    TYPE_AMD,
> -    TYPE_NONE
> -} IommuType;
> -
>  struct X86IOMMUClass {
>      SysBusDeviceClass parent;
>      /* Intel/AMD specific realize() hook */
> @@ -71,7 +65,6 @@ struct X86IOMMUState {
>      OnOffAuto intr_supported;   /* Whether vIOMMU supports IR */
>      bool dt_supported;          /* Whether vIOMMU supports DT */
>      bool pt_supported;          /* Whether vIOMMU supports pass-through */
> -    IommuType type;             /* IOMMU type - AMD/Intel     */
>      QLIST_HEAD(, IEC_Notifier) iec_notifiers; /* IEC notify list */
>  };
>  
> @@ -140,11 +133,6 @@ struct X86IOMMU_MSIMessage {
>   */
>  X86IOMMUState *x86_iommu_get_default(void);
>  
> -/*
> - * x86_iommu_get_type - get IOMMU type
> - */
> -IommuType x86_iommu_get_type(void);
> -
>  /**
>   * x86_iommu_iec_register_notifier - register IEC (Interrupt Entry
>   *                                   Cache) notifiers
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81418b7911..ab49e799ff 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2488,6 +2488,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      PCMachineState *pcms = PC_MACHINE(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(machine);
> +    X86IOMMUState *iommu = x86_iommu_get_default();
>      GArray *table_offsets;
>      unsigned facs, dsdt, rsdt, fadt;
>      AcpiPmInfo pm;
> @@ -2604,17 +2605,14 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
>                     x86ms->oem_table_id);
>      }
> -    if (x86_iommu_get_default()) {
> -        IommuType IOMMUType = x86_iommu_get_type();
> -        if (IOMMUType == TYPE_AMD) {
> -            acpi_add_table(table_offsets, tables_blob);
> -            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> -                            x86ms->oem_table_id);
> -        } else if (IOMMUType == TYPE_INTEL) {
> -            acpi_add_table(table_offsets, tables_blob);
> -            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> -                           x86ms->oem_table_id);
> -        }
> +    if (object_dynamic_cast(OBJECT(iommu), TYPE_AMD_IOMMU_DEVICE)) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> +                        x86ms->oem_table_id);
> +    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_INTEL_IOMMU_DEVICE)) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> +                       x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 9242a0d3ed..91fe34ae58 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1538,7 +1538,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>  {
>      int ret = 0;
>      AMDVIState *s = AMD_IOMMU_DEVICE(dev);
> -    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
>      MachineState *ms = MACHINE(qdev_get_machine());
>      PCMachineState *pcms = PC_MACHINE(ms);
>      X86MachineState *x86ms = X86_MACHINE(ms);
> @@ -1548,7 +1547,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>                                       amdvi_uint64_equal, g_free, g_free);
>  
>      /* This device should take care of IOMMU PCI properties */
> -    x86_iommu->type = TYPE_AMD;
>      if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
>          return;
>      }
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 75f075547f..c27b20090e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3806,9 +3806,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
>      X86MachineState *x86ms = X86_MACHINE(ms);
>      PCIBus *bus = pcms->bus;
>      IntelIOMMUState *s = INTEL_IOMMU_DEVICE(dev);
> -    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
> -
> -    x86_iommu->type = TYPE_INTEL;
>  
>      if (!vtd_decide_config(s, errp)) {
>          return;
> diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
> index c5ba077f9d..781b5ff922 100644
> --- a/hw/i386/x86-iommu-stub.c
> +++ b/hw/i386/x86-iommu-stub.c
> @@ -36,8 +36,3 @@ bool x86_iommu_ir_supported(X86IOMMUState *s)
>  {
>      return false;
>  }
> -
> -IommuType x86_iommu_get_type(void)
> -{
> -    abort();
> -}
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..dc968c7a53 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -98,11 +98,6 @@ X86IOMMUState *x86_iommu_get_default(void)
>      return x86_iommu_default;
>  }
>  
> -IommuType x86_iommu_get_type(void)
> -{
> -    return x86_iommu_default->type;
> -}
> -
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);


