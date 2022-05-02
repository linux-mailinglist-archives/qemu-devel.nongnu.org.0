Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63388516F11
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 13:48:16 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlUXG-0005DZ-Uc
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlUVf-0004NT-PV
 for qemu-devel@nongnu.org; Mon, 02 May 2022 07:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlUVc-0000qE-03
 for qemu-devel@nongnu.org; Mon, 02 May 2022 07:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651491989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/ElN0xs+3rd6Vdk71CfQhFEDsC/bk+0RVffZVEgaZ8=;
 b=i/xY0KSQoBQjhDYREktm5vGboPpJQB8kf3Tl5sa02ghgJJn1S1Bb5jloejHHUXrxYhMq1k
 0oeLFl0FWMKhj0X3Z0oImaBelRuCT8T6ZjAP3WQj5uN9hoQg+XyG+LvcGjbWtIz2f/k3A7
 ywSJ8y4qYNWHAoD8fk8hLKhUdyseR3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-xtKqBfrWMeKdWRk674HMRg-1; Mon, 02 May 2022 07:46:28 -0400
X-MC-Unique: xtKqBfrWMeKdWRk674HMRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0004B801E67
 for <qemu-devel@nongnu.org>; Mon,  2 May 2022 11:46:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41EA21121330;
 Mon,  2 May 2022 11:46:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1903621E66D0; Mon,  2 May 2022 13:46:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
Date: Mon, 02 May 2022 13:46:23 +0200
In-Reply-To: <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 (Andrea Bolognani's message of "Mon, 2 May 2022 05:04:13 -0400")
Message-ID: <875ymop374.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Mon, May 02, 2022 at 09:21:36AM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>> > The wire protocol would still retain the unappealing name, but at
>> > least client libraries could hide the uglyness from users.
>>
>> At the price of mild inconsistency between the library interface and
>> QMP.
>
> That's fine, and in fact it already happens all the time when QAPI
> names (log-append) are translated to C identifiers (log_append).

There's a difference between trivial translations like "replace '-' by
'_'" and arbitrary replacement like the one for enumeration constants
involving 'prefix'.

>> We could clean up QMP if we care, keeping around the old names for
>> compatibility.  See also Kevin's work on QAPI aliases.  Which is much
>> more ambitious, though.
>
> I wasn't aware of that effort. Personally I'm always in favor of
> cleaning up inconsistencies, so I am automatically a fan :)
>
> That said, the idea of exposing a sub-par Go API until such massive
> undertaking can be completed is not terribly appealing.

Point.

>                                                         And it would
> not address every facet of the issue (see below).
>
>> > Capitalization of these acronyms is inconsistent across the schema,
>>
>> Common issue with camel-cased compounds containing acronyms, because
>> either way is ugly.
>
> Agreed :) But consistent ugliness is still preferable to inconsistent
> ugliness.

True.

>> > with one of the two forms disagreeing with Go naming expectations.
>>
>> Pardon my ignorance: What are Go's expectations?
>
> Acronyms are usually all upper case:
>
>   https://pkg.go.dev/net/http#ParseHTTPVersion
>   https://pkg.go.dev/net/http#ProxyURL
>   https://pkg.go.dev/crypto/tls#NewLRUClientSessionCache
>
> The same seems to be true of Python:
>
>   https://docs.python.org/3/library/http.html#http.HTTPStatus
>   https://docs.python.org/3/library/urllib.error.html#urllib.error.URLError
>   https://docs.python.org/3/library/xmlrpc.server.html#xmlrpc.server.SimpleXMLRPCServer
>
> Rust, on the other hand, seems to prefer only capitalizing the first
> letter of a word, no matter if it's an acronym:
>
>   https://doc.rust-lang.org/std/net/struct.TcpStream.html
>   https://doc.rust-lang.org/std/net/struct.Ipv4Addr.html
>   https://doc.rust-lang.org/std/ffi/struct.OsString.html

Another strange game where the only winning move is not to play.

> Whether different naming conventions are used for types, functions
> and struct members is also language-dependent.

Yes.

>> > In this case we might be able to just change the schema without
>> > introducing backwards compatibility issues, though? Type names are
>> > not actually transmitted on the wire IIUC.
>>
>> Correct!
>
> That's great, but even if we decided to change all type names so that
> the schema is internally consistent and follows a naming convention
> that's reasonable for C, Go and Python, we'd still leave the Rust
> interface looking weird... There's no one-size-fits-all name,
> unfortunately.

C will remain the primary customer for quite a while.  It doesn't come
with universally accepted naming conventions, so we made up our own.  I
think we have some wiggle room there.  We could, for instance, decide to
clean up the current inconsistent capitalization of acronyms in the QAPI
schema to either style, TCPStream or TcpStream.

Your point remains: some names will still look "weird" in some possible
target languages.

>> > Of course such annotations would only be necessary to deal with
>> > identifiers that are not already following the expected naming
>> > conventions and when MLAs are involved.
>>
>> Pardon my ignorance some more: what are MLAs?
>
> Multi Letter Acronyms. Which are actually just called "acronyms" I
> guess? O:-)

Well played!

> The point is that, if we want to provide a language interface that
> feels natural, we need a way to mark parts of a QAPI symbol's name in
> a way that makes it possible for the generator to know they're
> acronyms and treat them in an appropriate, language-specific manner.

It's not just acronyms.  Consider IAmALittleTeapot.  If you can assume
that only beginning of words are capitalized, even for acronyms, you can
split this into words without trouble.  You can't recover correct case,
though: "i am a little teapot" is wrong.

"Split before capital letter" falls apart when you have characters that
cannot be capitalized: Point3d.

Camel case is hopeless.

> The obvious way to implement this would be with an annotation along
> the lines of the one I proposed. Other ideas?

I'm afraid having the schema spell out names in multiple naming
conventions could be onerous.  How many names will need it?  Times how
many naming conventions?

Another issue: the fancier the translation from schema name to
language-specific name gets, the harder it becomes to find one from the
other.


