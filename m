Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2D610D7C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:42:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLsB-0003VH-LZ; Fri, 28 Oct 2022 05:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ooLrR-0003QP-AK
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ooLrO-00022C-Ta
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666950066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41A0jbvBHSGC26jUPSWloiXed/dsaKT23rNli+/4LEg=;
 b=IZin/74nu594rDnEF9t3sjttN5x1pxIHrAPgcgTb6i3EQSlhpOhKguUj9E1WLuuGbhvszb
 Bk4f9exmOvjvIjxtqbMnMcjCQBePP+lxCTCoclltz+FW0uC414REDnmLvg0GQ4imZhIJhj
 EqETURqW9LAKMKt0D9iynl3Jq5Z2pos=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-u6G8RDUYOUGuHsNBnr6A3w-1; Fri, 28 Oct 2022 05:41:02 -0400
X-MC-Unique: u6G8RDUYOUGuHsNBnr6A3w-1
Received: by mail-io1-f69.google.com with SMTP id
 14-20020a05660220ce00b006c1bdc8ef72so4048790ioz.23
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41A0jbvBHSGC26jUPSWloiXed/dsaKT23rNli+/4LEg=;
 b=D/bJQJAUZPyNM6p8vItzd9pa6CCXiLq8Hct2N7S3MyAa/0rw+6JROnhSjx0Lkzd4Mk
 8n6BdzH5aC2k+zdlqaLCL6IgQmdta3RyF3faGji13VSMP5N/9XPgVueno8mdmU/GCULv
 3XcjtsCit40723GqmuzxVhoT1zF2426aC+BUxF5oiClqe+c+YXwgNU8hmCkujuM6XRLk
 DnMbqYvIyMjNbTRpj9LiGdysifnGSeTlZqsqPNdmDU+T/sQ6l87LD5oajmF/SUIuYxGD
 +TLzgoQClNFaOm6O4YmbJh9t5xLHmJULuh0ShxEqViy6z3w93clijCNkGUYQTGGhAYaA
 zMlg==
X-Gm-Message-State: ACrzQf0vFLyynX+jRpqIPG2VbrnXCQQU+TsHjwxlmgOPhjhLsxn/Iiyb
 5Ge7EVYLeEiHJkcir7JDMJUNsaAaJIEszWS01KR6Kqi2v/x7efTj4VfDfkN80zg+d28syCGaBLW
 DzQz9fGk62nDgxurlTnbURak0ggX6IdQ=
X-Received: by 2002:a02:9386:0:b0:373:6f8b:10a5 with SMTP id
 z6-20020a029386000000b003736f8b10a5mr16735430jah.0.1666950061484; 
 Fri, 28 Oct 2022 02:41:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oceAQiBhVYX8CpEctYgR3femhT71lXXkGVrQdhJ/EUU1r94w9hGIXVAMONe0qjClcSC5FMFawmWV6OrJnnKo=
X-Received: by 2002:a02:9386:0:b0:373:6f8b:10a5 with SMTP id
 z6-20020a029386000000b003736f8b10a5mr16735408jah.0.1666950061034; Fri, 28 Oct
 2022 02:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <CAMxuvawoU3P_eHknzzEaPnr6evzCOUij-pMnHJvpdvP4HZpc3g@mail.gmail.com>
 <CAEUhbmWPAa+KX=pu4d5WmnxkSpHTcLKYgaK_JE8g_5X3SK_NvA@mail.gmail.com>
