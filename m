Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47E24811C3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 11:47:09 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2WU8-0003mE-C8
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 05:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2WRp-0002TK-VF
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 05:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2WRl-0008T9-TU
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 05:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640774679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVLX3ol4QkPqNOGWaua/tR1zhpkJgN6KjgRxEhs5SSk=;
 b=fPEUVR9NVxV/8naCRn+wqcvZKc7VBabtDLNzORrAAZlPjxex7cm3jG9nMLZgW18Omkmgx0
 c6MnALLScvrMoKbOzwEm20iFJZP8Al4n0K3Vu1niyq4/p4lS0Nc8frxBvAJOMMjwDqYSJl
 OBbcSFBAeDT+qlAmKa9jenzfCNupaOc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-5alljVzONwGgfvGZ4qz-tw-1; Wed, 29 Dec 2021 05:44:35 -0500
X-MC-Unique: 5alljVzONwGgfvGZ4qz-tw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j26-20020adfb31a000000b001a2356afd4fso4884206wrd.21
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 02:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PVLX3ol4QkPqNOGWaua/tR1zhpkJgN6KjgRxEhs5SSk=;
 b=YzyvTEloq+q4Sr6xrSmPzlGl3OguJcCh8ebdXy1DxCFrG4cd8l6jhVaH863Z99JdoW
 gVlHK3dcrpAWOxK7yecBWlUHE/ecAH8wZxauObV78J7USoSYq3jRe09ZJM4yEKTI7rvn
 GhHE+Op0yoqnT2maTlROo1r61vzKEz/XLLykZcVOkJLb8jfXJ025MaYv+kIr0xmFwIhb
 6EYXmzmY/FYusss+xdn72jxJ6kIESTZ+UTmiowpeP06fsMVDgxQckJwOFZhPf9FuRXPG
 rGQSwdN/XxFhnbGC/2vT4MHExSfs/zdc5IMtrFly9gsdyow5CTorJDWpB1TWoePcMNjJ
 bLfw==
X-Gm-Message-State: AOAM533F1hgMP2OznFCp5LsSCpO/6/u/QZnPaF/a6IfjMGNJ12jNJfBu
 hk0ETgabCv6IPVo75p+y2hl89mfAX/ZHqw0M/Hyk2/RsX6jasjtMM1homs5/MqB2HxPWR1q7I75
 TpyCM/jq+PLXjshw=
X-Received: by 2002:a1c:98d5:: with SMTP id
 a204mr20649375wme.160.1640774674479; 
 Wed, 29 Dec 2021 02:44:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd+bpHk5DH4rW+RtQW5fweZV58IUi3hJcaH/wVDm9rxQPGAI5t2hcqZ2QcH2Ia02bKA4Bwuw==
X-Received: by 2002:a1c:98d5:: with SMTP id
 a204mr20649353wme.160.1640774674251; 
 Wed, 29 Dec 2021 02:44:34 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id a20sm16373190wmb.27.2021.12.29.02.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 02:44:33 -0800 (PST)
Message-ID: <084c5004-6eb6-9952-0d9c-6ae3dc69aca0@redhat.com>
Date: Wed, 29 Dec 2021 11:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
 <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
 <2248a06d-7c3d-2ee3-e683-901d9bcbec02@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2248a06d-7c3d-2ee3-e683-901d9bcbec02@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 04:48, wangyanan (Y) wrote:
