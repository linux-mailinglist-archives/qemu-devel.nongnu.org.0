Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0D2A0168
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 10:26:45 +0100 (CET)
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYQgG-0003SG-D2
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 05:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kYQf0-0002sh-5o
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 05:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kYQey-0003fa-9o
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 05:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604049923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWmO3fJ83aQfjtTtQNtK4UnT0BfjMHaMiAN921rNkLY=;
 b=AfPl860BuRXdV8tdaAL+3NqRu65UV5irD2M+k2b5oHHG3tcfG3+wpF0TQFZ6ClSPWoImcJ
 7gCS3ub1rqW7FDNiiOlLoldYfywMFdy19PkfHIpBl44/aQ5MSseV+hyoEQgYOJ3OQEJd8/
 VT1/11lTcrMJ21jvvMpZVog8uPQzaMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Dh5uKN-4NEi4DjadxIQxAw-1; Fri, 30 Oct 2020 05:25:21 -0400
X-MC-Unique: Dh5uKN-4NEi4DjadxIQxAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A9210E2187;
 Fri, 30 Oct 2020 09:25:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D17055792;
 Fri, 30 Oct 2020 09:25:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08D42113865F; Fri, 30 Oct 2020 10:25:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 11/11] sockets: Make abstract UnixSocketAddress depend
 on CONFIG_LINUX
References: <20201029133833.3450220-1-armbru@redhat.com>
 <20201029133833.3450220-12-armbru@redhat.com>
 <77c4d3b2-44f0-2bf8-feb6-bc760b2b8c46@redhat.com>
Date: Fri, 30 Oct 2020 10:25:11 +0100
In-Reply-To: <77c4d3b2-44f0-2bf8-feb6-bc760b2b8c46@redhat.com> (Eric Blake's
 message of "Thu, 29 Oct 2020 14:54:38 -0500")
Message-ID: <877dr8xdzc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 10/29/20 8:38 AM, Markus Armbruster wrote:
>> The abstract socket namespace is a non-portable Linux extension.  An
>> attempt to use it elsewhere should fail with ENOENT (the abstract
>> address looks like a "" pathname, which does not resolve).  We report
>> this failure like
>> 
>>     Failed to connect socket abc: No such file or directory
>> 
>> Tolerable, although ENOTSUP would be better.
>> 
>> However, introspection lies: it has @abstract regardless of host
>> support.  Easy enough to fix: since Linux provides them since 2.2,
>> 'if': 'defined(CONFIG_LINUX)' should do.
>> 
>> The above failure becomes
>> 
>>     Parameter 'backend.data.addr.data.abstract' is unexpected
>> 
>> I consider this an improvement.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/qapi/sockets.json
>> @@ -74,18 +74,20 @@
>>  # Captures a socket address in the local ("Unix socket") namespace.
>>  #
>>  # @path: filesystem path to use
>> -# @tight: pass a socket address length confined to the minimum length of the
>> -#         abstract string, rather than the full sockaddr_un record length
>> -#         (only matters for abstract sockets, default true). (Since 5.1)
>> -# @abstract: whether this is an abstract address, default false. (Since 5.1)
>> +# @abstract: if true, this is a Linux abstract socket address.  @path
>> +#            will be prefixed by a null byte, and optionally padded
>> +#            with null bytes.  Defaults to false.  (Since 5.1)
>> +# @tight: if false, pad an abstract socket address with enough null
>> +#         bytes to make it fill struct sockaddr_un member sun_path.
>> +#         Defaults to true.  (Since 5.1)
>
> Do we need to mention that @tight is ignored (or even make it an error)
> if @abstract is false?

We could make presence of @tight an error unless @abstract is true.  But
again, this series aims for less wrong, not for less ugly.

For me, the description "if false, pad an abstract socket address..."
implies "no effect when the socket address is not abstract".  If you'd
like to suggest a clearer phrasing, go right ahead.

>>  #
>>  # Since: 1.3
>>  ##
>>  { 'struct': 'UnixSocketAddress',
>>    'data': {
>>      'path': 'str',
>> -    '*tight': 'bool',
>> -    '*abstract': 'bool' } }
>> +    '*tight': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' },
>> +    '*abstract': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' } } }
>
> So we document @abstract before @tight, but declare them in reverse
> order.  I guess our doc generator doesn't care?

It doesn't.  I flipped them in the comment for readability, but
neglected to flop the code.  Flipping them now.

>>  
>>  ##
>>  # @VsockSocketAddress:
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index dc1cf86ecf..1d2b2efb13 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -444,14 +444,20 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
>>          break;
>>      case SOCKET_ADDRESS_TYPE_UNIX:
>>      {
>> +#ifdef CONFIG_LINUX
>>          UnixSocketAddress *sa = &s->addr->u.q_unix;
>> +#endif
>>  
>>          return g_strdup_printf("%sunix:%s%s%s%s", prefix,
>>                                 s->addr->u.q_unix.path,
>
> Why did we need the #ifdef above, which means we can't we use sa here?

Tunnel vision.  I'll simplify.

>> +#ifdef CONFIG_LINUX
>>                                 sa->has_abstract && sa->abstract
>
> I hate mid-()-expression #ifdefs.  If g_strdup_printf() were itself a
> macro expansion, things break.  Can you come up with a saner way of
> writing this?
>
>>                                 ? ",abstract" : "",
>>                                 sa->has_tight && sa->tight
>>                                 ? ",tight" : "",
>> +#else
>> +                               "", "",
>> +#endif
>>                                 s->is_listen ? ",server" : "");
>
> I suggest:
>
>     const char *tight = "", *abstract = "";
>     UnixSocketAddress *sa = &s->addr->u.q_unix;
>
> #ifdef CONFIG_LINUX
>     if (sa->has_abstract && sa->abstract) {
>         abstract = ",abstract";
>         if (sa->has_tight && sa->tight) {
>             tight = ",tight";
>         }
>     }
> #endif
>
>     return g_strdup_printf("%sunix:%s%s%s%s", prefix, sa->path,
>                            abstract, tight,
>                            s->is_listen ? ", server" : "");

I don't care either way, so I'm taking yours.

>> +++ b/util/qemu-sockets.c
>> @@ -854,10 +854,29 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
>>  
>>  #ifndef _WIN32
>>  
>> +static bool saddr_is_abstract(UnixSocketAddress *saddr)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    return saddr->abstract;
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>> +static bool saddr_is_tight(UnixSocketAddress *saddr)
>> +{
>> +#ifdef CONFIG_LINUX
>> +    return !saddr->has_tight || saddr->tight;
>
> Should this also look at abstract?

It's used in just two places, both guarded by if (abstract).

I added the helpers only because the code creating a struct sockaddr_un
is duplicated, and de-duplication is too hard to bother due to the
(racy) "if path="" pick one" feature.

>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>
> Is it any easier to split the patch, first into the introduction of
> saddr_is_* and adjusting all clients, and second into adding the 'if' to
> the QAPI declaration?

I doubt it.  But If you guys think it makes the patch easier to
understand, I'll gladly do it.

> But the idea makes sense.

Thanks!


