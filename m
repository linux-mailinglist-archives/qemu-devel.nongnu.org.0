Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356A610BDC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:08:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKPO-0001zz-LO; Fri, 28 Oct 2022 04:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ooKNy-0001bH-Tt
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ooKNq-0002XZ-SI
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666944389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6I0l/I75l3/lTy2FcqzhHKJ37Q8gEODgeQa4Dh6BvYI=;
 b=IQ75U3+LZC+ZIemtz8lCu9JQPlmAn+pjm2KF6gy3Ji/TsKGsx/JXoabS7BegIVbsc/gtgr
 SBr6C/pc4cpT3BkAJhAnPWfEc8Kcvp4bWFuSAO1D3Q5cdWV36MlusurIC7rdCCQgjfpmMV
 jMhwqfcH6klF10C4RbFYRIwwl69/KRQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-tcnNY6lONGOnV_LW1T_axQ-1; Fri, 28 Oct 2022 04:06:28 -0400
X-MC-Unique: tcnNY6lONGOnV_LW1T_axQ-1
Received: by mail-io1-f72.google.com with SMTP id
 y26-20020a5d9b1a000000b006bc71505e97so3927814ion.16
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 01:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6I0l/I75l3/lTy2FcqzhHKJ37Q8gEODgeQa4Dh6BvYI=;
 b=vfdwn87A4RVEoXiIX69i7yNZC4OByb/6lEty5phvQnMk6brXPpm7dJZSceRV1tdtFE
 f7jtVKw2vhkO3YWgGuUVoNERDM64b47/UTLnV8No0ljL5tUL8msXWAdznvVz6SqPWn2i
 0l0K1D55baD0DPo/BVSTlCAFMlOQsUInmlD+QwbYKbpy1jRRcde5JoXTakreS4OcXn06
 zfqFcAaf4XOSInQk3HjeMcgpGBlT565xvVqVR8wIeGYkV7d/Mqqa2lR/4ck0+L0Ac2M/
 5UQqWNuWvbL4LZT51XhmLV4OtgSMaW9CSWYGAEUBI6njhig33lJ+sVg3f5QGhMrlbRii
 dQHg==
X-Gm-Message-State: ACrzQf19WvcYtENZQSTx/2CjR5G6NGgbuefPXB/qKHe5eiF+n7ASLlqT
 K4MyBBN7Ef+wnhYL5kn4AXKtc9Lf+rd7v6XUXPvwq1K/0+O7Z4mWn+bgewQRuHUQ9PYW2RBm79S
 e5B2blz1QXK0m2nDEmD9O1gtTvqwwGZ8=
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr33080999iow.101.1666944387442; 
 Fri, 28 Oct 2022 01:06:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5O2eiPkz7f43oiD14Rb6o5Ks/mnVrpJLIFtshjJhNApUMdabM5MWKoYBcyOvswx0HKqNoG5t1RGFl/PgTUmm8=
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr33080982iow.101.1666944387207; Fri, 28
 Oct 2022 01:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 28 Oct 2022 12:06:15 +0400
Message-ID: <CAMxuvawoU3P_eHknzzEaPnr6evzCOUij-pMnHJvpdvP4HZpc3g@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] tests/qtest: Enable running qtest on Windows
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org,
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
Content-Type: multipart/alternative; boundary="0000000000000f6c3105ec13bcfc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--0000000000000f6c3105ec13bcfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 28, 2022 at 8:58 AM Bin Meng <bin.meng@windriver.com> wrote:

> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.
>
> Changes in v6:
> - drop patches that are already in Alex and Daniel's tree
> - remove CONFIG_POSIX from meson.build
> - include <qemu/sockets.h> in libqtest.c
> - move documentation comments of qemu_send_full() from util/osdep.c
>   to qemu/sockets.h
> - save the "exit_code" in struct QTestState
> - new patch: "tests/qtest: device-plug-test: Reverse the usage of
> double/single quotes"
> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
> - new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
> - change to use qtest_wait_qemu() API
> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p
> unconditionally"
>
> Changes in v5:
> - restore to v1 version which does not touch the posix implementation
> - Drop patches that are already merged
>
> Changes in v3:
> - Add a usleep(1) in the busy wait loop
> - Drop the host test
>
> Changes in v2:
> - Introduce qemu_send_full() and use it
> - Move the enabling of building qtests on Windows to a separate
>   patch to keep bisectablity
> - Call socket_init() unconditionally
> - Add a missing CloseHandle() call
> - Change to a busy wait after migration is canceled
> - Change the timeout limit to 90 minutes
> - new patch: "tests/qtest: Enable qtest build on Windows"
>
> Bin Meng (8):
>   tests/qtest: Support libqtest to build and run on Windows
>   tests/qtest: device-plug-test: Reverse the usage of double/single
>     quotes
>   tests/qtest: Use EXIT_FAILURE instead of magic number
>   tests/qtest: libqtest: Introduce qtest_wait_qemu()
>   tests/qtest: libqos: Do not build virtio-9p unconditionally
>   tests/qtest: libqtest: Correct the timeout unit of blocking receive
>     calls for win32
>   .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
>   tests/qtest: Enable qtest build on Windows
>
> Xuzhou Cheng (3):
>   accel/qtest: Support qtest accelerator for Windows
>   tests/qtest: Use send/recv for socket communication
>   tests/qtest: migration-test: Make sure QEMU process "to" exited after
>     migration is canceled
>
>  include/hw/core/cpu.h           |   1 +
>  include/qemu/sockets.h          |  13 +++
>  tests/qtest/libqtest.h          |   9 ++
>  accel/dummy-cpus.c              |  14 ++-
>  softmmu/cpus.c                  |   9 +-
>  tests/qtest/dbus-vmstate-test.c |   2 +-
>  tests/qtest/device-plug-test.c  |  16 ++--
>  tests/qtest/libqmp.c            |   5 +-
>  tests/qtest/libqtest.c          | 151 ++++++++++++++++++++++++++++----
>  tests/qtest/migration-test.c    |   8 +-
>  util/osdep.c                    |  22 +++++
>  .gitlab-ci.d/windows.yml        |   4 +-
>  accel/meson.build               |   2 +-
>  accel/qtest/meson.build         |   3 +-
>  tests/qtest/libqos/meson.build  |   6 +-
>  tests/qtest/meson.build         |   6 --
>  16 files changed, 221 insertions(+), 50 deletions(-)
>
> --
> 2.25.1
>
>
Series looks good to me:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


