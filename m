Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F73AFD8D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 09:06:43 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaUc-0000Z7-C1
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 03:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvaSh-0007O4-QB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvaSe-0004hj-Lk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624345479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/mwW6rSZjEn7qj1SxdIJOBxbNOTDY6DeSrbREkH5XY=;
 b=Zz7HafFN4ZE+sOSeJ0QXxaT4rU+MqDCF9tlnRpn9Gh2/AELM0y6/Gzdi5rOqtq4cWklyDu
 suv+gzDUb4wy48s2YFH3CT2StRcypQrBymaHBX7rnQAObBQ69Ji1JqIl6tHBj4M1DpL+KU
 1VPu5Z5Bv0M38KD6YaBbavlkyYCsMf8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-hMBeDyINMUK9SgnARyxGJw-1; Tue, 22 Jun 2021 03:04:38 -0400
X-MC-Unique: hMBeDyINMUK9SgnARyxGJw-1
Received: by mail-pf1-f200.google.com with SMTP id
 124-20020a6217820000b02902feebfd791eso7981593pfx.19
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=k/mwW6rSZjEn7qj1SxdIJOBxbNOTDY6DeSrbREkH5XY=;
 b=ZE3VChnuLd5ZMb1cVLL5OAd/qkkeZPJQuJhKTKVYT2m+1H/IDG5Ik+7SXINxyB08A7
 Yd63Hy9Rf+KdOVH77GEFMCWa9GKKktPW6Ysa1oWUEcT9kY4TAIoEwhsovhGNQ1lVzSj3
 8alfUowKZHSHnkK1OAzTdSNQkoRXXwJbvk5hAQUCoUpa64Dho/KIhu80HtOsVOUSnYIw
 o6UpbNRnEcYYcCkYKiDr0TrpfSY0hKGE2FAGVcnGvaSaVumFIPX6p87OOffAAI68S1bi
 +M+QztyYZ280NOFLaMhj23yQ6VK+NjRgJ4XYFyNO1OZPpQ4YzWOxhms++yUsNPbJo8G8
 cEdQ==
X-Gm-Message-State: AOAM530Z4vUEFX6khptl5vWejfq8GeiYs2oMEJx/LlBQ5TpvUn7fr2iT
 UWgNKA/qAh3E0FK5WXeLvIWVqnIYALTIvmUoQK5hf32uVDV19xS6KS99HYWIJyQOP9KqRcTtPd9
 smkWz2gjC4P0KVTU=
X-Received: by 2002:a17:90a:6ba3:: with SMTP id
 w32mr2548663pjj.33.1624345477065; 
 Tue, 22 Jun 2021 00:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztKsY3KTH3Bss05fJ2pzpWbTCqF7rH+bC4CKqsQe/hP3oOxLCuOnScJwrnNMMuKFd1588EhA==
X-Received: by 2002:a17:90a:6ba3:: with SMTP id
 w32mr2548630pjj.33.1624345476738; 
 Tue, 22 Jun 2021 00:04:36 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y29sm18743432pff.161.2021.06.22.00.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:04:36 -0700 (PDT)
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: "chen.zhang@intel.com" <chen.zhang@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org> <YNB4PbUeVbS0hqbA@work-vm>
 <5bfc50e3-2315-8a11-1152-9bc62cb1bf79@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <83403e8a-71b3-dacd-bab0-c1aee51e2d10@redhat.com>
