Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F55214CE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 14:06:16 +0200 (CEST)
Received: from localhost ([::1]:36694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noOd5-0002vP-4u
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 08:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noOa0-0000P8-2C
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noOZw-00033K-O5
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652184179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8sRoqqOMjw3FHCEbBRyFRIxQjXiWOU59KjTe5nu9XE=;
 b=YoojZ4Vx/DDpDOL7RpPN8H5DUYff5APQ5LU+DktZCmo4E9Wr4FLlzX+ieO0AiRGAF/dIgh
 kFD6FMJjAiSR5YY8f9GO5D7uxL0fMfathKiRamFYiSMKSeHFosCwv5NEXxiuDpAdIA1PJq
 FUGkWSAt2aNCNxpKM3bLZCVFct89ZFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-5SLAL8bDPkCqtkZYDgojeA-1; Tue, 10 May 2022 08:02:58 -0400
X-MC-Unique: 5SLAL8bDPkCqtkZYDgojeA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB113185A7A4
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 12:02:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D6940317B;
 Tue, 10 May 2022 12:02:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 508B121E6880; Tue, 10 May 2022 14:02:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>,  John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>,  qemu-devel@nongnu.org,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
Date: Tue, 10 May 2022 14:02:56 +0200
In-Reply-To: <Ynon8Y8uwfL1bDyN@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 10 May 2022 09:53:05 +0100")
Message-ID: <87lev9mw7j.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

> On Tue, Apr 26, 2022 at 01:14:28PM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>>=20
>> > Hi,
>> >
>> > Happy 1st April. Not a joke :) /* ugh, took me too long to send */
>> >
>> > This series is about adding a generator in scripts/qapi to produce
>> > Go data structures that can be used to communicate with QEMU over
>> > QMP.
>> >
>> >
>> > * Why Go?
>> >
>> > There are quite a few Go projects that interact with QEMU over QMP
>> > and they endup using a mix of different libraries with their own
>> > code.
>> >
>> >
>> > ** Which projects?
>> >
>> > The ones I've found so far:
>> >
>> > - podman machine
>> >   https://github.com/containers/podman/tree/main/pkg/machine/qemu
>> >
>> > - kata-containers (govmm)
>> >   https://github.com/kata-containers/kata-containers/tree/main/src/run=
time/pkg/govmm
>> >
>> > - lxd
>> >   https://github.com/lxc/lxd/tree/master/lxd/instance/drivers
>> >
>> > - kubevirt (plain json strings)
>> >   https://github.com/kubevirt/kubevirt
>> >
>> > (let me know if you know others)
>> >
>> >
>> > * But Why?
>> >
>> > I'm particularly interested in 3 out of 4 of the projects above and
>> > only Kubevirt uses libvirt to handle QEMU. That means that every
>> > QEMU releases where a QMP command, event or other data struct is
>> > added, removed or changed, those projects need to check what changed
>> > in QEMU and then address those changes in their projects, if needed.
>> >
>> > The idea behind generating Go data structures is that we can keep a
>> > Go module which can have releases that follow QEMU releases.
>>=20
>> We need to look at "following the QEMU releases" a bit more closely.
>>=20
>> Merging your patches gives us the capability to generate a Go interface
>> to HEAD's version of QMP.
>>=20
>> The obvious way for an out-of-tree Go program to use this generated Go
>> interface is to build with a specific version of it.  It can then talk
>> QMP to any compatible QEMU version.
>>=20
>> Compatibility with older QEMUs is not assured: stuff added since is
>> present on the Go QMP client end, but not on the QEMU QMP server end.
>>=20
>> Compatibility with newer QEMUs is subject to our deprecation policy:
>>=20
>>     In general features are intended to be supported indefinitely once
>>     introduced into QEMU.  In the event that a feature needs to be
>>     removed, it will be listed in this section.  The feature will remain
>>     functional for the release in which it was deprecated and one
>>     further release.  After these two releases, the feature is liable to
>>     be removed.
>>=20
>> So, if you stay away from deprecated stuff, you're good for two more
>> releases at least.
>>=20
>> Does this work for the projects you have in mind?
>
> It might work for some projects, but in the general case I find it pretty
> unappealing as a restriction. Mixing and matching new QEMU with old libvi=
rt,
> or vica-verca has been an incredibly common thing todo when both developi=
ng
> and perhaps more importantly debugging problems. For example I have one
> libvirt build and I use it against any QEMU from Fedora / any RHEL-8.x
> update, which spans a great many QEMU releases.=20

