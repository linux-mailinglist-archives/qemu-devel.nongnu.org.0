Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0452CED6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:02:07 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrc2n-0007sO-EA
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrby8-0006TZ-Dv
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrby5-00035l-63
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652950631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyC1m8uL4ebwZcYwkSdrG24434KguMQl0Ep9z5j1PZ4=;
 b=AvrTb2hHxeUCHkE7TYdqMmCEB3zALNYqxyG7CQghzoHNEG4PB5YZ57eZgwOCQA9AfcJwS2
 0OPZiJFasxUMIYy5KeBBc7AAjkcOES7WydD2t0rPTaXbFc+fDah7TMVNHV4DX8WrK47eCN
 020zgtPfcqwz1VsaLlyvSJ00NPQovgI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-vl3TsWTIP8Wp2vDaJvqyqA-1; Thu, 19 May 2022 04:57:10 -0400
X-MC-Unique: vl3TsWTIP8Wp2vDaJvqyqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C7A93817A65;
 Thu, 19 May 2022 08:57:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A2B2166B25;
 Thu, 19 May 2022 08:57:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D263F21E690D; Thu, 19 May 2022 10:57:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,  qemu-devel@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com,  Ryan El Kochta <relkochta@gmail.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
 <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
 <YoX3AFUoXCFxI4Sa@redhat.com>
Date: Thu, 19 May 2022 10:57:08 +0200
In-Reply-To: <YoX3AFUoXCFxI4Sa@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 19 May 2022 08:51:28 +0100")
Message-ID: <87o7zthpcr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, May 19, 2022 at 09:27:08AM +0200, Thomas Huth wrote:
>> On 19/05/2022 09.08, Thomas Huth wrote:
>> > On 19/05/2022 08.39, Thomas Huth wrote:
>> > > On 18/05/2022 17.08, Markus Armbruster wrote:
>> > > > Thomas Huth <thuth@redhat.com> writes:
>> > > >=20
>> > > > > The "-display sdl" option still uses a hand-crafted parser for i=
ts
>> > > > > parameters since we didn't want to drag an interface we consider=
ed
>> > > > > somewhat flawed into the QAPI schema. Since the flaws are gone n=
ow,
>> > > > > it's time to QAPIfy.
>> > > > >=20
>> > > > > This introduces the new "DisplaySDL" QAPI struct that is used to=
 hold
>> > > > > the parameters that are unique to the SDL display. The only spec=
ific
>> > > > > parameter is currently "grab-mod" that is used to specify the re=
quired
>> > > > > modifier keys to escape from the mouse grabbing mode.
>> > > > >=20
>> > > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
>> > > > > ---
>> > > > > =C2=A0 qapi/ui.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 27 +++++++++++++++-
>> > > > > =C2=A0 include/sysemu/sysemu.h |=C2=A0 2 --
>> > > > > =C2=A0 softmmu/globals.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 --
>> > > > > =C2=A0 softmmu/vl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 70 +----------------------------------------
>> > > > > =C2=A0 ui/sdl2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++
>> > > > > =C2=A0 5 files changed, 37 insertions(+), 74 deletions(-)
>> > > > >=20
>> > > > > diff --git a/qapi/ui.json b/qapi/ui.json
>> > > > > index 11a827d10f..a244e26e0f 100644
>> > > > > --- a/qapi/ui.json
>> > > > > +++ b/qapi/ui.json
>> > > > > @@ -1295,6 +1295,30 @@
>> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '*swap-opt-cmd': 'boo=
l'
>> > > > > =C2=A0=C2=A0=C2=A0 } }
>> > > > > +##
>> > > > > +# @GrabMod:
>> > > > > +#
>> > > > > +# Set of modifier keys that need to be hold for shortcut key ac=
tions.
>> > > > > +#
>> > > > > +# Since: 7.1
>> > > > > +##
>> > > > > +{ 'enum'=C2=A0 : 'GrabMod',
>> > > > > +=C2=A0 'data'=C2=A0 : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rct=
rl' ] }
>> > > >=20
>> > > > This is fine now.=C2=A0 If we ever generalize to "arbitrary set of=
 modifier
>> > > > keys", it'll become somewhat awkward.=C2=A0 No objection from me.
>>=20
>> Oh well, I just noticed that we already have a GrabToggleKeys enum in
>> qapi/common.json ... I wonder whether I should try to use that instead? =
It
>> seems to be used in a slightly different context, though, if I get that
>> right ...?
>
> It also doesn't distinguish left & right control/alt/shift keys
> for some reason.  So you would end up having to add more enum
> entries for SDL, none of which overlap with existing enum entries.
> Rather a pity, as the consistency would have been nice

Speaking of consistency: stick to the key names we use in QKeyCode?
Sadly, they contain '_'.


