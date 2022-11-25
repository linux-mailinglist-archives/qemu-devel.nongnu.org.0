Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4D638D5A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:16:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaQZ-0003cf-V4; Fri, 25 Nov 2022 10:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyaQX-0003aj-Sj
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:15:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyaQV-0002p9-2j
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:15:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bs21so7205415wrb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IonOnyqzNC0jZ8QL1hNy1cvFEg0azx9orVe19HU+TH8=;
 b=wZ/x5vAk9IrJD5UchMXmtQ99MAXZqe6EKtbp0Md6KYYPhVarUf6thsEwgoVgSbMy4e
 b6h8qhalesCqb2vsKvJgavKiR6W8q7EbmvjALzKcEZo8Rizv0FO7Kr1LUfil0hNxLK1v
 jg1Tfsx5mgKZ/Srg1yIGmIqzrByVUei8w2OIQdQk/jp92octkp9WBsv0Szxi97VKK+l+
 LH9t1uRd3TigO7IEf/SxlXHUKIxsJ4W1IzwJ7Nb4T7k0I9cSC9QNv+stuZLjJ3QPXmNB
 lrzDGYbJ7M4LW1rQiUkRgE9jPXuijuO8oiPz7BPe/5uF2Sc4nlTjxN/GeJHnUsMA/W5t
 FgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IonOnyqzNC0jZ8QL1hNy1cvFEg0azx9orVe19HU+TH8=;
 b=H2LXIqWzz9YUINzBfoYX8sVG0rNF2S4GkaS1X07YeG0P8BafW4P49tgSqDWzpqnn0s
 zYPfOThuRwn5e+2qSDqvAClh5GYoCeQ2kLZieTkXlLVl1Y7vafuVlnewx4Q4JCbFA8cS
 eYlnRGjpy/ISv0KTi6We9mhKGsHkAEkANdh/FU6GWMEJDNMrL60LOGyIb0qcy/4q+zCQ
 KGpq30vTngOyZ1OU7MWwOviHQmsWE/iI89GY0OAKe7X/xkkgmfhRZukg6L9eMWylcIoT
 DiAzAurq9jzXklpn+p1h9FrZ5maZL/gIjmJMkGLN26lZrcBgrUyH8u8kfVApmI5zx/v1
 OCrw==
X-Gm-Message-State: ANoB5plhABOLFYsH3KgiPsyo5ZEFdO1a8YqLwzNFADflKbcpK4kF3zEj
 tXtcIua2odDp7KA9K8455/zwDw==
X-Google-Smtp-Source: AA0mqf4AivluW9BxDf4Lc9BABGkLojUdcPwP9uOsMXDiS2wTtpw787Yc+ROq48I4w8gFQtUy4zXaIw==
X-Received: by 2002:adf:b610:0:b0:231:9b9f:652b with SMTP id
 f16-20020adfb610000000b002319b9f652bmr16874183wre.421.1669389337234; 
 Fri, 25 Nov 2022 07:15:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a5d55c4000000b0023647841c5bsm3963204wrw.60.2022.11.25.07.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 07:15:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 145101FFB7;
 Fri, 25 Nov 2022 15:15:36 +0000 (GMT)
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
 <877czkbtbs.fsf@linaro.org>
 <20221124055230-mutt-send-email-mst@kernel.org>
 <87y1s09edk.fsf@linaro.org>
 <20221125070510-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Fri, 25 Nov 2022 15:14:37 +0000
