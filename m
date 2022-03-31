Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089934EDC18
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:51:08 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZw8h-0004yV-58
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:51:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZw4a-00025s-6B
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZvve-000249-Uy
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648737450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yfD/bodveYnTanWTDFL5/3R4rMfizifsem2r1LnJQ4w=;
 b=MniOQ8HCzz6dJB56xpvhubGOCsrAeJ0EcdwwFh4jj5Zz17bBOahXKAYoNEPpsrv8JF7FbH
 y0GwpqT9Kj3a4cDq7HOUqPyQ40CheKkYPjnBf7jYjQAlIl/Ys5JZySnALlozP9cSp/uS9V
 rYD5Qvzn4OtUS1qGpUfRJNpRD6MCS4g=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573--8LUBjHaNNiLLpFtou_hZQ-1; Thu, 31 Mar 2022 10:37:27 -0400
X-MC-Unique: -8LUBjHaNNiLLpFtou_hZQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 d6-20020a056102222600b003252be7deb9so3276091vsb.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 07:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfD/bodveYnTanWTDFL5/3R4rMfizifsem2r1LnJQ4w=;
 b=ktS+DnwaxmIunMKQbMZwWEFrYfRDPMJgTqMLR+xtewKlBVpNfNJCANsecuvleVJswN
 O+oq3G5oJ2+v2VcQMC8SJ/1CvtNQIcz2sABwRDo2vjhe6Lvib0KLkDPRw37rAEhuWdTn
 Sn6RAGTROMABv+t62UgmN7rh3Kri9i5fClkcrQwEKVGOptv5TNoa9Lt0tFKgwxbAG2Dk
 vCcQko6Jsw7d3yR5SL/LMg2uBoPaVVCp/W1IuMcH1p+VzslBHrYz6qoPebM0kdrKoBsd
 EXstP1hgvEBs2m+o5gCrZBTfUrMmcrjEsXBNI1kYas2XvHr1XTd+Y9pSpbbMYDu7BIAr
 xl7g==
X-Gm-Message-State: AOAM533cTpNBMLnp0U92kQwalKArm6skkpmCAudwUtDJPa7FWmbCsJpn
 WD8J1TGekR9LonPl50yiS1X0XoDa3aSId1ELhlyXkvjkw8Oe1O9QdOh4jia3J3gNgQGI0EWvt42
 0SX0OCvE6ewVoUaf7kVXTSRD/zjFIRdw=
X-Received: by 2002:a05:6122:1da:b0:33f:c6b3:ac58 with SMTP id
 h26-20020a05612201da00b0033fc6b3ac58mr2190035vko.1.1648737446430; 
 Thu, 31 Mar 2022 07:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFjs+x45uqGVfs83oQbSZhtIvgzgndLU7mE9du8hyRv+h9gppsw21KOiQcDUiElqWFV6bjcTGdNxlYfUWLwv0=
X-Received: by 2002:a05:6122:1da:b0:33f:c6b3:ac58 with SMTP id
 h26-20020a05612201da00b0033fc6b3ac58mr2190024vko.1.1648737446151; Thu, 31 Mar
 2022 07:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
 <32ff3a63-fb50-8038-3f2e-5bfd70b01344@suse.de>
 <37635a04-b717-b7c6-88a0-1b3cecc0c4f5@suse.de>
 <8a898f41-98e1-5a02-4cd8-a697bcb6d9a1@redhat.com>
 <7a952654-c163-00c9-8538-e07afef47ca8@suse.de>
In-Reply-To: <7a952654-c163-00c9-8538-e07afef47ca8@suse.de>
From: John Snow <jsnow@redhat.com>
Date: Thu, 31 Mar 2022 10:37:16 -0400
Message-ID: <CAFn=p-aKWCQM29qEB6YRK6A_6DwcaMPbVTyLLbLnCZ1zG7cBtQ@mail.gmail.com>
Subject: Re: iotest40 problem
To: Li Zhang <lizhang@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ce63ad05db8499b9"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ce63ad05db8499b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022, 6:47 AM Li Zhang <lizhang@suse.de> wrote:

> On 3/31/22 08:10, Hanna Reitz wrote:
> > On 29.03.22 18:49, Li Zhang wrote:
> >> Update what I observed.
> >>
> >> It seems that aqmp is not stable when running test cases.
> >> So I revert the patches as the following, iotest40/41 test cases work
> >> well.
> >
> > Thanks for bisecting.  I haven=E2=80=99t seen this problem before, so I=
 didn=E2=80=99t
> > look into it; CC-ing John, perhaps he figures something.
> >
> Thanks a lot.
> It happens occassionally. I didn't find a way to reproduce it manually.
>

Sorry for the instability.

A few questions then:

- what operating system and version
- kernel version
- architecture (looks like x86 and others?)
- what commit/version of QEMU are you testing?
- what python version are you using to run iotests?



> > Hanna
> >
> >> commit 76cd358671e6b8e7c435ec65b1c44200254514a9
> >>
> >> Author: John Snow <jsnow@redhat.com>
> >>
> >> Date:   Tue Oct 26 13:56:12 2021 -0400
> >>
> >>
> >>
> >>     python, iotests: replace qmp with aqmp
> >>
> >>
> >>
> >>     Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with
> >> the sync
> >>
> >>     wrapper from qemu.aqmp instead.
> >>
> >>
> >>
> >>     Add an escape hatch in the form of the environment variable
> >>
> >>     QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into
> >> using
> >>
> >>     the old implementation, proving that both implementations work
> >>
> >>     concurrently.
> >>
> >>
> >>
> >>     Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >>     Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> >>
> >>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> >>
> >>     Message-id: 20211026175612.4127598-9-jsnow@redhat.com
> >>
> >>     Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >>
> >> commit 1611e6cf4e7163f6102b37010a8b7e7120f468b5
> >>
> >> Author: John Snow <jsnow@redhat.com>
> >>
> >> Date:   Thu Nov 18 15:46:18 2021 -0500
> >>
> >>
> >>
> >>     python/machine: handle "fast" QEMU terminations
> >>
> >>
> >>
> >>     In the case that the QEMU process actually launches -- but then
> >> dies so
> >>
> >>     quickly that we can't establish a QMP connection to it --
> QEMUMachine
> >>
> >>     currently calls _post_shutdown() assuming that it never launched
> >> the VM
> >>
> >>     process.
> >>
> >>
> >>
> >>     This isn't true, though: it "merely" may have failed to establish
> >> a QMP
> >>
> >>     connection and the process is in the middle of its own exit path.
> >>
> >>
> >>
> >>     If we don't wait for the subprocess, the caller may get a bogus
> >> `None`
> >>
> >>     return for .exitcode(). This behavior was observed from
> >>
> >>     device-crash-test; after the switch to Async QMP, the timings were
> >>
> >>     changed such that it was now seemingly possible to witness the
> >> failure
> >>
> >>     of "vm.launch()" *prior* to the exitcode becoming available.
> >>
> >>
> >>
> >>     The semantic of the `_launched` property is changed in this
> >>
> >>     patch. Instead of representing the condition "launch() executed
> >>
> >>     successfully", it will now represent "has forked a child process
> >>
> >>     successfully". This way, wait() when called in the exit path won't
> >>
> >>     become a no-op.
> >>
> >>
> >>
> >>     Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >>     Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> >>
> >>     Message-id: 20211118204620.1897674-6-jsnow@redhat.com
> >>
> >>     Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >>
> >>
> >>
> >>
> >> On 3/25/22 11:17, Li Zhang wrote:
> >>> Hi,
> >>>
> >>> I backport some iotests patches to the tree and change timeout.
> >>> It doesn't work.
> >>>
> >>> Sometimes, iotest41 also reports the errors.
> >>> [ 1347s]
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> [ 1347s] +ERROR: test_top_node_in_wrong_chain
> (__main__.TestSingleDrive)
> >>> [ 1347s]
> >>> +--------------------------------------------------------------------=
--
> >>> [ 1347s] +Traceback (most recent call last):
> >>> [ 1347s] +  File
> >>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>> line 399, in launch
> >>> [ 1347s] +    self._launch()
> >>> [ 1347s] +  File
> >>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>> line 434, in _launch
> >>> [ 1347s] +    self._post_launch()
> >>> [ 1347s] +  File
> >>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py"=
,
> line
> >>> 147, in _post_launch
> >>> [ 1347s] +    super()._post_launch()
> >>> [ 1347s] +  File
> >>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>> line 340, in _post_launch
> >>> [ 1347s] +    self._qmp.accept(self._qmp_timer)
> >>> [ 1347s] +  File
> >>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py",
> >>> line 69, in accept
> >>> [ 1347s] +    timeout
> >>> [ 1347s] +  File
> >>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py",
> >>> line 42, in _sync
> >>> [ 1347s] +    asyncio.wait_for(future, timeout=3Dtimeout)
> >>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/base_events.py", line
> >>> 488, in run_until_complete
> >>> [ 1347s] +    return future.result()
> >>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/tasks.py", line 362,
> >>> in wait_for
> >>> [ 1347s] +    raise futures.TimeoutError()
> >>> [ 1347s] +concurrent.futures._base.TimeoutError
> >>>
> >>>
> >>> I can see other errors like this, it's the problem of the socket.
> >>>
> >>> [ 1535s] socket_accept failed: Resource temporarily unavailable
> >>> [ 1535s] **
> >>> [ 1535s]
> >>> ERROR:../tests/qtest/libqtest.c:321:qtest_init_without_qmp_handshake:
> >>> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> >>>
> >>>
> >>> The script is running the command as this:
> >>> /usr/bin/make -O -j4 check-block V=3D1
> >>>
> >>> I can see the errors on ppc, arm or x86.
> >>> But I couldn't reproduce it when I run it manually.
> >>>
> >>> It will be appreciated if any suggestions. Thanks.
> >>>
> >>>
> >>> On 3/24/22 14:47, Li Zhang wrote:
> >>>> Hi,
> >>>>
> >>>> When I run the testsuit on our buidling system, it reports a timeout
> >>>> sometimes not always as the following.
> >>>> It couldn't connect qmp socket. Any ideas about this problem?
> >>>>
> >>>>
> >>>> [ 1989s] ---
> >>>> /home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040.out
> >>>> [ 1989s] +++ 040.out.bad
> >>>> [ 1989s] @@ -1,5 +1,55 @@
> >>>> [ 1989s]
> >>>> -.................................................................
> >>>> [ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed to
> >>>> establish connection: asyncio.exceptions.CancelledError
> >>>> [ 1989s]
> >>>>
> +E..................................ERROR:qemu.aqmp.qmp_client.qemu-6471:=
Failed
>
> >>>> to establish connection: asyncio.exceptions.CancelledError
> >>>> [ 1989s] +E.........................
> >>>> [ 1989s]
> >>>>
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> [ 1989s] +ERROR: test_commit_node (__main__.TestActiveZeroLengthImag=
e)
> >>>> [ 1989s]
> >>>>
> +----------------------------------------------------------------------
> >>>> [ 1989s] +Traceback (most recent call last):
> >>>> [ 1989s] +  File
> >>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040",
> >>>> line 94, in setUp
> >>>> [ 1989s] +    self.vm.launch()
> >>>> [ 1989s] +  File
> >>>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>>> line 399, in launch
> >>>> [ 1989s] +    self._launch()
> >>>> [ 1989s] +  File
> >>>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>>> line 434, in _launch
> >>>> [ 1989s] +    self._post_launch()
> >>>> [ 1989s] +  File
> >>>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py",
> >>>> line 147, in _post_launch
> >>>> [ 1989s] +    super()._post_launch()
> >>>> [ 1989s] +  File
> >>>>
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py",
> >>>> line 340, in _post_launch
> >>>> [ 1989s] +    self._qmp.accept(self._qmp_timer)
> >>>> [ 1989s] +  File
> >>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py",
> >>>> line 67, in accept
> >>>> [ 1989s] +    self._sync(
> >>>> [ 1989s] +  File
> >>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py",
> >>>> line 41, in _sync
> >>>> [ 1989s] +    return self._aloop.run_until_complete(
> >>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/base_events.py", line
> >>>> 616, in run_until_complete
> >>>> [ 1989s] +    return future.result()
> >>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/tasks.py", line 501,
> >>>> in wait_for
> >>>> [ 1989s] +    raise exceptions.TimeoutError()
> >>>> [ 1989s] +asyncio.exceptions.TimeoutError
> >>>>
> >>>
> >>>
> >>
> >
>
>
>

--000000000000ce63ad05db8499b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 31, 2022, 6:47 AM Li Zhang &lt;<a href=3D"=
mailto:lizhang@suse.de" target=3D"_blank" rel=3D"noreferrer">lizhang@suse.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/31/22 08:10, =
Hanna Reitz wrote:<br>
&gt; On 29.03.22 18:49, Li Zhang wrote:<br>
&gt;&gt; Update what I observed.<br>
&gt;&gt;<br>
&gt;&gt; It seems that aqmp is not stable when running test cases.<br>
&gt;&gt; So I revert the patches as the following, iotest40/41 test cases w=
ork <br>
&gt;&gt; well.<br>
&gt; <br>
&gt; Thanks for bisecting.=C2=A0 I haven=E2=80=99t seen this problem before=
, so I didn=E2=80=99t <br>
&gt; look into it; CC-ing John, perhaps he figures something.<br>
&gt; <br>
Thanks a lot.<br>
It happens occassionally. I didn&#39;t find a way to reproduce it manually.=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Sorry for the instability.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">A few questions then:</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>- what operating system and version</div><div dir=3D"auto">- kernel versio=
n=C2=A0</div><div dir=3D"auto">- architecture (looks like x86 and others?)<=
/div><div dir=3D"auto">- what commit/version of QEMU are you testing?</div>=
<div dir=3D"auto">- what python version are you using to run iotests?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Hanna<br>
&gt; <br>
&gt;&gt; commit 76cd358671e6b8e7c435ec65b1c44200254514a9<br>
&gt;&gt;<br>
&gt;&gt; Author: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Date:=C2=A0=C2=A0 Tue Oct 26 13:56:12 2021 -0400<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 python, iotests: replace qmp with aqmp<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Swap out the synchronous QEMUMonitorProtocol fr=
om qemu.qmp with <br>
&gt;&gt; the sync<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 wrapper from qemu.aqmp instead.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Add an escape hatch in the form of the environm=
ent variable<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 QEMU_PYTHON_LEGACY_QMP which allows you to cajo=
le QEMUMachine into <br>
&gt;&gt; using<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 the old implementation, proving that both imple=
mentations work<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 concurrently.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: John Snow &lt;<a href=3D"mailto:=
jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jsnow@red=
hat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Reviewed-by: Kevin Wolf &lt;<a href=3D"mailto:k=
wolf@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">kwolf@redh=
at.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:=
hreitz@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">hreitz@r=
edhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Message-id: <a href=3D"mailto:20211026175612.41=
27598-9-jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">2=
0211026175612.4127598-9-jsnow@redhat.com</a><br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: John Snow &lt;<a href=3D"mailto:=
jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jsnow@red=
hat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; commit 1611e6cf4e7163f6102b37010a8b7e7120f468b5<br>
&gt;&gt;<br>
&gt;&gt; Author: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Date:=C2=A0=C2=A0 Thu Nov 18 15:46:18 2021 -0500<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 python/machine: handle &quot;fast&quot; QEMU te=
rminations<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 In the case that the QEMU process actually laun=
ches -- but then <br>
&gt;&gt; dies so<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 quickly that we can&#39;t establish a QMP conne=
ction to it -- QEMUMachine<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 currently calls _post_shutdown() assuming that =
it never launched <br>
&gt;&gt; the VM<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 process.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 This isn&#39;t true, though: it &quot;merely&qu=
ot; may have failed to establish <br>
&gt;&gt; a QMP<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 connection and the process is in the middle of =
its own exit path.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 If we don&#39;t wait for the subprocess, the ca=
ller may get a bogus <br>
&gt;&gt; `None`<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 return for .exitcode(). This behavior was obser=
ved from<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 device-crash-test; after the switch to Async QM=
P, the timings were<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 changed such that it was now seemingly possible=
 to witness the <br>
&gt;&gt; failure<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 of &quot;vm.launch()&quot; *prior* to the exitc=
ode becoming available.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 The semantic of the `_launched` property is cha=
nged in this<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 patch. Instead of representing the condition &q=
uot;launch() executed<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 successfully&quot;, it will now represent &quot=
;has forked a child process<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 successfully&quot;. This way, wait() when calle=
d in the exit path won&#39;t<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 become a no-op.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: John Snow &lt;<a href=3D"mailto:=
jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jsnow@red=
hat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Reviewed-by: Willian Rampazzo &lt;<a href=3D"ma=
ilto:willianr@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">w=
illianr@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Message-id: <a href=3D"mailto:20211118204620.18=
97674-6-jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">2=
0211118204620.1897674-6-jsnow@redhat.com</a><br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: John Snow &lt;<a href=3D"mailto:=
jsnow@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jsnow@red=
hat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 3/25/22 11:17, Li Zhang wrote:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I backport some iotests patches to the tree and change timeout=
.<br>
&gt;&gt;&gt; It doesn&#39;t work.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sometimes, iotest41 also reports the errors.<br>
&gt;&gt;&gt; [ 1347s] <br>
&gt;&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt;&gt;&gt; [ 1347s] +ERROR: test_top_node_in_wrong_chain (__main__.TestSi=
ngleDrive)<br>
&gt;&gt;&gt; [ 1347s] <br>
&gt;&gt;&gt; +-------------------------------------------------------------=
---------<br>
&gt;&gt;&gt; [ 1347s] +Traceback (most recent call last):<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machi=
ne/machine.py&quot;, <br>
&gt;&gt;&gt; line 399, in launch<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 self._launch()<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machi=
ne/machine.py&quot;, <br>
&gt;&gt;&gt; line 434, in _launch<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 self._post_launch()<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machi=
ne/qtest.py&quot;, line <br>
&gt;&gt;&gt; 147, in _post_launch<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 super()._post_launch()<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machi=
ne/machine.py&quot;, <br>
&gt;&gt;&gt; line 340, in _post_launch<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 self._qmp.accept(self._qmp_timer)=
<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/=
legacy.py&quot;, <br>
&gt;&gt;&gt; line 69, in accept<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 timeout<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File <br>
&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/=
legacy.py&quot;, <br>
&gt;&gt;&gt; line 42, in _sync<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 asyncio.wait_for(future, timeout=
=3Dtimeout)<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File &quot;/usr/lib64/python3.6/asyncio/base_=
events.py&quot;, line <br>
&gt;&gt;&gt; 488, in run_until_complete<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 return future.result()<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0 File &quot;/usr/lib64/python3.6/asyncio/tasks=
.py&quot;, line 362, <br>
&gt;&gt;&gt; in wait_for<br>
&gt;&gt;&gt; [ 1347s] +=C2=A0=C2=A0=C2=A0 raise futures.TimeoutError()<br>
&gt;&gt;&gt; [ 1347s] +concurrent.futures._base.TimeoutError<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I can see other errors like this, it&#39;s the problem of the =
socket.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [ 1535s] socket_accept failed: Resource temporarily unavailabl=
e<br>
&gt;&gt;&gt; [ 1535s] **<br>
&gt;&gt;&gt; [ 1535s] <br>
&gt;&gt;&gt; ERROR:../tests/qtest/libqtest.c:321:qtest_init_without_qmp_han=
dshake: <br>
&gt;&gt;&gt; assertion failed: (s-&gt;fd &gt;=3D 0 &amp;&amp; s-&gt;qmp_fd =
&gt;=3D 0)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The script is running the command as this:<br>
&gt;&gt;&gt; /usr/bin/make -O -j4 check-block V=3D1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I can see the errors on ppc, arm or x86.<br>
&gt;&gt;&gt; But I couldn&#39;t reproduce it when I run it manually.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It will be appreciated if any suggestions. Thanks.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 3/24/22 14:47, Li Zhang wrote:<br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; When I run the testsuit on our buidling system, it reports=
 a timeout <br>
&gt;&gt;&gt;&gt; sometimes not always as the following.<br>
&gt;&gt;&gt;&gt; It couldn&#39;t connect qmp socket. Any ideas about this p=
roblem?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; [ 1989s] --- <br>
&gt;&gt;&gt;&gt; /home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/=
040.out<br>
&gt;&gt;&gt;&gt; [ 1989s] +++ 040.out.bad<br>
&gt;&gt;&gt;&gt; [ 1989s] @@ -1,5 +1,55 @@<br>
&gt;&gt;&gt;&gt; [ 1989s] <br>
&gt;&gt;&gt;&gt; -.........................................................=
........<br>
&gt;&gt;&gt;&gt; [ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed =
to <br>
&gt;&gt;&gt;&gt; establish connection: asyncio.exceptions.CancelledError<br=
>
&gt;&gt;&gt;&gt; [ 1989s] <br>
&gt;&gt;&gt;&gt; +E..................................ERROR:qemu.aqmp.qmp_cl=
ient.qemu-6471:Failed <br>
&gt;&gt;&gt;&gt; to establish connection: asyncio.exceptions.CancelledError=
<br>
&gt;&gt;&gt;&gt; [ 1989s] +E.........................<br>
&gt;&gt;&gt;&gt; [ 1989s] <br>
&gt;&gt;&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt;&gt;&gt; [ 1989s] +ERROR: test_commit_node (__main__.TestActiveZero=
LengthImage)<br>
&gt;&gt;&gt;&gt; [ 1989s] <br>
&gt;&gt;&gt;&gt; +---------------------------------------------------------=
-------------<br>
&gt;&gt;&gt;&gt; [ 1989s] +Traceback (most recent call last):<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-io=
tests/040&quot;, <br>
&gt;&gt;&gt;&gt; line 94, in setUp<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 self.vm.launch()<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/m=
achine/machine.py&quot;, <br>
&gt;&gt;&gt;&gt; line 399, in launch<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 self._launch()<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/m=
achine/machine.py&quot;, <br>
&gt;&gt;&gt;&gt; line 434, in _launch<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 self._post_launch()<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/m=
achine/qtest.py&quot;, <br>
&gt;&gt;&gt;&gt; line 147, in _post_launch<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 super()._post_launch()<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/m=
achine/machine.py&quot;, <br>
&gt;&gt;&gt;&gt; line 340, in _post_launch<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 self._qmp.accept(self._qmp_ti=
mer)<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/a=
qmp/legacy.py&quot;, <br>
&gt;&gt;&gt;&gt; line 67, in accept<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 self._sync(<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File <br>
&gt;&gt;&gt;&gt; &quot;/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/a=
qmp/legacy.py&quot;, <br>
&gt;&gt;&gt;&gt; line 41, in _sync<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 return self._aloop.run_until_=
complete(<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File &quot;/usr/lib64/python3.8/asyncio/b=
ase_events.py&quot;, line <br>
&gt;&gt;&gt;&gt; 616, in run_until_complete<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 return future.result()<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0 File &quot;/usr/lib64/python3.8/asyncio/t=
asks.py&quot;, line 501, <br>
&gt;&gt;&gt;&gt; in wait_for<br>
&gt;&gt;&gt;&gt; [ 1989s] +=C2=A0=C2=A0=C2=A0 raise exceptions.TimeoutError=
()<br>
&gt;&gt;&gt;&gt; [ 1989s] +asyncio.exceptions.TimeoutError<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
<br>
</blockquote></div></div></div>

--000000000000ce63ad05db8499b9--


