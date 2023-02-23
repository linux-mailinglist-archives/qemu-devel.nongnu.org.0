Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5C6A019F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 04:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV2fX-0003KO-6x; Wed, 22 Feb 2023 22:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pV2fS-0003Jz-OW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:53:14 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pV2fP-0002Ze-P3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 22:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677124391; x=1708660391;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cmhG6VCOdCnIg031ZGNAEjdie+7RC20CYfV/pfcsRSI=;
 b=fqJ1umjBW0ABn5MfxncojM+4swPOHlkNccFA3+FwnyO6CsDIBEQdSfw5
 NyjMKa1g60pKT1AGojwoshCQwe1Vay5a9CRMdmWxeaBj6cxWLA4GYCxYj
 6NqMRThd8uuNztrexHcMdwvaJHpbJ6ayZtDX5s6W2+zmQ4V14TjdL3Bzb
 J4gfhbnwYvsCsU43FqPJvcT6xdOq3zgulTRs7Uc03ukGpP8m3CDcdTCuh
 PWERa9JcfEkdataMulft4BY2Em8NvgPis64XBTdwU2sBx8fe6MmsSUsxe
 sKxIQAkZSEbSkHJVn51yHmBjvG5GOSwhEOWA7FJbdktkTcfmthVjnyVnF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312731940"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="312731940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 19:53:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="736176662"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="736176662"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.173.167])
 ([10.249.173.167])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 19:52:59 -0800
Message-ID: <3b5a7b9e-65f1-50d8-4605-0a8a4e06c0ee@intel.com>
Date: Thu, 23 Feb 2023 11:52:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
 CPUID.04H
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-5-zhao1.liu@linux.intel.com>
 <e7d7f1a0-15ac-d863-625f-08e66667e4ec@intel.com>
 <Y/W4LFqvUbsleBAf@liuzhao-OptiPlex-7080>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <Y/W4LFqvUbsleBAf@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/22/2023 2:37 PM, Zhao Liu wrote:
> Hi Xiaoyao,
> 
> Thanks, I've spent some time thinking about it here.
> 
> On Mon, Feb 20, 2023 at 02:59:20PM +0800, Xiaoyao Li wrote:
>> Date: Mon, 20 Feb 2023 14:59:20 +0800
>> From: Xiaoyao Li <xiaoyao.li@intel.com>
>> Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs
>>   in CPUID.04H
>>
>> On 2/13/2023 5:36 PM, Zhao Liu wrote:
>>> For i-cache and d-cache, the maximum IDs for CPUs sharing cache (
>>> CPUID.04H.00H:EAX[bits 25:14] and CPUID.04H.01H:EAX[bits 25:14]) are
>>> both 0, and this means i-cache and d-cache are shared in the SMT level.
>>> This is correct if there's single thread per core, but is wrong for the
>>> hyper threading case (one core contains multiple threads) since the
>>> i-cache and d-cache are shared in the core level other than SMT level.
>>>
>>> Therefore, in order to be compatible with both multi-threaded and
>>> single-threaded situations, we should set i-cache and d-cache be shared
>>> at the core level by default.
>>
>> It's true for VM only when the exactly HW topology is configured to VM.
>> i.e., two virtual LPs of one virtual CORE are pinned to two physical LPs
>> that of one physical CORE.
> 
> Yes, in this case, host and guest has the same topology, and their
> topology can match.
> 
>> Otherwise it's incorrect for VM.
> 
> My understanding here is that what we do in QEMU is to create
> self-consistent CPU topology and cache topology for the guest.
> 
> If the VM topology is self-consistent and emulated to be almost
> identical to the real machine, then the emulation in QEMU is correct,
> right? ;-)

Real machine tells two threads in the same CORE share the L1 cahche via 
CUPID because it's the fact and it is how exactly hardware resource lay 
out. However, for VM, when you tell the same thing (two threads share 
the L1 cache), is it true for vcpus?

The target is to emulate things correctly, not emulate it identical to 
real machine. In fact, for these shared resources, it's mostly 
infeasible to emulate correctly if not pinning vcpus to physical LPs.

>>
>> for example. given a VM of 4 threads and 2 cores. If not pinning the 4
>> threads to physical 4 LPs of 2 CORES. It's likely each vcpu running on a LP
>> of different physical cores.
> 
> Thanks for bringing this up, this is worth discussing.
> 
> I looked into it and found that the specific scheduling policy for the
> vCPU actually depends on the host setting. For example, (IIUC) if host
> 
> enables core scheduling, then host will schedule the vCPU on the SMT
> threads of same core.
> 
> Also, to explore the original purpose of the "per thread" i/d cache
> topology, I have retraced its history.
> 
> The related commit should be in '09, which is 400281a (set CPUID bits
> to present cores and threads topology). In this commit, the
> multithreading cache topology is added in CPUID.04H. In particular, here
> it set the L2 cache level to per core, but it did not change the level of
> L1 (i/d cache), that is, L1 still remains per thread.
> 
> I think that here is the problem, L1 should also be per core in
> multithreading case. (the fix for this patch is worth it?)
> 
> Another thing we can refer to is that AMD's i/d cache topology is per
> core rather than per thread (different CPUID leaf than intel): In
> encode_cache_cpuid8000001d() (target/i386/cpu.c), i/d cache and L2
> are encoded as core level in EAX. They set up the per core supposedly
> to emulate the L1 topology of the real machine as well.
> 
> So, I guess this example is "unintentionally" benefiting from the
> "per thread" level of i/d cache.
> 
> What do you think?
> 
>> So no vcpu shares L1i/L1d cache at core level.
> 
> Yes. The scheduling of host is not guaranteed, and workload balance
> policies in various scenarios and some security mitigation ways may
> break the delicate balance we have carefully set up.
> 
> Perhaps another way is to also add a new command "x-l1-cache-topo" (like
> [1] did for L2) that can adjust the i/d cache level from core to smt to
> benefit cases like this.
> 
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03201.html
> 
> Thanks,
> Zhao
> 


