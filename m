Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28A3441A7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:36:22 +0100 (CET)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJnB-0000Z4-6T
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJiF-0004qp-Vz
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:31:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJiC-0000OH-32
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616416270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwbWwphEZep9UQKdkW1Zm8a39xDl6Do7hkt58ea4mwQ=;
 b=TBdyjkfqa0hYy7Ru58mirybDTKKGPTGrdOKL/Vousqt2qVSuMjFTTQ6gwCWh756J9OpMgY
 AovXlSIjVj/6u50vRjnkovX1IPcO8YXt4baKGSZ8/Q3+C9n6rmpQ8ASkbink93vGNQpaZH
 TMVgJbLa4dC4gmGlhG4NWLl2LnRfdf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-CRrKxf6TM76ef7_I3f6Hag-1; Mon, 22 Mar 2021 08:31:06 -0400
X-MC-Unique: CRrKxf6TM76ef7_I3f6Hag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60DF7108BD16;
 Mon, 22 Mar 2021 12:31:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1721E2B3BA;
 Mon, 22 Mar 2021 12:31:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78B3211327E1; Mon, 22 Mar 2021 13:31:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-3-chen.zhang@intel.com>
 <877dm3i1qk.fsf@dusky.pond.sub.org>
 <5b75057ecc784296aa271f5f6692906a@intel.com>
Date: Mon, 22 Mar 2021 13:31:03 +0100
In-Reply-To: <5b75057ecc784296aa271f5f6692906a@intel.com> (Chen Zhang's
 message of "Mon, 22 Mar 2021 10:00:06 +0000")
Message-ID: <87k0pz4bg8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zhang, Chen" <chen.zhang@intel.com> writes:

>> -----Original Message-----
>> From: Markus Armbruster <armbru@redhat.com>
>> Sent: Friday, March 19, 2021 11:48 PM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
>> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
>> Li Zhijian <lizhijian@cn.fujitsu.com>; Lukas Straub <lukasstraub2@web.de>;
>> Zhang Chen <zhangckid@gmail.com>
>> Subject: Re: [PATCH V4 2/7] qapi/net.json: Add L4_Connection definition
>> 
>> Zhang Chen <chen.zhang@intel.com> writes:
>> 
>> > Add L4_Connection struct for other QMP commands.
>> > Except protocol field is necessary, other fields are optional.
>> >
>> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> > ---
>> >  qapi/net.json | 26 ++++++++++++++++++++++++++
>> >  1 file changed, 26 insertions(+)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json index
>> > 498ea7aa72..cd4a8ed95e 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -825,3 +825,29 @@
>> >  { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udplite',
>> >      'icmp', 'igmp', 'ipv6' ] }
>> >
>> > +##
>> > +# @L4_Connection:
>> > +#
>> > +# Layer 4 network connection.
>> > +#
>> > +# Just for IPv4.
>> > +#
>> > +# @protocol: Transport layer protocol like TCP/UDP...
>> > +#
>> > +# @id: For specific module with Qemu object ID, If there is no such part,
>> > +#      it means global rules.
>> 
>> Clear as mud.
>
> Sorry, let me re-clear it.
> If I understand correctly, The ID shouldn't be here, but I found the 'boxed' flag just can add only one 'data' like this:
> +##
> +{ 'command': 'colo-passthrough-add', 'boxed': true,
> +     'data': 'L4_Connection' }
>
> I original want to this:
> +##
> +{ 'command': 'colo-passthrough-add', 
> +     'data': { 'id': 'str', 'boxed': false, 'conn': 'L4_Connection', 'boxed': true  }
>
> So, I add the @id as an optional argument here.
>
> rewrite the comments:
> +# @id: Assign the rule to Qemu network handle module object ID. Like colo-compare, net-filter. 
>
> Please see the ID details in patch3 too. 

So, colo-passthrough-add takes an @id argument (to be tacked onto
packets to help with further processing, I understand), and arguments to
match packets.

Naming the argument type L4_Connection is misleading.

Even naming the match arguments L4_Connection would be misleading.
"Connection" has a specific meaning in networking.  There are TCP
connections.  There is no such thing as an UDP connection.

A TCP connection is uniquely identified by a pair of endpoints, i.e. by
source address, source port, destination address, destination port.
Same for other connection-oriented protocols.  The protocol is not part
of the connection.  Thus, L4_Connection would be misleading even for the
connection-oriented case.

You need a named type for colo-passthrough-add's argument because you
share it with colo-passthrough-del.  I'm not sure that's what we want
(I'm going to write more on that in a moment).  If it is what we want,
then please pick a another, descriptive name.


