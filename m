Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A7346783
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:24:54 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOli1-0003vj-77
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOkis-0004Jk-3V; Tue, 23 Mar 2021 13:21:42 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOkio-0000qB-S2; Tue, 23 Mar 2021 13:21:41 -0400
Received: by mail-qv1-xf36.google.com with SMTP id 30so10836974qva.9;
 Tue, 23 Mar 2021 10:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BoOI+leqrbQ+b1Jw75b9PqbPatpVKg9+H0d1DsNm1PM=;
 b=lrv6P4zfLIrsgG1kSYaLOasmPwywNlxwe0wl5WxOXeYUmcltpQab4Ftlq49uAxBKtr
 48Wc/4mVTWNzUsKFXhUU1SuJnEVVgWEbzRKSV98M08qcywtf0raGO6M+9fJ6tXVQpN48
 4bjDcH/H50e/XZJ5lfO9FOBtfDWRLWJPn5p0H2rWUJbM5H0M+L50QezCOmkEDxbhLjEP
 1aM7Dhg7veZNv70wbYHkkkJSSez+Oa6aMGx3eE4ShKJXaJ7ZK5wV8pm3gxr19DGQyuUV
 jheWK+anMprWLEvIwT5Nnrm/syQApMNUIAgJoK+JME+BjY062M9waxl4QSmGpxUVCxxx
 csyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BoOI+leqrbQ+b1Jw75b9PqbPatpVKg9+H0d1DsNm1PM=;
 b=Pm18jdTN9XS/vfg8pfxPOmtt050bEyxq5TZHDQEzOn430bplHzGuEsro6B6tOG9+6q
 WMAcW0PJnoa7P0Z2nklRhMagTLiXTTl5Tkjx9ZdstiqNogurWhlcArYQnxedniclBrf9
 xpMelsPjyr/+QsnWLS+uT1MBQS00QtzLlRt7u9uykK1+BOxFXINmB+j8FgNGW017KwzL
 viC7lWteqyVs63fV9L+Bh4eYmCt2wowlolnWvXUtUV2jC5xntfu9QYUuDaDDN0bNkt9D
 7XGkUXMluzDZ4WOH0KtMlr6/FtVz6Ro8Dif/pxFo84d8kxH9RKpVFXn0jTDTauw5WZ1W
 cDyQ==
X-Gm-Message-State: AOAM530hEKq4n432HkwJ+N3OqbQiRToqP7OfYCvs41HEHFu7/exo3voJ
 r0k5EJBhCcrYCWuQCViqyN4=
X-Google-Smtp-Source: ABdhPJzEmNVBsIGK732POXXh4s/2ZztRq4jOL2vdGqSDb6GAQmTgGgdAzoM5Jpf/t3+pfvvAlkKk7g==
X-Received: by 2002:a0c:c3cd:: with SMTP id p13mr5995858qvi.4.1616520097587;
 Tue, 23 Mar 2021 10:21:37 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id h7sm13379664qkk.41.2021.03.23.10.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:21:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
Date: Tue, 23 Mar 2021 14:21:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/22/21 10:03 PM, David Gibson wrote:
> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>> topology_core_cpumask") cause a regression in the pseries machine when
>> defining certain SMP topologies [1]. The reasoning behind the change is
>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>> far as the kernel understanding of SMP topologies goes, both masks are
>> equivalent.
>>
>> Further discussions in the kernel mailing list [2] shown that the
>> powerpc kernel always considered that the number of sockets were equal
>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>> immediate conclusion is that all SMP topologies the pseries machine were
>> supplying to the kernel, with more than one socket in the same NUMA node
>> as in [1], happened to be correctly represented in the kernel by
>> accident during all these years.
>>
>> There's a case to be made for virtual topologies being detached from
>> hardware constraints, allowing maximum flexibility to users. At the same
>> time, this freedom can't result in unrealistic hardware representations
>> being emulated. If the real hardware and the pseries kernel don't
>> support multiple chips/sockets in the same NUMA node, neither should we.
>>
>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>> pseries machine. qtest changes were made to adapt to this new
>> condition.
> 
> Oof.  I really don't like this idea.  It means a bunch of fiddly work
> for users to match these up, for no real gain.  I'm also concerned
> that this will require follow on changes in libvirt to not make this a
> really cryptic and irritating point of failure.

