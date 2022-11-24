Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A56380E9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 23:30:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyKhc-00061y-BJ; Thu, 24 Nov 2022 17:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyKha-00061n-4Y
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 17:28:14 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyKhY-0005Qp-1d
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 17:28:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so4329287wrb.4
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 14:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4GluGF7bYaDEP8ToUXerL6ps8j/Vgdup6zQ4cwUNqU=;
 b=v9AGGqm83zlV1IetZdowOtfxWWMkuAqD35PznTZVM631Cib6i/6hWxXogS0fBTylwA
 U7/xguZ3K9Ni1aL+iLKRKGk3q2IAxXiGXBmvVKyBGvo0UTuD5PZhm5RHpmAAA6h1Skod
 m9c4WH+dlyYIXVlx7C9gAgrrXTUpP8Tb1aMBmSFvfVXPZ2sYf1VRgW4tKTu/IH9pl84N
 ymJ3NNsEw4PPCFoiuc0c2w109VyZR8xXezkaduwGMxlfA/w+5o2M30gFjOASQmy5Pmzb
 hLyLlISCfB3stgE9Tys6Y2skUaWmTXtP4t5rfp8FUZ0UmX1N0rucuHiToRyPrZzKIObs
 GTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M4GluGF7bYaDEP8ToUXerL6ps8j/Vgdup6zQ4cwUNqU=;
 b=K4izBpYyxXI9vApd3uBgRcFvBs9fQzwYLnv98vQw6vK/fEOKvZp0U/m3BXsWgEwCi1
 9yOBc2RkPb6MxPz9GuACvw9LANbePPpGDgS6nlq4PHiHgrR8HzzLaTvjS6Pfp3C6YV3T
 Jt7BNT2UPx4+ceOcTNfUMTqmQf9kWCaHigDEl+4uKjE0C73PgSgWrPQ47TlHO18COZze
 aDmhA2//KOZuFbl53MeHcojzbISC3PSIPeG1d4ak4+8uIyaqkmBEUd581TLel2WqTEca
 14e06gGmXDbGKvQDXgi3FjTDXS+ti6IoGv92OaGJ1DVeVT1Ai2gH5T+atpJ/0oygwyYI
 BdyQ==
X-Gm-Message-State: ANoB5pmQn+aMJZFiYpFcwyrwl0Uryo6xePh6WFpqYJ/qah/+21gG8WF/
 Kp7g+Ua8kK9uQTW6mxG/WmYA8A==
X-Google-Smtp-Source: AA0mqf43VHrtvpPgEbExJVgBmsHMxpzlsK7+c7TxxQ42E2O0X9qLSFwOpw+HzUgTuXK5ghzP7lq2Hw==
X-Received: by 2002:a05:6000:112:b0:241:d25a:e57b with SMTP id
 o18-20020a056000011200b00241d25ae57bmr13798710wrx.418.1669328889788; 
 Thu, 24 Nov 2022 14:28:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b003cfa622a18asm6959366wma.3.2022.11.24.14.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 14:28:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACE161FFB7;
 Thu, 24 Nov 2022 22:28:07 +0000 (GMT)
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
 <877czkbtbs.fsf@linaro.org>
 <20221124055230-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Thu, 24 Nov 2022 22:24:14 +0000
In-reply-to: <20221124055230-mutt-send-email-mst@kernel.org>
Message-ID: <87y1s09edk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Nov 24, 2022 at 09:21:15AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >>=20
>> >> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Benn=C3=A9e wrote:
>> >> >> Hi,
>> >> >>=20
>> >> >> This hopefully fixes the problems with VirtIO migration caused by =
the
>> >> >> previous refactoring of virtio_device_started(). That introduced a
>> >> >> different order of checking which didn't give the VM state primacy=
 but