I'd like to propose that for compatibility with a wide range of QEMU
versions, you use or reinvent libvirt.

> I like the idea of auto-generating clients from the QAPI schema, and
> would like it if we were able to use this kind of approach on the libvirt
> side, but for that we need to be more flexible in version matching.
>
> Our current approach to deprecation features and subsequently removing
> them from the QAPI schema works fine when the QAPI schema is only used
> internally by QEMU, not when we we expand usage of QAPI to external
> applications.=20
>
> I think we need to figure out a way to make the QAPI schema itself be
> append only, while still allowing QEMU to deprecation & remove features.

This is going to get complicated fast.

> For a minimum viable use case, this doesn't feel all that difficult, as
> conceptually instead of deleting the field from QAPI, we just need to
> annotate it to say when it was deleted from the QEMU side.  The QAPI
> generator for internal QEMU usage, can omit any fields annotated as
> deleted in QAPI schema. The QAPI generator for external app usage,
> can (optionally) be told to include deleted fields ranging back to
> a given version number. So apps can chooses what degree of compat
> they wish to retain.

Consider this evolution of command block_resize

* Initially, it has a mandatory argument @device[*].

* An alternative way to specify the command's object emerges: new
  argument @node-name.  Both old @device and new @node-name become
  optional, and exactly one of them must be specified.  This is commit
  3b1dbd11a6 "qmp: Allow block_resize to manipulate bs graph nodes."

* At some future date, the old way gets deprecated: argument @device
  acquires feature @deprecated.

* Still later, the old way gets removed: @device is deleted, and
  @node-name becomes mandatory.

What is the proper version-spanning interface?

I figure it's both arguments optional, must specify the right one for
the version of QEMU actually in use.  This spans versions, but it fails
to abstract from them.

Note that it's not enough to replace "delete member" by "mark member
deleted in <version>".  You also have to keep full history for "is it
optional".  And for types, because those can evolve compatibly, too,
e.g. from struct to flat union, or from string to alternate of string
and something else.  What is the proper version-spanning interface in
all the possible cases?

> Apps that wish to have version compat, would of course need to write
> their code to be aware of which fields they need to seend for which
> QEMU version.

At which point we're reinventing libvirt.

>> > * Status
>> >
>> > There are a few rough edges to work on but this is usable. The major
>> > thing I forgot to add is handling Error from Commands. It'll be the
>> > first thing I'll work on next week.
>> >
>> > If you want to start using this Today you can fetch it in at
>> >
>> >     https://gitlab.com/victortoso/qapi-go/
>> >
>> > There are quite a few tests that I took from the examples in the
>> > qapi schema. Coverage using go's cover tool is giving `28.6% of
>> > statements`
>> >
>> > I've uploaded the a static generated godoc output of the above Go
>> > module here:
>> >
>> >     https://fedorapeople.org/~victortoso/qapi-go/rfc/victortoso.com/qa=
pi-go/pkg/qapi/
>> >
>> >
>> > * License
>> >
>> > While the generator (golang.py in this series) is GPL v2, the
>>=20
>> I'd make it v2+, just to express my displeasure with the decision to
>> make the initial QAPI generator v2 only for no good reason at all.
>
> Our policy is that all new code should be v2+ anyway, unless it was
> clearly derived from some pre-existing v2-only code. Upto Victor to
> say whether the golang.py is considered clean, or was copy+paste
> in any parts from existin v2-only code

Makes sense.

>> > generated code needs to be compatible with other Golang projects,
>> > such as the ones mentioned above. My intention is to keep a Go
>> > module with a MIT license.
>>
>> Meh.  Can't be helped, I guess.
>
> This does make me wonder though whether the license of the QAPI input
> files has a bearing on the Go (or other $LANGUAGE) ouput files. eg is
> the Go code to be considered a derived work of the QAPI JSON files. I'm
> not finding a clearly articulated POV on this question so far.

Oww.  You're right.

The safe and easy answer is "same license as the generator code".
Anything else is either not safe or not easy, I'm afraid.


[*] Because everyhing in QEMU must be called either "device" or
"driver".  It's the law!


