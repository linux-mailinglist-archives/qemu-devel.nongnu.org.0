Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C042C680
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 18:36:57 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mahFQ-00031X-SA
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 12:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mahEO-0001Tl-6J
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mahEH-0007j6-AE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 12:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634142943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+O7ejYFKvIrZdWtxh+HcpBsOw1Y//ZtGjtcYCBE4cU=;
 b=Vy1+emTkgbJo0nl1NNTJcQXUpLePNAbm8MZG2KU/SJkxPlobBcE7MZmiTEMlOPjluxw8Ta
 uRPK2TBB8k0S9u/6yaNav7sxUtPVNdOe1ifYNod/PJrK14Hqnn5Q6Z1wEIPirERcVn3yuH
 VbumHo3kWronRc9MRv7xBbtDD/uL0/Q=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-kkQuVUD4OziYVwR43SAduA-1; Wed, 13 Oct 2021 12:35:39 -0400
X-MC-Unique: kkQuVUD4OziYVwR43SAduA-1
Received: by mail-vk1-f199.google.com with SMTP id
 j190-20020a1f23c7000000b002a420cdd181so1256470vkj.21
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 09:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+O7ejYFKvIrZdWtxh+HcpBsOw1Y//ZtGjtcYCBE4cU=;
 b=ky6rmYl/0pzO3kLrS4mVB8y0XWJqLKyoV1sKrQ8TEKV1zrSQdsJysw45rF5UfD8Q/W
 A0OEI1mHghfxp+9/V8MhAvwUjZQHa41hRdsys9QMPKjiIvIUoPTmQdh8uERo8HWGxIxY
 u5zG5RNiDD1+e5SbfajvxTM85nC6WmA0GMPhczwI5tVaEC+/AyUb4PvAMEDfc0hmWlAZ
 uobz8yD7sYhxDM4pg7KKZcF+ckfuR9zr2pEfrdGVdCL9wNPl9OSoOcsB26JdVaEgLX8C
 hxOM5gwoVhTm/U4PLtO22JbwNZsdkFqkWYJxTwkDBIPqIQle8QYH/Ivda4zuHWXWLx0e
 C8CA==
X-Gm-Message-State: AOAM532siW+QPAeURzvYgR3evID/xGKNY5IYnKywcrt2+GuzIC+vPr2R
 W1wQ/30Q5YGrseF7gC6S9fN8b9Gd5dA3QMgiPPOzy7iAmxr0VqvSCqv+iK3Kz2jXfVwRsrNZFPx
 7aSxV4fZQ0dSDIL+cXy3kJqiGnz2QULE=
X-Received: by 2002:ab0:6c4b:: with SMTP id q11mr193470uas.128.1634142938748; 
 Wed, 13 Oct 2021 09:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgck1KUTPIvZ12w+YFHxSfohOQxr1ZC9SL6pfP7zRkEQSzOGgjK1BXzaGJcIzpLhrqhyDrdXh+91nb6rw+3j0=
X-Received: by 2002:ab0:6c4b:: with SMTP id q11mr193430uas.128.1634142938514; 
 Wed, 13 Oct 2021 09:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
 <CAFn=p-aJdGpCzkMHmMO9WO+rYn55OznyZ7K5BJz+Rv0GkRDhOA@mail.gmail.com>
 <CAFn=p-bdg3T0kt_QHDeeJCKbpugmSbzfjO+ZVDMk3TLP4fBoHg@mail.gmail.com>
 <3d23738f-6b9f-2b90-c005-827708d5dae4@redhat.com>
