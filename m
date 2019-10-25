Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA5E43A0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 08:35:09 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNtBj-0003lG-T6
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 02:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34947)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iNtAg-0002Su-Fe
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iNtAe-0007fx-9S
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:34:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:3375)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iNtAe-0007fF-1j
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:34:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 23:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,227,1569308400"; d="scan'208";a="188833237"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.142])
 ([10.239.196.142])
 by orsmga007.jf.intel.com with ESMTP; 24 Oct 2019 23:33:54 -0700
Subject: Re: [PATCH v13 06/12] numa: Extend CLI to provide memory latency and
 bandwidth information
To: Igor Mammedov <imammedo@redhat.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
 <20191020111125.27659-7-tao3.xu@intel.com>
 <20191023172854.42c495d5@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <9e30d8fe-7274-4ee8-3c4b-64c370141358@intel.com>
Date: Fri, 25 Oct 2019 14:33:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023172854.42c495d5@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/2019 11:28 PM, Igor Mammedov wrote:
> On Sun, 20 Oct 2019 19:11:19 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
[...]
>> +#
>> +# @access-bandwidth: access bandwidth (MB/s)
>> +#
>> +# @read-bandwidth: read bandwidth (MB/s)
>> +#
>> +# @write-bandwidth: write bandwidth (MB/s)
> I think units here are not appropriate, values stored in fields are
> minimal base units only and nothing else (i.e. ps and B/s)
> 
Eric suggest me to drop picoseconds. So here I can use ns. For 
bandwidth, if we use B/s here, does it let user or developer to 
misunderstand that the smallest unit is B/s ?

>>   @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>>   @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>>   @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
>>   @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
>> +@itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{str},data-type=@var{str}[,latency=@var{lat}][,bandwidth=@var{bw}]
>                                                                                ^^^                 ^^^
> Using the same 'str' for 2 different enums is confusing.
> Suggest for 1st use 'level' and for the second just 'type'
> 
Ok

>>   @findex -numa
>>   Define a NUMA node and assign RAM and VCPUs to it.
>>   Set the NUMA distance from a source node to a destination node.
>> +Set the ACPI Heterogeneous Memory Attributes for the given nodes.
>>   
>>   Legacy VCPU assignment uses @samp{cpus} option where
>>   @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
>> @@ -256,6 +259,50 @@ specified resources, it just assigns existing resources to NUMA
>>   nodes. This means that one still has to use the @option{-m},
>>   @option{-smp} options to allocate RAM and VCPUs respectively.
>>   
>> +Use @samp{hmat-lb} to set System Locality Latency and Bandwidth Information
>> +between initiator and target NUMA nodes in ACPI Heterogeneous Attribute Memory Table (HMAT).
>> +Initiator NUMA node can create memory requests, usually including one or more processors.
> s/including/it has/
> 
>> +Target NUMA node contains addressable memory.
>> +
>> +In @samp{hmat-lb} option, @var{node} are NUMA node IDs. @var{str} of 'hierarchy'
>> +is the memory hierarchy of the target NUMA node: if @var{str} is 'memory', the structure
>> +represents the memory performance; if @var{str} is 'first-level|second-level|third-level',
>> +this structure represents aggregated performance of memory side caches for each domain.
>> +@var{str} of 'data-type' is type of data represented by this structure instance:
>> +if 'hierarchy' is 'memory', 'data-type' is 'access|read|write' latency(nanoseconds)
> is nanoseconds is right here? Looking at previous patches default value of suffix-less
> should be picoseconds. I'd just drop '(nanoseconds)'. User will use appropriate suffix.
> 
OK, I will drop it.
>> +or 'access|read|write' bandwidth(MB/s) of the target memory; if 'hierarchy' is
> ditto (MB/s), probably should be Bytes/s for default suffix-less value
> (well, I'm not sure how to express it better)
> 

But last version, we let !QEMU_IS_ALIGNED(node->bandwidth, MiB) as error.
>> +'first-level|second-level|third-level', 'data-type' is 'access|read|write' hit latency
>> +or 'access|read|write' hit bandwidth of the target memory side cache.
>> +
>> +@var{lat} of 'latency' is latency value, the possible value and units are
>> +NUM[ps|ns|us] (picosecond|nanosecond|microsecond), the recommended unit is 'ns'. @var{bw}
>> +is bandwidth value, the possible value and units are NUM[M|G|T], mean that
> 
>> +the bandwidth value are NUM MB/s, GB/s or TB/s. Note that max NUM is 65534,
>> +if NUM is 0, means the corresponding latency or bandwidth information is not provided.
>> +And if input numbers without any unit, the latency unit will be 'ps' and the bandwidth
>> +will be MB/s.
>   1st: above is applicable to both bw and lat values and should be documented as such
>   2nd: 'max NUM is 65534' when different suffixes is fleeting target,
>        spec says that entry with 0xFFFF is unreachable, so how about documenting
>        unreachable value as 0xFFFFFFFFFFFFFFFF (then CLI parsing code will
>        exclude it from range detection and acpi table building code translate it
>        to internal 0xFFFF it could fit into the tables)
> 

If we input 0xFFFFFFFFFFFFFFFF, qemu will raise error that parameter 
expect a size value.


