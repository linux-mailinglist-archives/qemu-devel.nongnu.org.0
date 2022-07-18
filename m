Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC1578384
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:19:23 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQeg-0002wi-U2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQbv-0005Cv-Dp
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQbr-00044X-PD
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658150186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jb3d2E85nPXVUIoCZRlpkgFmLssBWzCKpJVufWoAqY=;
 b=SJP0vayKOgW25Yq0sPkKOFWwoiy4poiUrkGiUceiZIjZ1JTyr/I+BVM/nREemZYZ2sZr9z
 m01Xu5ajb2nGzGNKXYfTRYpT2IMPKhT2qjTa9jCCIA+jEFTsJ2Lfz4ucAayG6cAcC4d/gv
 v119DGuugw80LbbGQHE78g1Kp9AVs/k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-ZK9tpiDNMD277e-YccPk2w-1; Mon, 18 Jul 2022 09:16:25 -0400
X-MC-Unique: ZK9tpiDNMD277e-YccPk2w-1
Received: by mail-ed1-f70.google.com with SMTP id
 z14-20020a056402274e00b0043ae5c003c1so7896516edd.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Jb3d2E85nPXVUIoCZRlpkgFmLssBWzCKpJVufWoAqY=;
 b=W9/Aj8s7s22cMQIU77yRoTE5cDceq81129jlvY+PId8OHgp6jPTQRJJLx0YFKmlvK1
 tDah0fHlgWgF5fSQrGHboTOL8QJNt/axw1BE+rQogOo8lmUC6FXOPdPbLsdMcCyffRfx
 muxEUUlFOQNks/QlL9DZa/2HkAPE0+q6NWyifRwVC2LHtPPAj8YN1RSB41JIPNtZyb+R
 ou95ttwZgp7w1C/vLs42pnEpewKwN72kB01Rnckaz1plnihhgaVjc33U0taxAwYrCJi2
 J9BLW4WDAqp5SqZKmcWkrp7+MA9YUYLRVI/EKkA0oTHwlTjT4LP93ovTTSJDe6MpKcDs
 x/7g==
X-Gm-Message-State: AJIora+E4V60CrqZfvOfjClURGGrPYXkHrSPth2ozpS2lmJmBqgbAU7M
 Gu/wgv1Tivpqh2CnLHXLMhsDkWy4MMeioygsQM/zKdArj+IZqBR2iXUQYJe2t9cTEigtnzoLQre
 CAjgJhXBDgszvejk=
X-Received: by 2002:a17:907:9606:b0:70a:e140:6329 with SMTP id
 gb6-20020a170907960600b0070ae1406329mr25963497ejc.471.1658150184297; 
 Mon, 18 Jul 2022 06:16:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6LU8YA8IHhiUs7kwK6TMkqOKn+OxNPdQdJQ7B/WGWbA1rxXnE9+os2wlyoEipZXDstLwqVg==
X-Received: by 2002:a17:907:9606:b0:70a:e140:6329 with SMTP id
 gb6-20020a170907960600b0070ae1406329mr25963474ejc.471.1658150184075; 
 Mon, 18 Jul 2022 06:16:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056402000200b0043a61f6c389sm8632110edu.4.2022.07.18.06.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:16:23 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:16:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v8 09/11] i386/pc: bounds check phys-bits against max
 used GPA
Message-ID: <20220718151622.3c38f261@redhat.com>
In-Reply-To: <20220715171628.21437-10-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-10-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jul 2022 18:16:26 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Calculate max *used* GPA against the CPU maximum possible address
> and error out if the former surprasses the latter. This ensures
> max used GPA is reacheable by configured phys-bits. Default phys-bits
> on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
> address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
> with IOMMU.
> 
> This is preparation for AMD guests with >1010G, where it will want relocate
> ram-above-4g to be after 1Tb instead of 4G.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index cda435e3baeb..f30661b7f1a2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -880,6 +880,18 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>      return start;
>  }
>  
> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
> +{
> +    X86CPU *cpu = X86_CPU(first_cpu);
> +
> +    /* 32-bit systems don't have hole64 thus return max CPU address */
> +    if (cpu->phys_bits <= 32) {
> +        return ((hwaddr)1 << cpu->phys_bits) - 1;
> +    }
> +
> +    return pc_pci_hole64_start() + pci_hole64_size - 1;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -894,13 +906,28 @@ void pc_memory_init(PCMachineState *pcms,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
> +    hwaddr maxphysaddr, maxusedaddr;
>      hwaddr cxl_base, cxl_resv_end = 0;
> +    X86CPU *cpu = X86_CPU(first_cpu);
>  
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    /*
> +     * phys-bits is required to be appropriately configured
> +     * to make sure max used GPA is reachable.
> +     */
> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
> +    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u)",
> +                     maxphysaddr, maxusedaddr, cpu->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.


