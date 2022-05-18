Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DF52B9E7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:35:08 +0200 (CEST)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrItO-0007lT-UG
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrIov-0005je-6c
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:30:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrIos-0007XP-J0
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652877014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dk2gLYvaxrh/zqm7CpuedLcI5kZEM6o/vTfqvx4hgok=;
 b=f+6M/1gY0AH/FFeVbjoOqvYUDCNMrfzscoYOOjDq7M8lJGax2r/jEM/bj4qBTKXkAWXm5F
 4iy2ZKDdAxoNqHun4jIrLLUert82RNTeCXVfkhr1/H0zAdXatEd97f9Fxd/AzBJ0vf+230
 S7DaCgzOlbZpfEy4SUQErplJapbNYWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-qxtwama4PUi7lW8t4FADqg-1; Wed, 18 May 2022 08:30:13 -0400
X-MC-Unique: qxtwama4PUi7lW8t4FADqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3A603C0D193
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 12:30:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AAC7492C14;
 Wed, 18 May 2022 12:30:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5458B21E690D; Wed, 18 May 2022 14:30:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  John Snow
 <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>,  qemu-devel@nongnu.org,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <87r150dugw.fsf@pond.sub.org>
 <20220518085548.gri7ojvp5ezrstsj@tapioca>
Date: Wed, 18 May 2022 14:30:11 +0200
In-Reply-To: <20220518085548.gri7ojvp5ezrstsj@tapioca> (Victor Toso's message
 of "Wed, 18 May 2022 10:55:48 +0200")
