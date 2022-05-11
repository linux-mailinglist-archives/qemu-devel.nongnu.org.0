Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1C5234A0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 15:48:16 +0200 (CEST)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nomhL-0007Oq-D7
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nomf7-0005sz-6y
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nomf4-0007uZ-3z
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652276751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tud1ksFHx5LRmkDtEmzxokWyw1LCXMg9MXX3uqIcd3s=;
 b=PMjm9Hw0JtZnOGnMdh4aBLqYEKR7TmHX/nTM6CRoE9+W4khVWPUTtBjl1SUgHyRSIqEq+8
 DLm0ZUPnhlgvsJc8beAcGSIdoSEc7uLVO/O6cFKNKjrYihDyzHR50xVW/7/ld5WD6GVBIZ
 bRL6vo9jtgGxFEFTnXx3PCbrjRBrQzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-YTV7q5bqOp6skO6vPqpFiQ-1; Wed, 11 May 2022 09:45:49 -0400
X-MC-Unique: YTV7q5bqOp6skO6vPqpFiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94EDC80B71A
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 13:45:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 514D8400E86A;
 Wed, 11 May 2022 13:45:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 13EC021E6880; Wed, 11 May 2022 15:45:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,  Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
 <Yno14p8M2ABKQCcp@redhat.com>
Date: Wed, 11 May 2022 15:45:48 +0200
In-Reply-To: <Yno14p8M2ABKQCcp@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 10 May 2022 10:52:34 +0100")
Message-ID: <87a6bofaib.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, May 02, 2022 at 10:01:41AM -0400, Andrea Bolognani wrote:
>> > Times how many naming conventions?
>>=20
>> Yeah, I don't think requiring all possible permutations to be spelled
>> out in the schema is the way to go. That's exactly why my proposal
>> was to offer a way to inject the semantic information that the parser
>> can't figure out itself.
>>=20
>> Once you have a way to inform the generator that "VNCProps" is made
>> of the two words "vnc" and "props", and that "vnc" is an acronym,
>> then it can generate an identifier appropriate for the target
>> language without having to spell out anywhere that such an identifier
>> would be VNCProps for Go and VncProps for Rust.
>>=20
>> By the way, while looking around I realized that we also have to take
>> into account things like D-Bus: the QAPI type ChardevDBus, for
>> example, would probably translate verbatim to Go but have to be
>> changed to ChardevDbus for Rust. Fun :)

For what it's worth, I prefer Rust's style, because I hate downcasing
tails of abbreviations a lot less than I hate WORDSRUNTOGETHER.

> The hardest one of all is probably
>
>    QAuthZListPolicy
>
> which must be split  'QAuthZ'  + 'List' + 'Policy'  - the trailing
> uppercase ruins all heuristics you can come up with, as there's no
> viable way to distinguish that scenario from 'ChardevDBus' which
> is 'Chardev' + 'DBus' not  'ChardevD' + 'Bus'
>
>> Revised proposal for the annotation:
>>=20
>>   ns:word-WORD-WoRD-123Word
>
> Ugly, but we should only need this in the fairly niche scenarios,
> so not too pain ful to add a handful of these:
>
> Essentially if have the schema use CamelCase with UPPERCASE
> acronyms, and declare two rules:
>
>  1. Split on every boundary from lower to upper
>  2. Acronym detection if there's a sequence of 3 uppercase
>     letters, then split before the last uppercase.
>
> then we'll do the right thing with the vast majority of cases:
>
>   ChardevSocket:
>      Rule 1: Chardev + Socket
>      Rule 2: Chardev + Socket

Rule 2 isn't used here.

>
>   VNCProps:
>      Rule 1: VNCProps
>      Rule 2: VNC + Props

Rule 2 is used here.

For Rust-style VncProps, rule 2 is again unused.

>
>   ChardevDBus

Note: "DBus" is not an (upper-case) acronym.  It's a proper name grown
from an abbreviation of "desktop bus".

>      Rule 1: Chardev + DBus
>      Rule 2: Chardev + DBus

Rule 2 isn't used here, either.

> and fail on=20
>
>   QAuthZListPolicy
>
>      Rule 1: QAuth + ZList + Policy
>      Rule 2: QAuth + ZList + Policy
>
> so only the last case needs   ns:QAuthZ-List-Policy  annotation, whcih
> doesn't feel like a big burden

I think there are two interesting sub-problems within the larger problem
of mapping QAPI names to "nice" target language identifiers.

1. Splitting words run together (mostly camels, but also mistakes like
   logappend).

2. Adjust case in words for the target language

For 1., we can rely on word separators '-', '_' and change from lower to
upper case.  Cases where that doesn't suffice remain.

Adopting Go-style camels for QAPI will add to them, but something like
your rule 2 above should mitigate.

What about this simple greedy algorithm:

    funny_words =3D [QAuthZ, ...]

    tail =3D name
    words =3D []
    while tail !=3D "":
        if tail starts with any of the words in funny_words:
            next_word =3D that member of funny_words
        else:
            next_word =3D tail up to next separator or change from lower
                        to upper case
        append next_word to tail
        tail =3D remainder of tail with leading separator stripped

For 2., adjusting to all lower case (like "vnc", "props", "dbus"), all
upper case (like "VNC", "PROPS", "DBUS"), and capitalized (like "Vnc",
"Props", "Dbus") is trivial.  Adjusting to capitalized except for funny
words (like "VNC", "Props", "DBus") is not.  Need a list of funny words,
I guess.

Perhaps a single list of funnies would do for 1. and for 2.


