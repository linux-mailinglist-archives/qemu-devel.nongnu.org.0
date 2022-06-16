Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBD54E1E2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:25:27 +0200 (CEST)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pV0-0006Hy-6g
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pC7-0003wJ-Qb
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1pBz-0003bP-Rp
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655384746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZ5EJK0cGtNLbtPOD52HR+0nQiJsDvVQpArGvxNDOJc=;
 b=BvPhXyEdYMLMXMo2mtc8UGHt/wRfgnngdJU84eEmLrMw1Z7x/dkx9ePharUpkFrf4nHFZE
 lGHt0lj1Zv6yh7y34NPDbr5wSrTHu85uoTctCkKI0aCZ5ass7gr4UHEmOuFJwMb7EsyBQU
 CyAUWj80M7oM5c56hQkA7JFiD04Qv04=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-KuieiLpENoKBq2oFoYfvFg-1; Thu, 16 Jun 2022 09:05:43 -0400
X-MC-Unique: KuieiLpENoKBq2oFoYfvFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so1137104wmb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 06:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZ5EJK0cGtNLbtPOD52HR+0nQiJsDvVQpArGvxNDOJc=;
 b=vHz/MBCpUms+mPKdV1nJmXLHG+f2+MJcg5zoh4Hj5INvAQ09Zc5CaN93hw6PvFJdpl
 5bQnbSG6w+/A4gWCwMhQ9PUvXUPHqJXuAzC6HIVflRxplFXpAw4ZJ/eShPezBJy4V2Wx
 gzrOnq/YmfTjgQbYxToXrSx/KI8Mli2v/B6nNqeUjb324up0U6QxfmGOSAa0Qi/74/7k
 QKTLidasFBbN3M7CA0jVDzL91Mz1/q7xN9obscnVlX6XHqjKCGYgQnyafSUNPC2h/Lop
 te5NQJsSWg5CUcU6I/1akkY7O1FMXWADYvDHM0hPNIP7lqGUYCgCx9/puiU/aCE530a0
 S0qg==
X-Gm-Message-State: AJIora+0podUbCu+t+NXsfCN9Jpm8s0RooVfCRhKTaXAUZCwHNCEkoJe
 XkSxdiull4RZDnNqHEgP9pw4x02RUqLHidlWq7QMNgfwpoho55Z7RpHwW5szR+RGpb1uK3B58RU
 i2RLXUnvFqxxdmm0=
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr4875773wmj.57.1655384742104; 
 Thu, 16 Jun 2022 06:05:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1szfFA8aYOAHQ7TbO6v24hOK1KIZkhum8ShJTzzUo6ggKW4rITNSHpSzecyo6zzvtXpNM95Bg==
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr4875740wmj.57.1655384741838; 
 Thu, 16 Jun 2022 06:05:41 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a1cf705000000b0039c5fb1f592sm5491396wmh.14.2022.06.16.06.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 06:05:41 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:05:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 1/5] hw/i386: add 4g boundary start to X86MachineState
Message-ID: <20220616150540.31b51edf@redhat.com>
In-Reply-To: <20220520104532.9816-2-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-2-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 May 2022 11:45:28 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Rather than hardcoding the 4G boundary everywhere, introduce a
> X86MachineState property @above_4g_mem_start and use it
so far it's just field not a property /fix commit message/

> accordingly.
> 
> This is in preparation for relocating ram-above-4g to be
> dynamically start at 1T on AMD platforms.

possibly needs to be rebased on top of current master to include cxl_base

with comments fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
> index c125939ed6f9..3160b20c9574 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2120,7 +2120,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>                  build_srat_memory(table_data, mem_base, mem_len, i - 1,
>                                    MEM_AFFINITY_ENABLED);
>              }
> -            mem_base = 1ULL << 32;
> +            mem_base = x86ms->above_4g_mem_start;
>              mem_len = next_base - x86ms->below_4g_mem_size;
>              next_base = mem_base + mem_len;
>          }
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7c39c913355b..f7da1d5dd40d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -832,9 +832,10 @@ void pc_memory_init(PCMachineState *pcms,
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
> @@ -875,7 +876,7 @@ void pc_memory_init(PCMachineState *pcms,
>              machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>          } else {
>              machine->device_memory->base =
> -                0x100000000ULL + x86ms->above_4g_mem_size;
> +                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>          }
>  
>          machine->device_memory->base =
> @@ -1019,7 +1020,7 @@ uint64_t pc_pci_hole64_start(void)
>      } else if (pcms->sgx_epc.size != 0) {
>              hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
>      } else {
> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
> +        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>      }
>  
>      return ROUND_UP(hole64_start, 1 * GiB);
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index a44d66ba2afc..09d9c7c73d9f 100644
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
> index 78b05ab7a2d1..af3c790a2830 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1373,6 +1373,7 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>      x86ms->bus_lock_ratelimit = 0;
> +    x86ms->above_4g_mem_start = 0x100000000ULL;

s/0x.../4 * GiB/

>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 9089bdd99c3a..df82c5fd4252 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -56,6 +56,9 @@ struct X86MachineState {
>      /* RAM information (sizes, addresses, configuration): */
>      ram_addr_t below_4g_mem_size, above_4g_mem_size;
>  
> +    /* Start address of the initial RAM above 4G */
> +    uint64_t above_4g_mem_start;
> +
>      /* CPU and apic information: */
>      bool apic_xrupt_override;
>      unsigned pci_irq_mask;


