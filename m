Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E3177039
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 08:42:34 +0100 (CET)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j92CH-0003L0-0r
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 02:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j92BT-0002tr-MI
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 02:41:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j92BR-0001H8-PD
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 02:41:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33099
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j92BR-0001Fj-LH
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 02:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6LeKNSpFxY2IELQBaRRmRgFk3NPFBVvZmWwuBp16vk=;
 b=RIPWoX/2jyid/l68l3O3vPczzZ2VsP6RehvB+SdnTXEy6G/tBikdeTrL/Xp7MOWGMdlqdk
 bJUoEvYgk1Gsxb7D/ns+6fyqCeQ5EuaNGuShSbQPaVTBUH8TY3RFme2KZlJIUG1TiGHGM8
 +70+E0a8h1tSaiGYYURRlobzSE1VLiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-iDTX_6mEOvGhLppMinmoMw-1; Tue, 03 Mar 2020 02:41:36 -0500
X-MC-Unique: iDTX_6mEOvGhLppMinmoMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D04107ACCA;
 Tue,  3 Mar 2020 07:41:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCD919E9C;
 Tue,  3 Mar 2020 07:41:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F23C511386A6; Tue,  3 Mar 2020 08:41:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] console: make QMP screendump use coroutine
References: <20200113144848.2168018-1-marcandre.lureau@redhat.com>
 <87a75dn1gd.fsf@dusky.pond.sub.org>
 <CAJ+F1C+M3yPreBLOHXkt16b5aghesT7qYkEPbS_3Dm7vGTaMKA@mail.gmail.com>
 <87blptckoi.fsf@dusky.pond.sub.org>
 <20200221100700.GA5254@linux.fritz.box>
 <87pne751g9.fsf@dusky.pond.sub.org>
 <CAJ+F1CKbZiVk0DCQxMojxu8FyEskg5Cw32B08Vi9emaEMw79fQ@mail.gmail.com>
 <87imjm96qy.fsf@dusky.pond.sub.org>
 <20200302153626.GD4965@linux.fritz.box>
Date: Tue, 03 Mar 2020 08:41:30 +0100
In-Reply-To: <20200302153626.GD4965@linux.fritz.box> (Kevin Wolf's message of
 "Mon, 2 Mar 2020 16:36:26 +0100")