Haven't though about required Libvirt changes, although I can say that there
will be some amount to be mande and it will probably annoy existing users
(everyone that has a multiple socket per NUMA node topology).

There is not much we can do from the QEMU layer aside from what I've proposed
here. The other alternative is to keep interacting with the kernel folks to
see if there is a way to keep our use case untouched. This also means that
'ibm,chip-id' will probably remain in use since it's the only place where
we inform cores per socket information to the kernel.



Thanks,


DHB




> 
>>
>> [1] https://bugzilla.redhat.com/1934421
>> [2] https://lore.kernel.org/linuxppc-dev/daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com/
>>
>> CC: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> CC: Cédric Le Goater <clg@kaod.org>
>> CC: Igor Mammedov <imammedo@redhat.com>
>> CC: Laurent Vivier <lvivier@redhat.com>
>> CC: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c                 |  3 ++
>>   hw/ppc/spapr_numa.c            |  7 +++++
>>   include/hw/ppc/spapr.h         |  1 +
>>   tests/qtest/cpu-plug-test.c    |  4 +--
>>   tests/qtest/device-plug-test.c |  9 +++++-
>>   tests/qtest/numa-test.c        | 52 ++++++++++++++++++++++++++++------
>>   6 files changed, 64 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index d56418ca29..745f71c243 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -4611,8 +4611,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>>    */
>>   static void spapr_machine_5_2_class_options(MachineClass *mc)
>>   {
>> +    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
>> +
>>       spapr_machine_6_0_class_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>> +    smc->pre_6_0_smp_topology = true;
>>   }
>>   
>>   DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 779f18b994..0ade43dd79 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -163,6 +163,13 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
>>       int i, j, max_nodes_with_gpus;
>>       bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
>>   
>> +    if (!smc->pre_6_0_smp_topology &&
>> +        nb_numa_nodes != machine->smp.sockets) {
>> +        error_report("Number of CPU sockets must be equal to the number "
>> +                     "of NUMA nodes");
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>>       /*
>>        * For all associativity arrays: first position is the size,
>>        * position MAX_DISTANCE_REF_POINTS is always the numa_id,
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 47cebaf3ac..98dc5d198a 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -142,6 +142,7 @@ struct SpaprMachineClass {
>>       hwaddr rma_limit;          /* clamp the RMA to this size */
>>       bool pre_5_1_assoc_refpoints;
>>       bool pre_5_2_numa_associativity;
>> +    bool pre_6_0_smp_topology;
>>   
>>       bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>>                             uint64_t *buid, hwaddr *pio,
>> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
>> index a1c689414b..946b9129ea 100644
>> --- a/tests/qtest/cpu-plug-test.c
>> +++ b/tests/qtest/cpu-plug-test.c
>> @@ -118,8 +118,8 @@ static void add_pseries_test_case(const char *mname)
>>       data->machine = g_strdup(mname);
>>       data->cpu_model = "power8_v2.0";
>>       data->device_model = g_strdup("power8_v2.0-spapr-cpu-core");
>> -    data->sockets = 2;
>> -    data->cores = 3;
>> +    data->sockets = 1;
>> +    data->cores = 6;
>>       data->threads = 1;
>>       data->maxcpus = data->sockets * data->cores * data->threads;
>>   
>> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
>> index 559d47727a..dd7d8268d2 100644
>> --- a/tests/qtest/device-plug-test.c
>> +++ b/tests/qtest/device-plug-test.c
>> @@ -91,7 +91,14 @@ static void test_spapr_cpu_unplug_request(void)
>>   {
>>       QTestState *qtest;
>>   
>> -    qtest = qtest_initf("-cpu power9_v2.0 -smp 1,maxcpus=2 "
>> +    /*
>> +     * Default smp settings will prioritize sockets over cores and
>> +     * threads, so '-smp 2,maxcpus=2' will add 2 sockets. However,
>> +     * the pseries machine requires a NUMA node for each socket
>> +     * (since 6.0.0). Specify sockets=1 to make life easier.
>> +     */
>> +    qtest = qtest_initf("-cpu power9_v2.0 "
>> +                        "-smp 1,maxcpus=2,threads=1,cores=2,sockets=1 "
>>                           "-device power9_v2.0-spapr-cpu-core,core-id=1,id=dev0");
>>   
>>       /* similar to test_pci_unplug_request */
>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>> index dc0ec571ca..bb13f7131b 100644
>> --- a/tests/qtest/numa-test.c
>> +++ b/tests/qtest/numa-test.c
>> @@ -24,9 +24,17 @@ static void test_mon_explicit(const void *data)
>>       QTestState *qts;
>>       g_autofree char *s = NULL;
>>       g_autofree char *cli = NULL;
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "ppc64")) {
>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-3 "
>> +                             "-numa node,nodeid=1,cpus=4-7");
>> +    } else {
>> +        cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
>> +                             "-numa node,nodeid=1,cpus=4-7");
>> +    }
>>   
>> -    cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
>> -                         "-numa node,nodeid=1,cpus=4-7");
>>       qts = qtest_init(cli);
>>   
>>       s = qtest_hmp(qts, "info numa");
>> @@ -57,10 +65,18 @@ static void test_mon_partial(const void *data)
>>       QTestState *qts;
>>       g_autofree char *s = NULL;
>>       g_autofree char *cli = NULL;
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "ppc64")) {
>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>> +                             "-numa node,nodeid=1,cpus=4-5 ");
>> +    } else {
>> +        cli = make_cli(data, "-smp 8 "
>> +                             "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>> +                             "-numa node,nodeid=1,cpus=4-5 ");
>> +    }
>>   
>> -    cli = make_cli(data, "-smp 8 "
>> -                   "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
>> -                   "-numa node,nodeid=1,cpus=4-5 ");
>>       qts = qtest_init(cli);
>>   
>>       s = qtest_hmp(qts, "info numa");
>> @@ -85,9 +101,17 @@ static void test_query_cpus(const void *data)
>>       QObject *e;
>>       QTestState *qts;
>>       g_autofree char *cli = NULL;
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "ppc64")) {
>> +        cli = make_cli(data, "-smp 8,threads=1,cores=4,sockets=2 "
>> +                             "-numa node,memdev=ram,cpus=0-3 "
>> +                             "-numa node,cpus=4-7");
>> +    } else {
>> +        cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
>> +                             "-numa node,cpus=4-7");
>> +    }
>>   
>> -    cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
>> -                         "-numa node,cpus=4-7");
>>       qts = qtest_init(cli);
>>       cpus = get_cpus(qts, &resp);
>>       g_assert(cpus);
>> @@ -177,7 +201,7 @@ static void spapr_numa_cpu(const void *data)
>>       QTestState *qts;
>>       g_autofree char *cli = NULL;
>>   
>> -    cli = make_cli(data, "-smp 4,cores=4 "
>> +    cli = make_cli(data, "-smp 4,threads=1,cores=2,sockets=2 "
>>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>           "-numa cpu,node-id=0,core-id=0 "
>>           "-numa cpu,node-id=0,core-id=1 "
>> @@ -554,7 +578,17 @@ int main(int argc, char **argv)
>>   
>>       g_test_init(&argc, &argv, NULL);
>>   
>> -    qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
>> +    /*
>> +     * Starting on 6.0.0, for the pseries machine, '-smp 8' will only work
>> +     * if we have 8 NUMA nodes. If we specify 'smp 8,sockets=2' to match
>> +     * 2 NUMA nodes, the CPUs will be split as 0123/4567 instead of
>> +     * 0246/1357 that test_def_cpu_split expects. In short, this test is
>> +     * no longer valid for ppc64 in 6.0.0.
>> +     */
>> +    if (!g_str_equal(arch, "ppc64")) {
>> +        qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
>> +    }
>> +
>>       qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
>>       qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
>>       qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
> 

