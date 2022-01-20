Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A603749556D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:29:01 +0100 (CET)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAe3I-0004Zr-5p
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAZrs-00036V-JE
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAZrh-0002Na-LK
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642694434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbDyGBdzuZqMRouqRYpOBRFZFmIh+L6rjthM6djmquc=;
 b=CYAyZhFbaGJtXkr/BuEBmetLwuj08s2x/8i9HEXuRqxrlRpqqt3HqjVMwrfp2vX1UsBz39
 DGyHanBqGAHSSK+CD70T8d4AxqyDLT1+ndrO1wfjY1ghG7CboRHC7qiniZU+8xguMRNH5w
 Rv77y5qf5M9pc1oMnNPj2YYq3ARkGUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ULQH-lyCNHaahUzfS87Pdw-1; Thu, 20 Jan 2022 11:00:32 -0500
X-MC-Unique: ULQH-lyCNHaahUzfS87Pdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B1F874985;
 Thu, 20 Jan 2022 16:00:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6842A7ED86;
 Thu, 20 Jan 2022 16:00:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEF53113303B; Thu, 20 Jan 2022 17:00:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com>
Date: Thu, 20 Jan 2022 17:00:29 +0100
In-Reply-To: <YehIosxuXCqsGBSW@redhat.com> (Kevin Wolf's message of "Wed, 19
 Jan 2022 18:21:38 +0100")
Message-ID: <87ee5275ya.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>> On 19.01.22 13:58, Markus Armbruster wrote:
>> > Hanna Reitz <hreitz@redhat.com> writes:
>> >=20
>> > > We want to add a --daemonize argument to QSD's command line.
>> >=20
>> > Why?
>>=20
>> OK, s/we/I/.=C2=A0 I find it useful, because without such an option, I n=
eed to
>> have whoever invokes QSD loop until the PID file exists, before I can be
>> sure that all exports are set up.=C2=A0 I make use of it in the test cas=
es added
>> in patch 3.
>>=20
>> I suppose this could be worked around with a special character device, l=
ike
>> so:
>>=20
>> ```
>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>> ncat_pid=3D$!
>>=20
>> qemu-storage-daemon \
>> =C2=A0=C2=A0=C2=A0 ... \
>> =C2=A0=C2=A0=C2=A0 --chardev socket,id=3Dsignal_done,path=3D/tmp/qsd-don=
e.sock \
>> =C2=A0=C2=A0=C2=A0 --monitor signal_done \
>> =C2=A0=C2=A0=C2=A0 --pidfile /tmp/qsd.pid &
>>=20
>> wait $ncat_pid
>> ```
>>=20
>> But having to use an extra tool for this is unergonomic.=C2=A0 I mean, i=
f there=E2=80=99s
>> no other way...

I know duplicating this into every program that could server as a daemon
is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
make it superfluous.

> The other point is that the system emulator has it, qemu-nbd has it,
> so certainly qsd should have it as well. Not the least because it should
> be able to replace qemu-nbd (at least for the purpose of exporting NBD.
> not necessarily for attaching it to the host).

Point taken, but I think it's a somewhat weak one.  qsd could certainly
replace qemu-nbd even without --daemonize; we could use other means to
run it in the background.

>> > >                                                                This =
will
>> > > require forking the process before we do any complex initialization
>> > > steps, like setting up the block layer or QMP.  Therefore, we must s=
can
>> > > the command line for it long before our current process_options() ca=
ll.
>> >=20
>> > Can you explain in a bit more detail why early forking is required?
>> >=20
>> > I have a strong dislike for parsing more than once...
>>=20
>> Because I don=E2=80=99t want to set up QMP and block devices, and then f=
ork the
>> process into two.=C2=A0 That sounds like there=E2=80=99d be a lot of stu=
ff to think
>> about, which just isn=E2=80=99t necessary, because we don=E2=80=99t need=
 to set up any
>> of this in the parent.

We must fork() before we create threads.  Other resources are easy
enough to hand over to the child.  Still, having to think about less is
good, I readily grant you that.

The trouble is that forking early creates a new problem: any
configuration errors detected in the child must be propagated to the
parent somehow (output and exit status).  I peeked at your PATCH 2, and
I'm not convinced, but that's detail here.

> Here we can compare again: Both the system emulator and qemu-nbd behave
> the same, they fork before they do anything interesting.
>
> The difference is that they still parse the command line only once
> because they don't immediately create things, but just store the options
> and later process them in their own magic order. I'd much rather parse
> the command line twice than copy that behaviour.

The part I hate is "own magic order".  Without that, multiple passes are
just fine with me.

Parsing twice is a bit like having a two pass compiler run the first
pass left to right, and then both passes intertwined left to right.  The
pedestrian way to do it is running the first pass left to right, then
the second pass left to right.

We're clearly talking taste here.

>
> Kevin
>
>> For example, if I set up a monitor on a Unix socket (server=3Dtrue),
>> processing is delayed until the client connects.=C2=A0 Say I put --daemo=
nize
>> afterwards.=C2=A0 I connect to the waiting server socket, the child is f=
orked
>> off, and then... I=E2=80=99m not sure what happens, actually.=C2=A0 Do I=
 have a
>> connection with both the parent and the child listening?=C2=A0 I know th=
at in
>> practice, what happens is that once the parent exits, the connection is
>> closed, and I get a =E2=80=9Cqemu: qemu_thread_join: Invalid argument=E2=
=80=9D warning/error
>> on the QSD side.
>>=20
>> There=E2=80=99s a lot of stuff to think about if you allow forking after=
 other
>> options, so it should be done first.=C2=A0 We could just require the use=
r to put
>> --daemonize before all other options, and so have a single pass; but sti=
ll,
>> before options are even parsed, we have already for example called
>> bdrv_init(), init_qmp_commands(), qemu_init_main_loop().=C2=A0 These are=
 all
>> things that the parent of a daemonizing process doesn=E2=80=99t need to =
do, and
>> where I=E2=80=99d simply rather not think about what impact it has if we=
 fork
>> afterwards.
>>=20
>> Hanna

Care to put a brief version of the rationale for --daemonize and for
forking early in the commit message?

[...]


[*] Not everything systemd does is bad.  It's a big, mixed bag of ideas.


