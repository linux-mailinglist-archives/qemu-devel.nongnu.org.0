Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049334703DF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:30:38 +0100 (CET)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhr2-0001aw-ST
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvhn8-0004Mn-BD
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvhn2-0000D6-8T
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639149987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZdZ3Bht3SkZkEjGgEt2E02HQ0LE3B3pZNofj61zUoQ=;
 b=hLrgY2GnCleDGlGlw9Ppccjh4ktYUKzUINm8qCeriGyx8r9gnjKDWNiF20rydu8OVvPKzm
 9MDWy46XTSxOC1lwYwS6P0f3RJHRt4xhuKspBA2CkR7ZcFXHIoc2mRCfOtkishLilY7BSv
 7ckvlXzJKfvTZDrz9aMvhHfDpPZLFhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-X255CoF2P2OG0OA7K22qUw-1; Fri, 10 Dec 2021 10:26:23 -0500
X-MC-Unique: X255CoF2P2OG0OA7K22qUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AF301030C20;
 Fri, 10 Dec 2021 15:26:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 845D05DF37;
 Fri, 10 Dec 2021 15:26:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11D0A113865F; Fri, 10 Dec 2021 16:26:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
Date: Fri, 10 Dec 2021 16:26:20 +0100
In-Reply-To: <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com> (Paolo
 Bonzini's message of "Fri, 10 Dec 2021 09:34:41 +0100")
Message-ID: <87czm47a77.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/9/21 20:11, Daniel P. Berrang=C3=A9 wrote:
>>>     They still need to bootstrap a QMP monitor, and for that, CLI is fi=
ne
>>>     as long as it's simple and stable.
>
> I would go a step further and say that the QMP monitor socket should
> be created by whoever invoked QEMU and passed down via systemd's
> socket activation protocol, with a fallback to stdin/stdout.
>
>>> 2. CLI and configuration files
>>>
>>>     Human users want a CLI and configuration files.
>>
>> I'd note that Kubernetes doesn't bother with a human CLI at
>> all, and just expects everyone/everything to use JSON/YAML
>> config files. So there's no divide between what syntax humans
>> and machines use - humans just send the config via the CLI
>> tool which uploads it to the REST API that machines use
>> directly.
>
> I agree with Mark here that configuration is beyond QEMU's role.
> QEMU's JSON-based API isn't quite REST, but the idea is the same: the
> user talks to a tool which converts the configuration to QAPI
> commands.  The QAPI commands can be:
>
> - invocations of qmp_* functions in the case of a command-line based
>   configuration
>
> - invocations of QMP commands on a socket if startup is mediated by a
>   management tool
>
> Where Markus and I disagree is whether the two cases should be covered
> by one binary or two.  Personally I don't see much advantage in having
> a single binary, just like I don't care if /bin/ls and /bin/dir are=20
> symlinks, or they're separate binaries, or one invokes the other.
>
> What matters to me is the maintainability of the command-line based
> startup code.  Actual experience says that, as more and more options
> are supported via QMP-based configuration, the command-line based
> startup code gets simpler or at least more self-contained.
>
> In the terms of my KVM Forum talk, this is obtained by converting
> "one-off" options (typically global variables) to a combination of a=20
> "shortcut" option (typically a qemu_opts_set or qemu_opts_parse
> invocation) and a QOM property or a QMP command.  Examples from recent=20
> QEMU versions include -no-shutdown, -no-hpet, -no-acpi.
>
>>> =3D Ways forward =3D
>>
>> Just to clarify or remind ourselves of scope.
>> When I think about startup/cli in QEMU, I essentially consider
>> this to mean all softmmu/vl.c code.  Of course there are
>> supporting pieces splattered around, but IMHO 90% of the pain
>> is resulting from the code in the vl.c file.
>>
>>> 1. Improve what we have step by step, managing incompatible changes
>>>
>>>     We tried.  It has eaten substantial time and energy, it has
>>>     complicated code and interfaces further, and we're still nowhere ne=
ar
>>>     where we need to be.  Does not feel like a practical way forward to
>>>     me.
>>>
>>>     If you don't believe me, read the long version in "Appendix: Why
>>>     further incremental change feels impractical".
>>
>> Essentially death by 1000 cuts.
>
> There are two kinds of incremental changes.  Incremental changes to
> the UI are one thing; incremental changes to the implementations aka=20
> refactoring is another.
>
> I agree that further incremental changes to the UI (in the style of
> -preconfig) are impractical, but incremental changes to the=20
> implementation are totally practical.  The reason for that is that
> there *is* a way forward for decoupling the options from the command
> line parsing code, and this way forward has *already* proved itself.
>
>> Refering back to my earlier note, when I've suggested this approach
>> in the past, I've basically considered it to mean stop touching
>> softmmu/vl.c, and create a softmmu/vl2.c. The existing binaries
>> remain using vl.c, we get legacy free binaries built from vl2.c
>> Overtime we might get confidence to refactor bits of vl.c to
>> reduce duplication, but I would consider that not a priority
>> at least in the short term.
>
> This is what I have in my tree, though it's called climain.c and
> qmpmain.c. :)  There is one major difference though: refactoring bits
> of vl.c to use more of QMP/QOM *is* the way you add functionality in
> qmpmain.c.
>
> I disagree that vl.c is hard to refactor.  Sure there were some issues
> in 6.0/6.1, but at this point a lot of the hard parts have been done.=20
> The conversion of -smp to a QOM option, for example, was largely painless=
.

