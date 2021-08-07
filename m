Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF433E3547
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:09:25 +0200 (CEST)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCL8l-0008TN-TR
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCL7m-0007mE-5X
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCL7i-00014N-UU
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628338097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bkixy7MH3A0xMtdcbzbbaj4EqoLZ4cecr00RUnf7U+c=;
 b=Yyei+r3LZCUJ7nOC6UTEFefViRjvIrPjoR6cMtOzJbavJmbtePaImt9mzLJ6OeOhwGQqpN
 eNQ+AvBgFcZMGYFhtqJvX2beQ8bUmSj3dx65af5yxEolts3yYkuTLFJqk3XV/5OjYyUfyr
 Hxe3LCyspoX569QQ3qNxdaOappW8p8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-0gNOwBR_MW6pTpDY05sKkg-1; Sat, 07 Aug 2021 08:08:16 -0400
X-MC-Unique: 0gNOwBR_MW6pTpDY05sKkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0312D1006C83;
 Sat,  7 Aug 2021 12:08:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D026D1036D27;
 Sat,  7 Aug 2021 12:08:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6248511380A0; Sat,  7 Aug 2021 14:08:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PULL V3 for 6.2 1/6] qapi/net: Add IPFlowSpec and QMP command
 for filter passthrough
References: <20210719090051.3824672-1-chen.zhang@intel.com>
 <20210719090051.3824672-2-chen.zhang@intel.com>
 <874kc1h4ne.fsf@dusky.pond.sub.org>
Date: Sat, 07 Aug 2021 14:08:10 +0200
In-Reply-To: <874kc1h4ne.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Sat, 07 Aug 2021 13:32:05 +0200")
Message-ID: <87im0hfoet.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> I see Jason queued this while I was failing at keeping up with review.
> I apologize for dropping the ball.
>
> There still are a few unresolved issues I raised in prior review.  The
> documentation is not ready, and there is no consensus on the design of
> passthrough-filter-del.
>
> If we merge this as is for 6.2, then I want my review to be addressed on
> top.

One more thing...

> Zhang Chen <chen.zhang@intel.com> writes:
>
>> Since the real user scenario does not need to monitor all traffic.
>> Add passthrough-filter-add and passthrough-filter-del to maintain
>> a network passthrough list in object with network packet processing
>> function. Add IPFlowSpec struct for all QMP commands.
>> Most the fields of IPFlowSpec are optional,except object-name.
>>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> ---
>
> [...]
>
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 7fab2e7cd8..bfe38faab5 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -7,6 +7,7 @@
>>  ##
>>  
>>  { 'include': 'common.json' }
>> +{ 'include': 'sockets.json' }
>>  
>>  ##
>>  # @set_link:
>> @@ -696,3 +697,80 @@
>>  ##
>>  { 'event': 'FAILOVER_NEGOTIATED',
>>    'data': {'device-id': 'str'} }
>> +
>> +##
>> +# @IPFlowSpec:
>> +#
>> +# IP flow specification.
>> +#
>> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
>> +#            string instead of enum, because it can be passed to getprotobyname(3)
>> +#            and avoid duplication with /etc/protocols.
>
> In review of v8, I wrote:
>
>     The rationale is good, but it doesn't really belong into the interface
>     documentation.  Suggest:
>
>        # @protocol: Transport layer protocol like TCP/UDP, etc.  This will be
>        #            passed to getprotobyname(3).
>
> to which you replied "OK."  Please apply the change.
>
>> +#
>> +# @object-name: The @object-name means a qemu object with network packet
>> +#               processing function, for example colo-compare, filtr-redirector
>> +#               filtr-mirror, etc. VM can running with multi network packet
>
> s/qemu/QEMU/
>
> s/filtr/filter/ two times here, and more below.
>
> s/VM/The VM/
>
> s/multi/multiple/
>
> Also, limit doc comment line length to 70 characters or so.
>
>> +#               processing function objects. They can control different network
>> +#               data paths from netdev or chardev. So it needs the object-name
>> +#               to set the effective module.
>
> Again, this is rationale, which doesn't really belong here.
>
> What does belong here, but isn't: meaning of @object-name, i.e. how it
> is resolved to a "qemu object with network packet processing function",
> whatever that is.
>
> I'm *guessing* it's the QOM path of a QOM object that provides a certain
> interface.  Correct?
>
> If yes, which interface exactly?  Is it a QOM interface?
>
> The comment could then look like
>
>   # QOM path to a QOM object that implements the MUMBLE interface.
>
> with the details corrected / fleshed out.
>
>> +#
>> +# @source: Source address and port.
>> +#
>> +# @destination: Destination address and port.
>> +#
>> +# Since: 6.1

6.2 now.  More of the same below.

[...]


