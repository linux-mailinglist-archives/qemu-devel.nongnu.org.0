Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D85326E0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:54:37 +0200 (CEST)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRFM-000146-PF
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntQtZ-00050J-1k
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ntQtV-0005Sa-Tv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653384721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9wnLjUO29owPqHRKSOlxfq5Jw64hibembQsJpsWj7Y=;
 b=HzNvrMNz3zWnteyqJ2DUWqYfyDpKBdh8YbOP/g5b4/1wXvvzim+kzOIHy2L83QD7FaODFy
 eksERL8b/ScsYXnTBOEB/cqjQgrw22hRMZotgMzERTiGznZEObWA8ursANc4oYkQ58rA4S
 VeSHuW0o7qclo9kfzPoAvQAM4BtXjyc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-npdCMQU1Nq6lPPCG1Bqv7A-1; Tue, 24 May 2022 05:31:59 -0400
X-MC-Unique: npdCMQU1Nq6lPPCG1Bqv7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A8B1185A79C
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 09:31:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 316CF407DEC3;
 Tue, 24 May 2022 09:31:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECA2921E6906; Tue, 24 May 2022 11:31:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  Gerd Hoffmann
 <kraxel@redhat.com>,  Eric Blake <eblake@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220519155625.1414365-1-thuth@redhat.com>
 <20220519155625.1414365-3-thuth@redhat.com>
 <87v8tw7470.fsf@pond.sub.org>
 <dd189cec-06ed-5015-cab5-99abd3f69ecf@redhat.com>
 <YoyVfgrJiYCI8bEO@redhat.com>
Date: Tue, 24 May 2022 11:31:57 +0200
In-Reply-To: <YoyVfgrJiYCI8bEO@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 24 May 2022 09:21:18 +0100")
Message-ID: <87k0ab1dki.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

> On Mon, May 23, 2022 at 09:23:48PM +0200, Thomas Huth wrote:
>> On 23/05/2022 15.45, Markus Armbruster wrote:
>> > Thomas Huth <thuth@redhat.com> writes:
>> >=20
>> > > The "-display sdl" option still uses a hand-crafted parser for its
>> > > parameters since we didn't want to drag an interface we considered
>> > > somewhat flawed into the QAPI schema. Since the flaws are gone now,
>> > > it's time to QAPIfy.
>> > >=20
>> > > This introduces the new "DisplaySDL" QAPI struct that is used to hold
>> > > the parameters that are unique to the SDL display. The only specific
>> > > parameter is currently "grab-mod" that is used to specify the requir=
ed
>> > > modifier keys to escape from the mouse grabbing mode.
>> > >=20
>> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
>> > > ---
>> > >   qapi/ui.json            | 26 ++++++++++++++-
>> > >   include/sysemu/sysemu.h |  2 --
>> > >   softmmu/globals.c       |  2 --
>> > >   softmmu/vl.c            | 70 +------------------------------------=
----
>> > >   ui/sdl2.c               | 10 ++++++
>> > >   5 files changed, 36 insertions(+), 74 deletions(-)
>> > >=20
>> > > diff --git a/qapi/ui.json b/qapi/ui.json
>> > > index 11a827d10f..413371d5e8 100644
>> > > --- a/qapi/ui.json
>> > > +++ b/qapi/ui.json
>> > > @@ -1295,6 +1295,29 @@
>> > >         '*swap-opt-cmd': 'bool'
>> > >     } }
>> > > +##
>> > > +# @HotKeyMod:
>> > > +#
>> > > +# Set of modifier keys that need to be held for shortcut key action=
s.
>> > > +#
>> > > +# Since: 7.1
>> > > +##
>> > > +{ 'enum'  : 'HotKeyMod',
>> > > +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>> >=20
>> > I have a somewhat uneasy feeling about encoding what is essentially a
>> > subset of the sets of modifier keys as an enumeration, but it's what we
>> > have to do to QAPIfy existing grab-mod.
>>=20
>> Well, that's exactly what you suggested here:
>>=20
>>  https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg03401.html
>>=20
>> So I really don't understand your uneasy feeling now?

I did mention the set of modifiers (encoded as list) design alternative.
You pointed out that you're merely QAPIfying what we have.  Valid point,
well taken, I don't want to block that.

> I think we should consider what happens if we want to allow arbitrary
> key combinations in future, consisting of one or more modifiers together
> witha non-modifier key. For example CtrlL+ShiftL+F12.  We won't want
> to be expressing the combinatorial expansion of all possible key
> combinations as an enum.  Instead I think we would want to have an
> enum for keycode names and accept an array of them. We already
> have QKeyCode, so for SDL grab sequence we need to accept an
> arrray of QKeyCode.
>
>   { 'struct'  : 'DisplaySDL',
>     'data'    : { '*grab-mod'   : [ 'QKeyCode' ] }
>
> Good for QMP but not entirely pretty on the CLI. But we need back
> compat for existing CLI syntax too, so we would have to use an
> alternate allowing plain string for the legacy key codes combinations.
>
> IOW we end up needing
>
>    { 'alternate': 'SDLGrabSeq',
>      'data': { 'grab-mod': 'HotKeyMod',
>                'grab-keys: [ 'QKeyCode' ] } }
>
>   { 'struct'  : 'DisplaySDL',
>     'data'    : { '*grab-mod' : [ 'SDLGrabSeq' ] }
>
> deprecating 'grab-mod' for a while, eventually leaving just the
> first example above.
>
> Since  IIUC, we can retrofit the alternate after the fact if we
> decide to allow arbitrary key combos, it means we could safely
> start with what Thomas proposes
>
>   { 'struct'  : 'DisplaySDL',
>     'data'    : { '*grab-mod' : 'HotKeyMod' }
>
> and worry about the more general solution another day/month/year

Right.

[...]


