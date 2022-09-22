Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB95E600C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:41:13 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJdn-0000un-UZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obIhI-0004lA-5d
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obIhF-0002J1-8o
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663839640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7xjEln0wssnDh/y31jrz2omksBZm1+xzYuZCI2oPwI=;
 b=MN10aeEb3C56RBK4sd9jmPWLPtELgxVxc7J2Kc8t7J9UGEK486A5Fb7npFYo9t8fKB2Zbz
 chsyf09b2zF36co+surXoPKxrQ0vJdXyf9QdV5La0/g6RP2CZv49XljeRpVn4xUEN1ZJja
 aW/90s8uKt+jVIT8Ah1X4yf82iplnxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-c7XZkBjcN12CQQWSxD1zoQ-1; Thu, 22 Sep 2022 05:40:37 -0400
X-MC-Unique: c7XZkBjcN12CQQWSxD1zoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC65E3817A66;
 Thu, 22 Sep 2022 09:40:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD3AC1908C;
 Thu, 22 Sep 2022 09:40:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 59E9B21E6900; Thu, 22 Sep 2022 11:40:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gregory Kurz <gregory.kurz@free.fr>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 13/14] net: stream: move to QIO
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-14-lvivier@redhat.com>
 <87mtasai57.fsf@pond.sub.org>
 <68a362a2-33e0-c41c-1871-d22338b5a4a0@redhat.com>
Date: Thu, 22 Sep 2022 11:40:35 +0200
In-Reply-To: <68a362a2-33e0-c41c-1871-d22338b5a4a0@redhat.com> (Laurent
 Vivier's message of "Thu, 22 Sep 2022 11:13:05 +0200")
Message-ID: <87h70z4ui4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> On 9/21/22 16:58, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>> [...]
>> 
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index ee2436ae14a7..a0b5b70c80cb 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2732,8 +2732,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>       "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
>>>       "                configure a network backend to connect to another network\n"
>>>       "                using an UDP tunnel\n"
>>> -    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
>>> -    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
>>> +    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
>>>       "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=h\n"
>>>       "                configure a network backend to connect to another network\n"
>>>       "                using a socket connection in stream mode.\n"
>> The commit message didn't prepare me for this change.  Could you
>> explain?
>> 
>
> You're right, I should explain:
>
> moving to QIOChannel allows net/stream to use the all the available parameters provided by SocketAddress. They were not listed here before because they were not supported, and as 
> they are supported now I have added them in the list.

Fine addition to the commit message.  Suggest to amend its subject like

    net stream: move to QIO to enable additional parameters

or

    net stream: move to QIO, enabling additional parameters


