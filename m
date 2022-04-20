Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D71508B89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:05:00 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBt5-00012Q-JR
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBfa-0001dQ-LK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBfW-0001f7-FL
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aTLpHUw8vkZhTRWzG2wbOiVVKGvJcRxmcqgduknEtQ=;
 b=Ou7aktXZ2aFpDsLmI9i89iGNAK+7endnTxqZ0SeElxpmMiXWgiO6AE+dhDW8yDI6xo98gr
 CUhM9ggtf6AYLSVThd3tU7VP5uj9mVSG1RYS0eybQEKjx6Km4fF7QZTp6DOqdzTd8mi1Bz
 /R21H1qpWKe/zaCU52Jqd5XBE0xgt/c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-4TBTe4fLNpCc9YVDROMIxw-1; Wed, 20 Apr 2022 10:50:53 -0400
X-MC-Unique: 4TBTe4fLNpCc9YVDROMIxw-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg29-20020a056402289d00b0041d6db0fbc9so1330397edb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aTLpHUw8vkZhTRWzG2wbOiVVKGvJcRxmcqgduknEtQ=;
 b=4G6R5t0HUXq8Dk4iMfxCUB5/Sij9PzJOamxb+nw68s9efqoWHwzhwFtTpLXm7CTgVP
 UnaGC9aFUdLI73QmwTMoWwf02mudEp03g6fpMViwK19/NoQRazAxb1OMrLDMXIxpr3IW
 HJ8W9WaNA7wpvjr4UfcqHxn3EyCBcM3TuC8DgpzpbzoJLku51GodSpO5erNIGn4Ufr6p
 Fdz/GYlcSWElgY48u1TdoqSIRizo1jB/KA+3LpDchHJIps7knlTsrDfrg/K5jQL11Fre
 Pqxr4Hpf6Coj2x2lfSltnd42YCNcucPASquB7eo5E6CGFcXX8C5AqPLHSfFrp20ykScp
 +whw==
X-Gm-Message-State: AOAM531eZSZIyQVYD8o5LphAzhQCiRj9x7RfPywV1X4gQBBqvYFn4+Nk
 dDUz6SMFDY+zoxhtNKfICn2wOj6sz6783ibpFTR9Fm8AeZwCDJVati1M5GQaicycbjQhO4kOd2f
 uQYBhL68878AdV1Y=
X-Received: by 2002:a17:907:6e89:b0:6e8:d79a:dced with SMTP id
 sh9-20020a1709076e8900b006e8d79adcedmr18951106ejc.563.1650466252643; 
 Wed, 20 Apr 2022 07:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIFqemeZD1bng1/WV2PyM0mjwcAkfmQbutoLJ/LB94mTv87wbUhpozKYlm/C4M3mUk2FwLFw==
X-Received: by 2002:a17:907:6e89:b0:6e8:d79a:dced with SMTP id
 sh9-20020a1709076e8900b006e8d79adcedmr18951052ejc.563.1650466252234; 
 Wed, 20 Apr 2022 07:50:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a17090665c700b006efb9a33ca5sm3113754ejn.164.2022.04.20.07.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:50:51 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:50:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220420165050.66dd87a7@redhat.com>
In-Reply-To: <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
 <20220420135032.43711096@redhat.com>
 <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 22:24:46 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/20/22 7:50 PM, Igor Mammedov wrote:
