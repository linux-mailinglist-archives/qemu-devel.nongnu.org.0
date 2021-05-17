Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B08382493
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:42:53 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liWxm-00019U-IW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWwn-0000HC-Af
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWwl-0008VX-PI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621233707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kzasCPZQqJ9cRXMGi0lsx5m/DvQIiWbfgEHqEWPhTFs=;
 b=cDIVEIk+yYnEMYVjx1cECsw8Vm6Q9Zn8SR+yk5KgQMVODEuwgyfxPfrXUOyP3xRFRu8kxq
 Cr+Jf4Jjp3SCO1MGu5QBK779lJ1iiQaFFAM0cNgZT3OnQfbmN14Ez0VO/GXoJupQEFBR+s
 xZc3CHDobYndffI9luu24JPlb2NtDI8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-qKDHU6YiPGWTTtUawy0vKg-1; Mon, 17 May 2021 02:41:43 -0400
X-MC-Unique: qKDHU6YiPGWTTtUawy0vKg-1
Received: by mail-ej1-f72.google.com with SMTP id
 la2-20020a170906ad82b02903d4bcc8de3bso644870ejb.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 23:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kzasCPZQqJ9cRXMGi0lsx5m/DvQIiWbfgEHqEWPhTFs=;
 b=ZrhLjBbanYsNvP5YZ8Y9gnnzV4foj8uy2a019KKnh+NErJrwmVnJrOgk4hkD2YLh4Y
 gUJVMoH+SePGcIiGjgIwCOxyAFAQ/UNWWiylGli0I2+r9ur1rGuc+jXe/eCcVjo4UIcK
 CkDmHu6tSU5R+nOvDg6XQxtVapNkdIKvEbhKWhlT7WaePkKBB5LA4en3cGaE7q5u4GdG
 HvhGjrIHuV/lBNtIr7tTM8zqw2T+hgrFOGFgPO3Ivvf1tFOiXbxUmBIPGzboqm8N9MMp
 ha+pAB8pZzLb6E8++70pXbEUyvdawtcBJs4Y72ZXFXg4trhjlTbg/HJYMseuN/ASJNK6
 La+g==
X-Gm-Message-State: AOAM530su7s4NozAdulby7TjFsEKHKb2XqfOf1l9BANe8YvoLGmpTkdw
 O9+TlGOPaGEWdc2F2iXrlFduEUloklMGPUkzOVheRFuy35tlBn/To/mLB+CRxzQIyGlasnIS9MX
 AHzDeTOs+Frmz4oY=
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr61515672ejz.214.1621233702458; 
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJJmsT+ikhfuEOwIzr9KaIKznJjgR0UcRc5kIOy/3Dp4tyDwmQtjX74jP26xDnupGQxXpJtg==
X-Received: by 2002:a17:906:c010:: with SMTP id
 e16mr61515634ejz.214.1621233702287; 
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id v8sm4471085ejq.62.2021.05.16.23.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:41:42 -0700 (PDT)
Date: Mon, 17 May 2021 08:41:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 3/9] hw/arm/virt: Add cpu-map to device tree
Message-ID: <20210517064140.4cvurykbsofb7y3n@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 06:28:54PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Support device tree CPU topology descriptions.
> 
> In accordance with the Devicetree Specification, the Linux Doc
> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
> present. And we meet the requirement by creating /cpus/cpu@*
> nodes for members within ms->smp.cpus.
> 
> Correspondingly, we should also create subnodes in cpu-map for
> the present cpus, each of which relates to an unique cpu node.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c07841e3a4..e5dcdebdbc 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -349,10 +349,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int smp_cpus = ms->smp.cpus;
>  
>      /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml

Rather than aligning the top line with the lower lines, we could remove
the extra space from the lower lines. Or, leave the formatting as it was,
by putting 'See' where 'From' was, like I did in my original patch.

>       *  On ARM v8 64-bit systems value should be set to 2,
>       *  that corresponds to the MPIDR_EL1 register size.
>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> @@ -405,8 +406,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        if (!vmc->no_cpu_topology) {
> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>          g_free(nodename);
>      }
> +
> +    if (!vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs

s/entities/levels/

> +         * in the system: socket/cluster/core/thread.

The comment says there are four levels including 'cluster', but there's no
'cluster' below.

> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
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
> +
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> -- 
> 2.19.1
>

Thanks,
drew 


