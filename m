Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6F35AC1A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 11:06:12 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV9ZD-0003XN-IW
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 05:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lV9X3-0002h8-GM
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lV9X1-0005gB-Qd
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618045434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FdCYVLYPsfUsRiYkt7Ht1y3m63OMWasgzWYKvWRhWY=;
 b=OutQGGOU+aUXCHTD+/2dvaE+LaPuIpO6D+YZj/mjBXr7u8+h5cmsl/dP2xYs9yW/REUfq5
 MID3xXqH8NgiqGWNeKntXAbij31lTR/CnBWd7jUNP35qL2zitHOnbpo/MWpqFVpw7xIhED
 ceTTUmTddEb++0Vl/+0RhEk6rIORVkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-e_jXLhAKOWGMAuD1sR6bNw-1; Sat, 10 Apr 2021 05:03:53 -0400
X-MC-Unique: e_jXLhAKOWGMAuD1sR6bNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB1B807344
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 09:03:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A4E5C541;
 Sat, 10 Apr 2021 09:03:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C98C7113525D; Sat, 10 Apr 2021 11:03:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 5/5] sockets: Support multipath TCP
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <20210408191159.133644-6-dgilbert@redhat.com>
 <YHAc2V7bRS6EgQO9@redhat.com>
Date: Sat, 10 Apr 2021 11:03:47 +0200
In-Reply-To: <YHAc2V7bRS6EgQO9@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 9 Apr 2021 10:22:33 +0100")
Message-ID: <87v98ucxzg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org, pabeni@redhat.com, kraxel@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Apr 08, 2021 at 08:11:59PM +0100, Dr. David Alan Gilbert (git) wr=
ote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>=20
>> Multipath TCP allows combining multiple interfaces/routes into a single
>> socket, with very little work for the user/admin.
>>=20
>> It's enabled by 'mptcp' on most socket addresses:
>>=20
>>    ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
>>=20
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  io/dns-resolver.c   |  2 ++
>>  qapi/sockets.json   |  5 ++++-
>>  util/qemu-sockets.c | 34 ++++++++++++++++++++++++++++++++++
>>  3 files changed, 40 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/io/dns-resolver.c b/io/dns-resolver.c
>> index 743a0efc87..b081e098bb 100644
>> --- a/io/dns-resolver.c
>> +++ b/io/dns-resolver.c
>> @@ -122,6 +122,8 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSR=
esolver *resolver,
>>              .ipv4 =3D iaddr->ipv4,
>>              .has_ipv6 =3D iaddr->has_ipv6,
>>              .ipv6 =3D iaddr->ipv6,
>> +            .has_mptcp =3D iaddr->has_mptcp,
>> +            .mptcp =3D iaddr->mptcp,
>>          };
>> =20
>>          (*addrs)[i] =3D newaddr;
>> diff --git a/qapi/sockets.json b/qapi/sockets.json
>> index 2e83452797..43122a38bf 100644
>> --- a/qapi/sockets.json
>> +++ b/qapi/sockets.json
>> @@ -57,6 +57,8 @@
>>  # @keep-alive: enable keep-alive when connecting to this socket. Not su=
pported
>>  #              for passive sockets. (Since 4.2)
>>  #
>> +# @mptcp: enable multi-path TCP. (Since 6.0)
>> +#
>>  # Since: 1.3
>>  ##
>>  { 'struct': 'InetSocketAddress',
>> @@ -66,7 +68,8 @@
>>      '*to': 'uint16',
>>      '*ipv4': 'bool',
>>      '*ipv6': 'bool',
>> -    '*keep-alive': 'bool' } }
>> +    '*keep-alive': 'bool',
>> +    '*mptcp': 'bool' } }
>
> I think this would need to be
>
>    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' }
>
> so that mgmt apps can probe when it truely is supported or not for
> this build

Yes.  Instance of a somewhat common anti-pattern "declare
unconditionally (this hunk), write unconditionally (previous hunk), read
conditionally (next hunk).  Besides defeating introspection, it also
exposes configuration knobs that don't do anything.

>> =20
>>  ##
>>  # @UnixSocketAddress:
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 8af0278f15..72527972d5 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -206,6 +206,21 @@ static int try_bind(int socket, InetSocketAddress *=
saddr, struct addrinfo *e)
>>  #endif
>>  }
>> =20
>> +static int check_mptcp(const InetSocketAddress *saddr, struct addrinfo =
*ai,
>> +                       Error **errp)
>> +{
>> +    if (saddr->has_mptcp && saddr->mptcp) {
>> +#ifdef IPPROTO_MPTCP
>> +        ai->ai_protocol =3D IPPROTO_MPTCP;
>> +#else
>> +        error_setg(errp, "MPTCP unavailable in this build");
>> +        return -1;
>> +#endif
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static int inet_listen_saddr(InetSocketAddress *saddr,
>>                               int port_offset,
>>                               int num,
[...]


