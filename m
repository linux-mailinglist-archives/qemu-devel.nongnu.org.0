Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1523AFCE3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:08:49 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvZaa-0007ry-Pz
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvZZm-0007DH-8e
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:07:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:29850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvZZi-0001HQ-RV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:07:57 -0400
IronPort-SDR: upH9qvWPVNpbAm746EM5Po9PurE710xxFiUMSDUw6Mnprh7zx0JQnE0dFVkqkgbRVDtN1fzsbZ
 G98S22eqSsjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="186680944"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="186680944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 23:07:51 -0700
IronPort-SDR: xjzGZ7D46sGTJ42hHWpSdk1xKQH19UK4qt1WzEXHg4sX9P/0pF4za8z4WNWeEXQpQB93KlKs68
 FDjp0xgsfaRw==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452485459"
Received: from unknown (HELO [10.239.13.19]) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 23:07:48 -0700
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org> <YNB4PbUeVbS0hqbA@work-vm>
From: "chen.zhang@intel.com" <chen.zhang@intel.com>
Message-ID: <5bfc50e3-2315-8a11-1152-9bc62cb1bf79@intel.com>
Date: Tue, 22 Jun 2021 14:01:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNB4PbUeVbS0hqbA@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/21/21 7:30 PM, Dr. David Alan Gilbert wrote:
> * Markus Armbruster (armbru@redhat.com) wrote:
>> Zhang Chen <chen.zhang@intel.com> writes:
>>
>>> Since the real user scenario does not need COLO to monitor all traffic.
>>> Add colo-passthrough-add and colo-passthrough-del to maintain
>>> a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
>>> All the fields of IPFlowSpec are optional.
>>>
>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>> ---
>> The QAPI schema looks good to me, but the interface documentation is
>> still not quite clear enough.  To make progress, I'm going to make
>> concrete suggestions wherever I can despite being quite clueless about
>> the subject matter.  Risks me writing something that's clearer, but
>> wrong.  Keep that in mind, please.
>>
>>>   net/net.c     | 10 +++++++
>>>   qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 84 insertions(+)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index 76bbb7c31b..f913e97983 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>>>       }
>>>   }
>>>   
>>> +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>>> +{
>>> +    /* TODO implement setup passthrough rule */
>>> +}
>>> +
>>> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>>> +{
>>> +    /* TODO implement delete passthrough rule */
>>> +}
>>> +
>>>   static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>>>   {
>>>       char *str;
>>> diff --git a/qapi/net.json b/qapi/net.json
>>> index 7fab2e7cd8..91f2e1495a 100644
>>> --- a/qapi/net.json
>>> +++ b/qapi/net.json
>>> @@ -7,6 +7,7 @@
>>>   ##
>>>   
>>>   { 'include': 'common.json' }
>>> +{ 'include': 'sockets.json' }
>>>   
>>>   ##
>>>   # @set_link:
>>> @@ -696,3 +697,76 @@
>>>   ##
>>>   { 'event': 'FAILOVER_NEGOTIATED',
>>>     'data': {'device-id': 'str'} }
>>> +
>>> +##
>>> +# @IPFlowSpec:
>>> +#
>>> +# IP flow specification.
>>> +#
>>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
>>> +#            string instead of enum, because it can be passed to getprotobyname(3)
>>> +#            and avoid duplication with /etc/protocols.
>> The rationale is good, but it doesn't really belong into the interface
>> documentation.  Suggest:
>>
>>     # @protocol: Transport layer protocol like TCP/UDP, etc.  This will be
>>     #            passed to getprotobyname(3).
>>
>>
>>> +#
>>> +# @object-name: The @object-name means packet handler in Qemu. Because not
>>> +#               all the network packet must pass the colo-compare module,
>>> +#               the net-filters are same situation. There modules attach to
>>> +#               netdev or chardev to work, VM can run multiple modules
>>> +#               at the same time. So it needs the object-name to set
>>> +#               the effective module.
>> I still don't understand this, and I'm too ignorant of COLO and
>> networking to suggest improvements.
>>
>> Jason or David, perhaps?
> I'll leave Jason to check on the object behaviour (and I see the rest of
> the thread); but at a high level, COLO is deciding whether to do VM
> synchronisation on whether the network behaviour of the two VMs get out
> of sync (e.g. due to randomness in the flow of requests); if you don't
> sync then when you fail-over, you'll get TCP errors/inconsistencies in
> the stream view from the secondary; but this patch series is saying
> you don't care if some TCP connections fail like that, you only care
> about maybe the main sockets the application is providing.

Yes, you are right.


Thanks

Chen


> Dave
>
>>> +#
>>> +# @source: Source address and port.
>>> +#
>>> +# @destination: Destination address and port.
>>> +#
>>> +# Since: 6.1
>>> +##
>>> +{ 'struct': 'IPFlowSpec',
>>> +  'data': { '*protocol': 'str', '*object-name': 'str',
>>> +    '*source': 'InetSocketAddressBase',
>>> +    '*destination': 'InetSocketAddressBase' } }
>>> +
>>> +##
>>> +# @colo-passthrough-add:
>>> +#
>>> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>>> +# The protocol and source/destination IP/ports are optional. if the user
>>> +# only inputs part of the information, this will match all traffic.
>> Actually, all arguments are optional.
>>
>> Suggest:
>>
>>     # Add an entry to the COLO network passthrough list.
>>     # Absent protocol, host addresses and ports match anything.
>>
>> If there is more than one such list, then "to a COLO network passthrough
>> list" instead.
>>
>> Still missing then: meaning of absent @object-name.  Does it select the
>> COLO network passthrough list, perhaps?
>>
>>> +#
>>> +# Returns: Nothing on success
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "colo-passthrough-add",
>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>> +# <- { "return": {} }
>>> +#
>>> +##
>>> +{ 'command': 'colo-passthrough-add', 'boxed': true,
>>> +     'data': 'IPFlowSpec' }
>>> +
>>> +##
>>> +# @colo-passthrough-del:
>>> +#
>>> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
>>> +# The protocol and source/destination IP/ports are optional. if the user
>>> +# only inputs part of the information, this will match all traffic.
>> I suspect this command doesn't actually match traffic, it matches
>> entries added with colo-passthrough-add.
>>
>> Can it delete more than one such entry?
>>
>> Suggest:
>>
>>     # Delete an entry from the COLO network passthrough list.
>>
>> and then explain how the command arguments select entries.
>>
>>> +#
>>> +# Returns: Nothing on success
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "colo-passthrough-del",
>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>> +# <- { "return": {} }
>>> +#
>>> +##
>>> +{ 'command': 'colo-passthrough-del', 'boxed': true,
>>> +     'data': 'IPFlowSpec' }

