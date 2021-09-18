Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5E41028C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 03:13:36 +0200 (CEST)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mROv9-0005KU-If
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 21:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mROu3-0004fD-In
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 21:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mROu0-0003aV-GJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 21:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631927543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZR/aKeIMyog3TvxWUCQENJ4SEUl79t/cB/rFfwUvh0=;
 b=YMjga/VLr5cUvgkOVkepnVXBYHXi66UWZ/rCbhKgQqx6MFqs863woMrOrd9GPf4qrF5IM2
 t9d0rvcyvtj4SKQUcG6IsPJis7Ih+LEyVLB0F8Ob1b7eavBoAAsDXfnrxAN9AId+HCtMHQ
 c0k+btJYXhXAXeX2mgmmimH2/VFWUIw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-0umx3YuzMy2Wf63Lh4IO5w-1; Fri, 17 Sep 2021 21:12:21 -0400
X-MC-Unique: 0umx3YuzMy2Wf63Lh4IO5w-1
Received: by mail-oi1-f200.google.com with SMTP id
 y185-20020acaafc2000000b0027359453ad4so1731285oie.6
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 18:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZR/aKeIMyog3TvxWUCQENJ4SEUl79t/cB/rFfwUvh0=;
 b=DRrra7Pqo32ROTcvahymIUHIod+VNosOZGfWFR1AWOnHcNiinJBTWprYuPJpyJFkmF
 UsjD5K+8moMeljlVNYS4AH9TWsytlHerBqHLCOo/9BSadoTJCa/LkkRPTCPmeeUityZs
 Hm6fDAb3nmHrDgIs9bJgE746Zww9ReV7xOfj2dW92GXA0n7NSuQ3dYj9inilAvn4dLBA
 iG6F+Dttok4XTJG2hTePj1VeHcxqRxIf/XCTiCC7RaNmzV1c9V7mpkyFEdeTClJ6hquF
 5d2DHYIDkN7OsaagvJZOYeCaZBkfIHQ2+GGtWW6TP3hG7UatBFZxzGbVBnBe8PSmzhlO
 sTPw==
X-Gm-Message-State: AOAM532zterTWAk9bvwr249y6EetoQVWa18hWVUHN41SK7wJAqkl7+9z
 Au+VMSKOSDA1EhAkVL/OCs2odpdGxKRBpP7juvRj4A1rJVu0FFD6HyAbRZsgh8yepgfr6LcPtq+
 IyS9+HPjUsqp3FELXqhn5IfF5KE8X8HE=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr8887971ots.252.1631927541165; 
 Fri, 17 Sep 2021 18:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDkReLH9ZIAutWS4PAlLsO/fgc13ZwpJ2J7oewNPLqfxmAuLXE6hslUKbGDSjG6fiZCPatfxJYNTY1A6rB1jI=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr8887955ots.252.1631927540920; 
 Fri, 17 Sep 2021 18:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-14-jsnow@redhat.com>
 <5ef334d0-515b-42bf-01a0-b933c413c01e@redhat.com>
In-Reply-To: <5ef334d0-515b-42bf-01a0-b933c413c01e@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 21:12:10 -0400
Message-ID: <CAFn=p-Ydbnhdu5-xY-1ysqzS9kWanTAO+NPR-t3jeEOE_ujOEA@mail.gmail.com>
Subject: Re: [PATCH 13/15] iotests: Accommodate async QMP Exception classes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000604e4d05cc3abdfc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000604e4d05cc3abdfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:35 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > (But continue to support the old ones for now, too.)
> >
> > There are very few cases of any user of QEMUMachine or a subclass
> > thereof relying on a QMP Exception type. If you'd like to check for
> > yourself, you want to grep for all of the derivatives of QMPError,
> > excluding 'AQMPError' and its derivatives. That'd be these:
> >
> > - QMPError
> > - QMPConnectError
> > - QMPCapabilitiesError
> > - QMPTimeoutError
> > - QMPProtocolError
> > - QMPResponseError
> > - QMPBadPortError
> >
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   scripts/simplebench/bench_block_job.py    | 3 ++-
> >   tests/qemu-iotests/tests/mirror-top-perms | 6 +++++-
> >   2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/simplebench/bench_block_job.py
> b/scripts/simplebench/bench_block_job.py
> > index 4f03c12169..a403c35b08 100755
> > --- a/scripts/simplebench/bench_block_job.py
> > +++ b/scripts/simplebench/bench_block_job.py
> > @@ -28,6 +28,7 @@
> >   sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..',
> 'python'))
> >   from qemu.machine import QEMUMachine
> >   from qemu.qmp import QMPConnectError
> > +from qemu.aqmp import ConnectError
> >
> >
> >   def bench_block_job(cmd, cmd_args, qemu_args):
> > @@ -49,7 +50,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
> >           vm.launch()
> >       except OSError as e:
> >           return {'error': 'popen failed: ' + str(e)}
> > -    except (QMPConnectError, socket.timeout):
> > +    except (QMPConnectError, ConnectError, socket.timeout):
> >           return {'error': 'qemu failed: ' + str(vm.get_log())}
> >
> >       try:
> > diff --git a/tests/qemu-iotests/tests/mirror-top-perms
> b/tests/qemu-iotests/tests/mirror-top-perms
> > index 451a0666f8..7d448f4d23 100755
> > --- a/tests/qemu-iotests/tests/mirror-top-perms
> > +++ b/tests/qemu-iotests/tests/mirror-top-perms
> > @@ -103,7 +103,11 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
> >               print('ERROR: VM B launched successfully, this should not
> have '
> >                     'happened')
> >           except qemu.qmp.QMPConnectError:
> > -            assert 'Is another process using the image' in
> self.vm_b.get_log()
> > +            pass
> > +        except qemu.aqmp.ConnectError:
> > +            pass
> > +
> > +        assert 'Is another process using the image' in
> self.vm_b.get_log()
>
> But this assertion will fail if there was no exception, and so we won=E2=
=80=99t
> get to see the real problem, which is the original VM aborting (see the
> doc string).
>

