Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6AE4AD38A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:33:59 +0100 (CET)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLwk-0002sL-QX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHLaw-0006W4-0q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHLak-0000Te-Fj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644307854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Qpibqf+bnFS14gGbNz5euKOPk+vEUFi8wAHdr5AyCI=;
 b=hX4Zs0AivDwKu5e2Ql8qjeKAhNH8k7Zu2QCXytxUIXIt5ha1daFaQ708mkC3N8Jz2yBaR/
 8rAu5DsGKWIzNrQDwSyNF0/i786fWDIafyfzXNyQPekBQ1S5vvG9wNS6ojMwais1lCbSGJ
 JUT4fkaHE3ukQLSEdfGO0o/aqeL/WnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Epy8Bvn_Ov-ykKgTfT2XcA-1; Tue, 08 Feb 2022 03:10:49 -0500
X-MC-Unique: Epy8Bvn_Ov-ykKgTfT2XcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14D301091DA2;
 Tue,  8 Feb 2022 08:10:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 226657AB5F;
 Tue,  8 Feb 2022 08:10:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 93D7B21E66FF; Tue,  8 Feb 2022 09:10:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
Date: Tue, 08 Feb 2022 09:10:30 +0100
In-Reply-To: <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 8 Feb 2022 06:14:56
 +0100")
Message-ID: <877da5wzgp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 7/2/22 20:34, Peter Maydell wrote:
>> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>
>>> This displays detailed information about the device registers and timer=
s to aid
>>> debugging problems with timers and interrupts.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hmp-commands-info.hx | 12 ++++++
>>>   hw/misc/mos6522.c    | 92 +++++++++++++++++++++++++++++++++++++++++++=
+
>>>   2 files changed, 104 insertions(+)
>>=20
>> I'm not sure how keen we are on adding new device-specific
>> HMP info commands, but it's not my area of expertise. Markus ?
>
> HMP is David :)

Yes.

>                 IIRC it is OK as long as HMP is a QMP wrapper.

That's "how to do it", and I'll get back to it in a jiffie, but Peter
was wondering about the "whether to do it".

Most HMP commands are always there.

We have a few specific to compile-time configurable features: TCG, VNC,
Spice, Slirp, Linux.  Does not apply here.

We have a few specific to targets, such as dump-skeys and info skeys for
s390.  Target-specific is not quite the same as device-specific.

We have no device-specific commands so far.  However, dump-skeys and
info skeys appear to be about the skeys *device*, not the s390 target.
Perhaps any s390 target has such a device?  I don't know.  My point is
we already have device-specific commands, they're just masquerading as
target-specific commands.

The proposed device-specific command uses a mechanism originally made
for modules instead (more on that below).

I think we should make up our minds which way we want device-specific
commands done, then do *all* of them that way.


On to "how to do it", part 1.

Most of the time, the command handler is declared with the command in
hmp-commands{,-info}.hx, possibly with compile-time conditionals.

But it can also be left null there, and set with monitor_register_hmp()
or monitor_register_hmp_info_hrt().  This is intended for modules; see
commit f0e48cbd791^..bca6eb34f03.

Aside: can modules be unloaded?  If yes, we better zap the handler
then.

The proposed "info via" uses monitor_register_hmp_info_hrt().  No
objection from me, requires David's ACK.


"How to do it", part 2, in reply to Philippe's remark.

Ideally, HMP commands wrap around QMP commands, but we accept exceptions
for certain use cases where the wrapping is more trouble than it's
worth, with justification.  I've explained this several times, and I'm
happy to dig up a reference or explain it again if there's a need.

Justifying an exception is bothersome, too.  Daniel Berrang=C3=A9 recently
created a way to reduce the wrapping trouble (merge commit
e86e00a2493).  The proposed "info via" makes use of it.

>> (patch below for context)
>> thanks
>> -- PMM
>>=20
>>>
>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>> index e90f20a107..4e714e79a2 100644
>>> --- a/hmp-commands-info.hx
>>> +++ b/hmp-commands-info.hx
>>> @@ -879,3 +879,15 @@ SRST
>>>     ``info sgx``
>>>       Show intel SGX information.
>>>   ERST
>>> +
>>> +    {
>>> +        .name       =3D "via",
>>> +        .args_type  =3D "",
>>> +        .params     =3D "",
>>> +        .help       =3D "show guest 6522 VIA devices",
>>> +    },
>>> +
>>> +SRST
>>> +  ``info via``
>>> +    Show guest 6522 VIA devices.
>>> +ERST

Should this be conditional on the targets where we actually link the
device, like info skeys?

[...]


