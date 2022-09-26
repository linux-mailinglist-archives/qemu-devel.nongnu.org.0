Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4EF5EA292
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:10:54 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocm0j-00053D-83
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oclaG-0007DF-4k
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oclaC-0002d9-U9
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664189008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzpRtq6W35i/c0TQsBCIa2MyePXvMDcKXWVUEtAzrUA=;
 b=g3CaQxx7cvfzn0WPGXPU2eNZF7vcLE+u+O1I5BtCHvCymKn4NaOhUCz69C/cAL2fLLtMGN
 a6maeI6wSe9N5kdmGV2uF0UtntCjO8Ih72OoO1huoLxK60UZS5mH4R4YtyG9BEquw43E1f
 XtWMteyUWZcNSNXP+COi25BGW6OKs/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-1R2U_vk9Nb-ddR4GINhIHg-1; Mon, 26 Sep 2022 06:43:25 -0400
X-MC-Unique: 1R2U_vk9Nb-ddR4GINhIHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDDAD862FDF;
 Mon, 26 Sep 2022 10:43:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9690140EBF4;
 Mon, 26 Sep 2022 10:43:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9617A21E691D; Mon, 26 Sep 2022 12:43:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: John Snow <jsnow@redhat.com>,  Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,  Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: Maximum QMP reply size
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <87v8pzwgbm.fsf@pond.sub.org> <YzFd44GS6Ad0DNis@redhat.com>
Date: Mon, 26 Sep 2022 12:43:23 +0200
In-Reply-To: <YzFd44GS6Ad0DNis@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 26 Sep 2022 09:08:03 +0100")
Message-ID: <87zgem8lh0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

> On Wed, Sep 07, 2022 at 01:54:05PM +0200, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>>=20
>> > Hi, I suspect I have asked this before, but I didn't write it down in
>> > a comment, so I forget my justification...
>> >
>> > In the QMP lib, we need to set a buffering limit for how big a QMP
>> > message can be -- In practice, I found that the largest possible
>> > response was the QAPI schema reply, and I set the code to this:
>> >
>> >     # Maximum allowable size of read buffer
>> >     _limit =3D (64 * 1024)
>> >
>> > However, I didn't document if this was a reasonable limit or just a
>> > "worksforme" one. I assume that there's no hard limit for the protocol
>> > or the implementation thereof in QEMU. Is there any kind of value here
>> > that would be more sensible than another?
>> >
>> > I'm worried that if replies get bigger in the future (possibly in some
>> > degenerate case I am presently unaware of) that the library default
>> > will become nonsensical.
>> >
>> > Any pointers/tips?
>>=20
>> Peter and Daniel already provided some.  I can add a bit of insight into
>> how QMP output works in QEMU, which may or may not help you.
>>=20
>> QEMU executes one command after the other.  A command's response
>> (success or failure) is a QDict.  Which is then formatted as JSON and
>> appended to the monitor's output buffer.
>>=20
>> Events work similarly.
>>=20
>> The conversion to JSON does not limit the resulting string's size.  If
>> it runs out of memory, QEMU dies.
>>=20
>> The output buffer is also unbounded.  It drains into the monitor's
>> character device.
>>=20
>> If the QMP client sends enough commands without reading their responses,
>> QEMU can run out of memory and die.
>>=20
>> Now I'm ready to go back to your question, which is about a *single*
>> message (QMP command response or event): nothing in QEMU limits the size
>> of the QMP output message text.
>>=20
>> Weak consolation: I guess QEMU is somewhat likely to run out of memory
>> and die before your client software does.  That's because QDict is a
>> pig: an empty one eats 4120 Bytes on my system.  Compares unfavourable
>> to its text representation "{}".
>
> A malicious QEMU that's trying to attack the mgmt software client
> wouldn't need to use QDict, so that's only consolation against
> accidents. An evil QEMU would just write JSON directly onto the
> monitor chardev. It wouldn't even have to be well formed JSON,
> as it could just start a string and never end it.
>
>  {"blah..repeated for 1 TB for data...."

Yes, a malicious QEMU should be able to flood the QMP socket with
constant memory and negligible CPU overhead.


