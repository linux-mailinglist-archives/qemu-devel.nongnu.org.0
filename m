Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA034ADDF0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:07:08 +0100 (CET)
Received: from localhost ([::1]:37732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHT1H-0004IV-3m
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:07:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHSBT-0007Ri-MC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHSBQ-00078F-TK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644333211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbSAybE3ZYZu0O8HK7gVbXGV1H6SPgTAhiOyBX5xihQ=;
 b=iAYd6tp6s8+/xiFjwsPRxEoE85PnIQthbGcy4qIY2B4r4muMNyWRCFTaJSSeUmmDdPdYln
 Yx1CB+jLKqBdFYHElzGyv+j9coYlYWyNznHxtgmwD+iD90PX4DgkqhaHFTsjhalMQlAUOh
 AkDDnQjWJ9LtEvHeEuvXLknqzA3+4pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-u3aoHCYYN-ul_W_UtdqzXw-1; Tue, 08 Feb 2022 10:13:28 -0500
X-MC-Unique: u3aoHCYYN-ul_W_UtdqzXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E2F46863;
 Tue,  8 Feb 2022 15:13:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FF4798C3;
 Tue,  8 Feb 2022 15:13:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9232F21E6A00; Tue,  8 Feb 2022 16:13:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
 <YgJZfwfpX5/R9HfR@redhat.com>
Date: Tue, 08 Feb 2022 16:13:24 +0100
In-Reply-To: <YgJZfwfpX5/R9HfR@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 8 Feb 2022 11:52:31 +0000")
Message-ID: <874k59s86j.fsf@pond.sub.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 08, 2022 at 10:29:09AM +0000, Dr. David Alan Gilbert wrote:
>> * Markus Armbruster (armbru@redhat.com) wrote:
>> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>> >=20
>> > > On 7/2/22 20:34, Peter Maydell wrote:
>> > >> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
>> > >> <mark.cave-ayland@ilande.co.uk> wrote:
>> > >>>
>> > >>> This displays detailed information about the device registers and =
timers to aid
>> > >>> debugging problems with timers and interrupts.
>> > >>>
>> > >>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> > >>> ---
>> > >>>   hmp-commands-info.hx | 12 ++++++
>> > >>>   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++=
++++++
>> > >>>   2 files changed, 104 insertions(+)
>> > >>=20
>> > >> I'm not sure how keen we are on adding new device-specific
>> > >> HMP info commands, but it's not my area of expertise. Markus ?
>> > >
>> > > HMP is David :)
>> >=20
>> > Yes.
>>=20
>> So let me start with an:
>>=20
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> (If it's useful info for the author of the device, then I'm happy for
>> HMP to have that), but then - (moving the reply around a bit):
>>=20
>>=20
>> > Should this be conditional on the targets where we actually link the
>> > device, like info skeys?
>> >=20
>>=20
>> Yes, I think so; it's a reasonably old/obscure device, there's no reason
>> everyone having it built in.
>>=20
>> > >                 IIRC it is OK as long as HMP is a QMP wrapper.
>> >=20
>> > That's "how to do it", and I'll get back to it in a jiffie, but Peter
>> > was wondering about the "whether to do it".
>> >=20
>> > Most HMP commands are always there.
>> >=20
>> > We have a few specific to compile-time configurable features: TCG, VNC=
,
>> > Spice, Slirp, Linux.  Does not apply here.
>> >=20
>> > We have a few specific to targets, such as dump-skeys and info skeys f=
or
>> > s390.  Target-specific is not quite the same as device-specific.
>> >=20
>> > We have no device-specific commands so far.  However, dump-skeys and
>> > info skeys appear to be about the skeys *device*, not the s390 target.
>> > Perhaps any s390 target has such a device?  I don't know.  My point is
>> > we already have device-specific commands, they're just masquerading as
>> > target-specific commands.
>>=20
>> Yeh we've got info lapic/ioapic as well.
>>=20
>> > The proposed device-specific command uses a mechanism originally made
>> > for modules instead (more on that below).
>> >=20
>> > I think we should make up our minds which way we want device-specific
>> > commands done, then do *all* of them that way.
>>=20
>> I think device specific commands make sense, but I think it would
>> probably be better if we had an 'info dev $name' and that a method on
>> the device rather than registering each one separately.
>> I'd assume that this would be a QMP level thing that got unwrapped at
>> HMP.
>>=20
>> But that's not a problem for this contribution; someone else can figure
>> that out later.
>
> Actually I think this would solve a problem with this contribution.
> This patch implements a QMP command but never registers it, so it
> isn't actually accessible via QMP. It only registers the HMP wrapper
> which rather defeats the point of doing it via the QMP HumanReadableText
> approach.
>
> I'm guessing this was done because we don't have ability to dynamically
> register QMP commands at runtime.

Correct.  I pointed this out in review, actually:

    Message-ID: <87tuk1k0de.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01236.html

Gerd replied "when going forward with building more code modular we
might need this for qmp too at some point".

>                                    I don't know how hard/easy it is
> to address this, and perhaps we don't even want to.

Depends on requirements.

Say all we want is "command fails unless the module is loaded" (or
whatever the condition is).  Should be fairly easy.

But if we want introspection to reflect the state of things, that's
harder.

>                                                      It was a problem
> for me when previously converting HMP info commands to QMP and I
> didn't get a solution, so didn't convert anything where the command
> impl was dynamically registered at runtime. This basically excluded
> converting devices that have been split into loadable modules.

Understand; you series was big enough as it was.

> If we had a general  'info dev-debug' (HMP) and  'x-query-dev-debug'
> commands, then we could side-step the QMP limitation, as both thue
> HMP and QMP comamnds could be statically registered. The devices
> then only need to register  a callback at runtime which should be
> easier to deal with.

I like it.


