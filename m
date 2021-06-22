Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6B3AFEB6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:05:22 +0200 (CEST)
Received: from localhost ([::1]:35558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbPN-0002dt-Eh
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvbNz-0001y6-Jz
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvbNx-0008FH-9S
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624349032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQU9otthvwyoup3fQ94xOzhJLd8lEEsgnUOoEE36DKI=;
 b=RHfkzX/UWBvJvLdqOaSuTAADF7FFLqv3u8jVT3mojha7TecGhGpIS8vrckt0QjTjyFlENs
 pzoIhLfakW18eMmgMbh8ExeJMy/9zFpM/KSASCJ9xrkKKgqsRVJ7BXAEdM0cVayPklOlMO
 MedyvpV8lRyQ1ChUqSyPZUqDPXQ1tVE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1YRVa5dBMnKZYOB2qN7IOg-1; Tue, 22 Jun 2021 04:03:48 -0400
X-MC-Unique: 1YRVa5dBMnKZYOB2qN7IOg-1
Received: by mail-pj1-f70.google.com with SMTP id
 l4-20020a17090aec04b029016fb0a5610dso1567293pjy.7
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vQU9otthvwyoup3fQ94xOzhJLd8lEEsgnUOoEE36DKI=;
 b=Fxt3szM4qoboQoMMlQrzURbPggMCUpK9SR/zacWPyKjII1wwNQmJaNPt0LSFXnFBcK
 uRtYmuAf2R31yUIz10VSI9o7CP2KntoTNfZwSdd7CLFrygFn1dwqi69fkKOuc23ibMp5
 nPPZp87xxoQCvUidtomq2+TKqixkEswG1ujzC+mErWtyFJP6fdTxwh3QUQYFEquXWSuD
 /W0vsyGLHMec5DHcMqDwXBt0ZJl29FEbwsIM4khEDZexsGhpyDsfocKYmvqSll1CnBvM
 nX2XgMDIfOr8l5OJLj71IZhhq0ww+orARMbj97TNoeMa+OPTJWhlfApWtx/LrKg0Z9ws
 0opg==
X-Gm-Message-State: AOAM531RuG4kX5GC0xYks2BonTugzLftj8+ny7IUqckqyqBBQE/DwJJG
 p5dPLQiJEsnV4BEc85/5n1VD3DXrykvLLLiYnYshjuGpPenibWXmObJM5lNbhX3ogoqpmTdQ3L1
 Kn8gfgG2eUt4hAlI=
X-Received: by 2002:a17:902:c1cc:b029:122:52b4:3855 with SMTP id
 c12-20020a170902c1ccb029012252b43855mr17060677plc.10.1624349027675; 
 Tue, 22 Jun 2021 01:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKxIZwonbguYUEsfTLZH9KdZ791i7lc3dvcCen/B+3jc7kcqXxbZUuoo0j1cSKOdHTR7xMeg==
X-Received: by 2002:a17:902:c1cc:b029:122:52b4:3855 with SMTP id
 c12-20020a170902c1ccb029012252b43855mr17060648plc.10.1624349027320; 
 Tue, 22 Jun 2021 01:03:47 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z22sm18549687pfa.157.2021.06.22.01.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:03:46 -0700 (PDT)
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
To: "chen.zhang@intel.com" <chen.zhang@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
 <87zgvrnq7w.fsf@dusky.pond.sub.org> <YNB4PbUeVbS0hqbA@work-vm>
 <5bfc50e3-2315-8a11-1152-9bc62cb1bf79@intel.com>
 <83403e8a-71b3-dacd-bab0-c1aee51e2d10@redhat.com>
 <c0f94696-8af0-9dbf-38e8-ded2e00d2ac4@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4d8f38ff-46a3-e687-db6c-6c424c6543af@redhat.com>
Date: Tue, 22 Jun 2021 16:03:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c0f94696-8af0-9dbf-38e8-ded2e00d2ac4@intel.com>
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


在 2021/6/22 下午3:38, chen.zhang@intel.com 写道:
>
> On 6/22/21 3:04 PM, Jason Wang wrote:
>> 在 2021/6/22 下午2:01, chen.zhang@intel.com 写道:
>>> On 6/21/21 7:30 PM, Dr. David Alan Gilbert wrote:
>>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>>> Zhang Chen <chen.zhang@intel.com> writes:
>>>>>
>>>>>> Since the real user scenario does not need COLO to monitor all
>>>>>> traffic.
>>>>>> Add colo-passthrough-add and colo-passthrough-del to maintain
>>>>>> a COLO network passthrough list. Add IPFlowSpec struct for all QMP
>>>>>> commands.
>>>>>> All the fields of IPFlowSpec are optional.
>>>>>>
>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>> ---
>>>>> The QAPI schema looks good to me, but the interface documentation is
>>>>> still not quite clear enough.  To make progress, I'm going to make
>>>>> concrete suggestions wherever I can despite being quite clueless 
>>>>> about
>>>>> the subject matter.  Risks me writing something that's clearer, but
>>>>> wrong.  Keep that in mind, please.
>>>>>
>>>>>>    net/net.c     | 10 +++++++
>>>>>>    qapi/net.json | 74
>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>    2 files changed, 84 insertions(+)
>>>>>>
>>>>>> diff --git a/net/net.c b/net/net.c
>>>>>> index 76bbb7c31b..f913e97983 100644
>>>>>> --- a/net/net.c
>>>>>> +++ b/net/net.c
>>>>>> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error
>>>>>> **errp)
>>>>>>        }
>>>>>>    }
>>>>>>    +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
>>>>>> +{
>>>>>> +    /* TODO implement setup passthrough rule */
>>>>>> +}
>>>>>> +
>>>>>> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
>>>>>> +{
>>>>>> +    /* TODO implement delete passthrough rule */
>>>>>> +}
>>>>>> +
>>>>>>    static void netfilter_print_info(Monitor *mon, NetFilterState 
>>>>>> *nf)
>>>>>>    {
>>>>>>        char *str;
>>>>>> diff --git a/qapi/net.json b/qapi/net.json
>>>>>> index 7fab2e7cd8..91f2e1495a 100644
>>>>>> --- a/qapi/net.json
>>>>>> +++ b/qapi/net.json
>>>>>> @@ -7,6 +7,7 @@
>>>>>>    ##
>>>>>>      { 'include': 'common.json' }
>>>>>> +{ 'include': 'sockets.json' }
>>>>>>      ##
>>>>>>    # @set_link:
>>>>>> @@ -696,3 +697,76 @@
>>>>>>    ##
>>>>>>    { 'event': 'FAILOVER_NEGOTIATED',
>>>>>>      'data': {'device-id': 'str'} }
>>>>>> +
>>>>>> +##
>>>>>> +# @IPFlowSpec:
>>>>>> +#
>>>>>> +# IP flow specification.
>>>>>> +#
>>>>>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The
>>>>>> protocol is the
>>>>>> +#            string instead of enum, because it can be passed to
>>>>>> getprotobyname(3)
>>>>>> +#            and avoid duplication with /etc/protocols.
>>>>> The rationale is good, but it doesn't really belong into the 
>>>>> interface
>>>>> documentation.  Suggest:
>>>>>
>>>>>      # @protocol: Transport layer protocol like TCP/UDP, etc. This
>>>>> will be
>>>>>      #            passed to getprotobyname(3).
>>>>>
>>>>>
>>>>>> +#
>>>>>> +# @object-name: The @object-name means packet handler in Qemu.
>>
>> I think we need clarify "packet handler" here. It does not look like a
>> Qemu terminology.
>
>
> OK.
>
> The @object-name means a qemu object with network packet processing 
> function, for example colo-compare, filtr-mirror, etc.
>
> I will add it in the next version.


So if two net-filters want to use exact the same set of flowspec, we 
need to specify them twice?


>
>
>>
>>
>>>>>> Because not
>>>>>> +#               all the network packet must pass the colo-compare
>>>>>> module,
>>>>>> +#               the net-filters are same situation. There modules
>>>>>> attach to
>>>>>> +#               netdev or chardev to work, VM can run multiple
>>>>>> modules
>>>>>> +#               at the same time.
>>
>> This sentence needs some tweak since I fail to understand it's meaning.
>>
>
> OK. Change to:
>
> VM can running with multi network packet processing function objects.
>
> They can control different network data paths from netdev or chardev.
>
> So it needs the object-name to set the effective module.
>
>
>>>>>> So it needs the object-name to set
>>>>>> +#               the effective module.
>>>>> I still don't understand this, and I'm too ignorant of COLO and
>>>>> networking to suggest improvements.
>>>>>
>>>>> Jason or David, perhaps?
>>>> I'll leave Jason to check on the object behaviour (and I see the 
>>>> rest of
>>>> the thread); but at a high level, COLO is deciding whether to do VM
>>>> synchronisation on whether the network behaviour of the two VMs get 
>>>> out
>>>> of sync (e.g. due to randomness in the flow of requests); if you don't
>>>> sync then when you fail-over, you'll get TCP errors/inconsistencies in
>>>> the stream view from the secondary; but this patch series is saying
>>>> you don't care if some TCP connections fail like that, you only care
>>>> about maybe the main sockets the application is providing.
>>> Yes, you are right.
>>
>> I wonder if it's the best to introduce colo specific command here.
>> Instead, can we introduce commands to set and get netfilter properties?
>
> This series has not added pass-through support for other netfilters,
>
> Can we change the qmp command to passthrough-filter-add/del as 
> markus's comments in this series,