> Hi Philippe,
> Thanks for your review.
> 
> On 2021/12/29 3:17, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 12/28/21 10:22, Yanan Wang wrote:
>>> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
>>> which has been proved to benefit the scheduling performance (e.g.
>>> load balance and wake_affine strategy) on both x86_64 and AArch64.
>>>
>>> So now in Linux 5.16 we have four-level arch-neutral CPU topology
>>> definition like below and a new scheduler level for clusters.
>>> struct cpu_topology {
>>>      int thread_id;
>>>      int core_id;
>>>      int cluster_id;
>>>      int package_id;
>>>      int llc_id;
>>>      cpumask_t thread_sibling;
>>>      cpumask_t core_sibling;
>>>      cpumask_t cluster_sibling;
>>>      cpumask_t llc_sibling;
>>> }
>>>
>>> A cluster generally means a group of CPU cores which share L2 cache
>>> or other mid-level resources, and it is the shared resources that
>>> is used to improve scheduler's behavior. From the point of view of
>>> the size range, it's between CPU die and CPU core. For example, on
>>> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
>>> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
>>> L2 cache and a L3 cache tag, which brings cache affinity advantage.
>>>
>>> In virtualization, on the Hosts which have pClusters, if we can
>> Maybe [*] -> reference to pClusters?
> Hm, I'm not sure what kind of reference is appropriate here.

So I guess the confusion comes from a simple typo =)

Is it OK if I replace "pClusters" by "Clusters"?

> The third paragraph in the commit message has explained what
> a cluster generally means. We can also read the description of
> clusters in Linux kernel Kconfig files: [1] and [2].
> 
> [1]arm64: https://github.com/torvalds/linux/blob/master/arch/arm64/Kconfig
> 
> config SCHED_CLUSTER
>        bool "Cluster scheduler support"
>        help
>          Cluster scheduler support improves the CPU scheduler's decision
>          making when dealing with machines that have clusters of CPUs.
>          Cluster usually means a couple of CPUs which are placed closely
>          by sharing mid-level caches, last-level cache tags or internal
>          busses.
> 
> [2]x86: https://github.com/torvalds/linux/blob/master/arch/x86/Kconfig
> 
> config SCHED_CLUSTER
>        bool "Cluster scheduler support"
>        depends on SMP
>        default y
>        help
>          Cluster scheduler support improves the CPU scheduler's decision
>          making when dealing with machines that have clusters of CPUs.
>          Cluster usually means a couple of CPUs which are placed closely
>          by sharing mid-level caches, last-level cache tags or internal
>          busses.
>>> design a vCPU topology with cluster level for guest kernel and
>>> have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
>>> also make use of the cache affinity of CPU clusters to gain
>>> similar scheduling performance.
>>>
>>> This patch adds infrastructure for CPU cluster level topology
>>> configuration and parsing, so that the user can specify cluster
>>> parameter if their machines support it.
>>>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine-smp.c | 26 +++++++++++++++++++-------
>>>   hw/core/machine.c     |  3 +++
>>>   include/hw/boards.h   |  6 +++++-
>>>   qapi/machine.json     |  5 ++++-
>>>   qemu-options.hx       |  7 ++++---
>>>   softmmu/vl.c          |  3 +++
>>>   6 files changed, 38 insertions(+), 12 deletions(-)
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index edeab6084b..ff0ab4ca20 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -1404,7 +1404,9 @@
>>>   #
>>>   # @dies: number of dies per socket in the CPU topology
>>>   #
>>> -# @cores: number of cores per die in the CPU topology
>>> +# @clusters: number of clusters per die in the CPU topology
>> Missing:
>>
>>     #            (since 7.0)
> Ah, yes.
>>> +#
>>> +# @cores: number of cores per cluster in the CPU topology
>>>   #
>>>   # @threads: number of threads per core in the CPU topology
>>>   #
>>> @@ -1416,6 +1418,7 @@
>>>        '*cpus': 'int',
>>>        '*sockets': 'int',
>>>        '*dies': 'int',
>>> +     '*clusters': 'int',
>>>        '*cores': 'int',
>>>        '*threads': 'int',
>>>        '*maxcpus': 'int' } }
>> If you want I can update the doc when applying.
> Do you mean the missing "since 7.0"?
> If you have a plan to apply the first 1-7 patches separately and
> I don't need to respin, please help to update it, thank you! :)

Yes, that is the plan.

> 
> Thanks,
> Yanan
>> Thanks,
>>
>> Phil.
>>
>> .
> 


