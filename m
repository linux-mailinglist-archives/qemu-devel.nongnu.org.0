Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EC37F34C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 08:59:27 +0200 (CEST)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh5Jf-0008LE-1E
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 02:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Ih-0007U0-OL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5If-0002Q5-UX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620889105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/aiXQa7sdF3wG8FqWiUvXmixKCQD7MWhdxfzvffKLDU=;
 b=eMBb4NpMZ+kXR8PAJ5eNevphj6Mm0HVCB03zh3lAs6F6sFi+hb346DWzmqAfpIF318RqiO
 j9BtUafnIb2qtL1axto3Q3dUyjgvtxFdf+F+iJ6+pj3z/i+vUuX5oAxtbG5uwxfrkDNeWg
 r/zaQN/GF03lYRX7Srf7BPwMYL6Ya5c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-v_cndDEaM-KO9if0vNi5lQ-1; Thu, 13 May 2021 02:58:21 -0400
X-MC-Unique: v_cndDEaM-KO9if0vNi5lQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso8068076ejc.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/aiXQa7sdF3wG8FqWiUvXmixKCQD7MWhdxfzvffKLDU=;
 b=Z3qzgJlpeg67z/qd41CJ1CvmroM0Z8mBArVaAD5kFrRqaFWldYD3UzIg4KSktTDzfb
 Wn4tS2XUJC2bBtbiCuKUEE68I9pdhAPFBsujIJVROatgLdAezRr0RN4GQx55kIfR3Om5
 2QlqtaU5+xRqSvjLRymV2puNIHtAmmcVoFb6AqSQhFpvbh2ivV5qfLWIT21s2xZ3Vudg
 5ABdDeChDJpvIjBmkrVi2wlgFD0RLe5EZ956LnLZ3fvFVrmuJelclad/Lh0P2rQshk+o
 4W528LCUEn2s5n5PPbRO89zBcS8tUTRr1+DsDg+3xm/TufzRapRSKwjINs6U316zGdME
 Ru/A==
X-Gm-Message-State: AOAM531WACj1SC5UhPbtYkt0veS6H4abYnUmEKG60OzAE9k4KIvW4ua2
 4jJYYkLdqtb/FlRO2f0ePwLNshM1niZQ6l4Xuch+M+deT4K/pXG0HFt9Gx+gvEkPo5zOe3IXra0
 /3x3mCsWa5u22bIA=
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr48143110edw.218.1620889100434; 
 Wed, 12 May 2021 23:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP7yJVgMkgtaFz7e2kDG7+4CL4V5S2uBOynw5i2TH9k8Wk1OKs8pVAGrQciLUb+Bda7ThxIg==
X-Received: by 2002:aa7:cd4d:: with SMTP id v13mr48143081edw.218.1620889100238; 
 Wed, 12 May 2021 23:58:20 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id u6sm1331912ejn.14.2021.05.12.23.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 23:58:19 -0700 (PDT)
Date: Thu, 13 May 2021 08:58:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
Message-ID: <20210513065817.duqlblhcmje2hpnv@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:07:41PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Support device tree CPU topology descriptions.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f01d9041b..f4ae60ded9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int smp_cpus = ms->smp.cpus;
>  
>      /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>       *  On ARM v8 64-bit systems value should be set to 2,
>       *  that corresponds to the MPIDR_EL1 register size.
>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {

We should probably always generate the cpu-map, like we agreed to always
generate the PPTT. If, for some reason, we don't want to generate the
cpu-map for uniprocessor systems, then we should actually be checking
ms->smp.maxcpus here (and below) to be sure it's uniprocessor.

Thanks,
drew

> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>          g_free(nodename);
>      }
> +
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs
> +         * in the system: socket/cluster/core/thread.
> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (ms->smp.threads > 1) {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
> +                    "thread", cpu % ms->smp.threads);
> +            } else {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d",
> +                    "socket", cpu / ms->smp.cores,
> +                    "core", cpu % ms->smp.cores);
> +            }
> +            qemu_fdt_add_path(ms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>      virt_machine_6_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>      vmc->no_secure_gpio = true;
> +    vmc->no_cpu_topology = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 2)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..4a4b98e4a7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> +    bool no_cpu_topology;
>  };
>  
>  struct VirtMachineState {
> -- 
> 2.19.1
> 