In-Reply-To: <3d23738f-6b9f-2b90-c005-827708d5dae4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 12:35:27 -0400
Message-ID: <CAFn=p-bkCjx8FXa8uWX_Kmg-1xC29sXF+4FJfT1oqeC-xjznWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Switch iotests to using Async QMP
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005cd71a05ce3e8d43"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cd71a05ce3e8d43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 10:49 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 13.10.21 16:00, John Snow wrote:
> >
> >
> > On Wed, Oct 13, 2021 at 8:51 AM John Snow <jsnow@redhat.com> wrote:
> >
> >
> >
> >     On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz <hreitz@redhat.com>
> wrote:
> >
> >         On 13.10.21 00:34, John Snow wrote:
> >         > Based-on: <20211012214152.802483-1-jsnow@redhat.com>
> >         >            [PULL 00/10] Python patches
> >         > GitLab:
> >
> https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> >         > CI: https://gitlab.com/jsnow/qemu/-/pipelines/387210591
> >         >
> >         > Hiya,
> >         >
> >         > This series continues where the last two AQMP series left
> >         off and adds a
> >         > synchronous 'legacy' wrapper around the new AQMP interface,
> >         then drops
> >         > it straight into iotests to prove that AQMP is functional
> >         and totally
> >         > cool and fine. The disruption and churn to iotests is pretty
> >         minimal.
> >         >
> >         > In the event that a regression happens and I am not
> >         physically proximate
> >         > to inflict damage upon, one may set the
> >         QEMU_PYTHON_LEGACY_QMP variable
> >         > to any non-empty string as it pleases you to engage the QMP
> >         machinery
> >         > you are used to.
> >         >
> >         > I'd like to try and get this committed early in the 6.2
> >         development
> >         > cycle to give ample time to smooth over any possible
> >         regressions. I've
> >         > tested it locally and via gitlab CI, across Python versions
> >         3.6 through
> >         > 3.10, and "worksforme". If something bad happens, we can
> >         revert the
> >         > actual switch-flip very trivially.
> >
> >         So running iotests locally, I got one failure:
> >
> >         $ TEST_DIR=3D/tmp/vdi-tests ./check -c writethrough -vdi 300
> >         [...]
> >         300                             fail       [10:28:06] [10:28:11=
]
> >         5.1s                 output mismatch (see 300.out.bad)
> >         --- /home/maxx/projects/qemu/tests/qemu-iotests/300.out
> >         +++ 300.out.bad
> >         @@ -1,4 +1,5 @@
> >         -.......................................
> >
>  +..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader:
> >
> >         ConnectionResetError: [Errno 104] Connection reset by peer
> >         +.........................
> >
>    ----------------------------------------------------------------------
> >           Ran 39 tests
> >         [...]
> >
> >
> >     Oh, unfortunate.
> >
> >
> >         I=E2=80=99m afraid I can=E2=80=99t really give a reproducer or =
anything.  It
> >         feels like
> >
> >
> >     Thank you for the report!
> >
> >         just some random spurious timing-related error. Although then
> >         again,
> >         300 does have an `except machine.AbnormalShutdown` clause at on=
e
> >         point...  So perhaps that=E2=80=99s the culprit, and we need to
> >         disable logging
> >         there.
> >
> >
> >     I'll investigate!
> >
> >
> > Unfortunately, even in a loop some 150 times I couldn't reproduce this
> > one. As you point out, it appears to be just a failure caused by
> > logging. The test logic itself completes as expected.
> >
> > Still, I would expect, on a "clean" shutdown of the destination host
> > (where the destination process fails to load the migration stream and
> > voluntarily exits with an error code) to end with a FIN/ACK for TCP or
> > ... uh, whatever happens for a UNIX socket. Where's the Connection
> > Reset coming from? Did the destination VM process *crash*?
> >
> > I'm not so sure that I *should* silence this error, but I also can't
> > reproduce it at all to answer these questions, so uh. uhhh. I guess I
> > will just hammer it on a loop a few hundred times more and see if I
> > get lucky.
>
> I could reproduce it, by running 20 instances concurrently.  (Needs a
> change to testrunner.py, so that the reference outputs don=E2=80=99t coll=
ide:
>
> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index a56b6da396..fd0a3a1eeb 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -221,7 +221,7 @@ def find_reference(self, test: str) -> str:
>
>       def do_run_test(self, test: str) -> TestResult:
>           f_test =3D Path(test)
> -        f_bad =3D Path(f_test.name + '.out.bad')
> +        f_bad =3D Path(f'{os.getpid()}-{f_test.name}.out.bad')
>           f_notrun =3D Path(f_test.name + '.notrun')
>           f_casenotrun =3D Path(f_test.name + '.casenotrun')
>           f_reference =3D Path(self.find_reference(test))
>
> )
>
> And then:
>
> $ while TEST_DIR=3D/tmp/vdi-$$ ./check -vdi 300; do; done
>
> Which pretty quickly shows the error in at least one of those loops
> (under a minute).
>
> As far as I can tell, changing the log level in 300 does indeed fix it:
>
> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> index 10f9f2a8da..096f5dabf0 100755
> --- a/tests/qemu-iotests/300
> +++ b/tests/qemu-iotests/300
> @@ -27,6 +27,7 @@ from typing import Dict, List, Optional
>   from qemu.machine import machine
>
>   import iotests
> +from iotests import change_log_level
>
>
>   BlockBitmapMapping =3D List[Dict[str, object]]
> @@ -464,7 +465,8 @@ class
> TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
>           # Expect abnormal shutdown of the destination VM because of
>           # the failed migration
>           try:
> -            self.vm_b.shutdown()
> +            with change_log_level('qemu.aqmp'):
> +                self.vm_b.shutdown()
>           except machine.AbnormalShutdown:
>               pass
>
>
Thanks for this! That helped a lot.

