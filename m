Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803942A9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:49:02 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKxZ-0007RX-9y
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maKnb-0002kT-ON
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maKnW-0005qB-Fw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634056716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9q65KLoVI+pSN5op469E5wsZ/BJPPhhnJTTAyx6C/S8=;
 b=OLxkegfeUzT2j+EsP1WrEoT2d5TQFq6Xfd7vK6Akr16XwPcCxK4IMPwK0Rp8Bp9GbfOP9m
 J+GQIEV9kY0OV+timwCBYkD0aDgwKhzqSBdianih3746XlYeOU+u0erfp7ajHCX05DGzTS
 N0/bUTsC0Uz38xu+iPi4yatcRQyHvSc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-stazgHnOPm6ZDg2MvtGWTQ-1; Tue, 12 Oct 2021 12:38:33 -0400
X-MC-Unique: stazgHnOPm6ZDg2MvtGWTQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 6-20020ab00386000000b002c9ec841e55so9397881uau.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9q65KLoVI+pSN5op469E5wsZ/BJPPhhnJTTAyx6C/S8=;
 b=sLNqHaXPUAiKF7LnetHDdccIA6oiHzU8BR5uGenk96ugQyQfVY6A32G+ELLTH6vzwH
 tAHApl+mF27Rzzot6aoNNWvo7CA3CZeT2XV0H1ekuUljIW7GwWO1vEBv6NYhLHcpEKOh
 sBr4X7kgF6tBtGfa7ai6/NPJFIejnKU9t6mvZ8m4pRJMTrT6xVgFiBfroy3YQ+eXMCg3
 4ZkuLM4AxA5VV05/c/GZuLWBya0HMBrg/kuBmDqxeOHuFwNAkSemGCWnZTpsNASI/ROF
 r0FomQ9SzyFDK6oK59zke6/3HMRgf/5kf/dPYpcq6BqSlzKLaxWhsml7XxdUr8fYvuV3
 nUFA==
X-Gm-Message-State: AOAM531iB0a0Bl4W6ycyDxKE6sXi4bKvavH6tiMW675kt91QeZF1S4St
 ZHofklkM4RFsKeeFSeAKCtINXEpOuzBCh11DzjJFjpqY/NutqQKsMR6DKyaeZkw02IsRD75Ah6E
 9R294YFDWPv4P+Z/lgSmaNnBFk7mjMDo=
X-Received: by 2002:a67:c18c:: with SMTP id h12mr31959520vsj.27.1634056713276; 
 Tue, 12 Oct 2021 09:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAazsrtAOaNgQfDgjOaRvIbPv91O/6RAg6mB8NQai/RGeJZV+87jsuUjNZtJHlrLRw+GCh/GOCzEpqbpBPN+M=
X-Received: by 2002:a67:c18c:: with SMTP id h12mr31959491vsj.27.1634056713095; 
 Tue, 12 Oct 2021 09:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-14-jsnow@redhat.com>
 <4e34bf3c-c9eb-1bb5-15a1-a9e88a0b468f@redhat.com>
In-Reply-To: <4e34bf3c-c9eb-1bb5-15a1-a9e88a0b468f@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 12 Oct 2021 12:38:21 -0400
Message-ID: <CAFn=p-b0sSd9b=OQCLdh7jOOz2xCAv6K_eLLE6hPh7EixeSX2Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] iotests: Accommodate async QMP Exception classes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ed627b05ce2a7948"
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

--000000000000ed627b05ce2a7948
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 12:06 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 23.09.21 02:49, John Snow wrote:
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
> >   tests/qemu-iotests/tests/mirror-top-perms | 3 ++-
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/simplebench/bench_block_job.py
> b/scripts/simplebench/bench_block_job.py
> > index 4f03c121697..a403c35b08f 100755
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
> > index 2fc8dd66e0a..9fe315e3b01 100755
> > --- a/tests/qemu-iotests/tests/mirror-top-perms
> > +++ b/tests/qemu-iotests/tests/mirror-top-perms
> > @@ -26,6 +26,7 @@ from iotests import qemu_img
> >   # Import qemu after iotests.py has amended sys.path
> >   # pylint: disable=3Dwrong-import-order
> >   import qemu
> > +from qemu.aqmp import ConnectError
>
> With this change, the test emits the =E2=80=9CAQMP is in development=E2=
=80=9D warning,
> breaking the test.  Do we want to pull patch 16 before this patch?
>
>
Oh, good spot, I hadn't considered this.

Uh, yeah, I'll have to front-load the other patch.


> (I also wonder whether we want to import QMPConnectError, too, because
> the `except (qemu.qmp.*, *)` below looks so... heterogeneous.)
>

Will do.

(I don't think I've ever had code critiqued as "heterogeneous" before !)

>
> Hanna
>
> >   image_size =3D 1 * 1024 * 1024
> > @@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
> >               self.vm_b.launch()
> >               print('ERROR: VM B launched successfully, this should not
> have '
> >                     'happened')
> > -        except qemu.qmp.QMPConnectError:
> > +        except (qemu.qmp.QMPConnectError, ConnectError):
> >               assert 'Is another process using the image' in
> self.vm_b.get_log()
> >
> >           result =3D self.vm.qmp('block-job-cancel',
>
>

--000000000000ed627b05ce2a7948
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 12, 2021 at 12:06 PM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 23.09.=
21 02:49, John Snow wrote:<br>
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
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/mirror-top-perms | 3 ++-<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebe=
nch/bench_block_job.py<br>
&gt; index 4f03c121697..a403c35b08f 100755<br>
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
&gt; index 2fc8dd66e0a..9fe315e3b01 100755<br>
&gt; --- a/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; +++ b/tests/qemu-iotests/tests/mirror-top-perms<br>
&gt; @@ -26,6 +26,7 @@ from iotests import qemu_img<br>
&gt;=C2=A0 =C2=A0# Import qemu after iotests.py has amended sys.path<br>
&gt;=C2=A0 =C2=A0# pylint: disable=3Dwrong-import-order<br>
&gt;=C2=A0 =C2=A0import qemu<br>
&gt; +from qemu.aqmp import ConnectError<br>
<br>
With this change, the test emits the =E2=80=9CAQMP is in development=E2=80=
=9D warning, <br>
breaking the test.=C2=A0 Do we want to pull patch 16 before this patch?<br>
<br></blockquote><div><br></div><div>Oh, good spot, I hadn&#39;t considered=
 this.<br></div><div><br></div><div>Uh, yeah, I&#39;ll have to front-load t=
he other patch.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
(I also wonder whether we want to import QMPConnectError, too, because <br>
the `except (qemu.qmp.*, *)` below looks so... heterogeneous.)<br></blockqu=
ote><div><br></div><div>Will do.</div><div><br></div><div>(I don&#39;t thin=
k I&#39;ve ever had code critiqued as &quot;heterogeneous&quot; before !)<b=
r></div>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Hanna<br>
<br>
&gt;=C2=A0 =C2=A0image_size =3D 1 * 1024 * 1024<br>
&gt; @@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm_b.launch=
()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;ERROR=
: VM B launched successfully, this should not have &#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;happened&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except qemu.qmp.QMPConnectError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (qemu.qmp.QMPConnectError, Connect=
Error):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert &#39;Is a=
nother process using the image&#39; in self.vm_b.get_log()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D self.vm.qmp(&#39;bl=
ock-job-cancel&#39;,<br>
<br>
</blockquote></div></div>

--000000000000ed627b05ce2a7948--