I posit that "largely painless to refactor for Paolo" does not imply
"refactoring is largely painless (or even feasible) for mere mortals".

Kidding aside, I acknowledge the progress in vl.c.  My RFC series was
made quite a bit easier by it.

>> On the other hand if we do a good job with the new binaries
>> maybe there ceases to be any reason to keep the old binaries
>> at all after a few years.
>
> I'm not sure if this is possible if the new binaries provide
> exclusively a machine-oriented (JSON) interface.  But as you said, the
> pressure to keep a backwards-compatible command line would be much
> less with a good machine-oriented binary.
>
>>> 3. Start over with the aim to replace the traditional QEMU
>>>
>>>     I don't want an end game where we have two QEMUs, one with bad CLI
>>>     and limited QMP, and one without real CLI and decent QMP.  I want o=
ne
>>>     QEMU with decent CLI and decent QMP.
>>
>> Right, so this is essentially what I've just suggested as a possible
>> evoluation of (2). The only difference here is that you're setting
>> the death of the old QEMU as an explicit end gaol in (3), while
>> in (2) it is merely a nice-to-have.
>
> I agree.  Though in my case I'd still go for two binaries: one with
> good CLI and limited QMP, and one with limited CLI and good QMP.

The existing binary provides bad CLI and limited QMP.

Going from limited to good QMP involves reworking the startup code.  I
believe that's easier in a new binary.

Going from bad CLI to good CLI involves incompatible change.
Impractical as long as the CLI is a stable interface.  I believe the
sane way out is a new binary.

However, I can't see why we'd want to put a good CLI in the old binary
then.  We could just as well put it in the new binary, or in a wrapper
program around the new binary.

In both cases, the CLI is layered on top of a QAPI interface.  For an
integrated CLI, it's the C interface specified in the QAPI schema.  For
a wrapper program, it's the QMP interface specified in the schema, which
is in turn layered on top of the C interface specified in the schema.

Or, as ASCII art, first for the wrapper program:

    command line
         |
         |  CLI parser
         v
    internal CLI representation
         |
         |  CLI to QMP translator
         v
    internal QMP representation
         |
         |  QMP formatter
         v                                   wrapper program
--- QMP interface ------------------------------------------
         |                                   wrapped program
         |  QMP parser
         v
    internal QMP representation
         |
         |  QMP dispatcher
         v
    C interface

Cutting the detour from internal QMP representation via QMP interface
right back to internal QMP representation leads to the intergrated CLI:

    command line
         |
         |  CLI parser
         v
    internal CLI representation
         |
         |  CLI to QMP translator
         v
    internal QMP representation
         |
         |  QMP dispatcher
         v
    C interface

Fewer moving parts, easier to debug, same clean layering.

>> In practical terms I don't think (2) and (3) are that different
>> from each other for the first 2 years or so.  A lot can change in
>> that time, so I don't think we need to fixate on a choice of
>> (2) vs (3) upfront, just make it clear that the death of the old
>> binaries is "on the table" as an outcome if we do well.
>
> Agreed, but I would set the beginning of the "2 years or so" at last year=
...
>
>>> =3D Appendix: Why further incremental change feels impractical =3D
>>>
>>> Crafting a big change in small steps sounds great.  It isn't when we
>>> have to make things worse before they can get better, and every step is
>>> painfully slow because it's just too hard, and the end state we aim for
>>> isn't really what we want.
>>
>> I can't disagree with this. If we carry on trying to evolve vl.c
>> incrementally we are doomed to be stuck with a horrible starstup
>> process for enternity (or at least as long as I'll still be
>> working as QEMU maintainer).
>
> ... and if you compare vl.c in 5.2 and now, and consider current vl.c
> to be horrible, my knowedge of English does not include an adjective
> to describe the 5.2 state.  Some incremental work _is_ possible or
> even necessary, and has been done already.

Once again, I acknowledge the progress in vl.c.  I still find it pretty
horrible, but certainly less horrible than it used to be.