>> >> >> wasn't noticed as we don't properly exercise VirtIO device migrati=
on
>> >> >> and caused issues when dev->started wasn't checked in the core cod=
e.
>> >> >> The introduction of virtio_device_should_start() split the overloa=
ded
>> >> >> function up but the broken order still remained. The series finally
>> >> >> fixes that by restoring the original semantics but with the cleane=
d up
>> >> >> functions.
>> >> >>=20
>> >> >> I've added more documentation to the various structures involved as
>> >> >> well as the functions. There is still some inconsistencies in the
>> >> >> VirtIO code between different devices but I think that can be look=
ed
>> >> >> at over the 8.0 cycle.
>> >> >
>> >> >
>> >> > Thanks a lot! Did you try this with gitlab CI? A patch similar to y=
our
>> >> > 2/2 broke it previously ...
>> >>=20
>> >> Looking into it now - so far hasn't broken locally but I guess there =
is
>> >> something different about the CI.
>> >
>> >
>> > yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
>> >
>> > Or with QEMU_CI set to 1 and then run fedora container and then
>> > clang-system manually.
>>=20
>> I'm having trouble re-creating the failures in CI locally on my boxen. I
>> have triggered a bug on s390 but that looks like a pre-existing problem
>> with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
>> think that is a limitation of the test harness.
>>=20
>> Will keep looking.
>
> Why not just trigger it on gitlab CI - it's very repeatable there?

I can repeat a problem locally on Debian Bullseye and Ubuntu 22.04 with cla=
ng and leak sanitizer:

  # QEMU configure log Thu 24 Nov 16:02:56 GMT 2022
  # Configured with: '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--=
enable-sanitizers' '--target-list=3Darm-softmmu,aarch64-softmmu,i386-softmm=
u,x86_64-softmmu,ppc64-softmmu'#

And the command:

  env QTEST_QEMU_BINARY=3D./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINAR=
Y=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=3D./qemu-img MALLOC=
_PERTURB_=3D178 G_TEST_DBUS_DAEMON=3D/home/alex.bennee/lsrc/qemu.git/tests/=
dbus-vmstate-daemon.sh ./tests/qtest/qos-test -p /arm/virt/virtio-mmio/virt=
io-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-gu=
est-mem/memfile/subprocess

Gives the following failure, while a leak may not be that exciting it
does point to a potential corruption issue. Unfortunately I don't get a
decent backtrace from the tool:

  # random seed: R02S071fe8d68317a8b01e5e7fadbf1ac60a
  # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352.so=
ck -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1024352.qmp,id=3D=
char0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -acce=
l qtest
  =3D=3D1024354=3D=3DWARNING: ASan doesn't fully support makecontext/swapco=
ntext functions and may produce false positives in some cases!
  # Start of arm tests
  # Start of virt tests
  # Start of virtio-mmio tests
  # Start of virtio-bus tests
  # Start of vhost-user-gpio-device tests
  # Start of vhost-user-gpio tests
  # Start of vhost-user-gpio-tests tests
  # Start of read-guest-mem tests
  # Start of memfile tests
  # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352.so=
ck -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1024352.qmp,id=3D=
char0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -M virt  -device vh=
ost-user-gpio-device,id=3Dgpio0,chardev=3Dchr-vhost-user-test -m 256 -objec=
t memory-backend-memfd,id=3Dmem,size=3D256M, -numa node,memdev=3Dmem -chard=
ev socket,id=3Dchr-vhost-user-test,path=3D/tmp/vhost-test-8DD2V1/vhost-user=
-test.sock -accel qtest
  # GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be use=
d after threads are created
  =3D=3D1024371=3D=3DWARNING: ASan doesn't fully support makecontext/swapco=
ntext functions and may produce false positives in some cases!
  # set_protocol_features: 0x200
  # set_owner: start of session
  # vhost-user: un-handled message: 14
  # vhost-user: un-handled message: 14
  # set_vring_num: 0/1024
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (2=
2)
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (2=
2)
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
  qemu-system-arm: Failed to set msg fds.
  qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
  ok 1 /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-g=