Message-ID: <875zflevh1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Alan Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 02.03.2020 um 15:22 hat Markus Armbruster geschrieben:
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>>=20
>> > Hi
>> >
>> > On Fri, Feb 21, 2020 at 5:50 PM Markus Armbruster <armbru@redhat.com> =
wrote:
>> >>
>> >> Kevin Wolf <kwolf@redhat.com> writes:
>> >>
>> >> > Am 20.02.2020 um 17:01 hat Markus Armbruster geschrieben:
>> >> >> >> >  void qmp_screendump(const char *filename, bool has_device, c=
onst char *device,
>> >> >> >> >                      bool has_head, int64_t head, Error **err=
p)
>> >> >> >> >  {
>> >> >> >> >      QemuConsole *con;
>> >> >> >> >      DisplaySurface *surface;
>> >> >> >> > +    g_autoptr(pixman_image_t) image =3D NULL;
>> >> >> >> >      int fd;
>> >> >> >> >
>> >> >> >> >      if (has_device) {
>> >> >> >> > @@ -365,7 +375,15 @@ void qmp_screendump(const char *filename=
, bool has_device, const char *device,
>> >> >> >> >          }
>> >> >> >> >      }
>> >> >> >> >
>> >> >> >> > -    graphic_hw_update(con);
>> >> >> >> > +    if (qemu_in_coroutine()) {
>> >> >> >> > +        assert(!con->screendump_co);
>> >> >> >> > +        con->screendump_co =3D qemu_coroutine_self();
>> >> >> >> > +        aio_bh_schedule_oneshot(qemu_get_aio_context(),
>> >> >> >> > +                                graphic_hw_update_bh, con);
>> >> >> >> > +        qemu_coroutine_yield();
>> >> >> >> > +        con->screendump_co =3D NULL;
>> >> >> >> > +    }
>> >> >> >>
>> >> >> >> What if multiple QMP monitors simultaneously screendump?  Hmm, =
it works
>> >> >> >> because all execute one after another in the same coroutine
>> >> >> >> qmp_dispatcher_co.  Implicit mutual exclusion.
>> >> >> >>
>> >> >> >> Executing them one after another is bad, because it lets an ill=
-behaved
>> >> >> >> QMP command starve *all* QMP monitors.  We do it only out of
>> >> >> >> (reasonable!) fear of implicit mutual exclusion requirements li=
ke the
>> >> >> >> one you add.
>> >> >> >>
>> >> >> >> Let's not add more if we can help it.
>> >> >> >
>> >> >> > The situation is not worse than the current blocking handling.
>> >> >>
>> >> >> Really?
>> >> >>
>> >> >> What makes executing multiple qmp_screendump() concurrently (in se=
parate
>> >> >> threads) or interleaved (in separate coroutines in the same thread=
)
>> >> >> unsafe before this patch?
>> >> >
>> >> > QMP command handlers are guaranteed to run in the main thread with =
the
>> >> > BQL held, so there is no concurrency. If you want to change this, y=
ou
>> >> > would have much more complicated problems to solve than in this han=
dler.
>> >> > I'm not sure it's fair to require thread-safety from one handler wh=
en
>> >> > no other handler is thread safe (except accidentally) and nobody se=
ems
>> >> > to plan actually calling them from multiple threads.
>> >>
>> >> "Let's not [...] if we can help it." is hardly a "change this or else=
 no
>> >> merge" demand.  It is a challenge to find a more elegant solution.
>> >>
>> >> >> >> Your screendump_co is per QemuConsole instead of per QMP monito=
r only
>> >> >> >> because you need to find the coroutine in graphic_hw_update_don=
e().  Can
>> >> >> >> we somehow pass it via function arguments?
>> >> >> >
>> >> >> > I think it could be done later, so I suggest a TODO.
>> >> >>
>> >> >> We should avoid making our dependence on implicit mutual exclusion
>> >> >> worse.  When we do it anyway, a big, fat, ugly comment is definite=
ly
>> >> >> called for.
>> >> >
>> >> > Anyway, what I really wanted to add:
>> >> >
>> >> > This should be easy to solve by having a CoQueue instead of a singl=
e
>> >>
>> >> Ah, challenge accepted!  Exactly the outcome I was hoping for :)
>> >>
>> >> > Coroutine pointer. The coroutine would just call qemu_co_queue_wait=
(),
>> >> > which adds itself to the queue before it yields and the update
>> >> > completion would wake up all coroutines that are currently queued w=
ith
>> >> > qemu_co_queue_restart_all().
>> >> >
>> >> > qemu_co_queue_wait() takes a lock as its second parameter. You don'=
t
>> >> > need it in this context and can just pass NULL. (This is a lock tha=
t
>> >> > would be dropped while the coroutine is sleeping and automatically
>> >> > reacquired afterwards.)
>> >> >
>> >> >> >> In case avoiding the mutual exclusion is impractical: please ex=
plain it
>> >> >> >> in a comment to make it somewhat less implicit.
>> >> >>
>> >> >> It is anything but: see appended patch.
>> >> >
>> >> > This works, too, but it requires an additional struct. I think the =
queue
>> >> > is easier. (Note there is a difference in the mechanism: Your patch
>> >> > waits for the specific update it triggered, while the CoQueue would=
 wait
>> >> > for _any_ update to complete. I assume effectively the result is th=
e
>> >> > same.)
>> >>
>> >> Your idea sounds much nicer to me.  Thanks!
>> >
>> > Similar to the NULL check you asked to remove,
>> > having a CoQueue there would lead to think that several concurrently
>> > running screendump are possible.
>> >
>> > Is this a direction we are willing to take?
>>=20
>> Let's take a step back.
>>=20
>> The actual problem is to find the coroutine in graphic_hw_update_done(),
>> so you can wake it.
>>=20
>> Your solution stores the coroutine in the QemuConsole, because that's
>> readily available in graphic_hw_update_done().
>>=20
>> However, it really, really doesn't belong there, it belongs to the
>> monitor.  Works anyway only because QMP commands execute one after the
>> other.
>>=20
>> Kevin suggested using a CoQueue to avoid this unspoken dependency.  You
>> object, because it could make readers assume multiple screendump
>> commands could run concurrently, which is not the case.
>>=20
>> Alright, let's KISS: since there's just one main loop, there's just one
>> coroutine: @qmp_dispatcher_co.  Let's use that, so the dependency on
>> "one command after the other" is explicit and obvious.
>
> Ugh... If you choose that this is the way to go, please add an assertion
> at least that we are indeed in qmp_dispatcher_co before yielding.

No objection.

To apply the QMP coroutine infrastructure for 5.0, I need a user.  We
have two: block_resize from Kevin, and screendump from Marc-Andr=C3=A9.
Neither is quite ready, yet.  I'll wait for a respin of either one.


