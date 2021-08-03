Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134043DE662
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:56:25 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnPc-0001Gm-5E
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mAnOr-0000ZY-W1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:55:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:2959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mAnOq-0002WA-0C
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:55:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="211724593"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="211724593"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 22:55:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="666981964"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.238.6.254])
 ([10.238.6.254])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 22:55:29 -0700
Subject: Re: [PATCH v2 1/1] nvdimm: add 'target-node' option
To: Igor Mammedov <imammedo@redhat.com>
References: <20210719020153.30574-1-jingqi.liu@intel.com>
 <20210719020153.30574-2-jingqi.liu@intel.com>
 <20210729144444.22104221@redhat.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <a1c4dcda-78b7-52f2-2496-ed0750992134@intel.com>
Date: Tue, 3 Aug 2021 13:55:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729144444.22104221@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=jingqi.liu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 7/29/2021 8:44 PM, Igor Mammedov wrote:
> On Mon, 19 Jul 2021 10:01:53 +0800
> Jingqi Liu <jingqi.liu@intel.com> wrote:
> 
>> Linux kernel version 5.1 brings in support for the volatile-use of
>> persistent memory as a hotplugged memory region (KMEM DAX).
>> When this feature is enabled, persistent memory can be seen as a
>> separate memory-only NUMA node(s). This newly-added memory can be
>> selected by its unique NUMA node.
>>
>> Add 'target-node' option for 'nvdimm' device to indicate this NUMA
>> node. It can be extended to a new node after all existing NUMA nodes.
>>
>> The 'node' option of 'pc-dimm' device is to add the DIMM to an
>> existing NUMA node. The 'node' should be in the available NUMA nodes.
>> For KMEM DAX mode, persistent memory can be in a new separate
>> memory-only NUMA node. The new node is created dynamically.
>> So users use 'target-node' to control whether persistent memory
>> is added to an existing NUMA node or a new NUMA node.
>>
>> An example of configuration is as follows.
>>
>> Using the following QEMU command:
>>   -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
>>   -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=2
>>
>> To list DAX devices:
>>   # daxctl list -u
>>   {
>>     "chardev":"dax0.0",
>>     "size":"3.00 GiB (3.22 GB)",
>>     "target_node":2,
>>     "mode":"devdax"
>>   }
>>
>> To create a namespace in Device-DAX mode as a standard memory:
>>   $ ndctl create-namespace --mode=devdax --map=mem
>> To reconfigure DAX device from devdax mode to a system-ram mode:
>>   $ daxctl reconfigure-device dax0.0 --mode=system-ram
>>
>> There are two existing NUMA nodes in Guest. After these operations,
>> persistent memory is configured as a separate Node 2 and
>> can be used as a volatile memory. This NUMA node is dynamically
>> created according to 'target-node'.
> 
> 
> Well, I've looked at spec and series pointed at v1 thread,
> and I don't really see a good reason to add duplicate 'target-node'
> property to NVDIMM that for all practical purposes serves the same
> purpose as already existing 'node' property.
> The only thing that it does on top of existing 'node' property is
> facilitate implicit creation of numa nodes on top of user configured
> ones.
> 
> But what I really dislike, is adding implicit path to create
> numa nodes from random place.
> 
> It just creates mess and and doesn't really work well because you
> will have to plumb into other code to account for implicit nodes
> for it to work properly. (1st thing that comes to mind is HMAT
> configuration won't accept this implicit nodes, there might be
> other places that will not work as expected).
> So I suggest to abandon this approach and use already existing
> numa CLI options to do what you need.
> 
> What you are trying to achieve can be done without this series
> as QEMU allows to create memory only nodes and even empty ones
> (for future hotplug) just fine.
> The only thing is that one shall specify complete planned
> numa topology on command line.
> 
> Here is an example that works for me:
>     -machine q35,nvdimm=on \
>     -m 4G,slots=4,maxmem=12G \
>     -smp 4,cores=2 \
>     -object memory-backend-ram,size=4G,policy=bind,host-nodes=0,id=ram-node0 \
>     -numa node,nodeid=0,memdev=ram-node0
> # explicitly assign all CPUs
>     -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=0,socket-id=1
> # and create a cpu-less node for you nvdimm
>     -numa node,nodeid=1
> 
> with that you can hotplug nvdimm to with 'node=1' property set
> or provide that at startup, like this:
>     -object memory-backend-file,id=mem1,share=on,mem-path=nvdimmfile,size=3G,align=2M \
>     -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,node=1
> 
> after boot numactl -H will show:
> 
> available: 1 nodes (0)
> node 0 cpus: 0 1 2 3
> node 0 size: 3924 MB
> node 0 free: 3657 MB
> node distances:
> node   0
>    0:  10
> 
> and after initializing nvdimm as a dax device and
> reconfiguring that to system memory it will show
> as 'new' 'memory only' node
> 
> available: 2 nodes (0-1)
> node 0 cpus: 0 1 2 3
> node 0 size: 3924 MB
> node 0 free: 3641 MB
> node 1 cpus:
> node 1 size: 896 MB
> node 1 free: 896 MB
> node distances:
> node   0   1
>    0:  10  20
>    1:  20  10
> 
>> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
> [...]
> 

Thanks for your comments and detailed example.
I agree with you.
I've tried these commands and it works.

Actually, I've provided similar commands to the customer before.
They just had some concerns on the need to create complete numa 
topology. But seems it's the only way to create memory-only nodes for 
future hotplugging.

I'll try to convince the customer to use it.

Thanks,
Jingqi