In-reply-to: <20221125070510-mutt-send-email-mst@kernel.org>
Message-ID: <87pmdb9iav.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> On Thu, Nov 24, 2022 at 10:24:14PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Thu, Nov 24, 2022 at 09:21:15AM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >>=20
>> >> > On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Benn=C3=A9e wrote:
>> >> >>=20
>> >> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >> >>=20
>> >> >> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Benn=C3=A9e wrote:
>> >> >> >> Hi,
>> >> >> >>=20
>> >> >> >> This hopefully fixes the problems with VirtIO migration caused =
by the
>> >> >> >> previous refactoring of virtio_device_started(). That introduce=
d a
>> >> >> >> different order of checking which didn't give the VM state prim=
acy but
>> >> >> >> wasn't noticed as we don't properly exercise VirtIO device migr=
ation
>> >> >> >> and caused issues when dev->started wasn't checked in the core =
code.
>> >> >> >> The introduction of virtio_device_should_start() split the over=
loaded
>> >> >> >> function up but the broken order still remained. The series fin=
ally
>> >> >> >> fixes that by restoring the original semantics but with the cle=
aned up
>> >> >> >> functions.
>> >> >> >>=20
>> >> >> >> I've added more documentation to the various structures involve=
d as
>> >> >> >> well as the functions. There is still some inconsistencies in t=
he
>> >> >> >> VirtIO code between different devices but I think that can be l=
ooked
>> >> >> >> at over the 8.0 cycle.
>> >> >> >
>> >> >> >
>> >> >> > Thanks a lot! Did you try this with gitlab CI? A patch similar t=
o your
>> >> >> > 2/2 broke it previously ...
>> >> >>=20
>> >> >> Looking into it now - so far hasn't broken locally but I guess the=
re is
>> >> >> something different about the CI.
>> >> >
>> >> >
>> >> > yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
>> >> >
>> >> > Or with QEMU_CI set to 1 and then run fedora container and then
>> >> > clang-system manually.
>> >>=20
>> >> I'm having trouble re-creating the failures in CI locally on my boxen=
. I
>> >> have triggered a bug on s390 but that looks like a pre-existing probl=
em
>> >> with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
>> >> think that is a limitation of the test harness.
>> >>=20
>> >> Will keep looking.
>> >
>> > Why not just trigger it on gitlab CI - it's very repeatable there?
>>=20
>> I can repeat a problem locally on Debian Bullseye and Ubuntu 22.04 with =
clang and leak sanitizer:
>>=20
>>   # QEMU configure log Thu 24 Nov 16:02:56 GMT 2022
>>   # Configured with: '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' =
'--enable-sanitizers' '--target-list=3Darm-softmmu,aarch64-softmmu,i386-sof=
tmmu,x86_64-softmmu,ppc64-softmmu'#
>>=20
>> And the command:
>>=20
>>   env QTEST_QEMU_BINARY=3D./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BI=
NARY=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=3D./qemu-img MAL=
LOC_PERTURB_=3D178 G_TEST_DBUS_DAEMON=3D/home/alex.bennee/lsrc/qemu.git/tes=
ts/dbus-vmstate-daemon.sh ./tests/qtest/qos-test -p /arm/virt/virtio-mmio/v=
irtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read=
-guest-mem/memfile/subprocess
>>=20
>> Gives the following failure, while a leak may not be that exciting it
>> does point to a potential corruption issue. Unfortunately I don't get a
>> decent backtrace from the tool:
>>=20
>>   # random seed: R02S071fe8d68317a8b01e5e7fadbf1ac60a
>>   # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352=
.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1024352.qmp,id=
=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -a=
ccel qtest
>>   =3D=3D1024354=3D=3DWARNING: ASan doesn't fully support makecontext/swa=
pcontext functions and may produce false positives in some cases!
>>   # Start of arm tests
>>   # Start of virt tests
>>   # Start of virtio-mmio tests
>>   # Start of virtio-bus tests
>>   # Start of vhost-user-gpio-device tests
>>   # Start of vhost-user-gpio tests
>>   # Start of vhost-user-gpio-tests tests
>>   # Start of read-guest-mem tests
>>   # Start of memfile tests
>>   # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352=
.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1024352.qmp,id=
=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -M virt  -device=
 vhost-user-gpio-device,id=3Dgpio0,chardev=3Dchr-vhost-user-test -m 256 -ob=
ject memory-backend-memfd,id=3Dmem,size=3D256M, -numa node,memdev=3Dmem -ch=
ardev socket,id=3Dchr-vhost-user-test,path=3D/tmp/vhost-test-8DD2V1/vhost-u=
ser-test.sock -accel qtest
>>   # GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be =
used after threads are created
>>   =3D=3D1024371=3D=3DWARNING: ASan doesn't fully support makecontext/swa=
pcontext functions and may produce false positives in some cases!
>>   # set_protocol_features: 0x200
>>   # set_owner: start of session
>>   # vhost-user: un-handled message: 14
>>   # vhost-user: un-handled message: 14
>>   # set_vring_num: 0/1024
>>   qemu-system-arm: Failed to set msg fds.
>>   qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument=
 (22)
