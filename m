Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A685BC35D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:08:52 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAtf-00024h-4i
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaAWt-00074S-KQ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaAWp-0002Zw-Ou
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663569914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qREFu8MFjUuc6X3YqnyMO3UlYylOxf+DmrM3UZMT128=;
 b=aIswSHkVPpDliZ4ou2Eha3N1rkJV79VpFHQxgAz/IUpxuJeH8zX7UyEE3FnCrmcAh27cly
 enK+drEYG07wEXm8/mXKQWmqsRXzZN5yxR0qdwIDjoEHrhY8uZD5YOtl5H1tWnzTbC7xYx
 Aua7AlwbUcuX5ktGlLN+RBOTJhA/Y7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-SyuOkBfxOsClU2c0LgcZDQ-1; Mon, 19 Sep 2022 02:45:09 -0400
X-MC-Unique: SyuOkBfxOsClU2c0LgcZDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 758B8862FE1;
 Mon, 19 Sep 2022 06:45:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B8D140EBF5;
 Mon, 19 Sep 2022 06:45:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B36C721E6900; Mon, 19 Sep 2022 08:45:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  John Snow <jsnow@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
 <YyNDCDH71oytYujr@work-vm>
 <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
 <YySX9BCEoJ/sARn6@redhat.com>
Date: Mon, 19 Sep 2022 08:45:07 +0200
In-Reply-To: <YySX9BCEoJ/sARn6@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 16 Sep 2022 16:36:20 +0100")
Message-ID: <87a66vammk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Sep 16, 2022 at 04:12:00PM +0100, Peter Maydell wrote:
>> On Thu, 15 Sept 2022 at 16:21, Dr. David Alan Gilbert
>> <dgilbert@redhat.com> wrote:
>> >
>> > * Peter Maydell (peter.maydell@linaro.org) wrote:
>> > > On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
>> > > > Hi, I suspect I have asked this before, but I didn't write it down=
 in
>> > > > a comment, so I forget my justification...
>> > > >
>> > > > In the QMP lib, we need to set a buffering limit for how big a QMP
>> > > > message can be -- In practice, I found that the largest possible
>> > > > response was the QAPI schema reply, and I set the code to this:
>> > > >
>> > > >     # Maximum allowable size of read buffer
>> > > >     _limit =3D (64 * 1024)
>> > > >
>> > > > However, I didn't document if this was a reasonable limit or just a
>> > > > "worksforme" one. I assume that there's no hard limit for the prot=
ocol
>> > > > or the implementation thereof in QEMU. Is there any kind of value =
here
>> > > > that would be more sensible than another?
>> > > >
>> > > > I'm worried that if replies get bigger in the future (possibly in =
some
>> > > > degenerate case I am presently unaware of) that the library default
>> > > > will become nonsensical.
>> > >
>> > > There are some QMP commands which return lists of things
>> > > where we put no inherent limit on how many things there
>> > > are in the list, like qom-list-types. We'd have to be getting
>> > > a bit enthusiastic about defining types for that to get
>> > > up towards 64K's worth of response, but it's not inherently
>> > > impossible. I think using human-monitor-command to send
>> > > an 'xp' HMP command is also a way to get back an arbitrarily
>> > > large string (just ask for a lot of memory to be dumped).
>> >
>> > We could put size limits on xp; most Humans will only dump a few kB
>> > maximum like that, any larger and you can dump to file.
>>=20
>> Sure, we could, but why? It's not clear to me why a consumer
>> of QMP needs to impose a maximum message size limit on it:
>> I thought it was just JSON. Fixed buffer sizes are very 1980s :-)
>
> Well even if they parse the JSON as it streams in, rather than
> reading the whole doc and then parsing it in one go, you still
> need to have limits on any sane QMP client.
>
> The QEMU process is an untrusted component in the stack, talking
> to a trusted mgmt layer. If the QEMU process sends a 1 TB JSON
> message as a QMP reply, the mgmt layer must not try to parse
> that as they'll let loose the kraken^H^H^H^H^H OOM killer.
>
> To be robust against either a malicious or mis-behaving QEMU
> they need to impose a limit on the size of QMP response they'll
> be willing to process. The challenge is figuring out what limit
> is big enough to handle any conceivable valid message, while
> being small enough to minimize denial of service risks.

Yes.

QEMU does this for QMP input.

Trying to defend against malicious QMP input would of course be
pointless; if you can send QMP input, you "own" QEMU anyway.  It's
defense against *accidents*.

The limits are extremely (overly?) generous: each command is limited to
1024 levels of nesting to protect the stack, 64MiB of total token size
and 2Mi[*] tokens to protect the heap.

> NB, that's not the only thing clients need todo to protect from
> a bad QEMU. Rate limiting consumption is potentially important too
> lest a bad QEMU inflict a DoS on the CPU by sending such frequent
> messages that the QMP client is burning 100% CPU just parsing
> them.  I've not seen any QMP client do this in practice though,
> not even libvirt has attempted it.

What could a management application do when it detects it can't /
doesn't want to keep up with QMP output?

>> If this is a common requirement then should we define something
>> in the protocol where the client says "I can support messages
>> up to this big" and then the server has to split things up?
>
> Splitting doesn't help protect against the DoS, because the QMP
> client would have to reassemble the pieces afterwards to process
> the reply / async event.

Yes.

Can we estimate limits that should suffice?  Documenting them could help
management applications.


[*] If you're curious about this value, see commit df649835fe "qjson:
Limit number of tokens in addition to total size".


