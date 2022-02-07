Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBE4AB8C4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:35:12 +0100 (CET)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1MV-00007J-9g
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nH0zV-0008GW-0H
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nH0zP-0005E9-I2
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644228675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qSBJxa/FI/g39kDuEl14hQb9VmDVRcWigWzWK5kGX4=;
 b=N2wGeAOBJiZNPc+YFMAI1SsCNenuTH7Ui6RQnPm9reHzwYopC0vX1BFyoQpS1W1l7f2EbL
 MbHxxrSmMkx6gJnMOvXpbgEgMWqTWxWx0gGhBCLlBQ7VSmZKgzySqSezDarJpbxqGA1W6o
 RWLTb+ew275lD4Y75wGBAJKiB02+CKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-g6x_DSwCN0y7qarw-J93_g-1; Mon, 07 Feb 2022 05:11:13 -0500
X-MC-Unique: g6x_DSwCN0y7qarw-J93_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1D691091DA1
 for <qemu-devel@nongnu.org>; Mon,  7 Feb 2022 10:11:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 564BC105C730;
 Mon,  7 Feb 2022 10:11:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA87721E66CF; Mon,  7 Feb 2022 11:11:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <Yfuw1gGPPf8IPzLB@redhat.com>
 <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
 <YfzwIfAYQub5LjdG@redhat.com>
Date: Mon, 07 Feb 2022 11:11:10 +0100
In-Reply-To: <YfzwIfAYQub5LjdG@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 4 Feb 2022 09:21:37 +0000")
Message-ID: <87v8xr3s1t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Victor Toso de Carvalho <victortoso@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Feb 03, 2022 at 05:52:10PM -0500, John Snow wrote:
>> On Thu, Feb 3, 2022 at 5:40 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>> >
>> > On Wed, Jan 26, 2022 at 01:58:19PM -0500, John Snow wrote:
>> >
>> > As you mention though, bear in mind that a command returning
>> > nothing today, might return something tomorrow. IOW, we'd be
>> > going from a empty dict to a non-empty dict. If you use "None"
>> > then it'd be gonig from None to a non-empty dict.
>> >
>> > I think you can argue both of these approaches are backwards
>> > compatible. The python app is not likely to be looking at
>> > the return type at all initially - unlike C, errors get
>> > raised as exceptions, so you don't need to look at return
>> > type to distinguish succes from failure.
>> >
>> > So I'd consider it merely a documentation problem to say
>> > that a "None" return type might later change to a dict.
>> > Dunno how you represent that in python type annotations,
>> > but I presume there's a way.
>>=20
>> I don't think type hints offer a temporal dimension to them yet :)
>>=20
>> I started writing a much lengthier response, but the subject of
>> compatibility is really complex and I am not prepared to give a
>> comprehensive response to some of the issues you raise ... so instead
>> I will say "Wow, good points!" and I will get back to you on some of
>> it. A lot of things will only make sense if we are talking about a
>> very specific type of project, with very specific goals that are
>> clearly established. I don't really have that ready, here; I am just
>> experimenting to learn where some of the pain points are, still.
>>=20
>> So... I'll get back to you on this.
>>=20
>> > We do allow fields to be deleted, which is a *non-compatible*
>> > evolution, but they MUST have been marked as deprecated for
>> > 2 cycles first.
>>=20
>> Good point.
>>=20
>> > I'd say sorting required vs optional arguments is doomed as
>> > a strategy. Stuff that is mandatory today can be made optional
>> > tomorrow and I think that's reasonable to want todo as we
>> > evolve an API design.
>>=20
>> Also a good point. Python requires all mandatory arguments precede all
>> optional ones, so you're probably right that in order to maximize
>> cross-version compatibility, keyword-only arguments for *all*
>> arguments both mandatory and optional is the only real way to fly.
>>=20
>> I think this might cause problems for Marc-Andre in rust/dbus land,
>> but it's tractable in Python. I am unclear on the ramifications for
>> golang. (Victor, Marc-Andre, any input here?)
>
> Well as a general point, if we consider usage outside of
> qemu.git, I'm far from convinced that generating code from
> the schema as it exists today is going to be broadly usable
> enough to make it worthwhile.
>
> The problem is precisely that the code that is generated is
> only ensured to work with the specific version of QEMU that
> it was generated from. The key problem here is the removal
> of features after deprecation.  That removal is fine if you
> only ever need an API to talk to the current QEMU, or only
> need to be able to introspect the current QEMU.
>
> Management apps are likely to want to write code that works
> with more than 1 version of QEMU, and be able to decide
> whether they provide the params needed by the old command
> or the new command.   The introspection data lets them
> make the decision about which command needs to be invoked,
> but it can't be used to generate the code needed for the
> old command.
>
> I don't know how exactly you're dealing with the Python
> mapping. If you're literally statically generating Python
> code you'll face this same problem. If on the other hand
> you've just got a stub object that does dynamic dispatch
> then it can dynamically adapt at runtime to work with
> whatever version of the schema it queried from the QEMU
> it is talking to. I'm hoping you're doing the latter
> for this reason.
>
> One strategy for compiled languages is to generate multiple
> copies of the APIs, one for each QEMU version. This could
> be made to work but I feel it is pretty horrific as an
> approach.  Libvirt has one set of client APIs that we've
> extended over time so they can be used to call both old
> and new variants of commands - we just need to use the
> introspected schema to decide which to use.
>
> To make the latter viable for generating compiled code
> though, we need to change how we deal with removals, by
> essentially never removing things at all. Instead we
> would need some way to express that "field A" or "type T"
> is not present after some point in time / release.
>
> Overall I don't think we're really in a position to use
> compiled auto generated bindings, except for QMP clients
> that are released in lockstep with specific QEMU versions,
> and I don't think lockstep releases are a viable strategy
> in general.

