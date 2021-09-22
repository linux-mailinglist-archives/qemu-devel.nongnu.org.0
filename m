Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582C414593
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:53:02 +0200 (CEST)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSyw1-0001Gi-Ay
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSytO-00088w-Jc
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSytL-0001i2-Tt
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632304214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZHAlkuRdILcAgLrPvnFkrvBAEx9/rMp/Lfikfv1uUE=;
 b=PlulaWgQIwp4uCLfodRFLF+JN0pywnLF2iUpuTjCHCfbLBFxSfz3TIY/nEs4rJquzXlXhZ
 ixk8SqVMJ8kZWHvqIjmdL76sXQFKc4UEWwNpXRT13ZtgrdGP34A6rEbsehwuc9FnfU06TN
 JBErZwkWAu/HMkSukvnoku/LNeMIcBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-EtChzf3eN5eeDazP9JksYg-1; Wed, 22 Sep 2021 05:50:12 -0400
X-MC-Unique: EtChzf3eN5eeDazP9JksYg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so1635991wrh.8
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AZHAlkuRdILcAgLrPvnFkrvBAEx9/rMp/Lfikfv1uUE=;
 b=d6AGAAumoL7vyIGqcY7UTNEgDU0zj2bGO6yem66Yda9GPOqvlPLDBAt5tnc4bku1uV
 3ucfsR97gYVhQyvrAUICIXcmoKEtmaykcZS4qKN6jVpQxCV2bSUzQ4E+sPB+eJNvtdOv
 mtp8P62s9Ud0zaiBUpLzisRa8yHnALLs/2WMUOKwHb0w+Ptg1ZlDLT8ONImx3K4TM9++
 gJbk5rHGc2jF6Yu2wqFh/VAW0FzbGOQsJPuI1y5domtJP6fieb/SOsuNlCL4oQkCsdJL
 VhLagzNT3Iaez/UsqMm/mhNZy9s/A9k0Ne18n0LWFr3dMtBh+KqVsJl9YR7iXHhssEe9
 cnqA==
X-Gm-Message-State: AOAM532N9Xp+kM/8XLs64NUOEU4D9KU7FUhAVQxp0Az9NwDY7AE3fHi0
 ETK6+OCroJMyGLwiyxuATvVAG3ISkisRWRAfMXtLF4kk6n8Pe/05Kwcm3u0n5SLfaOklpnIVQBl
 kPdSX4/905VDQQlY=
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr39424852wrw.224.1632304211656; 
 Wed, 22 Sep 2021 02:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwblNJeRPNGPvA5fTY0ivwS2lmSS0/iLKjI/UdFJMskfZnGfJs5Tge6ICvHijr9Emz+S4aw9g==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr39424820wrw.224.1632304211349; 
 Wed, 22 Sep 2021 02:50:11 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id s13sm5568043wmc.47.2021.09.22.02.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:50:10 -0700 (PDT)
Subject: Re: [PATCH v3 23/35] acpi: x86: set enabled when composing _MAT
 entries
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-24-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <2e735fa1-b990-0cad-c80e-83c0bd0c6ac7@redhat.com>
Date: Wed, 22 Sep 2021 11:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-24-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> Instead of composing disabled _MAT entry and then later on
> patching it to enabled for hotpluggbale CPUs in DSDT,
> set it to enabled at the time _MAT entry is built.
> 
> It will allow to drop usage of packed structures in
> following patches when build_madt() is switched to use
> build_append_int_noprefix() API.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: marcel.apfelbaum@gmail.com
> ---
>  include/hw/acpi/acpi_dev_interface.h |  3 ++-
>  include/hw/i386/pc.h                 |  6 +++---
>  hw/acpi/acpi-x86-stub.c              |  3 ++-
>  hw/acpi/cpu.c                        | 17 ++---------------
>  hw/i386/acpi-common.c                | 18 ++++++------------
>  5 files changed, 15 insertions(+), 32 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> index 769ff55c7e..ea6056ab92 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -53,6 +53,7 @@ struct AcpiDeviceIfClass {
>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
>      void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
> -                     const CPUArchIdList *apic_ids, GArray *entry);
> +                     const CPUArchIdList *apic_ids, GArray *entry,
> +                     bool force_enabled);
>  };
>  #endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 4d2e35a152..82cf7b7e30 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -187,10 +187,10 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>                                 int *data_len);
>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
>  
> -
> -/* acpi-build.c */
> +/* hw/i386/acpi-common.c */
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry);
> +                       const CPUArchIdList *apic_ids, GArray *entry,
> +                       bool force_enabled);
>  
>  extern GlobalProperty pc_compat_6_1[];
>  extern const size_t pc_compat_6_1_len;
> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> index e9e46c5c5f..3df1e090f4 100644
> --- a/hw/acpi/acpi-x86-stub.c
> +++ b/hw/acpi/acpi-x86-stub.c
> @@ -3,7 +3,8 @@
>  #include "hw/i386/acpi-build.h"
>  
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry)
> +                       const CPUArchIdList *apic_ids, GArray *entry,
> +                       bool force_enabled)
>  {
>  }
>  
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f82e9512fd..b20903ea30 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -669,21 +669,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>  
>              /* build _MAT object */
>              assert(adevc && adevc->madt_cpu);
> -            adevc->madt_cpu(adev, i, arch_ids, madt_buf);
> -            switch (madt_buf->data[0]) {
> -            case ACPI_APIC_PROCESSOR: {
> -                AcpiMadtProcessorApic *apic = (void *)madt_buf->data;
> -                apic->flags = cpu_to_le32(1);
> -                break;
> -            }
> -            case ACPI_APIC_LOCAL_X2APIC: {
> -                AcpiMadtProcessorX2Apic *apic = (void *)madt_buf->data;
> -                apic->flags = cpu_to_le32(1);
> -                break;
> -            }
> -            default:
> -                assert(0);
> -            }
> +            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
> +                            true); /* set enabled flag */
>              aml_append(dev, aml_name_decl("_MAT",
>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
>              g_array_free(madt_buf, true);
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index a0cde1d874..7983a13a93 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -34,9 +34,11 @@
>  #include "acpi-common.h"
>  
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry)
> +                       const CPUArchIdList *apic_ids, GArray *entry,
> +                       bool force_enabled)
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> +    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 : 0;
>  
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -51,11 +53,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>          apic->length = sizeof(*apic);
>          apic->processor_id = uid;
>          apic->local_apic_id = apic_id;
> -        if (apic_ids->cpus[uid].cpu != NULL) {
> -            apic->flags = cpu_to_le32(1);
> -        } else {
> -            apic->flags = cpu_to_le32(0);
> -        }
> +        apic->flags = cpu_to_le32(flags);
>      } else {
>          AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
>  
> @@ -63,11 +61,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>          apic->length = sizeof(*apic);
>          apic->uid = cpu_to_le32(uid);
>          apic->x2apic_id = cpu_to_le32(apic_id);
> -        if (apic_ids->cpus[uid].cpu != NULL) {
> -            apic->flags = cpu_to_le32(1);
> -        } else {
> -            apic->flags = cpu_to_le32(0);
> -        }
> +        apic->flags = cpu_to_le32(flags);
>      }
>  }
>  
> @@ -96,7 +90,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
>  
>      for (i = 0; i < apic_ids->len; i++) {
> -        adevc->madt_cpu(adev, i, apic_ids, table_data);
> +        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
>          if (apic_ids->cpus[i].arch_id > 254) {
>              x2apic_mode = true;
>          }
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