Long story short, what is happening here is that in some cases, we manage
to issue a 'quit' command before we acknowledge the EOF from the target VM,
so we get an 'ExecInterruptedError' from the top half and ECONNRESET from
the bottom half.
This gives me some faith that there's no more sinister problem going on
here.

There's really no way to "universally" solve this, though: It's always
going to be a problem that *maybe* sometimes when we go to send a command
that, no matter how recently we checked, the peer appeared to be online and
then upon sending a message we found out that isn't true.

However, there's a cuter way to solve this particular instance: just change
test 300 to wait() for the VM to self-exit instead of trying to shut it
down ourselves. That avoids the race condition in exactly what type of
error message we find when shutting down a dead-or-dying VM.

Thanks for the assistance on debugging this one.

--js

--0000000000005cd71a05ce3e8d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 10:49 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 13.10.=
21 16:00, John Snow wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Oct 13, 2021 at 8:51 AM John Snow &lt;<a href=3D"mailto:jsnow@=
redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz &lt;<a =
href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 13.10.21 00:34, John Snow wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Based-on: &lt;<a href=3D"mailto:=
20211012214152.802483-1-jsnow@redhat.com" target=3D"_blank">20211012214152.=
802483-1-jsnow@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [PULL 00/10] Python patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; GitLab:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.com/jsnow/q=
emu/-/commits/python-aqmp-iotest-wrapper" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; CI: <a href=3D"https://gitlab.co=
m/jsnow/qemu/-/pipelines/387210591" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.com/jsnow/qemu/-/pipelines/387210591</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hiya,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This series continues where the =
last two AQMP series left<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off and adds a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; synchronous &#39;legacy&#39; wra=
pper around the new AQMP interface,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then drops<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; it straight into iotests to prov=
e that AQMP is functional<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and totally<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cool and fine. The disruption an=
d churn to iotests is pretty<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minimal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In the event that a regression h=
appens and I am not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0physically proximate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to inflict damage upon, one may =
set the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_PYTHON_LEGACY_QMP variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to any non-empty string as it pl=
eases you to engage the QMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machinery<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; you are used to.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;d like to try and get this=
 committed early in the 6.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0development<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cycle to give ample time to smoo=
th over any possible<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regressions. I&#39;ve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; tested it locally and via gitlab=
 CI, across Python versions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03.6 through<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 3.10, and &quot;worksforme&quot;=
. If something bad happens, we can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0revert the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; actual switch-flip very triviall=
y.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So running iotests locally, I got one=
 failure:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$ TEST_DIR=3D/tmp/vdi-tests ./check -=
c writethrough -vdi 300<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 [10:28:06] [10:28:11]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05.1s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output mism=
atch (see 300.out.bad)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- /home/maxx/projects/qemu/tests/qe=
mu-iotests/300.out<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ 300.out.bad<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,5 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-....................................=
...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+..............ERROR:qemu.aqmp.qmp_cl=
ient.qemu-b-222963:Task.Reader:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ConnectionResetError: [Errno 104] Con=
nection reset by peer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+.........................<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0-------------------------=
---------------------------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0Ran 39 tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Oh, unfortunate.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I=E2=80=99m afraid I can=E2=80=99t re=
ally give a reproducer or anything.=C2=A0 It<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feels like<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you for the report!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0just some random spurious timing-rela=
ted error. Although then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0again,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0300 does have an `except machine.Abno=
rmalShutdown` clause at one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0point...=C2=A0 So perhaps that=E2=80=
=99s the culprit, and we need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disable logging<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0there.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ll investigate!<br>
&gt;<br>
&gt;<br>
&gt; Unfortunately, even in a loop some 150 times I couldn&#39;t reproduce =
this <br>
&gt; one. As you point out, it appears to be just a failure caused by <br>
&gt; logging. The test logic itself completes as expected.<br>
&gt;<br>
&gt; Still, I would expect, on a &quot;clean&quot; shutdown of the destinat=
ion host <br>
&gt; (where the destination process fails to load the migration stream and =
<br>
&gt; voluntarily exits with an error code) to end with a FIN/ACK for TCP or=
 <br>
