Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D927495DF6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:54:43 +0100 (CET)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArZ3-00034H-Tw
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAr8x-0000BK-KV
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAr8t-0005bN-U5
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642760858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMyhQs3f/ynhuNonkh6U/xr/0qzCMdctK8GSJn6zJAE=;
 b=g9tzTn30ECHuY1JSkO7kWHCe7JChjBFTv+aKQKsvURZWerqlHiZ8TC4g2c97EcByiqFHmk
 e7652jg/LV7OudPA67Dtw4d+ng0QEkJdM5WqwGzH9+mz+UiSmPJ52YV3EqC9TDB2DmaxqA
 oc7GcerrQhu4MeRW5//oAyzWPeMghoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-rBa7RWQPNzeWQlYZfdwd1A-1; Fri, 21 Jan 2022 05:27:37 -0500
X-MC-Unique: rBa7RWQPNzeWQlYZfdwd1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54DFC835B47;
 Fri, 21 Jan 2022 10:27:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00AB76F95D;
 Fri, 21 Jan 2022 10:27:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85750113303B; Fri, 21 Jan 2022 11:27:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
 <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
 <87pmol62kv.fsf@dusky.pond.sub.org>
 <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com>
Date: Fri, 21 Jan 2022 11:27:34 +0100
In-Reply-To: <f7b6d0e0-ee5f-f7ed-795b-27b13ff816c7@redhat.com> (Hanna Reitz's
 message of "Fri, 21 Jan 2022 09:43:10 +0100")
Message-ID: <87tudx4c4p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> On 21.01.22 07:10, Markus Armbruster wrote:
>> Hanna Reitz <hreitz@redhat.com> writes:
>>
>>> On 20.01.22 17:00, Markus Armbruster wrote:
>>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>>
>>>>> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>>>>>> On 19.01.22 13:58, Markus Armbruster wrote:
>>>>>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>>>>>
>>>>>>>> We want to add a --daemonize argument to QSD's command line.
>>>>>>> Why?
>>>>>> OK, s/we/I/.=C2=A0 I find it useful, because without such an option,=
 I need to
>>>>>> have whoever invokes QSD loop until the PID file exists, before I ca=
n be
>>>>>> sure that all exports are set up.=C2=A0 I make use of it in the test=
 cases added
>>>>>> in patch 3.
>>>>>>
>>>>>> I suppose this could be worked around with a special character devic=
e, like
>>>>>> so:
>>>>>>
>>>>>> ```
>>>>>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>>>>>> ncat_pid=3D$!
>>>>>>
>>>>>> qemu-storage-daemon \
>>>>>>   =C2=A0=C2=A0=C2=A0 ... \
>>>>>>   =C2=A0=C2=A0=C2=A0 --chardev socket,id=3Dsignal_done,path=3D/tmp/q=
sd-done.sock \
>>>>>>   =C2=A0=C2=A0=C2=A0 --monitor signal_done \
>>>>>>   =C2=A0=C2=A0=C2=A0 --pidfile /tmp/qsd.pid &
>>>>>>
>>>>>> wait $ncat_pid
>>>>>> ```
>>>>>>
>>>>>> But having to use an extra tool for this is unergonomic.=C2=A0 I mea=
n, if there=E2=80=99s
>>>>>> no other way...
>>>> I know duplicating this into every program that could server as a daem=
on
>>>> is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
>>>> make it superfluous.
>>>
>>> Well.=C2=A0 I have absolutely nothing against systemd.=C2=A0 Still, I w=
ill not
>>> use it in an iotest, that=E2=80=99s for sure.
>
>> My point isn't "use systemd in iotests".  It's "consider doing it like
>> systemd", i.e. do the daemonization work in a utility program.  For what
>> it's worth, Linux has daemonize(1).
>
> The problem I face is that currently there is no ergonomic way to wait
> until the QSD is up and running (besides looping until the PID file=20
> exists), and I don=E2=80=99t think a utility program that doesn=E2=80=99t=
 know the QSD
> could provide this.=C2=A0 (For example, it looks like daemonize(1) will
> have the parent exit immediately, regardless of whether the child is
> set up or not.)

Why do you need to wait for QSD to be ready?

I'm asking because with common daemons, I don't wait, I just connect to
their socket and start talking.  They'll reply only when ready.

>> [...]
>>
>>>> Care to put a brief version of the rationale for --daemonize and for
>>>> forking early in the commit message?
>>>
>>> Well, my rationale for adding the feature doesn=E2=80=99t really extend=
 beyond
>>> =E2=80=9CI want it, I find it useful, and so I assume others will, too=
=E2=80=9D.
>>>
>> Don't pretend to be obtuse, it's not credible :)  You mentioned iotests,
>> which makes me guess your rationale is "I want this for iotests, and
>> there may well be other uses."
>
> Oh, I also want it for other things, like the script I have to use the
> QSD to make disk images accessible as raw files.=C2=A0 Thing is, the stre=
ss=20
> is on =E2=80=9Cwant=E2=80=9D in contrast to =E2=80=9Cneed=E2=80=9D.=C2=A0=
 I can do without --daemonize, I
> have already done so, even before there was --pidfile (I just queried=20
> the block exports through QMP until they were all there).=C2=A0 It=E2=80=
=99s just
> that it=E2=80=99s kind of a pain.
>
> Same with the iotests, it=E2=80=99s absolutely possible to get away witho=
ut
> --daemonize.=C2=A0 It=E2=80=99s just that I wrote the test, wanted to use=
 some form=20
> of --daemonize option, noticed there wasn=E2=80=99t any yet, and thought =
=E2=80=9COh,
> that=E2=80=99d be nice to have=E2=80=9D.
>
> I would love a --daemonize option, but I can=E2=80=99t say it=E2=80=99s n=
ecessary. If
> the way it=E2=80=99d need to be implemented isn=E2=80=99t acceptable, the=
n I won=E2=80=99t
> force it into the code.

Rationale doesn't have to be "we must have this because".  It can also
be "I want this because".  What it can't be is "I want this".

[...]


