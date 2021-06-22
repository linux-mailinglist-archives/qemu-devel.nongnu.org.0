Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B03AFED1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:10:47 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbUc-0000JT-C5
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvbTT-0007iR-0B
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:09:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:61061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvbTM-0003c9-MU
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:09:34 -0400
IronPort-SDR: rEdAhQGhuzmovMIbWQVwJaolsPIb+0P3Y7DTaWf+L1OQaPtJgPBdNo4q+BgKHmA+xc291Oz8k1
 3UcHpP/nCoUg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="228562996"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="228562996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 01:09:22 -0700
IronPort-SDR: EicK6R7p6Zr3BFZR5ca5IdlcFd4VOQ5GedbZqz3I+bFj5JInYWgPnwPIQxjzY3+daX7SGEPcLU
 t8ApWJzvQbaA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452520390"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 01:09:19 -0700
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org> <YNB4PbUeVbS0hqbA@work-vm>
 <5bfc50e3-2315-8a11-1152-9bc62cb1bf79@intel.com>
 <83403e8a-71b3-dacd-bab0-c1aee51e2d10@redhat.com>
 <c0f94696-8af0-9dbf-38e8-ded2e00d2ac4@intel.com>
 <4d8f38ff-46a3-e687-db6c-6c424c6543af@redhat.com>
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
Message-ID: <b183d730-1921-e08f-9679-2b1bde789ad1@intel.com>
Date: Tue, 22 Jun 2021 16:02:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4d8f38ff-46a3-e687-db6c-6c424c6543af@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/22/21 4:03 PM, Jason Wang wrote:
> 在 2021/6/22 下午3:38, chen.zhang@intel.com 写道:
>> On 6/22/21 3:04 PM, Jason Wang wrote:
>>> 在 2021/6/22 下午2:01, chen.zhang@intel.com 写道:
>>>> On 6/21/21 7:30 PM, Dr. David Alan Gilbert wrote:
>>>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>>>> Zhang Chen <chen.zhang@intel.com> writes:
>>>>>>
>>>>>>> Since the real user scenario does not need COLO to monitor all
>>>>>>> traffic.
>>>>>>> Add colo-passthrough-add and colo-passthrough-del to maintain
>>>>>>> a COLO network passthrough list. Add IPFlowSpec struct for all QMP
>>>>>>> commands.
>>>>>>> All the fields of IPFlowSpec are optional.
>>>>>>>
>>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>>> ---
>>>>>> The QAPI schema looks good to me, but the interface documentation is
>>>>>> still not quite clear enough.  To make progress, I'm going to make
>>>>>> concrete suggestions wherever I can despite being quite clueless
>>>>>> about
>>>>>> the subject matter.  Risks me writing something that's clearer, but
>>>>>> wrong.  Keep that in mind, please.
>>>>>>
>>>>>>>     net/net.c     | 10 +++++++
>>>>>>>     qapi/net.json | 74
>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>     2 files changed, 84 insertions(+)
>>>>>>>
>>>>>>> diff --git a/net/net.c b/net/net.c
>>>>>>> index 76bbb7c31b..f913e97983 100644
>>>>>>> --- a/net/net.c
>>>>>>> +++ b/net/net.c
>>>>>>> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error
>>>>>>> **errp)
>>>>>>>         }
>>>>>>>     }
>>>>>>>     +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>>>>>>> +{
>>>>>>> +    /* TODO implement setup passthrough rule */
>>>>>>> +}
>>>>>>> +
>>>>>>> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>>>>>>> +{
>>>>>>> +    /* TODO implement delete passthrough rule */
>>>>>>> +}
>>>>>>> +
>>>>>>>     static void netfilter_print_info(Monitor *mon, NetFilterState
>>>>>>> *nf)
>>>>>>>     {
>>>>>>>         char *str;
>>>>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>>>>> index 7fab2e7cd8..91f2e1495a 100644
>>>>>>> --- a/qapi/net.json
>>>>>>> +++ b/qapi/net.json
>>>>>>> @@ -7,6 +7,7 @@
>>>>>>>     ##
>>>>>>>       { 'include': 'common.json' }
>>>>>>> +{ 'include': 'sockets.json' }
>>>>>>>       ##
>>>>>>>     # @set_link:
>>>>>>> @@ -696,3 +697,76 @@
>>>>>>>     ##
>>>>>>>     { 'event': 'FAILOVER_NEGOTIATED',
>>>>>>>       'data': {'device-id': 'str'} }
>>>>>>> +
>>>>>>> +##
>>>>>>> +# @IPFlowSpec:
>>>>>>> +#
>>>>>>> +# IP flow specification.
>>>>>>> +#
>>>>>>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The
>>>>>>> protocol is the
>>>>>>> +#            string instead of enum, because it can be passed to
>>>>>>> getprotobyname(3)
>>>>>>> +#            and avoid duplication with /etc/protocols.
>>>>>> The rationale is good, but it doesn't really belong into the
>>>>>> interface
>>>>>> documentation.  Suggest:
>>>>>>
>>>>>>       # @protocol: Transport layer protocol like TCP/UDP, etc. This
>>>>>> will be
>>>>>>       #            passed to getprotobyname(3).
>>>>>>
>>>>>>
>>>>>>> +#
>>>>>>> +# @object-name: The @object-name means packet handler in Qemu.
>>> I think we need clarify "packet handler" here. It does not look like a
>>> Qemu terminology.
>>
>> OK.
>>
>> The @object-name means a qemu object with network packet processing
>> function, for example colo-compare, filtr-mirror, etc.
>>
>> I will add it in the next version.
>
> So if two net-filters want to use exact the same set of flowspec, we
> need to specify them twice?


Yes. Each filter has it's own pass-through list.


Thanks

Chen


>
>>
>>>
>>>>>>> Because not
>>>>>>> +#               all the network packet must pass the colo-compare
>>>>>>> module,
>>>>>>> +#               the net-filters are same situation. There modules
>>>>>>> attach to
>>>>>>> +#               netdev or chardev to work, VM can run multiple
>>>>>>> modules
>>>>>>> +#               at the same time.
>>> This sentence needs some tweak since I fail to understand it's meaning.
>>>
>> OK. Change to:
>>
>> VM can running with multi network packet processing function objects.
>>
>> They can control different network data paths from netdev or chardev.
>>
>> So it needs the object-name to set the effective module.
>>
>>
>>>>>>> So it needs the object-name to set
>>>>>>> +#               the effective module.
>>>>>> I still don't understand this, and I'm too ignorant of COLO and
>>>>>> networking to suggest improvements.
>>>>>>
>>>>>> Jason or David, perhaps?
>>>>> I'll leave Jason to check on the object behaviour (and I see the
>>>>> rest of
>>>>> the thread); but at a high level, COLO is deciding whether to do VM
>>>>> synchronisation on whether the network behaviour of the two VMs get
>>>>> out
>>>>> of sync (e.g. due to randomness in the flow of requests); if you don't
>>>>> sync then when you fail-over, you'll get TCP errors/inconsistencies in
>>>>> the stream view from the secondary; but this patch series is saying
>>>>> you don't care if some TCP connections fail like that, you only care
>>>>> about maybe the main sockets the application is providing.
>>>> Yes, you are right.
>>> I wonder if it's the best to introduce colo specific command here.
>>> Instead, can we introduce commands to set and get netfilter properties?
>> This series has not added pass-through support for other netfilters,
>>
>> Can we change the qmp command to passthrough-filter-add/del as
>> markus's comments in this series,
>
> It looks more general, so I think it should work.
>
> Thanks
>
>
>> And enable filters pass-through capability and add properties in next
>> series. Step by step.
>>
>>
>> Thanks
>>
>> Chen
>>
>>
>>> Thanks
>>>
>>>
>>>> Thanks
>>>>
>>>> Chen
>>>>
>>>>
>>>>> Dave
>>>>>
>>>>>>> +#
>>>>>>> +# @source: Source address and port.
>>>>>>> +#
>>>>>>> +# @destination: Destination address and port.
>>>>>>> +#
>>>>>>> +# Since: 6.1
>>>>>>> +##
>>>>>>> +{ 'struct': 'IPFlowSpec',
>>>>>>> +  'data': { '*protocol': 'str', '*object-name': 'str',
>>>>>>> +    '*source': 'InetSocketAddressBase',
>>>>>>> +    '*destination': 'InetSocketAddressBase' } }
>>>>>>> +
>>>>>>> +##
>>>>>>> +# @colo-passthrough-add:
>>>>>>> +#
>>>>>>> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>>>>>>> +# The protocol and source/destination IP/ports are optional. if
>>>>>>> the user
>>>>>>> +# only inputs part of the information, this will match all traffic.
>>>>>> Actually, all arguments are optional.
>>>>>>
>>>>>> Suggest:
>>>>>>
>>>>>>       # Add an entry to the COLO network passthrough list.
>>>>>>       # Absent protocol, host addresses and ports match anything.
>>>>>>
>>>>>> If there is more than one such list, then "to a COLO network
>>>>>> passthrough
>>>>>> list" instead.
>>>>>>
>>>>>> Still missing then: meaning of absent @object-name.  Does it
>>>>>> select the
>>>>>> COLO network passthrough list, perhaps?
>>>>>>
>>>>>>> +#
>>>>>>> +# Returns: Nothing on success
>>>>>>> +#
>>>>>>> +# Since: 6.1
>>>>>>> +#
>>>>>>> +# Example:
>>>>>>> +#
>>>>>>> +# -> { "execute": "colo-passthrough-add",
>>>>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>>>>> +# <- { "return": {} }
>>>>>>> +#
>>>>>>> +##
>>>>>>> +{ 'command': 'colo-passthrough-add', 'boxed': true,
>>>>>>> +     'data': 'IPFlowSpec' }
>>>>>>> +
>>>>>>> +##
>>>>>>> +# @colo-passthrough-del:
>>>>>>> +#
>>>>>>> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
>>>>>>> +# The protocol and source/destination IP/ports are optional. if
>>>>>>> the user
>>>>>>> +# only inputs part of the information, this will match all traffic.
>>>>>> I suspect this command doesn't actually match traffic, it matches
>>>>>> entries added with colo-passthrough-add.
>>>>>>
>>>>>> Can it delete more than one such entry?
>>>>>>
>>>>>> Suggest:
>>>>>>
>>>>>>       # Delete an entry from the COLO network passthrough list.
>>>>>>
>>>>>> and then explain how the command arguments select entries.
>>>>>>
>>>>>>> +#
>>>>>>> +# Returns: Nothing on success
>>>>>>> +#
>>>>>>> +# Since: 6.1
>>>>>>> +#
>>>>>>> +# Example:
>>>>>>> +#
>>>>>>> +# -> { "execute": "colo-passthrough-del",
>>>>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>>>>> +# <- { "return": {} }
>>>>>>> +#
>>>>>>> +##
>>>>>>> +{ 'command': 'colo-passthrough-del', 'boxed': true,
>>>>>>> +     'data': 'IPFlowSpec' }