&gt; ... uh, whatever happens for a UNIX socket. Where&#39;s the Connection=
 <br>
&gt; Reset coming from? Did the destination VM process *crash*?<br>
&gt;<br>
&gt; I&#39;m not so sure that I *should* silence this error, but I also can=
&#39;t <br>
&gt; reproduce it at all to answer these questions, so uh. uhhh. I guess I =
<br>
&gt; will just hammer it on a loop a few hundred times more and see if I <b=
r>
&gt; get lucky.<br>
<br>
I could reproduce it, by running 20 instances concurrently.=C2=A0 (Needs a =
<br>
change to testrunner.py, so that the reference outputs don=E2=80=99t collid=
e:<br>
<br>
diff --git a/tests/qemu-iotests/testrunner.py <br>
b/tests/qemu-iotests/testrunner.py<br>
index a56b6da396..fd0a3a1eeb 100644<br>
--- a/tests/qemu-iotests/testrunner.py<br>
+++ b/tests/qemu-iotests/testrunner.py<br>
@@ -221,7 +221,7 @@ def find_reference(self, test: str) -&gt; str:<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def do_run_test(self, test: str) -&gt; TestR=
esult:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_test =3D Path(test=
)<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_bad =3D Path(<a href=3D"http:=
//f_test.name" rel=3D"noreferrer" target=3D"_blank">f_test.name</a> + &#39;=
.out.bad&#39;)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_bad =3D Path(f&#39;{os.getpid=
()}-{<a href=3D"http://f_test.name" rel=3D"noreferrer" target=3D"_blank">f_=
test.name</a>}.out.bad&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_notrun =3D Path(<a=
 href=3D"http://f_test.name" rel=3D"noreferrer" target=3D"_blank">f_test.na=
me</a> + &#39;.notrun&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_casenotrun =3D Pat=
h(<a href=3D"http://f_test.name" rel=3D"noreferrer" target=3D"_blank">f_tes=
t.name</a> + &#39;.casenotrun&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f_reference =3D Path=
(self.find_reference(test))<br>
<br>
)<br>
<br>
And then:<br>
<br>
$ while TEST_DIR=3D/tmp/vdi-$$ ./check -vdi 300; do; done<br>
<br>
Which pretty quickly shows the error in at least one of those loops <br>
(under a minute).<br>
<br>
As far as I can tell, changing the log level in 300 does indeed fix it:<br>
<br>
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300<br>
index 10f9f2a8da..096f5dabf0 100755<br>
--- a/tests/qemu-iotests/300<br>
+++ b/tests/qemu-iotests/300<br>
@@ -27,6 +27,7 @@ from typing import Dict, List, Optional<br>
=C2=A0=C2=A0from qemu.machine import machine<br>
<br>
=C2=A0=C2=A0import iotests<br>
+from iotests import change_log_level<br>
<br>
<br>
=C2=A0=C2=A0BlockBitmapMapping =3D List[Dict[str, object]]<br>
@@ -464,7 +465,8 @@ class <br>
TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Expect abnormal sh=
utdown of the destination VM because of<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the failed migrati=
on<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vm=
_b.shutdown()<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with ch=
ange_log_level(&#39;qemu.aqmp&#39;):<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.vm_b.shutdown()<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except machine.Abnor=
malShutdown:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pass<br>
<br></blockquote><div><br></div><div>Thanks for this! That helped a lot.</d=
iv><div><br></div><div>Long story short, what is happening here is that in =
some cases, we manage to issue a &#39;quit&#39; command before we acknowled=
ge the EOF from the target VM, so we get an &#39;ExecInterruptedError&#39; =
from the top half and ECONNRESET from the bottom half.</div><div>This gives=
 me some faith that there&#39;s no more sinister problem going on here.</di=
v><div><br></div><div>There&#39;s really no way to &quot;universally&quot; =
solve this, though: It&#39;s always going to be a problem that *maybe* some=
times when we go to send a command that, no matter how recently we checked,=
 the peer appeared to be online and then upon sending a message we found ou=
t that isn&#39;t true.</div><div><br></div><div>However, there&#39;s a cute=
r way to solve this particular instance: just change test 300 to wait() for=
 the VM to self-exit instead of trying to shut it down ourselves. That avoi=
ds the race condition in exactly what type of error message we find when sh=
utting down a dead-or-dying VM.</div><div><br></div><div>Thanks for the ass=
istance on debugging this one.</div><div><br></div><div>--js<br></div></div=
></div>

--0000000000005cd71a05ce3e8d43--


