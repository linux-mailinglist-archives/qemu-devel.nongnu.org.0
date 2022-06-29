Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDEF55FE58
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:17:14 +0200 (CEST)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Vh3-0003GQ-3n
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6Vdc-0000vY-3I
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6VdY-0007V8-Be
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656501215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwL/NJ3y6OGJLQCNTKhQIGqs7onCaRTmnZSxNmMner8=;
 b=gGy2gk6hlGOTIoHuh+lsg7h4t/ZD+bnIaRTPoMIrzInDSaGf0bqAyPEzWRVmJDBk4h9sIj
 rxvQWop8u3pS1erpPPLPuzaQt+9VbyX1HDNKrUbT55YcXeqUJe22lYls1kO0CYGuIqq2ep
 GBthetAj7tUloA81pA5IO5rB7jCey9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-UJ2aBXI5OcKo8KG23Z-bOg-1; Wed, 29 Jun 2022 07:13:34 -0400
X-MC-Unique: UJ2aBXI5OcKo8KG23Z-bOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5B7C101A586
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 11:13:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81F2F40CF8EA;
 Wed, 29 Jun 2022 11:13:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46A3921E690D; Wed, 29 Jun 2022 13:13:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v4 04/11] qapi: net: add stream and dgram netdevs
References: <20220623155317.675932-1-lvivier@redhat.com>
 <20220623155317.675932-5-lvivier@redhat.com>
 <87a6a2bdpo.fsf@pond.sub.org>
 <37ad02f3-364f-d420-e986-47ec4884407d@redhat.com>
Date: Wed, 29 Jun 2022 13:13:32 +0200
In-Reply-To: <37ad02f3-364f-d420-e986-47ec4884407d@redhat.com> (Laurent
 Vivier's message of "Mon, 27 Jun 2022 16:36:23 +0200")
Message-ID: <87bkubhgdf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> On 24/06/2022 11:41, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> Copied from socket netdev file and modified to use SocketAddress
>>> to be able to introduce new features like unix socket.
>>>
>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>> according to the IP address type.
>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>> parameter "server" defines the mode (server by default)
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>> ---
>> 
>> [...]
>> 
>>> diff --git a/qapi/net.json b/qapi/net.json
>>> index d6f7cfd4d656..32a9b1a5ac6c 100644
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
>>> @@ -566,6 +567,42 @@
>>>       '*isolated':  'bool' },
>>>     'if': 'CONFIG_VMNET' }
>>>   
>>> +##
>>> +# @NetdevStreamOptions:
>>> +#
>>> +# Configuration info for stream socket netdev
>>> +#
>>> +# @addr: socket address to listen on (server=true)
>>> +#        or connect to (server=false)
>>> +# @server: create server socket (default: true)
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'struct': 'NetdevStreamOptions',
>>> +  'data': {
>>> +    'addr':   'SocketAddress',
>>> +    '*server': 'bool' } }
>>> +
>>> +##
>>> +# @NetdevDgramOptions:
>>> +#
>>> +# Configuration info for datagram socket netdev.
>>> +#
>>> +# @remote: remote address
>>> +# @local: local address
>>> +#
>>> +# The code checks there is at least one of these options and reports an error
>>> +# if not. If remote address is present and it's a multicast address, local
>>> +# address is optional. Otherwise local address is required and remote address
>>> +# is optional.
>> 
>> I need to make a table to understand this.
>> 
>> 
>>      @remote         @local      |   okay?
>>      ----------------------------+--------
>>      absent          present     |   yes
>>      multicast       absent      |   yes
>>      multicast       present     |   yes
>>      not multicast   absent      |   no
>>      not multicast   present     |   yes
>> 
>> Correct?
>
> yes

Forgot the row

        absent          absent      |   no

Fortunately, the comment is perfectly clear there.

>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'struct': 'NetdevDgramOptions',
>>> +  'data': {
>>> +    '*local':  'SocketAddress',
>>> +    '*remote': 'SocketAddress' } }
>>> +
>>>   ##
>>>   # @NetClientDriver:
>>>   #
>>> @@ -579,8 +616,9 @@
>>>   #        @vmnet-bridged since 7.1
>>>   ##
>>>   { 'enum': 'NetClientDriver',
>>> -  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
>>> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
>>> +  'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'stream',
>>> +            'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user',
>>> +            'vhost-vdpa',
>>>               { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
>>>               { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
>>>               { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>>> @@ -610,6 +648,8 @@
>>>       'tap':      'NetdevTapOptions',
>>>       'l2tpv3':   'NetdevL2TPv3Options',
>>>       'socket':   'NetdevSocketOptions',
>>> +    'stream':   'NetdevStreamOptions',
>>> +    'dgram':    'NetdevDgramOptions',
>>>       'vde':      'NetdevVdeOptions',
>>>       'bridge':   'NetdevBridgeOptions',
>>>       'hubport':  'NetdevHubPortOptions',
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 377d22fbd82f..03d58da6f8ed 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2722,6 +2722,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>>       "                configure a network backend to connect to another network\n"
>>>       "                using an UDP tunnel\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>>> +    "                configure a network backend to connect to another network\n"
>>> +    "                using a socket connection in stream mode.\n"
>> 
>> This shows -netdev stream with address types 'inet' and 'fd' only.  Are
>> address types 'unix' and and 'vsock' rejected?
>
> Yes, in net_stream_client_init() we have a switch that manages only inet and fd (I'm going 
> to update the patch because server and client doesn't manage the error in the same way).
> This is updated in patch "net: stream: add unix socket".
>
>> 
>>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
>>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=h]\n"
>>> +    "                configure a network backend to connect to a multicast maddr and port\n"
>>> +    "                use 'local.host=addr' to specify the host address to send packets from\n"
>> 
>> I think we use ``local.host=addr`` markup.
>
> ok
>
>> 
>> Since this part is about multicast, only remote.type=inet makes sense
>> (other types can't be multicast).
>
> right
>
>> Are local address types 'unix' and 'vsock' rejected?
>
> if the type is not inet, we go into the not multicast code, and it accepts only inet and fd.
>
>> 
>>> +    "-netdev dgram,id=str,local.type=inet,local.host=host,local.port=port[,remote.type=inet,remote.host=host,remote.port=port]\n"
>>> +    "-netdev dgram,id=str,local.type=fd,local.str=h\n"
>>> +    "                configure a network backend to connect to another network\n"
>>> +    "                using an UDP tunnel\n"
>> 
>> Is this unicast only?
>
> yes
>
>> Are other combinations of local.type and remote.type rejected?
>
> If we have remote, it must not be fd type and remote type must be equal to local type.
> local type can only be inet or fd (updated with unix in patch "net: dgram: add unix socket")

So, only some combinations of socket address types are valid.  Shouldn't
this be documented in net.json?

>>>   #ifdef CONFIG_VDE
>>>       "-netdev vde,id=str[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
>>>       "                configure a network backend to connect to port 'n' of a vde switch\n"
>> 
>
> Thanks,
> Laurent