It looks more general, so I think it should work.

Thanks


>
> And enable filters pass-through capability and add properties in next 
> series. Step by step.
>
>
> Thanks
>
> Chen
>
>
>>
>> Thanks
>>
>>
>>>
>>> Thanks
>>>
>>> Chen
>>>
>>>
>>>> Dave
>>>>
>>>>>> +#
>>>>>> +# @source: Source address and port.
>>>>>> +#
>>>>>> +# @destination: Destination address and port.
>>>>>> +#
>>>>>> +# Since: 6.1
>>>>>> +##
>>>>>> +{ 'struct': 'IPFlowSpec',
>>>>>> +  'data': { '*protocol': 'str', '*object-name': 'str',
>>>>>> +    '*source': 'InetSocketAddressBase',
>>>>>> +    '*destination': 'InetSocketAddressBase' } }
>>>>>> +
>>>>>> +##
>>>>>> +# @colo-passthrough-add:
>>>>>> +#
>>>>>> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
>>>>>> +# The protocol and source/destination IP/ports are optional. if
>>>>>> the user
>>>>>> +# only inputs part of the information, this will match all traffic.
>>>>> Actually, all arguments are optional.
>>>>>
>>>>> Suggest:
>>>>>
>>>>>      # Add an entry to the COLO network passthrough list.
>>>>>      # Absent protocol, host addresses and ports match anything.
>>>>>
>>>>> If there is more than one such list, then "to a COLO network
>>>>> passthrough
>>>>> list" instead.
>>>>>
>>>>> Still missing then: meaning of absent @object-name.  Does it 
>>>>> select the
>>>>> COLO network passthrough list, perhaps?
>>>>>
>>>>>> +#
>>>>>> +# Returns: Nothing on success
>>>>>> +#
>>>>>> +# Since: 6.1
>>>>>> +#
>>>>>> +# Example:
>>>>>> +#
>>>>>> +# -> { "execute": "colo-passthrough-add",
>>>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>>>> +# <- { "return": {} }
>>>>>> +#
>>>>>> +##
>>>>>> +{ 'command': 'colo-passthrough-add', 'boxed': true,
>>>>>> +     'data': 'IPFlowSpec' }
>>>>>> +
>>>>>> +##
>>>>>> +# @colo-passthrough-del:
>>>>>> +#
>>>>>> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
>>>>>> +# The protocol and source/destination IP/ports are optional. if
>>>>>> the user
>>>>>> +# only inputs part of the information, this will match all traffic.
>>>>> I suspect this command doesn't actually match traffic, it matches
>>>>> entries added with colo-passthrough-add.
>>>>>
>>>>> Can it delete more than one such entry?
>>>>>
>>>>> Suggest:
>>>>>
>>>>>      # Delete an entry from the COLO network passthrough list.
>>>>>
>>>>> and then explain how the command arguments select entries.
>>>>>
>>>>>> +#
>>>>>> +# Returns: Nothing on success
>>>>>> +#
>>>>>> +# Since: 6.1
>>>>>> +#
>>>>>> +# Example:
>>>>>> +#
>>>>>> +# -> { "execute": "colo-passthrough-del",
>>>>>> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
>>>>>> +#      "source": {"host": "192.168.1.1", "port": "1234"},
>>>>>> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
>>>>>> +# <- { "return": {} }
>>>>>> +#
>>>>>> +##
>>>>>> +{ 'command': 'colo-passthrough-del', 'boxed': true,
>>>>>> +     'data': 'IPFlowSpec' }
>>
>