Message-ID: <87mtffm3ak.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Wed, May 11, 2022 at 04:17:35PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> > Caller
>> >
>> >     block_resize(device=3D"dev0", size=3D1*GiB)
>> >     block_resize(node_name=3D"devnode0", size=3D1*GiB)
>> >
>> >
>> > In golang definition
>> >
>> >    type BlockResizeArguments struct {
>> >        Device string
>> >        NodeName string
>> >        Size int
>> >    }
>> >
>> > Caller choice of
>> >
>> >    cmd :=3D &BlockResizeCommand{
>> >        Device: "dev0",
>> >        Size: 1 * GiB,
>> >    }
>> >
>> >    cmd :=3D &BlockResizeCommand{
>> >        NodeName: "devnode0",
>> >        Size: 1 * GiB,
>> >    }
>>=20
>> Note that the Go bindings you sketched effectively use (poor
>> man's) keyword arguments.
>>=20
>> > Neither case can easily prevent passing Device and NodeName
>> > at same time.
>>=20
>> That defect lies at the schema's feet.
>
> Right. The schema does not provide any metadata to explicit say
> that only @device or @node-name should be used, correct?

Correct.

The existing means to express either / or are tagged unions and
alternates.

Tagged unions require an explicit tag member.

Alternates select the alternative by the type of the value.

We don't have anything that selects by member name.

> This would be important to differentiate of a simple 'adding a
> new optional argument' plus 'making this other argument
> optional'.

We also don't have means to express "this integer must be a power of
two", or "this string must name a block backend", or any number of
semantic constraints.

We have to draw the line somewhere.  Schema language complexity needs to
earn its keep.

>> >> * At some future date, the old way gets deprecated: argument @device
>> >>   acquires feature @deprecated.
>> >
>> > Ok, no change needed to the APIs in either case. Possibly have
>> > code emit a warning if a deprecated field is set.
>> >
>> >> * Still later, the old way gets removed: @device is deleted, and
>> >>   @node-name becomes mandatory.
>> >
>> > Again no change needed to APIs, but QEMU will throw back an
>> > error if the wrong one is used.=20
>> >
>> >> What is the proper version-spanning interface?
>> >>=20
>> >> I figure it's both arguments optional, must specify the right one for
>> >> the version of QEMU actually in use.  This spans versions, but it fai=
ls
>> >> to abstract from them.
>> >
>> > Yep, I think that's inevitable in this scenario. THe plus side
>> > is that apps that want to span versions can do so. The downside
>> > is that apps that don't want smarts to span version, may loose
>> > compile time warnings about use of the now deleted field.=20
>>=20
>> The version-spanning interface will arguably be a bad interface for any
>> version.
>>
>> > I suggested the code generator have an option to say what level
>> > of compat to use for generated code, so that apps can request an
>> > API without compat, which will result in compile errors. This
>> > though assumes every consumer app is embedding their own
>> > generated copy of the code. Not neccessarily desirable.
>> >
>> > At the C level you can play games with __deprecated__ to get
>> > compile time warnings in some cases.=20
>> >
>> > #define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_56
>> >
>> > causes QEMU to get compile time warnings (or errors) if it
>> > attempts to use a API feature deprecated in 2.56, even if
>> > the API exists in the header & library.=20
>> >
>> >
>> >> Note that it's not enough to replace "delete member" by "mark member
>> >> deleted in <version>".  You also have to keep full history for "is it
>> >> optional".  And for types, because those can evolve compatibly, too,
>> >> e.g. from struct to flat union, or from string to alternate of string
>> >> and something else.  What is the proper version-spanning interface in
>> >> all the possible cases?
>> >
>> > I've not thought through all possible scenarios, but there may end
>> > up being restrictions, such that changes that were previously possible
>> > may have to be forbidden.
>>=20
>> "There may be restrictions" is not exactly a confidence-inspring design
>> assumption.  We need a reasonably dependable idea on what exactly we're
>> intending to sacrifice.
>
> I can't help much here but I guess we can evolve QAPI schema as
> we move forward. Adding metadata that helps document changes to
> the benefit of giving code generators tools to provide a way to
> work with those QAPI changes seems desirable, no?

QMP comes with a certain compatibility promise.  Keeping the promise has
been expensive, but that's okay; a weaker promise would have been
differently expensive.  It's a compromise that has emerged over a long
time.

I fail to see why QEMU-provided QMP bindings should come with a stronger
promise than QEMU-provided QMP.

>> > One example,  in the past we could do deprecate a field 'foo', then
>> > delete 'foo' and then some time re-introduce 'foo' with a completely
>> > different type. That would not be possible if we wanted to maintain
>> > compat, but in this example that's probably a good thing, as it'll
>> > be super confusing to have the same field name change type like that
>> > over time. Easier to just use a different name.
>> >
>> > So the question to me is not whether all our previous changes are
>> > still possible, but whether enough of the typwes of change are
>> > possible, such that we can cope with the ongoing maint in a
>> > reasonable way. I don't think we've explored the possibility enough
>> > to say one way or the other.
>> >
>> >> > Apps that wish to have version compat, would of course need to write
>> >> > their code to be aware of which fields they need to seend for which
>> >> > QEMU version.
>> >>=20
>> >> At which point we're reinventing libvirt.
>
> IMHO, at this moment, qapi-go is targeting communicating with
> QEMU and handling multiple QEMU versions seems reasonable to me.

It's targeting communicating in *QMP*.  QMP is designed to support
communicating with a range of QEMU versions.  Full compatibility is
promised for a narrow range.  Outside that range, graceful degradation.

*If* you want to widen the full compatibility range, do it in *QMP*.  Or
do it on top of QEMU, e.g. in libvirt.

> Perhaps libvirt can use qapi-go in the future or other generated
> interface. That would be cool.

"Would be cool" and a dollar buys you a cup of bad coffee.

Is it a good use of our limited resources?

How much will it delay delivery of Go bindings compared to less
ambitious version?

>> > The premise of the code generators is that there are applications
>> > that want to consume QEMU that are not libvirt. With this line of
>> > reasoning we could easily say that all such applications should
>> > just use libvirt and then we don't need to provide any of these
>> > code generators.  The fact that we're considering these code
>> > generators though, says that we're accepting there are valid use
>> > cases that don't want to use libvirt for whatever reasons.
>>=20
>> Can't resist any longer: "What has libvirt ever done for us?"
>> https://www.youtube.com/watch?v=3DQc7HmhrgTuQ
>>=20
>> >                                                            It is
>> > reasonable that some of those applications may wish to target
>> > a wide range of QEMU versions, just like libvirt does.
>>=20
>> At which point they're comitting to reinventing the relevant parts of
>> libvirt.
>>=20
>> I'd expect marshalling and umarshalling QMP to be among the
>> smaller sub-problems then.  It may look relatively large at
>> first, because it's among the first ones to be solved.  More so
>> when you hand-wave away the more interesting ones of
>> *abstraction* until they bite you in the posterior.
>
> I might have missed it but I don't see unsolvable problems.
>
>  1) We decide if we want a Golang interface that can communicate
>     with multiple QEMU versions or not;
>  2) We discuss how that Golang interface would look like;
>  3) We discuss what is needed in QEMU/QAPI to achieve (2)
>  4) We work on QEMU/QAPI to address (3)
>  5) We move on with qapi-go proposal

This reinvents significant parts of libvirt in QEMU.

> I see only benefits with this project, plus the fact we already
> have Golang projects doing their own code to communicate with
> QEMU and I do believe we will make their lives easier.

Perhaps my idea of practical Go usage is hopelessly naive, but here goes
anyway.

Go project vendors current Go bindings (because they vendor everything).
Works with current QEMU, plus a range of past and future QEMUs.

Eventually something breaks with a then current QEMU.  Go project
updates vendored Go bindings to current.  Compiler points out everything
they need fixing (this assumes the type system is sufficiently
expressive, and bindings use it properly).

Good enough for these Golang projects?

Or asked in a different way: what exactly are the compatibility
requirements of these projects?

Please keep it to requirements *actual* projects have.  Providing for
additional, non-trivial requirements hypothetical projects might have
is, in my reasoned opinion, folly we cannot afford.  YAGNI until
demonstrated otherwise.

If different projects have different requirements, then QEMU having to
provide for all of them does not follow.  Nothing absolves us from
weighing benefits vs. costs and risks.


