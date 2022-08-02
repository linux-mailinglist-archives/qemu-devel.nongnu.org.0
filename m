Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5ED587C5B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 14:24:32 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqwo-0006oS-Ip
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 08:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIquR-0004q9-Av
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIquN-0002z0-TL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659442919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8qGWtq9ce+bgjRr4t+dZw9L42o/RILX+izDjGR305w=;
 b=gjgu0RA9vgjfItip0VTZzGxky9OcSfI5jWPRZs4lEtMVLgYYND00mASMONbGcGnCkBzn8E
 ZITXQ4ShddA2UuAN6+zM+6z4RX4kHqdj5DKEi+ILCYdKaKKKbt0c2FqUrwtOh5YFHaMYxJ
 uc65BXrUdpi3CR3jTQRm2TYm4/En7As=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-ZW4GMcnkNRmbLZCri4CWhg-1; Tue, 02 Aug 2022 08:21:56 -0400
X-MC-Unique: ZW4GMcnkNRmbLZCri4CWhg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7903E18F0243;
 Tue,  2 Aug 2022 12:21:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE7DF492C3B;
 Tue,  2 Aug 2022 12:21:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A71C821E6930; Tue,  2 Aug 2022 14:21:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 06/15] qapi: move QEMU-specific dispatch code in monitor
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-7-marcandre.lureau@redhat.com>
 <87les6ud1p.fsf@pond.sub.org>
 <CAJ+F1C+hqN0SpG6cLxGEi9xcpW+vha6NzZZDJXb1fEbn-UianA@mail.gmail.com>
Date: Tue, 02 Aug 2022 14:21:53 +0200
In-Reply-To: <CAJ+F1C+hqN0SpG6cLxGEi9xcpW+vha6NzZZDJXb1fEbn-UianA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 2 Aug 2022
 15:19:57 +0400")
Message-ID: <87y1w6sun2.fsf@pond.sub.org>
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Aug 2, 2022 at 3:04 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Make QMP-dispatch code free from QEMU-specific OOB dispatch/async
>> > coroutine handling. This will allow to move the base code to
>> > qemu-common, and clear other users from potential mis-ususe (QGA doesn=
't
>>
>
> misuse :)

Right :)

>> have OOB or coroutine).
>>
>> I trust the utilty of such a move will become clear later in this
>> series.
>>
>> >
>> > To do that, introduce an optional callback QmpDispatchRun called when a
>> > QMP command should be run, to allow QEMU to override the default
>> > behaviour.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

[...]

>> A callback works, but note that each program's function is fixed (the
>> simple and common function is inlined, but that's just for convenience).
>>
>> We could use the linker instead.  We already do for
>> qmp_command_available(), and the patch doesn't change that.
>>
>
> Tbh, using the linker override trick makes me a bit uncomfortable when
> trying to make a "common" qemu library.

This linker behavior goes back to when link archives / libraries were
invented half a century ago.  All of stubs/ relies on it.

> The "trick" is not well documented (I couldn't find a good reference for
> the expected behaviour,

I'd recommend John Levine's "Linkers and Loaders".  You can find an
archive of the unedited manuscript at

    https://archive.ph/20121205032107/http://www.iecc.com/linker/

Chapter 6 applies.

>                         and my experience with it isn't great when I
> struggled with linking issues earlier). It also makes the library usage a
> bit hidden.

I think the difficulty in understanding shifts.

With link-time resolution, the *possible* resolutions are obvious (by
name), but to see the *actual* resolution, you need to understand how
the program is linked.

With run-time resolution / callbacks, you need to understand run-time
behavior.  Can range from obvious to impossible.  Your use is certainly
obvious enough.

>             And it limits the full potential of the library to static
> linking.

Unix shared libraries make this work, too (they even pay a performance
price for it).  For instance, you can override malloc() in a statically
linked .o, and all the .so use it, unless they resort to dark magic to
break this.

> Callbacks are not always meant to be dynamically changeable.

True.  See my next paragraph :)

>> Perhaps a layering argument could be made for callbacks.  Before the
>> series, monitor/qmp.c's monitor_qmp_dispatch() calls
>> qapi/qmp-dispatch.c's qmp_dispatch(), which calls a few functions from
>> monitor/.  However, consistency seems desirable.
>>
>> What do you think?
>>
>
> No strong opinion, as long as the qemu-common project is internal to qemu
> projects. If we imagine the code can be made into a shared library, it wi=
ll
> need callbacks.

We'll need several more callbacks for that, I'm afraid.

I'd go with link-time resolution for now, simply because that's what we
already use for qmp_command_available() & friends.

I don't like partial replacement by callbacks.  I figure a layering
argument could be made for complete replacement.


