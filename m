Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82836C62E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:39:35 +0200 (CEST)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbN02-0006B0-8K
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMxb-00056v-Bo
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMxY-0005Ln-Kk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619527020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6l5h5dE6OceQRG27UFTeSJIxH+26NuQa8PS5ZNSi54=;
 b=QIKy5V19s9BKG1Fs2MjpgXOYLKicELqLaBCfVY9Vbi5JYr3ruJpIVnEiCyW3G7RamVfQ+v
 CrBgiWB3kfn4nOnCoWy3Bd/+9UoQ6s8TJIKoS4J08b23gySECAKlEnnC7BA3106U/HyRnK
 7FIngikBZqlRaKdeZvjQbXiGNmJRtCA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-hEaz6TQTNu-4rHPpYabuAg-1; Tue, 27 Apr 2021 08:36:58 -0400
X-MC-Unique: hEaz6TQTNu-4rHPpYabuAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 61-20020adf84430000b029010b4cd88298so3526137wrf.21
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 05:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6l5h5dE6OceQRG27UFTeSJIxH+26NuQa8PS5ZNSi54=;
 b=l4USctHUmC/GCeyMLG3TssHonIvoxMKPMyaGRjsPRl7ye0yZJEG6oC2V//CCCr4TLn
 6mYoMV8A/R/c0x9RyBMIowxm8oxhqmFW8+qexvb6Rj3F6TGwkHmWWVrKG3dho5LE/rYp
 OjRY5yc9yVraZvWXiIwTGqrIce8JkBXfY0a1zFd++A9RGhzZWeUvN4y3zbx7cPUfDFkf
 ZMn/Q9nQRna3++MoWBfNL25kY7q5abZlEpMyA4NHKegkE3DHTOKsGqOU4dU4j/iSFVPE
 HAIW7DX2voPGHgapUSMDX/+r4RPqlsn28qvm3CbyYSLM6yzO0iDRalDkyAByMBQ6bkJD
 MouQ==
X-Gm-Message-State: AOAM533sCaDGy/vNyh5XW9mZvzyKAG60k5zfqqn5O0uVbsNjiWaqBED2
 J58xKxuqAnwefhdJvLCwMp7au0Esp6fUsN098IsoEIpThqI629m1Nt8G+phE8pSUjKzOBgItU6Z
 2+c19sp1OZtMxPWs=
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr30246209wri.66.1619527016922; 
 Tue, 27 Apr 2021 05:36:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+73/VqOjdhxyKrje8odJL3B0qD3HKuLULcbCsn+gA0JD99VsXnhKtR4DdI6vCZWkLEHCyTQ==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr30246167wri.66.1619527016716; 
 Tue, 27 Apr 2021 05:36:56 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 61sm4043528wrm.52.2021.04.27.05.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:36:56 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
 <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
 <20210427100442.elz3bjgl6mcntevc@gator.home>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <afe6dbd6-d026-3fd4-b794-01fe566e27a3@redhat.com>
Date: Tue, 27 Apr 2021 14:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210427100442.elz3bjgl6mcntevc@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 12:04 PM, Andrew Jones wrote:
> On Tue, Apr 27, 2021 at 11:47:17AM +0200, Philippe Mathieu-Daudé wrote:
>> Hi Yanan, Drew,
>>
>> On 4/13/21 10:07 AM, Yanan Wang wrote:
>>> From: Andrew Jones <drjones@redhat.com>
>>>
>>> Support device tree CPU topology descriptions.
>>>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>>>  include/hw/arm/virt.h |  1 +
>>>  2 files changed, 41 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 9f01d9041b..f4ae60ded9 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>      int cpu;
>>>      int addr_cells = 1;
>>>      const MachineState *ms = MACHINE(vms);
>>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>      int smp_cpus = ms->smp.cpus;
>>>  
>>>      /*
>>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>>> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>>       *  On ARM v8 64-bit systems value should be set to 2,
>>>       *  that corresponds to the MPIDR_EL1 register size.
>>>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>>> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>>          }
>>>  
>>> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>>> +        }
>>> +
>>>          g_free(nodename);
>>>      }
>>> +
>>> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>>> +        /*
>>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>>> +         * entities that are used to describe the layout of physical CPUs
>>> +         * in the system: socket/cluster/core/thread.
>>> +         */
>>> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>>> +
>>> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>>> +            char *map_path;
>>> +
>>> +            if (ms->smp.threads > 1) {
>>> +                map_path = g_strdup_printf(
>>> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
>>> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
>>> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
>>> +                    "thread", cpu % ms->smp.threads);
>>> +            } else {
>>> +                map_path = g_strdup_printf(
>>> +                    "/cpus/cpu-map/%s%d/%s%d",
>>> +                    "socket", cpu / ms->smp.cores,
>>> +                    "core", cpu % ms->smp.cores);
>>> +            }
>>> +            qemu_fdt_add_path(ms->fdt, map_path);
>>> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
>>> +            g_free(map_path);
>>> +            g_free(cpu_path);
>>> +        }
>>> +    }
>>>  }
>>>  
>>>  static void fdt_add_its_gic_node(VirtMachineState *vms)
>>> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>>>      virt_machine_6_0_options(mc);
>>>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>>>      vmc->no_secure_gpio = true;
>>> +    vmc->no_cpu_topology = true;
>>
>> Bare with me because "machine versioning" is something new to me, I was
>> expecting it to be only related to migrated fields.
>> Why do we need to care about not adding the FDT node in older machines?
>> Shouldn't the guest skip unknown FDT nodes?
> 
> It probably should, the question is whether it would. Also, the nodes may
> not be unknown, so the guest will read the information and set up its
> topology as instructed. That topology may not be the same as what was
> getting used by default without the topology description. It's possible
> that a user's application has a dependency on the topology and if that
> topology gets changed under its feat it'll behave differently.

[*]

I see.

> In short, machine versioning isn't just about vmstate, it's also about
> keeping a machine type looking the same to the guest.

Yes, TIL.

> Now, it's possible that we're being overly cautious here, but this compat
> variable doesn't complicate code too much. So I think I'd prefer to use it
> than not.

No problem. Could you or Yanan add your first paragraph ([*], reworded
in the commit description? I don't think a comment in the code is
useful, but having it in the commit is helpful IMO.

Thanks,

Phil.