pio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess # SKIP No memor=
y at address 0x0
  # End of memfile tests
  # End of read-guest-mem tests
  # End of vhost-user-gpio-tests tests
  # End of vhost-user-gpio tests
  # End of vhost-user-gpio-device tests
  # End of virtio-bus tests
  # End of virtio-mmio tests
  # End of virt tests
  # End of arm tests
  1..1

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D1024371=3D=3DERROR: LeakSanitizer: detected memory leaks

  Direct leak of 240 byte(s) in 1 object(s) allocated from:
      #0 0x561d9a5d7a18 in __interceptor_calloc (/home/alex.bennee/lsrc/qem=
u.git/builds/all.clang-sanitizers/qemu-system-arm+0x1d1fa18) (BuildId: 0bdc=
7c2ada2277089db16d57f17c314e9e53e41c)
      #1 0x7f46ee656c40 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.=
0+0x5ec40) (BuildId: 0ab0b740e34eeb0c84656ba53737f4c440dfbed4)
      #2 0x561d9bf7875b in virtio_device_realize /home/alex.bennee/lsrc/qem=
u.git/builds/all.clang-sanitizers/../../hw/virtio/virtio.c:4175:9
      #3 0x561d9c321bf4 in device_set_realized /home/alex.bennee/lsrc/qemu.=
git/builds/all.clang-sanitizers/../../hw/core/qdev.c:566:13
      #4 0x561d9c33dda8 in property_set_bool /home/alex.bennee/lsrc/qemu.gi=
t/builds/all.clang-sanitizers/../../qom/object.c:2285:5
      #5 0x561d9c338fb3 in object_property_set /home/alex.bennee/lsrc/qemu.=
git/builds/all.clang-sanitizers/../../qom/object.c:1420:5
      #6 0x561d9c344c7c in object_property_set_qobject /home/alex.bennee/ls=
rc/qemu.git/builds/all.clang-sanitizers/../../qom/qom-qobject.c:28:10
      #7 0x561d9b367954 in qdev_device_add /home/alex.bennee/lsrc/qemu.git/=
builds/all.clang-sanitizers/../../softmmu/qdev-monitor.c:733:11
      #8 0x561d9b36f832 in qemu_create_cli_devices /home/alex.bennee/lsrc/q=
emu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2536:5
      #9 0x561d9b36f832 in qmp_x_exit_preconfig /home/alex.bennee/lsrc/qemu=
.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2604:5
      #10 0x561d9b37613f in qemu_init /home/alex.bennee/lsrc/qemu.git/build=
s/all.clang-sanitizers/../../softmmu/vl.c:3601:9
      #11 0x561d9a6125a5 in main /home/alex.bennee/lsrc/qemu.git/builds/all=
.clang-sanitizers/../../softmmu/main.c:47:5

  SUMMARY: AddressSanitizer: 240 byte(s) leaked in 1 allocation(s).
  ../../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU pro=
cess but encountered exit status 1 (expected 0)
  fish: Job 1, 'env QTEST_QEMU_BINARY=3D./qemu-sy=E2=80=A6' terminated by s=
ignal SIGABRT (Abort)
  =F0=9F=95=9922:26:18 alex.bennee@hackbox2:qemu.git/builds/all.clang-sanit=
izers  on =EE=82=A0 for-7.2/virtio-fixes [$?] [=E2=9A=A1 IOT]
  =E2=9C=97



>> >
>> >> >
>> >> >> Alex Benn=C3=A9e (2):
>> >> >>   include/hw: attempt to document VirtIO feature variables
>> >> >>   include/hw: VM state takes precedence in virtio_device_should_st=
art
>> >> >>=20
>> >> >>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
>> >> >>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++-=
-----
>> >> >>  2 files changed, 59 insertions(+), 9 deletions(-)
>> >> >>=20
>> >> >> --=20
>> >> >> 2.34.1
>> >>=20
>> >>=20
>> >> --=20
>> >> Alex Benn=C3=A9e
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

