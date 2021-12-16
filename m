Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D526C476EDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:27:14 +0100 (CET)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnyk-0008TO-0M
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxnwc-0006Vb-GT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxnwZ-0005CW-L9
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639650298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDsjdMVV2OyCTXUf7OUer3PTN2StY5GoKJMckp/uRpg=;
 b=Q3LAhAfSJCxhDs2mx7vcPWS31dvxDLjyDreAsMc9TT9lRZ6M2BpGrPNXzQVOsNwlM8Ypvp
 dju82aVLCphTkd0Gw6wDz/nJ0LnuRN30IZHnfwZVF/OxQuOz3OyBWbKRyp20yJAzGlSwu4
 b4AD48hAh8buTN+y+YGQhYZyM5/tVCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-sEjGcuxLOrKLk4cA4lYd-w-1; Thu, 16 Dec 2021 05:24:55 -0500
X-MC-Unique: sEjGcuxLOrKLk4cA4lYd-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CC810B7468;
 Thu, 16 Dec 2021 10:24:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B432875744;
 Thu, 16 Dec 2021 10:24:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6477E113865F; Thu, 16 Dec 2021 11:24:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
Date: Thu, 16 Dec 2021 11:24:22 +0100
In-Reply-To: <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com> (Paolo
 Bonzini's message of "Wed, 15 Dec 2021 21:00:46 +0100")
Message-ID: <875yroyhih.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berran?= =?utf-8?Q?g=C3=A9?=" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/14/21 12:48, Markus Armbruster wrote:
>> Let's start with where we (hopefully) agree:
>
> More or less I do agree with this, except for a couple points below
> where I think we disagree.
>
>> * We need a single, cohesive, low-level interface suitable for
>>   management applications.
>>
>> * The existing interface is specified in QAPI.  Its concrete transport
>>   is QMP.
>>
>> * The existing interface is not complete: certain things can only be
>>   done with the CLI.
>>
>> * The existing transport is not available early enough to permit
>>   completing the interface.
>
> So far so good.
>
>> * Fixing that involves a rework of startup.
>>
>> * Reworking the existing startup and managing incompatible changes is
>>   impractical, and likely to make the mess we have on our hands worse.
>
> Not really, in particular the startup has been mostly reworked already
> and I disagree that it is messy.  softmmu/vl.c is messy, sure: it has
> N different command line parser for command line options, magic
> related to default devices, and complicated ordering of -object
> creation.
>
> But the building of emulator data structures is not messy; only the
> code that transforms the user's instructions into startup commands.
> The messy parts are almost entirely contained within softmmu/vl.c.

In my opinion, the worst mess is the reordering and the (commonly
unstated, sometimes unknown) dependencies that govern it.

The reordering is part of the stable interface.  Its finer points
basically nobody understands, at least not without staring at the code.

When we mess with the order, we commonly break things.

This is what leads me to my "still a mess" and "impractical" verdicts.

> The one (and important, but fixable) exception is backends for
> on-board devices: serial_hd, drive_get, and nd_table.

Practical ideas on fixing it?

>> * A new binary sidesteps the need to manage incompatible change.
>
> More precisely, a new binary sidesteps the need to integrate an
> existing mechanism with a new transport, and deal with the
> incompatibilities that arise.

I'm not sure I got this.

>> Any objections so far?
>>
>> Now let me make a few more points:
>>
>> * Single, cohesive interface does not require single transport.  In
>>   fact, we already have two: QMP and the (internal) C interface.
>>
>> * QMP encodes the abstract interface in JSON, and offers the result on a
>>   Unix domain socket[1].
>>
>> * The (internal) C interface encodes the abstract interface as a set of
>>   C data types and functions.
>>
>> * Consider a configuration file transport that encodes the abstract
>>   interface in JSON.  The only wart this adds is syntax that is
>>   arguiably ill-suited to the purpose.  More suitable syntax exists.
>>
>> * Similar for CLI.
>>
>> * To get a "a second set of warts layered on top", we actually have to
>>   layer something on top that isn't utterly trivial.  Like a
>>   higher-level interface.  The "second set of warts" objection does not
>>   apply to (sane) transports.
>
> The problem is that CLI and HMP, being targeted to humans (and as you
> say below humans matter), are not necessarily trivial transports.  If 
> people find the trivial transport unusable, we will not be able to
> retire the old CLI.

Yes, a trivial CLI transport alone may not suffice to retire the old
CLI.  By itself, that doesn't mean trivial transports must be avoided.

Do I have to argue the benefits of a trivial configuration file
transport?

Do I have to argue the benefits of a trivial CLI transport for use by
relatively unsophisticated programs / relatively sophisticated humans
(such as developers)?

Can we agree these benefits are not zero?

If yes, we can move on to debate whether such trivial transports are
worth their (modest) keep.

> Bad CLI is also very hard to deprecate because, unlike QMP (for which
> you can delegate the workarounds to Libvirt & friends) and HMP (for 
> which people can just learn the new thing and type it), it is baked in
> countless scripts.  People hate it when scripts break.

I assure you that bad QMP is plenty hard to deprecate, even when libvirt
can be updated to cope.

I think HMP is easier to change than QMP and CLI mostly because we've
spent years guiding people in need of a stable interface towards QMP.

>> * The old CLI is partly layered on QMP, partly on HMP, and partly on
>>   internal C interfaces.  It's full of warts.
>
> I've worked on moving it more towards QMP or at least QOM, and much
> less on internal C interfaces.  It still has warts but they are 
> self-contained and due to the baroque ordering of options.  My point
> is that we can continue this work to the point that having separate
> entry points (one CLI-centered, one QMP-only) is not a problem.
>
> The issues with the CLI then can be completely self-contained within
> softmmu/vl.c, and will not influence the innards of QEMU.

The issues with the CLI will still influence its users.

Can we agree that human users deserve something better than the current
CLI?

If no, then I doubt consensus is possible.

If yes, then we need to discuss how to build a better CLI for humans.
No "somebody could" cop outs, please.

I think we can learn from our experience with HMP/QMP.

Good:

* Separate interfaces for machines and for humans, because their needs
  are different: QMP and HMP.

* The stable interface is clear: QMP unless explicitly marked unstable.

* Layering the human interface on top of the machine interface: HMP
  commands implemented on top of QMP's internal C interface.

Bad:

* Not layering the human interface on top of the machine interface: HMP
  commands bypassing QMP's internal C interface.

* Proper layering is too much work: writing HMP commands that way should
  be easier, not harder.

Debatable:

* Some functionality is only available in HMP, mostly because that's
  less work.  Can't really argue against "this is more trouble than it's
  worth".

* Some functionality is only available in QMP, mostly because providing
  equivalent HMP commands is too much work.  Sometimes, equivalent HMP
  commands are awkwardly low level for humans, but "nope, go use QMP" is
  at least as awkward.

There's obviously more, but I think these are the points that matter
here.

> Paolo
>
>> * Management applications are not the only users that matter.  Humans
>>   matter.  Simple programs like ad hoc scripts matter.


