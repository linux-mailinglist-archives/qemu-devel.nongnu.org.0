Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B104B530C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:18:36 +0100 (CET)
Received: from localhost ([::1]:57532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcBX-0006mF-4c
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJbGU-0008Pp-9b
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJbGR-0003GQ-Rf
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644844775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OUxvNLwaKmdCsSpZ6Hk+UPd8zn4CT1So13l3tNnQuY=;
 b=jFvp1OhExch12hP8Kj8dJTtM24J0R4gXWCfvjQDvuu9KpEmCrv/8ay3tcwmX94zxp5qk3z
 S3Rnoi0syxhonyyOxmutj20AFv/ne8/lPenaPPDwvDeh7648ycYgIZ1G0QC+h3XaEqd6EE
 7K8Afo0bJIfUIW545Du1MnwkoPQbZ4E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-_LrH27CaOkm7KLDt364rCA-1; Mon, 14 Feb 2022 08:19:34 -0500
X-MC-Unique: _LrH27CaOkm7KLDt364rCA-1
Received: by mail-ed1-f72.google.com with SMTP id
 f9-20020a056402354900b0040fb9c35a02so10242002edd.18
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OUxvNLwaKmdCsSpZ6Hk+UPd8zn4CT1So13l3tNnQuY=;
 b=1wY7f0zUlFafxxwESbfaIOToL4e08CulmqjlFmygIaCvAazh0/pv6OvPVJz0psJ/k6
 7cuwqSn6Xpf2W4616Ptmus9IQSHw4GN3Odvu9pm3nAlj1H+cJUPdGY+S1YiSA7q+Ve5F
 KQcaBBFH/KEkIrlM9BLuQYJ/eZonvnbwmHg1UC4wnW5nTSm38+ri6AMtri6K69a0ovCs
 ExXRJtpu0a0vJdYDzifU+f/x7SI3esEF47tRn/rffOjGpvsIIdhXSREd+yhqs/gOdev5
 8pHzNxI9e5pn7qmlT3cz1TRg/XWXufzb+qQV57+CvHEfYiZ1SPLKD82xobeIFhCh3fzI
 HocA==
X-Gm-Message-State: AOAM5307/O+IerB5sYfeqSSJEgQMwDHHD0iOlotP7RyGUhMF0+2IpDXy
 04YufFiQe2CrqRwKHPxPSXwmaElH/EuVQcneC6rxYBLvHT9XE6Hv3cyyo1TMmy2tPVLOqsZ8OsW
 a8SWJ2nsRCVrSKbA=
X-Received: by 2002:a17:907:1b09:: with SMTP id
 mp9mr11272611ejc.587.1644844773062; 
 Mon, 14 Feb 2022 05:19:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywbQtarG8mur+vTW+pLNhdB73ltt2rqrsMW4DVERMuZQMWvvEyUsTmqQglfc+fmbPQZcPv/Q==
X-Received: by 2002:a17:907:1b09:: with SMTP id
 mp9mr11272593ejc.587.1644844772836; 
 Mon, 14 Feb 2022 05:19:32 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d25sm10600307ejz.4.2022.02.14.05.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:19:32 -0800 (PST)
Date: Mon, 14 Feb 2022 14:19:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 1/4] hw/i386: add 4g boundary start to
 X86MachineState
Message-ID: <20220214141931.61b87d43@redhat.com>
In-Reply-To: <20220207202422.31582-2-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-2-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  7 Feb 2022 20:24:19 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Rather than hardcoding the 4G boundary everywhere, introduce a
> X86MachineState property @above_4g_mem_start and use it
> accordingly.
> 
> This is in preparation for relocating ram-above-4g to be
> dynamically start at 1T on AMD platforms.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/acpi-build.c  | 2 +-
>  hw/i386/pc.c          | 9 +++++----
>  hw/i386/sgx.c         | 2 +-
>  hw/i386/x86.c         | 1 +
>  include/hw/i386/x86.h | 3 +++
>  5 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26fd8..4bf54ccdab91 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2063,7 +2063,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>                  build_srat_memory(table_data, mem_base, mem_len, i - 1,
>                                    MEM_AFFINITY_ENABLED);
>              }
> -            mem_base = 1ULL << 32;
> +            mem_base = x86ms->above_4g_mem_start;
>              mem_len = next_base - x86ms->below_4g_mem_size;
>              next_base = mem_base + mem_len;
>          }
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c8696ac01e85..7de0e87f4a3f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -837,9 +837,10 @@ void pc_memory_init(PCMachineState *pcms,
>                                   machine->ram,
>                                   x86ms->below_4g_mem_size,
>                                   x86ms->above_4g_mem_size);
> -        memory_region_add_subregion(system_memory, 0x100000000ULL,
> +        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
>                                      ram_above_4g);
> -        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
> +        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
> +                       E820_RAM);
>      }
>  
>      if (pcms->sgx_epc.size != 0) {
> @@ -880,7 +881,7 @@ void pc_memory_init(PCMachineState *pcms,
>              machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>          } else {
>              machine->device_memory->base =
> -                0x100000000ULL + x86ms->above_4g_mem_size;
> +                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>          }
>  
>          machine->device_memory->base =
> @@ -972,7 +973,7 @@ uint64_t pc_pci_hole64_start(void)
>      } else if (pcms->sgx_epc.size != 0) {
>              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
>      } else {
> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
> +        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>      }
>  
>      return ROUND_UP(hole64_start, 1 * GiB);
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index a2b318dd9387..164ee1ddb8de 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>          return;
>      }
>  
> -    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
> +    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  
>      memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
>      memory_region_add_subregion(get_system_memory(), sgx_epc->base,
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb99..912e96718ee8 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1319,6 +1319,7 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>      x86ms->bus_lock_ratelimit = 0;
> +    x86ms->above_4g_mem_start = 0x100000000ULL;
>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index a145a303703f..2de7ec046b75 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -58,6 +58,9 @@ struct X86MachineState {
>      /* RAM information (sizes, addresses, configuration): */
>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>  
> +    /* RAM information when there's a hole in 1Tb */

s/^^^/GPA of the part of initial RAM above 4G/

or something like that, it doesn't have anything to do with hole at 1Tb
on some hosts.

> +    ram_addr_t above_4g_mem_start;
> +
>      /* CPU and apic information: */
>      bool apic_xrupt_override;
>      unsigned pci_irq_mask;