In-Reply-To: <CAEUhbmWPAa+KX=pu4d5WmnxkSpHTcLKYgaK_JE8g_5X3SK_NvA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 28 Oct 2022 13:40:48 +0400
Message-ID: <CAMxuvawyOgSQtJvxsn0+F8ctxG+PD4a1bYtyr+udoUNL8m89cg@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] tests/qtest: Enable running qtest on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000003f279605ec150e9f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003f279605ec150e9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 28, 2022 at 1:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Fri, Oct 28, 2022 at 4:09 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Hi
> >
> > On Fri, Oct 28, 2022 at 8:58 AM Bin Meng <bin.meng@windriver.com> wrote=
:
> >>
> >> In preparation to adding virtio-9p support on Windows, this series
> >> enables running qtest on Windows, so that we can run the virtio-9p
> >> tests on Windows to make sure it does not break accidently.
> >>
> >> Changes in v6:
> >> - drop patches that are already in Alex and Daniel's tree
> >> - remove CONFIG_POSIX from meson.build
> >> - include <qemu/sockets.h> in libqtest.c
> >> - move documentation comments of qemu_send_full() from util/osdep.c
> >>   to qemu/sockets.h
> >> - save the "exit_code" in struct QTestState
> >> - new patch: "tests/qtest: device-plug-test: Reverse the usage of
> double/single quotes"
> >> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
> >> - new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
> >> - change to use qtest_wait_qemu() API
> >> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p
> unconditionally"
> >>
> >> Changes in v5:
> >> - restore to v1 version which does not touch the posix implementation
> >> - Drop patches that are already merged
> >>
> >> Changes in v3:
> >> - Add a usleep(1) in the busy wait loop
> >> - Drop the host test
> >>
> >> Changes in v2:
> >> - Introduce qemu_send_full() and use it
> >> - Move the enabling of building qtests on Windows to a separate
> >>   patch to keep bisectablity
> >> - Call socket_init() unconditionally
> >> - Add a missing CloseHandle() call
> >> - Change to a busy wait after migration is canceled
> >> - Change the timeout limit to 90 minutes
> >> - new patch: "tests/qtest: Enable qtest build on Windows"
> >>
> >> Bin Meng (8):
> >>   tests/qtest: Support libqtest to build and run on Windows
> >>   tests/qtest: device-plug-test: Reverse the usage of double/single
> >>     quotes
> >>   tests/qtest: Use EXIT_FAILURE instead of magic number
> >>   tests/qtest: libqtest: Introduce qtest_wait_qemu()
> >>   tests/qtest: libqos: Do not build virtio-9p unconditionally
> >>   tests/qtest: libqtest: Correct the timeout unit of blocking receive
> >>     calls for win32
> >>   .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
> >>   tests/qtest: Enable qtest build on Windows
> >>
> >> Xuzhou Cheng (3):
> >>   accel/qtest: Support qtest accelerator for Windows
> >>   tests/qtest: Use send/recv for socket communication
> >>   tests/qtest: migration-test: Make sure QEMU process "to" exited afte=
r
> >>     migration is canceled
> >>
> >>  include/hw/core/cpu.h           |   1 +
> >>  include/qemu/sockets.h          |  13 +++
> >>  tests/qtest/libqtest.h          |   9 ++
> >>  accel/dummy-cpus.c              |  14 ++-
> >>  softmmu/cpus.c                  |   9 +-
> >>  tests/qtest/dbus-vmstate-test.c |   2 +-
> >>  tests/qtest/device-plug-test.c  |  16 ++--
> >>  tests/qtest/libqmp.c            |   5 +-
> >>  tests/qtest/libqtest.c          | 151 ++++++++++++++++++++++++++++---=
-
> >>  tests/qtest/migration-test.c    |   8 +-
> >>  util/osdep.c                    |  22 +++++
> >>  .gitlab-ci.d/windows.yml        |   4 +-
> >>  accel/meson.build               |   2 +-
> >>  accel/qtest/meson.build         |   3 +-
> >>  tests/qtest/libqos/meson.build  |   6 +-
> >>  tests/qtest/meson.build         |   6 --
> >>  16 files changed, 221 insertions(+), 50 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
> >
> > Series looks good to me:
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> >
> > However, many qtests are flaky on Windows. I get a number of "broken
> pipe" exit code 3 & timeout. Should gitlab ignore windows test failures ?
> Or perhaps have a new "ignored" job for the windows qtests. What's your
> experience running gitlab CI with this series? Can you share results? (I
> kicked off one here
> https://gitlab.com/marcandre.lureau/qemu/-/pipelines/679511572)
> >
>
> This "broken pipe" error was fixed by [1] which is currently in
> Daniel's tree. Please apply it in your tree and it should have a 100%
> pass rate.
>
> [1]
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20221006151927.20795=
83-17-bmeng.cn@gmail.com/
>
>
Ok I have seen other tests randomly failing. Furthermore:
https://gitlab.com/marcandre.lureau/qemu/-/jobs/3241465230
ERROR: Job failed: execution took longer than 1h30m0s seconds


I think we should drop the last 2 patches for now, until CI testing is
under control...

--0000000000003f279605ec150e9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 1:21 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, O=
ct 28, 2022 at 4:09 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Fri, Oct 28, 2022 at 8:58 AM Bin Meng &lt;<a href=3D"mailto:bin.men=
g@windriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; In preparation to adding virtio-9p support on Windows, this series=
<br>
&gt;&gt; enables running qtest on Windows, so that we can run the virtio-9p=
<br>
&gt;&gt; tests on Windows to make sure it does not break accidently.<br>
&gt;&gt;<br>
&gt;&gt; Changes in v6:<br>
&gt;&gt; - drop patches that are already in Alex and Daniel&#39;s tree<br>
&gt;&gt; - remove CONFIG_POSIX from meson.build<br>
&gt;&gt; - include &lt;qemu/sockets.h&gt; in libqtest.c<br>
&gt;&gt; - move documentation comments of qemu_send_full() from util/osdep.=
c<br>
&gt;&gt;=C2=A0 =C2=A0to qemu/sockets.h<br>
&gt;&gt; - save the &quot;exit_code&quot; in struct QTestState<br>
&gt;&gt; - new patch: &quot;tests/qtest: device-plug-test: Reverse the usag=
e of double/single quotes&quot;<br>
&gt;&gt; - new patch: &quot;tests/qtest: Use EXIT_FAILURE instead of magic =
number&quot;<br>
&gt;&gt; - new patch: &quot;tests/qtest: libqtest: Introduce qtest_wait_qem=
u()&quot;<br>
&gt;&gt; - change to use qtest_wait_qemu() API<br>
&gt;&gt; - new patch: &quot;test/qtest/libqos: meson.build: Do not build vi=
rtio-9p unconditionally&quot;<br>
&gt;&gt;<br>
&gt;&gt; Changes in v5:<br>
&gt;&gt; - restore to v1 version which does not touch the posix implementat=
ion<br>
&gt;&gt; - Drop patches that are already merged<br>
&gt;&gt;<br>
&gt;&gt; Changes in v3:<br>
&gt;&gt; - Add a usleep(1) in the busy wait loop<br>
&gt;&gt; - Drop the host test<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Introduce qemu_send_full() and use it<br>
&gt;&gt; - Move the enabling of building qtests on Windows to a separate<br=
>
&gt;&gt;=C2=A0 =C2=A0patch to keep bisectablity<br>
&gt;&gt; - Call socket_init() unconditionally<br>
&gt;&gt; - Add a missing CloseHandle() call<br>
&gt;&gt; - Change to a busy wait after migration is canceled<br>
&gt;&gt; - Change the timeout limit to 90 minutes<br>
&gt;&gt; - new patch: &quot;tests/qtest: Enable qtest build on Windows&quot=
;<br>
&gt;&gt;<br>
&gt;&gt; Bin Meng (8):<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: Support libqtest to build and run on Wind=
ows<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: device-plug-test: Reverse the usage of do=
uble/single<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0quotes<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: Use EXIT_FAILURE instead of magic number<=
br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: libqtest: Introduce qtest_wait_qemu()<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: libqos: Do not build virtio-9p unconditio=
nally<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: libqtest: Correct the timeout unit of blo=
cking receive<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0calls for win32<br>
&gt;&gt;=C2=A0 =C2=A0.gitlab-ci.d/windows.yml: Increase the timeout to 90 m=
inutes<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: Enable qtest build on Windows<br>
&gt;&gt;<br>
&gt;&gt; Xuzhou Cheng (3):<br>
&gt;&gt;=C2=A0 =C2=A0accel/qtest: Support qtest accelerator for Windows<br>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: Use send/recv for socket communication<br=
>
&gt;&gt;=C2=A0 =C2=A0tests/qtest: migration-test: Make sure QEMU process &q=
uot;to&quot; exited after<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0migration is canceled<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 13 +++<br>
&gt;&gt;=C2=A0 tests/qtest/libqtest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 ++<br>
&gt;&gt;=C2=A0 accel/dummy-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 14 ++-<br>
&gt;&gt;=C2=A0 softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt;&gt;=C2=A0 tests/qtest/dbus-vmstate-test.c |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 tests/qtest/device-plug-test.c=C2=A0 |=C2=A0 16 ++--<br>
&gt;&gt;=C2=A0 tests/qtest/libqmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A05 +-<br>
&gt;&gt;=C2=A0 tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
51 ++++++++++++++++++++++++++++----<br>
&gt;&gt;=C2=A0 tests/qtest/migration-test.c=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-=
<br>
&gt;&gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +++++<br>
&gt;&gt;=C2=A0 .gitlab-ci.d/windows.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +-<br>
&gt;&gt;=C2=A0 accel/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 accel/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 tests/qtest/libqos/meson.build=C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 --<br>
&gt;&gt;=C2=A0 16 files changed, 221 insertions(+), 50 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;<br>
&gt; Series looks good to me:<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; However, many qtests are flaky on Windows. I get a number of &quot;bro=
ken pipe&quot; exit code 3 &amp; timeout. Should gitlab ignore windows test=
 failures ? Or perhaps have a new &quot;ignored&quot; job for the windows q=
tests. What&#39;s your experience running gitlab CI with this series? Can y=
ou share results? (I kicked off one here <a href=3D"https://gitlab.com/marc=
andre.lureau/qemu/-/pipelines/679511572" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.com/marcandre.lureau/qemu/-/pipelines/679511572</a>)<br>
&gt;<br>
<br>
This &quot;broken pipe&quot; error was fixed by [1] which is currently in<b=
r>
Daniel&#39;s tree. Please apply it in your tree and it should have a 100%<b=
r>
pass rate.<br>
<br>
[1] <a href=3D"http://patchwork.ozlabs.org/project/qemu-devel/patch/2022100=
6151927.2079583-17-bmeng.cn@gmail.com/" rel=3D"noreferrer" target=3D"_blank=
">http://patchwork.ozlabs.org/project/qemu-devel/patch/20221006151927.20795=
83-17-bmeng.cn@gmail.com/</a><br>
<br></blockquote><div><br></div>Ok I have seen other tests randomly failing=
. Furthermore:<br><a href=3D"https://gitlab.com/marcandre.lureau/qemu/-/job=
s/3241465230">https://gitlab.com/marcandre.lureau/qemu/-/jobs/3241465230</a=
><br>ERROR: Job failed: execution took longer than 1h30m0s seconds</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">I think we should drop the last 2 patches for now, u=
ntil CI testing is under control...<br></div></div>

--0000000000003f279605ec150e9f--