However, many qtests are flaky on Windows. I get a number of "broken pipe"
exit code 3 & timeout. Should gitlab ignore windows test failures ? Or
perhaps have a new "ignored" job for the windows qtests. What's your
experience running gitlab CI with this series? Can you share results? (I
kicked off one here
https://gitlab.com/marcandre.lureau/qemu/-/pipelines/679511572)

--0000000000000f6c3105ec13bcfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 8:58 AM Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">In preparation to adding virtio-9p support on Windows, thi=
s series<br>
enables running qtest on Windows, so that we can run the virtio-9p<br>
tests on Windows to make sure it does not break accidently.<br>
<br>
Changes in v6:<br>
- drop patches that are already in Alex and Daniel&#39;s tree<br>
- remove CONFIG_POSIX from meson.build<br>
- include &lt;qemu/sockets.h&gt; in libqtest.c<br>
- move documentation comments of qemu_send_full() from util/osdep.c<br>
=C2=A0 to qemu/sockets.h<br>
- save the &quot;exit_code&quot; in struct QTestState<br>
- new patch: &quot;tests/qtest: device-plug-test: Reverse the usage of doub=
le/single quotes&quot;<br>
- new patch: &quot;tests/qtest: Use EXIT_FAILURE instead of magic number&qu=
ot;<br>
- new patch: &quot;tests/qtest: libqtest: Introduce qtest_wait_qemu()&quot;=
<br>
- change to use qtest_wait_qemu() API<br>
- new patch: &quot;test/qtest/libqos: meson.build: Do not build virtio-9p u=
nconditionally&quot;<br>
<br>
Changes in v5:<br>
- restore to v1 version which does not touch the posix implementation<br>
- Drop patches that are already merged<br>
<br>
Changes in v3:<br>
- Add a usleep(1) in the busy wait loop<br>
- Drop the host test<br>
<br>
Changes in v2:<br>
- Introduce qemu_send_full() and use it<br>
- Move the enabling of building qtests on Windows to a separate<br>
=C2=A0 patch to keep bisectablity<br>
- Call socket_init() unconditionally<br>
- Add a missing CloseHandle() call<br>
- Change to a busy wait after migration is canceled<br>
- Change the timeout limit to 90 minutes<br>
- new patch: &quot;tests/qtest: Enable qtest build on Windows&quot;<br>
<br>
Bin Meng (8):<br>
=C2=A0 tests/qtest: Support libqtest to build and run on Windows<br>
=C2=A0 tests/qtest: device-plug-test: Reverse the usage of double/single<br=
>
=C2=A0 =C2=A0 quotes<br>
=C2=A0 tests/qtest: Use EXIT_FAILURE instead of magic number<br>
=C2=A0 tests/qtest: libqtest: Introduce qtest_wait_qemu()<br>
=C2=A0 tests/qtest: libqos: Do not build virtio-9p unconditionally<br>
=C2=A0 tests/qtest: libqtest: Correct the timeout unit of blocking receive<=
br>
=C2=A0 =C2=A0 calls for win32<br>
=C2=A0 .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes<br>
=C2=A0 tests/qtest: Enable qtest build on Windows<br>
<br>
Xuzhou Cheng (3):<br>
=C2=A0 accel/qtest: Support qtest accelerator for Windows<br>
=C2=A0 tests/qtest: Use send/recv for socket communication<br>
=C2=A0 tests/qtest: migration-test: Make sure QEMU process &quot;to&quot; e=
xited after<br>
=C2=A0 =C2=A0 migration is canceled<br>
<br>
=C2=A0include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +=
++<br>
=C2=A0tests/qtest/libqtest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A09 ++<br>
=C2=A0accel/dummy-cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 14 ++-<br>
=C2=A0softmmu/cpus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0tests/qtest/dbus-vmstate-test.c |=C2=A0 =C2=A02 +-<br>
=C2=A0tests/qtest/device-plug-test.c=C2=A0 |=C2=A0 16 ++--<br>
=C2=A0tests/qtest/libqmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A05 +-<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 151 ++++++=
++++++++++++++++++++++----<br>
=C2=A0tests/qtest/migration-test.c=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 +++++<br>
=C2=A0.gitlab-ci.d/windows.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +=
-<br>
=C2=A0accel/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0accel/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +-<br>
=C2=A0tests/qtest/libqos/meson.build=C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 --<br>
=C2=A016 files changed, 221 insertions(+), 50 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>Series looks good to me:<br></div><div=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br><br></div><div>Howe=
ver, many qtests are flaky on Windows. I get a number of &quot;broken pipe&=
quot; exit code 3 &amp; timeout. Should gitlab ignore windows test failures=
 ? Or perhaps have a new &quot;ignored&quot; job for the windows qtests. Wh=
at&#39;s your experience running gitlab CI with this series? Can you share =
results? (I kicked off one here <a href=3D"https://gitlab.com/marcandre.lur=
eau/qemu/-/pipelines/679511572">https://gitlab.com/marcandre.lureau/qemu/-/=
pipelines/679511572</a>)</div><div>=C2=A0</div></div></div>

--0000000000000f6c3105ec13bcfc--