> > On Wed, 20 Apr 2022 18:31:02 +0800
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 4/20/22 4:32 PM, Igor Mammedov wrote:  
> >>> On Mon, 18 Apr 2022 10:09:18 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>      
> >>>> Currently, the SMP configuration isn't considered when the CPU
> >>>> topology is populated. In this case, it's impossible to provide
> >>>> the default CPU-to-NUMA mapping or association based on the socket
> >>>> ID of the given CPU.
> >>>>
> >>>> This takes account of SMP configuration when the CPU topology
> >>>> is populated. The die ID for the given CPU isn't assigned since
> >>>> it's not supported on arm/virt machine. Besides, the used SMP
> >>>> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> >>>> to avoid testing failure
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >>>> ---
> >>>>    hw/arm/virt.c           | 15 ++++++++++++++-
> >>>>    tests/qtest/numa-test.c |  3 ++-
> >>>>    2 files changed, 16 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>> index d2e5ecd234..5443ecae92 100644
> >>>> --- a/hw/arm/virt.c
> >>>> +++ b/hw/arm/virt.c
> >>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>>>        int n;
> >>>>        unsigned int max_cpus = ms->smp.max_cpus;
> >>>>        VirtMachineState *vms = VIRT_MACHINE(ms);
> >>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >>>>    
> >>>>        if (ms->possible_cpus) {
> >>>>            assert(ms->possible_cpus->len == max_cpus);
> >>>> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>>>            ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >>>>            ms->possible_cpus->cpus[n].arch_id =
> >>>>                virt_cpu_mp_affinity(vms, n);
> >>>> +
> >>>> +        assert(!mc->smp_props.dies_supported);
> >>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.socket_id =
> >>>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
> >>>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
> >>>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> >>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.core_id =
> >>>> +            (n / ms->smp.threads) % ms->smp.cores;
> >>>>            ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >>>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> >>>> +        ms->possible_cpus->cpus[n].props.thread_id =
> >>>> +            n % ms->smp.threads;
> >>>>        }
> >>>>        return ms->possible_cpus;
> >>>>    }
> >>>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> >>>> index 90bf68a5b3..aeda8c774c 100644
> >>>> --- a/tests/qtest/numa-test.c
> >>>> +++ b/tests/qtest/numa-test.c
> >>>> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
> >>>>        QTestState *qts;
> >>>>        g_autofree char *cli = NULL;
> >>>>    
> >>>> -    cli = make_cli(data, "-machine smp.cpus=2 "
> >>>> +    cli = make_cli(data, "-machine "
> >>>> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "  
> >>>
> >>> Is cluster-less config possible?
> >>> (looks like it used to work before and it doesn't after this series)
> >>>      
> >>
> >> Nope, it's impossible. This specific test case uses arm/virt machine
> >> where cluster is always supported.mc->smp_props.clusters_supported
> >> has been set to true in hw/arm/virt.c::virt_machine_class_init().
> >>
> >> Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
> >> the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
> >> make it 'bit bisect' friendly as Yanan suggested.  
> > 
> > so what was error that broke the test?
> > (probably should be mentioned in commit message)
> > 
> > (also is it possible to split out the test patch into
> > a separate one and put it before this one)
> >   
> 
> With amend to the command lines, the following one is used and below error
> is raised from the test. The error is mentioned in the commit log in
> PATCH[v7 2/4].
> 
>      -machine smp.cpus=2                                   \
>      -numa node,nodeid=0,memdev=ram -numa node,nodeid=1    \
>      -numa cpu,node-id=1,thread-id=0                       \
>      -numa cpu,node-id=0,thread-id=1
> 
>      qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>      (reported from hw/core/machine.c::machine_set_cpu_numa_node())
> 
> After the changes to virt_possible_cpu_arch_ids() is applied, "thread-id=1"
> isn't valid any more. The CPU topology becomes like below. Note that
> mc->smp_props.prefer_sockets is true on arm/virt machine.
> 
>      index    socket   cluster    core    thread
>      --------------------------------------------
>        0        0        0         0        0
>        1        1        0         0        0
> 
> With the amended command lines, the topology changes again so
> that "thread-id=1" is valid:
> 
>      index    socket   cluster    core    thread
>      --------------------------------------------
>        0        0        0         0        0
>        1        0        0         0        1
> 
> It should be ok to split the test/qtest/aarch64_numa_cpu() changes into
> a separate patch and put it before this one. In that case, the specified
> smp.{socket, cluster, core, threads} isn't used by arm/virt machine yet,
> and 'thread-id=2' should be still valid. Lets do this if I need post v8.
> Otherwise, I guess it's also fine to squash the test/qtest/aarch64_numa_cpu()
> changes into PATCH[2/4], as we're doing.

if you need to respin v7. do it as separate patch with proper commit message
and maybe add an extra test that exercises fully specified topo.

> 
> >   
> >>
> >>  
> >>>>            "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> >>>>            "-numa cpu,node-id=1,thread-id=0 "
> >>>>            "-numa cpu,node-id=0,thread-id=1");  
> 
> Thanks,
> Gavin
> 