Date: Tue, 22 Jun 2021 15:04:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5bfc50e3-2315-8a11-1152-9bc62cb1bf79@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/22 下午2:01, chen.zhang@intel.com 写道:
>
> On 6/21/21 7:30 PM, Dr. David Alan Gilbert wrote:
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> Zhang Chen <chen.zhang@intel.com> writes:
>>>
>>>> Since the real user scenario does not need COLO to monitor all 
>>>> traffic.
>>>> Add colo-passthrough-add and colo-passthrough-del to maintain
>>>> a COLO network passthrough list. Add IPFlowSpec struct for all QMP 
>>>> commands.
>>>> All the fields of IPFlowSpec are optional.
>>>>
>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>> ---
>>> The QAPI schema looks good to me, but the interface documentation is
>>> still not quite clear enough.  To make progress, I'm going to make
>>> concrete suggestions wherever I can despite being quite clueless about
>>> the subject matter.  Risks me writing something that's clearer, but
>>> wrong.  Keep that in mind, please.
>>>
>>>>   net/net.c     | 10 +++++++
>>>>   qapi/net.json | 74 
>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>   2 files changed, 84 insertions(+)
>>>>
>>>> diff --git a/net/net.c b/net/net.c
>>>> index 76bbb7c31b..f913e97983 100644
>>>> --- a/net/net.c
>>>> +++ b/net/net.c
>>>> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error 
>>>> **errp)
>>>>       }
>>>>   }
>>>>   +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>>>> +{
>>>> +    /* TODO implement setup passthrough rule */
>>>> +}
>>>> +
>>>> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>>>> +{
>>>> +    /* TODO implement delete passthrough rule */
>>>> +}
>>>> +
>>>>   static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>>>>   {
>>>>       char *str;
>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>> index 7fab2e7cd8..91f2e1495a 100644
>>>> --- a/qapi/net.json
>>>> +++ b/qapi/net.json
>>>> @@ -7,6 +7,7 @@
>>>>   ##
>>>>     { 'include': 'common.json' }
>>>> +{ 'include': 'sockets.json' }
>>>>     ##
>>>>   # @set_link:
>>>> @@ -696,3 +697,76 @@
>>>>   ##
>>>>   { 'event': 'FAILOVER_NEGOTIATED',
>>>>     'data': {'device-id': 'str'} }
>>>> +
>>>> +##
>>>> +# @IPFlowSpec:
>>>> +#
>>>> +# IP flow specification.
>>>> +#
>>>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The 
>>>> protocol is the
>>>> +#            string instead of enum, because it can be passed to 
>>>> getprotobyname(3)
>>>> +#            and avoid duplication with /etc/protocols.
>>> The rationale is good, but it doesn't really belong into the interface
>>> documentation.  Suggest:
>>>
>>>     # @protocol: Transport layer protocol like TCP/UDP, etc. This 
>>> will be
>>>     #            passed to getprotobyname(3).
>>>
>>>
>>>> +#
>>>> +# @object-name: The @object-name means packet handler in Qemu.


I think we need clarify "packet handler" here. It does not look like a 
Qemu terminology.


>>>> Because not
>>>> +#               all the network packet must pass the colo-compare 
>>>> module,
>>>> +#               the net-filters are same situation. There modules 
>>>> attach to
>>>> +#               netdev or chardev to work, VM can run multiple 
>>>> modules
>>>> +#               at the same time. 


This sentence needs some tweak since I fail to understand it's meaning.


>>>> So it needs the object-name to set
>>>> +#               the effective module.
>>> I still don't understand this, and I'm too ignorant of COLO and
>>> networking to suggest improvements.
>>>
>>> Jason or David, perhaps?
>> I'll leave Jason to check on the object behaviour (and I see the rest of
>> the thread); but at a high level, COLO is deciding whether to do VM
>> synchronisation on whether the network behaviour of the two VMs get out
>> of sync (e.g. due to randomness in the flow of requests); if you don't
>> sync then when you fail-over, you'll get TCP errors/inconsistencies in
>> the stream view from the secondary; but this patch series is saying
>> you don't care if some TCP connections fail like that, you only care
>> about maybe the main sockets the application is providing.
>
> Yes, you are right.


I wonder if it's the best to introduce colo specific command here. 
Instead, can we introduce commands to set and get netfilter properties?

Thanks


>
>
> Thanks
>
> Chen
>
>
>> Dave
>>
>>>> +#
>>>> +# @source: Source address and port.
>>>> +#
>>>> +# @destination: Destination address and port.
>>>> +#
>>>> +# Since: 6.1
>>>> +##
>>>> +{ 'struct': 'IPFlowSpec',
>>>> +  'data': { '*protocol': 'str', '*object-name': 'str',
>>>> +    '*source': 'InetSocketAddressBase',
>>>> +    '*destination': 'InetSocketAddressBase' } }
>>>> +
>>>> +##
>>>> +# @colo-passthrough-add:
>>>> +#
>>>> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>>>> +# The protocol and source/destination IP/ports are optional. if 
>>>> the user
>>>> +# only inputs part of the information, this will match all traffic.
>>> Actually, all arguments are optional.
>>>
>>> Suggest:
>>>
>>>     # Add an entry to the COLO network passthrough list.
>>>     # Absent protocol, host addresses and ports match anything.
>>>
>>> If there is more than one such list, then "to a COLO network 
>>> passthrough
>>> list" instead.
>>>
>>> Still missing then: meaning of absent @object-name.  Does it select the
>>> COLO network passthrough list, perhaps?
>>>
>>>> +#
>>>> +# Returns: Nothing on success
>>>> +#
>>>> +# Since: 6.1
>>>> +#
>>>> +# Example:
>>>> +#
>>>> +# -> { "execute": "colo-passthrough-add",
>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>> +# <- { "return": {} }
>>>> +#
>>>> +##
>>>> +{ 'command': 'colo-passthrough-add', 'boxed': true,
>>>> +     'data': 'IPFlowSpec' }
>>>> +
>>>> +##
>>>> +# @colo-passthrough-del:
>>>> +#
>>>> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
>>>> +# The protocol and source/destination IP/ports are optional. if 
>>>> the user
>>>> +# only inputs part of the information, this will match all traffic.
>>> I suspect this command doesn't actually match traffic, it matches
>>> entries added with colo-passthrough-add.
>>>
>>> Can it delete more than one such entry?
>>>
>>> Suggest:
>>>
>>>     # Delete an entry from the COLO network passthrough list.
>>>
>>> and then explain how the command arguments select entries.
>>>
>>>> +#
>>>> +# Returns: Nothing on success
>>>> +#
>>>> +# Since: 6.1
>>>> +#
>>>> +# Example:
>>>> +#
>>>> +# -> { "execute": "colo-passthrough-del",
>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>> +# <- { "return": {} }
>>>> +#
>>>> +##
>>>> +{ 'command': 'colo-passthrough-del', 'boxed': true,
>>>> +     'data': 'IPFlowSpec' }
>


