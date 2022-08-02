Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B965587DB2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:56:05 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsNQ-0002c9-CZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIsLG-00075A-OG
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIsLD-0006xw-Sm
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659448426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hvtHQ0Rm6OBzTJIBYClc5eA2ZM7Vu6o758ibFtTZwkQ=;
 b=LLkOWwanrc2zskRRRJcNKiJ4dmS3bVqOS5yDmRg7A+luD56E6fV7ocD5eixP9SDa0wNVvi
 +SgFvR6KCPsjQXMnmmoSiub/iG+EN7nXg41CPFPM2Oe9TNSwxuNHA1rPvtfCXE0j5wqU/1
 6DXeYeTDmeS4KYik5gjPtqCgIjHdOTw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-JG_y-FKpPvSNj9GhimFT3Q-1; Tue, 02 Aug 2022 09:53:45 -0400
X-MC-Unique: JG_y-FKpPvSNj9GhimFT3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F066A1C288CC
 for <qemu-devel@nongnu.org>; Tue,  2 Aug 2022 13:53:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEDB74010FA3;
 Tue,  2 Aug 2022 13:53:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80DB721E6930; Tue,  2 Aug 2022 15:53:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v7 05/14] qapi: net: add stream and dgram netdevs
References: <20220722190442.301310-1-lvivier@redhat.com>
 <20220722190442.301310-6-lvivier@redhat.com>
 <874jyvujlo.fsf@pond.sub.org>
 <b5b66160-d0a5-c5f8-4060-8afdcba7a930@redhat.com>
Date: Tue, 02 Aug 2022 15:53:43 +0200
In-Reply-To: <b5b66160-d0a5-c5f8-4060-8afdcba7a930@redhat.com> (Laurent
 Vivier's message of "Tue, 2 Aug 2022 11:39:10 +0200")
Message-ID: <87les6rbtk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

> On 02/08/2022 10:37, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
> ...
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 79e00916a11f..170117e1adf0 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2726,6 +2726,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>>       "                configure a network backend to connect to another network\n"
>>>       "                using an UDP tunnel\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>>> +    "                configure a network backend to connect to another network\n"
>>> +    "                using a socket connection in stream mode.\n"
>
>  From v6:
>> This part needs to match NetdevStreamOptions above.
>> 
>> Missing here: the optional members of InetSocketAddress: numeric, to,
>> ipv4, ...  Do we care?
>
> At this patch level, no, because we decode them manually and not using 
> socket_connect()/socket_listen(). But the doc should be updated for PATCH 13/14 as I move 
> stream.c to QIO.
>
>> 
>> The next part needs to match NetdevDgramOptions above.
>
>
>>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
>>> +    "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=fd,local.str=h]\n"
>>> +    "                configure a network backend to connect to a multicast maddr and port\n"
>>> +    "                use ``local.host=addr`` to specify the host address to send packets from\n"
>
>  From v6:
>> I figure this covers table rows
>> 
>>    #    @remote         @local      |   okay?
>>    #    ----------------------------+--------
>>    #    multicast       absent      |   yes
>>    #    multicast       present     |   yes
>> 
>> for remote.type=inet and any local.type.
>> 
>> What about remote.type=fd?
>
> multicast is only supported with remote.type=inet, not fd or unix
>
> In net_dgram_init(), we initiate a multicast connection if remote.type is inet and address 
> type is multicast, otherwise it's an unicast connection.

Hmm.

With .type=inet, .host=... determines multicast.

With .type=fd, we *assume* unicast?  What if the underlying socket is
actually bound to a multicast address?

>>> +    "-netdev dgram,id=str,local.type=inet,local.host=addr,local.port=port[,remote.type=inet,remote.host=addr,remote.port=port]\n"
>
>  From v6:
>> I figure this covers table rows
>> 
>>     #    absent          present     |   yes
>>     #    not multicast   present     |   yes
>> 
>> for *.type=inet.
>
>
>>> +    "-netdev dgram,id=str,local.type=fd,local.str=h\n"
>>> +    "                configure a network backend to connect to another network\n"
>>> +    "                using an UDP tunnel\n"
>
>  From v6:
>> I figure this covers table row
>> 
>>    #    absent          present     |   yes
>> 
>> for local.type=fd.
>> 
>> Together, they cover table row
>> 
>>     #    absent          present     |   yes
>> 
>> for any local.type.  Good.
>> 
>> Table row
>> 
>>     #    not multicast   present     |   yes
>> 
>> is only covered for *.type=inet.  Could either of the types be fd?
>
> In v7, I've update the table to include the case of fd:
>
>      =============  ========  =====
>      remote         local     okay?
>      =============  ========  =====
>      absent         absent    no
>      absent         not fd    no
>      absent         fd        yes
>      multicast      absent    yes
>      multicast      present   yes
>      not multicast  absent    no
>      not multicast  present   yes
>      =============  ========  =====
>
> For local, if it's not specified otherwise, fd is supported.
> Remote and local type must be the same (inet or unix), if local is fd, remote must not be 
> provided.

My brain is melting.


