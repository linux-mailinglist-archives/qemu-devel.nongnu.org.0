Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32217B888
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 09:45:26 +0100 (CET)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA8bl-0003fW-Kg
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 03:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jA8ad-0003Dw-00
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:44:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jA8aa-0001RU-LQ
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:44:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23314
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jA8aa-0001OF-Bv
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 03:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583484250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pic61oybC1s+l4VvC5sRclvtZmiaXpiie5vaT0tErr4=;
 b=dIFYlFW3a2zwM7rlN63SXYm1TSrryXE+02rJhJe0ISrx/lVde3JiSUHL3aTq2+X4xrAF3K
 L7gQMMaNAjnH5nXIaJczlu72RMfSFPRJkNmyLNjBpn8auQ/KJNTugNLPCYYiQvA8lTw/Kd
 QR5c6jtVK2MATqk4VLcVNyXfmNO7fVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-CPpwM6I9PLGTaFrPvYjWjg-1; Fri, 06 Mar 2020 03:44:09 -0500
X-MC-Unique: CPpwM6I9PLGTaFrPvYjWjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5597219057A0;
 Fri,  6 Mar 2020 08:44:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BAB119756;
 Fri,  6 Mar 2020 08:44:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEBD911386A6; Fri,  6 Mar 2020 09:44:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
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
 <875zflevh1.fsf@dusky.pond.sub.org>
 <CAJ+F1CK=15RH6VOTEyogp3xht-DQj2zQvwrukXNZKPBCUCX1aA@mail.gmail.com>
Date: Fri, 06 Mar 2020 09:44:03 +0100
In-Reply-To: <CAJ+F1CK=15RH6VOTEyogp3xht-DQj2zQvwrukXNZKPBCUCX1aA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 3 Mar 2020
 17:03:25 +0100")
Message-ID: <87sgil7u0c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 David Alan Gilbert <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Mar 3, 2020 at 8:41 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
[...]
>> >> Let's take a step back.
>> >>
>> >> The actual problem is to find the coroutine in graphic_hw_update_done=
(),
>> >> so you can wake it.
>> >>
>> >> Your solution stores the coroutine in the QemuConsole, because that's
>> >> readily available in graphic_hw_update_done().
>> >>
>> >> However, it really, really doesn't belong there, it belongs to the
>> >> monitor.  Works anyway only because QMP commands execute one after th=
e
>> >> other.

As discussed in the "[PATCH v4 1/4] qapi: Add a 'coroutine' flag for
commands" sub-thread, HMP commands may execute interleaved.  Your code
still works, because it only ever abuses QemuConsole with QMP.  But it's
brittle.

Looks like we'll change HMP not to run interleaved.  That adds a belt to
the suspenders.  You might argue that's robust enough.

But it's not just the brittleness I dislike.  Storing per-monitor-
command data in QemuConsole is ugly as sin.  Arguing that it works
because commands are strictly serialized, and that burying one more
dependence on such serialization deep in command code won't make the
situation appreciably worse, doesn't change the fact that QemuConsole
has no business holding per-monitor-command data.

>> >>
>> >> Kevin suggested using a CoQueue to avoid this unspoken dependency.  Y=
ou
>> >> object, because it could make readers assume multiple screendump
>> >> commands could run concurrently, which is not the case.
>> >>
>> >> Alright, let's KISS: since there's just one main loop, there's just o=
ne
>> >> coroutine: @qmp_dispatcher_co.  Let's use that, so the dependency on
>> >> "one command after the other" is explicit and obvious.
>> >
>> > Ugh... If you choose that this is the way to go, please add an asserti=
on
>> > at least that we are indeed in qmp_dispatcher_co before yielding.
>>
>> No objection.
>>
>> To apply the QMP coroutine infrastructure for 5.0, I need a user.  We
>> have two: block_resize from Kevin, and screendump from Marc-Andr=C3=A9.
>> Neither is quite ready, yet.  I'll wait for a respin of either one.
>>
>
> Is this the change you expect?
>
> diff --git a/ui/console.c b/ui/console.c
> index 57df3a5439..d6a8bf0cee 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -167,7 +167,7 @@ struct QemuConsole {
>      QEMUFIFO out_fifo;
>      uint8_t out_fifo_buf[16];
>      QEMUTimer *kbd_timer;
> -    Coroutine *screendump_co;
> +    bool wake_qmp_dispatcher_on_update;
>
>      QTAILQ_ENTRY(QemuConsole) next;
>  };

No, because it still stores per-command data in QemuConsole.  You need
to, because...

> @@ -263,8 +263,8 @@ static void gui_setup_refresh(DisplayState *ds)
>
>  void graphic_hw_update_done(QemuConsole *con)
>  {
> -    if (con && con->screendump_co) {
> -        aio_co_wake(con->screendump_co);
> +    if (con->wake_qmp_dispatcher_on_update) {
> +        aio_co_wake(qmp_dispatcher_co);

... you may call aio_co_wake() only while @qmp_dispatcher_co is waiting
for it after yielding ...

>      }
>  }
>
> @@ -376,12 +376,15 @@ void qmp_screendump(const char *filename, bool
> has_device, const char *device,
>      }
>
>      if (qemu_in_coroutine()) {
> -        assert(!con->screendump_co);
> -        con->screendump_co =3D qemu_coroutine_self();
> +        /*
> +         * The coroutine code is generic, but we are supposed to be on
> +         * the QMP dispatcher coroutine, and we will resume only that no=
w.
> +         */
> +        assert(qemu_coroutine_self() =3D=3D qmp_dispatcher_co);
> +        con->wake_qmp_dispatcher_on_update =3D true;
>          aio_bh_schedule_oneshot(qemu_get_aio_context(),
>                                  graphic_hw_update_bh, con);
>          qemu_coroutine_yield();

... here.  I missed that need when I suggested to use
@qmp_dispatcher_co.  Sorry.

> -        con->screendump_co =3D NULL;
> +        con->wake_qmp_dispatcher_on_update =3D false;
>      }

Have a look at qxl, the only provider of asynchronous .gfx_update().
The actual work is done in qxl-render.c.  qxl_render_update(),
qxl_render_update_area_bh(), qxl_render_update_area_unlocked(),
qxl_render_update_area_done() cooperate carefully to support multiple
updates in flight.

I guess that's necessary because we also call graphic_hw_update() from
display code such as ui/vnc.c and ui/spice-display.c.

Before your patch, none of these users waits for an asynchronous update
to complete, as far as I can tell.  Afterwards, QMP screendump does.
Whether more users should I can't tell.  Gerd, can you?

Your patch communicates completion to screendump by making
graphic_hw_update() wake a coroutine.  It stores the coroutine in
QemuConsole, exploiting that only one call site actually waits for an
asynchronous update to complete, and that caller is never reentered.

This new mechanism is not usable for any other caller, unless it somehow
synchronizes with screendump to avoid reentrance.

Shouldn't we offer a more generally useful way to wait for asynchronous
update to complete?  Kevin's idea to use a queue of waiters sounds more
appropriate than ever to me.