>>   qemu-system-arm: Failed to set msg fds.
>>   qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument=
 (22)
>>   qemu-system-arm: Failed to set msg fds.
>>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>>   qemu-system-arm: Failed to set msg fds.
>>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>>   ok 1 /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-use=
r-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess # SKIP No me=
mory at address 0x0
>>   # End of memfile tests
>>   # End of read-guest-mem tests
>>   # End of vhost-user-gpio-tests tests
>>   # End of vhost-user-gpio tests
>>   # End of vhost-user-gpio-device tests
>>   # End of virtio-bus tests
>>   # End of virtio-mmio tests
>>   # End of virt tests
>>   # End of arm tests
>>   1..1
>>=20
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>   =3D=3D1024371=3D=3DERROR: LeakSanitizer: detected memory leaks
>>=20
>>   Direct leak of 240 byte(s) in 1 object(s) allocated from:
>>       #0 0x561d9a5d7a18 in __interceptor_calloc (/home/alex.bennee/lsrc/=
qemu.git/builds/all.clang-sanitizers/qemu-system-arm+0x1d1fa18) (BuildId: 0=
bdc7c2ada2277089db16d57f17c314e9e53e41c)
>>       #1 0x7f46ee656c40 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.=
so.0+0x5ec40) (BuildId: 0ab0b740e34eeb0c84656ba53737f4c440dfbed4)
>>       #2 0x561d9bf7875b in virtio_device_realize /home/alex.bennee/lsrc/=
qemu.git/builds/all.clang-sanitizers/../../hw/virtio/virtio.c:4175:9
>>       #3 0x561d9c321bf4 in device_set_realized /home/alex.bennee/lsrc/qe=
mu.git/builds/all.clang-sanitizers/../../hw/core/qdev.c:566:13
>>       #4 0x561d9c33dda8 in property_set_bool /home/alex.bennee/lsrc/qemu=
.git/builds/all.clang-sanitizers/../../qom/object.c:2285:5
>>       #5 0x561d9c338fb3 in object_property_set /home/alex.bennee/lsrc/qe=
mu.git/builds/all.clang-sanitizers/../../qom/object.c:1420:5
>>       #6 0x561d9c344c7c in object_property_set_qobject /home/alex.bennee=
/lsrc/qemu.git/builds/all.clang-sanitizers/../../qom/qom-qobject.c:28:10
>>       #7 0x561d9b367954 in qdev_device_add /home/alex.bennee/lsrc/qemu.g=
it/builds/all.clang-sanitizers/../../softmmu/qdev-monitor.c:733:11
>>       #8 0x561d9b36f832 in qemu_create_cli_devices /home/alex.bennee/lsr=
c/qemu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2536:5
>>       #9 0x561d9b36f832 in qmp_x_exit_preconfig /home/alex.bennee/lsrc/q=
emu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2604:5
>>       #10 0x561d9b37613f in qemu_init /home/alex.bennee/lsrc/qemu.git/bu=
ilds/all.clang-sanitizers/../../softmmu/vl.c:3601:9
>>       #11 0x561d9a6125a5 in main /home/alex.bennee/lsrc/qemu.git/builds/=
all.clang-sanitizers/../../softmmu/main.c:47:5
>>=20
>>   SUMMARY: AddressSanitizer: 240 byte(s) leaked in 1 allocation(s).
>>   ../../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU =
process but encountered exit status 1 (expected 0)
>>   fish: Job 1, 'env QTEST_QEMU_BINARY=3D./qemu-sy=E2=80=A6' terminated b=
y signal SIGABRT (Abort)
>>   =F0=9F=95=9922:26:18 alex.bennee@hackbox2:qemu.git/builds/all.clang-sa=
nitizers  on =EE=82=A0 for-7.2/virtio-fixes [$?] [=E2=9A=A1 IOT]
>>   =E2=9C=97
>
>
> ok ... was gpio always like this? from 1st commit? if not bisect?
<snip>

I'm almost tempted to drop the mmio variant of the gpio test. I suspect
there is a reason the only other mmio vhost-user test is for virtio-net.

--=20
Alex Benn=C3=A9e