You described two choices.  I believe there's a third one.

A management application can choose to target a single QEMU version, and
require lockstep upgrade, i.e. upgrading QEMU requires upgrading to the
matching management application, and vice versa.  This is quite a hassle
for users.

The other extreme is to target a range of QEMU versions that is so wide
that the management application has to deal both with old and new
interfaces.  QEMU provides schema introspection to help with that, and
libvirt makes use of it.

A third choice is to target the narrow range of QEMU versions where the
deprecation policy protects you.  If a management application release
for QEMU version N uses no deprecated interfaces, it should be good up
to version N+2.  That's a full year.  Less wiggle room than libvirt
provides.  Whether the extra wiggle room is worth the extra effort is
for the management application developers to decide.

Note that this *can* use bindings generated for version N.  These
bindings talk wire format version N to QEMU, which QEMU up to version
N+2 must understand as per deprecation policy.

The difference between the first and the last choice is some extra
analysis and testing: you have to ensure no uses of deprecated
interfaces are left (QEMU provides -compat for that since v6.0), and you
have to keep testing with new QEMU releases (preferably *before* they
come out), to guard against deprecation policy violations slipping
through.  Same testing as for the second choice, just for fewer QEMU
releases.

>> > It sounds like you need a wrapper type.  This StrOrNull scenario
>> > is QMP's "alternate" type IIUC, but you're trying to avoid
>> > expressing the existance fo the "alternate" type in the API
>>=20
>> Yes. This is a very clean way to type it, but it is a little more
>> laborious for the user to have to remember to wrap certain strings in
>> a special constructor first. Still, this is a good trick that I hadn't
>> considered. I'll keep it in mind for future experiments.
>
> Bear in mind that this situation is pretty rare, so I don't think
> the user is especially burdened by needing an extra level of
> indirection for using 'alternate' types
>
> $ git grep "'alternate'" qapi
> qapi/block-core.json:{ 'alternate': 'BlockDirtyBitmapMergeSource',
> qapi/block-core.json:{ 'alternate': 'Qcow2OverlapChecks',
> qapi/block-core.json:{ 'alternate': 'BlockdevRef',
> qapi/block-core.json:{ 'alternate': 'BlockdevRefOrNull',
> qapi/common.json:{ 'alternate': 'StrOrNull',
>
> $ git grep "'StrOrNull'" qapi
> qapi/block-core.json:             'iothread': 'StrOrNull',
> qapi/common.json:{ 'alternate': 'StrOrNull',
> qapi/migration.json:            '*tls-creds': 'StrOrNull',
> qapi/migration.json:            '*tls-hostname': 'StrOrNull',
> qapi/migration.json:            '*tls-authz': 'StrOrNull',

Yes.

Apropos StrOrNull.  The natural C binding would be a nullable const *
(plain str is *not* nullable).  But StrOrNull is too rare to bother.