Uh, hm. OK, so the intent was that if vm_b somehow starts successfully that
we will fail the test based on output in the diff, but we'll continue on to
see other kinds of explosions so that the output is more useful for
diagnosing the failure. Gotcha.

It doesn=E2=80=99t really matter that much that VM B can start (hence it be=
ing a
> logged error message, not a fatal error), and when it can start, of
> course it won=E2=80=99t print an error =E2=80=93 but what=E2=80=99s impor=
tant is that the
> original VM will then abort.
>

> I mean, not an absolute showstopper by any means, but still, the
> assertion was deliberately placed into the `except` block.
>
> Hanna
>

I misunderstood the "test style" here. I'll fix it.

(Uh, I also forgot to explicitly import qemu.aqmp. It happens to work
anyway because of $reasons, but it's not very good style. I'll fix that,
too.)

--js

--000000000000604e4d05cc3abdfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:35 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; (But continue to support the old ones for now, too.)<br>
&gt;<br>
&gt; There are very few cases of any user of QEMUMachine or a subclass<br>
&gt; thereof relying on a QMP Exception type. If you&#39;d like to check fo=
r<br>
&gt; yourself, you want to grep for all of the derivatives of QMPError,<br>
&gt; excluding &#39;AQMPError&#39; and its derivatives. That&#39;d be these=
:<br>
&gt;<br>
&gt; - QMPError<br>
&gt; - QMPConnectError<br>
&gt; - QMPCapabilitiesError<br>
&gt; - QMPTimeoutError<br>
&gt; - QMPProtocolError<br>
&gt; - QMPResponseError<br>
&gt; - QMPBadPortError<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0scripts/simplebench/bench_block_job.py=C2=A0 =C2=A0 | 3 ++=
-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/mirror-top-perms | 6 +++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 7 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebe=
nch/bench_block_job.py<br>
&gt; index 4f03c12169..a403c35b08 100755<br>
&gt; --- a/scripts/simplebench/bench_block_job.py<br>
&gt; +++ b/scripts/simplebench/bench_block_job.py<br>
&gt; @@ -28,6 +28,7 @@<br>
&gt;=C2=A0 =C2=A0sys.path.append(os.path.join(os.path.dirname(__file__), &#=
39;..&#39;, &#39;..&#39;, &#39;python&#39;))<br>
&gt;=C2=A0 =C2=A0from qemu.machine import QEMUMachine<br>
&gt;=C2=A0 =C2=A0from qemu.qmp import QMPConnectError<br>
&gt; +from qemu.aqmp import ConnectError<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def bench_block_job(cmd, cmd_args, qemu_args):<br>
&gt; @@ -49,7 +50,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError as e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {&#39;error&#39;: &#39;=
popen failed: &#39; + str(e)}<br>
&gt; -=C2=A0 =C2=A0 except (QMPConnectError, socket.timeout):<br>
&gt; +=C2=A0 =C2=A0 except (QMPConnectError, ConnectError, socket.timeout):=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {&#39;error&#39;: &#39;=
qemu failed: &#39; + str(vm.get_log())}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-io=
tests/tests/mirror-top-perms<br>
&gt; index 451a0666f8..7d448f4d23 100755<br>
&gt; --- a/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; +++ b/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; @@ -103,7 +103,11 @@ class TestMirrorTopPerms(iotests.QMPTestCase):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;ERROR=
: VM B launched successfully, this should not have &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;happened&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except qemu.qmp.QMPConnectErro=
r:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert &#39;Is another proc=
ess using the image&#39; in self.vm_b.get_log()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except qemu.aqmp.ConnectError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert &#39;Is another process using the =
image&#39; in self.vm_b.get_log()<br>
<br>
But this assertion will fail if there was no exception, and so we won=E2=80=
=99t <br>
get to see the real problem, which is the original VM aborting (see the <br=
>
doc string).<br></blockquote><div><br></div><div>Uh, hm. OK, so the intent =
was that if vm_b somehow starts successfully that we will fail the test bas=
ed on output in the diff, but we&#39;ll continue on to see other kinds of e=
xplosions so that the output is more useful for diagnosing the failure. Got=
cha.<br></div><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It doesn=E2=80=99t really matter that much that VM B can start (hence it be=
ing a <br>
logged error message, not a fatal error), and when it can start, of <br>
course it won=E2=80=99t print an error =E2=80=93 but what=E2=80=99s importa=
nt is that the <br>
original VM will then abort.<br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
I mean, not an absolute showstopper by any means, but still, the <br>
assertion was deliberately placed into the `except` block.<br>
<br>
Hanna<br></blockquote><div><br></div><div>I misunderstood the &quot;test st=
yle&quot; here. I&#39;ll fix it.<br><br></div><div>(Uh, I also forgot to ex=
plicitly import qemu.aqmp. It happens to work anyway because of $reasons, b=
ut it&#39;s not very good style. I&#39;ll fix that, too.)</div><div><br></d=
iv><div>--js<br></div></div></div>

--000000000000604e4d05cc3abdfc--


