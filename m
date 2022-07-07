Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18156A316
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:03:32 +0200 (CEST)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9RAJ-0001x7-Fx
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9R7H-0000Q1-OG
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9R7E-00079J-Jz
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657198820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8DzcYY7ranZp53e85EaQoPuiNQIG9rJRbqFVa1hv88=;
 b=I3FacgyE+cNcXNZyBMnkfMUmsx8LpQoLMIHtV11TsN8lzJ2Ga2B7X3MWgApcxSByGuScn9
 X/+FQwUKEngsXkyo3vd/GWuvViHXQM1f/9b0UT7hIg76tWugccTg0nbEGzADVi2U7eCOVr
 7id5WD8OqJjZ7al4Ou8rtFEBVuvcxZk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-qPBy_Wq7MOmai3wa2brvOA-1; Thu, 07 Jul 2022 09:00:19 -0400
X-MC-Unique: qPBy_Wq7MOmai3wa2brvOA-1
Received: by mail-ej1-f71.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso4705187ejc.18
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H8DzcYY7ranZp53e85EaQoPuiNQIG9rJRbqFVa1hv88=;
 b=0NL/woI5uE2towDuDkU1TBYjiObHah9NbRDccPO9pTnthvXm4TwsxiXq/X3lLRl6x1
 9R6QV/BvkQEhiacMvVF8AkqNveQ5N2job42oB4YJLogL8XTyBQ/kdNR5eu5FJu+Ti+ST
 jF3Dl065m6xI8czm+GY9khjmXHpcOeOuMwGBvEc64A8YgYASzyVyU6ewo/v80jgF0LqV
 KyTEDxJwKh9/jfu1u2gu/M7cnRjVaTx+ZecN0l3fSnJVRCfJP/78V5T2B5mUDwNtw7dl
 opStYZuk+7ZElBYZFeSIqt1R4g5uzdx2AzeZZM3PzlunF2fCEEgr+Zu3HZj5coGFHhWP
 pllQ==
X-Gm-Message-State: AJIora+oYb+G9dzq/ZrrVZ4qGSnT+QfhnkC51vbsg9vRvZTYSlXBrc8m
 IXAntBfJKJqvoWZnpsDoP2BRFsHrpHP/Fz0zqZ0ajsr/tK0J0zSq8RQz+5mvKpuL6OOpXWO3jsd
 Edl2bAvfwATQYsIM=
X-Received: by 2002:a17:907:75ef:b0:72b:2fd:1a92 with SMTP id
 jz15-20020a17090775ef00b0072b02fd1a92mr5599683ejc.745.1657198817857; 
 Thu, 07 Jul 2022 06:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vtivoCItnSYtCYS+wUCZAhY5DNVk5xET5gPrr34WtZkjtwaRsgHXF1fXpdgWt8a2LlDyOz8g==
X-Received: by 2002:a17:907:75ef:b0:72b:2fd:1a92 with SMTP id
 jz15-20020a17090775ef00b0072b02fd1a92mr5599654ejc.745.1657198817653; 
 Thu, 07 Jul 2022 06:00:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a509989000000b004355d27799fsm28765172edb.96.2022.07.07.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 06:00:17 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:00:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 06/10] i386/pc: factor out cxl range start to helper
Message-ID: <20220707150015.22b9d29e@redhat.com>
In-Reply-To: <20220701161014.3850-7-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-7-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Jul 2022 17:10:10 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Factor out the calculation of the base address of the MR. It will be
> used later on for the cxl range end counterpart calculation and as
> well in pc_memory_init() CXL mr initialization, thus avoiding
> duplication.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

needs to be rebased on top of 


[PATCH 2/3] hw/i386/pc: Always place CXL Memory Regions after device_memory

> ---
>  hw/i386/pc.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 0abbf81841a9..8655cc3b8894 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,6 +825,24 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    hwaddr cxl_base;
> +
> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
> +        cxl_base = machine->device_memory->base;
> +        if (!pcmc->broken_reserved_end) {
> +            cxl_base += memory_region_size(&machine->device_memory->mr);
> +        }
> +    } else {
> +        cxl_base = pc_above_4g_end(pcms);
> +    }
> +
> +    return cxl_base;
> +}
> +
>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>  {
>      uint64_t start = 0;
> @@ -946,15 +964,7 @@ void pc_memory_init(PCMachineState *pcms,
>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
>          hwaddr cxl_size = MiB;
>  
> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
> -            cxl_base = machine->device_memory->base;
> -            if (!pcmc->broken_reserved_end) {
> -                cxl_base += memory_region_size(&machine->device_memory->mr);
> -            }
> -        } else {
> -            cxl_base = pc_above_4g_end(pcms);
> -        }
> -
> +        cxl_base = pc_get_cxl_range_start(pcms);
>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>          memory_region_add_subregion(system_memory, cxl_base, mr);


