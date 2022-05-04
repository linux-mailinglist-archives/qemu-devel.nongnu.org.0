Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6909A51A76C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:01:33 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmINY-0005qr-Ge
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmIII-0006oE-Dm
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:06 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmIIG-00035t-9o
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:56:06 -0400
Received: by mail-ej1-x635.google.com with SMTP id m20so4025096ejj.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iIxYdSaCvS9mXRtYUIrCkFhtf1OgXwgRZvQCJDcGjlc=;
 b=CovVzbvotB3Tkm1CfmCjQek8qBlxRq4ZRuOn3iciQMTRR0aGYgRZVMafqx9zjehYPQ
 JHMGVb1mIoLtg3tsjKbvFCnztT00QpVDs0oOvTUOJnPynqJinRg8Yu9Qr2xIXYiuqTkk
 Tl71SenLT+Uw7N3i8IB2yAbuNMNmbMC7ybtcuvaqbc1S2XFpb1QA3HW9OZnhWOlKRziS
 jb6YmwSfEuxICCghajV0rl5NhUKgDs8RlbPfy71lHQwhZyKUwyKe6o7/5MrA8Jt/14b9
 h444I7tK83Zslzw8eTVOxkO3laP4bCSfjIltl/b52LYSkbhmzHudRkc/uGyP1w0QWci/
 Akkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iIxYdSaCvS9mXRtYUIrCkFhtf1OgXwgRZvQCJDcGjlc=;
 b=mdOJWpBrCkhL7AJlhEgFW/GfwFRKOlb5bVJJzVN2zUGCIU96GRk7cy4JmML/JkR90a
 i0H6u/n70yrmGwcOWIkV96IECd+YOoIe7D63WlR6Qtt/UWKt8zzqKgJhk2WM13YgeP+r
 MPYNcoCxNOYXFe+J3O06FoNiRN32OoXA49wtzzGc7IJf5Ajx6D2QIbiCnszZwMTcB5F8
 DcDnV8ROpfUA7WWTpkanGg2Qxi/vHujxoFxsNrkOGdEcsP+ZWfu5mwkYxYEw60Uy9fp+
 CG6rjJCM6tXNfRYGP7cCLSHWm+B6I4Mpu4CAzZ6wYtv6kS14QJOwdTGWrj5ZRm/RiB+T
 ysqQ==
X-Gm-Message-State: AOAM532UyufEy3bHGeDqjCP5TRsv/WnA6wOEThp9YEh+PV1CHWc6HYnC
 hAKMnffpOtXf8U8vUMH5PYutSg==
X-Google-Smtp-Source: ABdhPJyh41LG4mQbzR5vQyeq+9p/P4kNvaEl5OK4tlxHYPALQdYPM1k4aD70xMOyGw6Mh+SvnOSS9w==
X-Received: by 2002:a17:907:7284:b0:6f4:28a8:9452 with SMTP id
 dt4-20020a170907728400b006f428a89452mr18116432ejc.344.1651683360954; 
 Wed, 04 May 2022 09:56:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a056402037700b0042617ba639bsm9358548edw.37.2022.05.04.09.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:55:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D8211FFB7;
 Wed,  4 May 2022 17:55:59 +0100 (BST)
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Jason
 Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Christian
 Schoenebeck <qemu_oss@crudebyte.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Dima Stepanov <dimastep@yandex-team.ru>, Markus Armbruster
 <armbru@redhat.com>, Michael S. Tsirkin <mst@redhat.com>, =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Eric Blake <eblake@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: Help trying to add a new vhost-user test to qos-test
Date: Wed, 04 May 2022 17:28:11 +0100
Message-ID: <874k25uti8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Apologies for the wide CC but I'm stuck trying to work out what is
going on. I've had a very frustrating few weeks trying to enable a basic
vhost-user test for the gpio stub device. I've been attempting to model
it on the existing vhost-user-test for virtio-net but I think I've
triggered some sort of subtle race condition but it's very hard to work
out amongst the moving pieces. I think this comes down to the fact that
the GPIO device supports the VHOST_USER_GET_CONFIG message and this
subtly breaks the test harness as can be seen by the following
backtrace:

  #0  virtio_pci_set_guest_notifiers (d=3D0x5615571bf620, nvqs=3D2, assign=
=3Dfalse) at ../../hw/virtio/virtio-pci.c:990
  #1  0x0000561553a585d5 in vu_gpio_stop (vdev=3D0x5615571c79c0) at ../../h=
w/virtio/vhost-user-gpio.c:106
  #2  0x0000561553a58958 in vu_gpio_disconnect (dev=3D0x5615571c79c0) at ..=
/../hw/virtio/vhost-user-gpio.c:215
  #3  0x0000561553a589fa in vu_gpio_event (opaque=3D0x5615571c79c0, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:233
  #4  0x0000561553bf47ac in chr_be_event (s=3D0x561556608000, event=3DCHR_E=
VENT_CLOSED) at ../../chardev/char.c:61
  #5  0x0000561553bf4820 in qemu_chr_be_event (s=3D0x561556608000, event=3D=
CHR_EVENT_CLOSED) at ../../chardev/char.c:81
  #6  0x0000561553bf06f9 in tcp_chr_disconnect_locked (chr=3D0x561556608000=
) at ../../chardev/char-socket.c:470
  #7  0x0000561553bf0768 in tcp_chr_disconnect (chr=3D0x561556608000) at ..=
/../chardev/char-socket.c:480
  #8  0x0000561553bf094c in tcp_chr_hup (channel=3D0x561556532c00, cond=3DG=
_IO_HUP, opaque=3D0x561556608000) at ../../chardev/char-socket.c:520
  #9  0x0000561553ae7ab5 in qio_channel_fd_source_dispatch (source=3D0x5615=
567a6c00, callback=3D0x561553bf091d <tcp_chr_hup>, user_data=3D0x5615566080=
00) at ../../io/channel-watch.c:84
  #10 0x00007f905b47fd6f in g_main_dispatch (context=3D0x5615571fff00) at .=
./../../glib/gmain.c:3325
  #11 g_main_context_dispatch (context=3D0x5615571fff00) at ../../../glib/g=
main.c:4043
  #12 0x00007f905b480118 in g_main_context_iterate (context=3D0x5615571fff0=
0, block=3Dblock@entry=3D1, dispatch=3Ddispatch@entry=3D1, self=3D<optimize=
d out>) at ../../../glib/gmain.c:4119
  #13 0x00007f905b48040b in g_main_loop_run (loop=3D0x561557200170) at
  #../../../glib/gmain.c:4317

For a not totally clear reason we dispatch a new run loop and discover
the vhost user socket has been closed down. This triggers the above stop
which then asserts because we haven't had a chance to fully initialise
the device yet.

  #14 0x0000561553a36fc3 in vhost_user_read (dev=3D0x5615571c7be0, msg=3D0x=
7ffcac609df0) at ../../hw/virtio/vhost-user.c:406
  #15 0x0000561553a3be39 in vhost_user_get_config (dev=3D0x5615571c7be0, co=
nfig=3D0x5615571c7bd0 "", config_len=3D8, errp=3D0x7ffcac60a120) at ../../h=
w/virtio/vhost-user.c:2304
  #16 0x0000561553a344b6 in vhost_dev_get_config (hdev=3D0x5615571c7be0, co=
nfig=3D0x5615571c7bd0 "", config_len=3D8, errp=3D0x7ffcac60a120) at ../../h=
w/virtio/vhost.c:1593
  #17 0x0000561553a58c0e in vu_gpio_device_realize (dev=3D0x5615571c79c0, e=
rrp=3D0x7ffcac60a120) at ../../hw/virtio/vhost-user-gpio.c:283
  #18 0x0000561553a2ec5d in virtio_device_realize (dev=3D0x5615571c79c0, er=
rp=3D0x7ffcac60a180) at ../../hw/virtio/virtio.c:3623
  #19 0x0000561553ad5ee0 in device_set_realized (obj=3D0x5615571c79c0, valu=
e=3Dtrue, errp=3D0x7ffcac60a428) at ../../hw/core/qdev.c:531
  #20 0x0000561553adf935 in property_set_bool (obj=3D0x5615571c79c0, v=3D0x=
5615571cfbe0, name=3D0x561553ef77d1 "realized", opaque=3D0x5615564a4b80, er=
rp=3D0x7ffcac60a428) at ../../qom/object.c:2273
  #21 0x0000561553add97c in object_property_set (obj=3D0x5615571c79c0, name=
=3D0x561553ef77d1 "realized", v=3D0x5615571cfbe0, errp=3D0x7ffcac60a428) at=
 ../../qom/object.c:1408
  #22 0x0000561553ae1d27 in object_property_set_qobject (obj=3D0x5615571c79=
c0, name=3D0x561553ef77d1 "realized", value=3D0x5615571cfbc0, errp=3D0x7ffc=
ac60a428) at ../../qom/qom-qobject.c:28
  #23 0x0000561553addce1 in object_property_set_bool (obj=3D0x5615571c79c0,=
 name=3D0x561553ef77d1 "realized", value=3Dtrue, errp=3D0x7ffcac60a428) at =
../../qom/object.c:1477
  #24 0x0000561553ad57a8 in qdev_realize (dev=3D0x5615571c79c0, bus=3D0x561=
5571c7938, errp=3D0x7ffcac60a428) at ../../hw/core/qdev.c:333
  #25 0x0000561553a58fe0 in vhost_user_gpio_pci_realize (vpci_dev=3D0x56155=
71bf620, errp=3D0x7ffcac60a428) at ../../hw/virtio/vhost-user-gpio-pci.c:32
  #26 0x0000561553679b82 in virtio_pci_realize (pci_dev=3D0x5615571bf620, e=
rrp=3D0x7ffcac60a428) at ../../hw/virtio/virtio-pci.c:1926
  #27 0x000056155357a983 in pci_qdev_realize (qdev=3D0x5615571bf620, errp=
=3D0x7ffcac60a4e0) at ../../hw/pci/pci.c:2191
  #28 0x0000561553679f26 in virtio_pci_dc_realize (qdev=3D0x5615571bf620, e=
rrp=3D0x7ffcac60a4e0) at ../../hw/virtio/virtio-pci.c:2011
  #29 0x0000561553ad5ee0 in device_set_realized (obj=3D0x5615571bf620, valu=
e=3Dtrue, errp=3D0x7ffcac60a750) at ../../hw/core/qdev.c:531
  #30 0x0000561553adf935 in property_set_bool (obj=3D0x5615571bf620, v=3D0x=
5615571c9db0, name=3D0x561553ef77d1 "realized", opaque=3D0x5615564a4b80, er=
rp=3D0x7ffcac60a750) at ../../qom/object.c:2273
  #31 0x0000561553add97c in object_property_set (obj=3D0x5615571bf620, name=
=3D0x561553ef77d1 "realized", v=3D0x5615571c9db0, errp=3D0x7ffcac60a750) at=
 ../../qom/object.c:1408
  #32 0x0000561553ae1d27 in object_property_set_qobject (obj=3D0x5615571bf6=
20, name=3D0x561553ef77d1 "realized", value=3D0x5615571ca040, errp=3D0x7ffc=
ac60a750) at ../../qom/qom-qobject.c:28
  #33 0x0000561553addce1 in object_property_set_bool (obj=3D0x5615571bf620,=
 name=3D0x561553ef77d1 "realized", value=3Dtrue, errp=3D0x7ffcac60a750) at =
../../qom/object.c:1477
  #34 0x0000561553ad57a8 in qdev_realize (dev=3D0x5615571bf620, bus=3D0x561=
5569e82e0, errp=3D0x7ffcac60a750) at ../../hw/core/qdev.c:333
  #35 0x00005615532f2523 in qdev_device_add_from_qdict (opts=3D0x5615571be5=
00, from_json=3Dfalse, errp=3D0x7ffcac60a750) at ../../softmmu/qdev-monitor=
.c:713
  #36 0x00005615532f25c1 in qdev_device_add (opts=3D0x5615564a29d0, errp=3D=
0x56155451b300 <error_fatal>) at ../../softmmu/qdev-monitor.c:732
  #37 0x00005615532f7b3d in device_init_func (opaque=3D0x0, opts=3D0x561556=
4a29d0, errp=3D0x56155451b300 <error_fatal>) at ../../softmmu/vl.c:1230
  #38 0x0000561553cb965b in qemu_opts_foreach (list=3D0x561554373400 <qemu_=
device_opts>, func=3D0x5615532f7b16 <device_init_func>, opaque=3D0x0, errp=
=3D0x56155451b300 <error_fatal>) at ../../util/qemu-option.c:1135
  #39 0x00005615532fb339 in qemu_create_cli_devices () at ../../softmmu/vl.=
c:2685
  #40 0x00005615532fb4c1 in qmp_x_exit_preconfig (errp=3D0x56155451b300 <er=
ror_fatal>) at ../../softmmu/vl.c:2747
  #41 0x00005615532fdb84 in qemu_init (argc=3D27, argv=3D0x7ffcac60ab78, en=
vp=3D0x0) at ../../softmmu/vl.c:3776
  #42 0x000056155326f0bd in qemu_main (argc=3D27, argv=3D0x7ffcac60ab78, en=
vp=3D0x0) at ../../softmmu/main.c:35
  #43 0x000056155326f0f3 in main (argc=3D27, argv=3D0x7ffcac60ab78) at ../.=
./softmmu/main.c:45

I thought it was the vhost-user server that was closing things but as
far as I can tell things just hang on the first attempt to respond to
the protocol features:

  # Start of read-guest-mem tests
  subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pc=
i-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-=
mem/memfile/subprocess
  virtio_net_register_nodes: dbg
  virtio_gpio_register_nodes: dbg
  qos_set_machines_devices_available: query machines
  qos_set_machines_devices_available: qom-list-types
  qemu_chr_be_event: closing char0/(null)
  qemu_chr_be_event: closing qtest/(null)
  run_one_test: -M virt, -cpu max -device vhost-user-gpio-pci,id=3Dgpio0,ad=
dr=3D04.0,chardev=3Dchr-vhost-user-test
  run_one_test: -M virt, -cpu max -device vhost-user-gpio-pci,id=3Dgpio0,ad=
dr=3D04.0,chardev=3Dchr-vhost-user-test
  test_server_create_chr: created chr-vhost-user-test unix:/tmp/vhost-test-=
01rNam/vhost-user-test.sock,server=3Don,wait=3Doff
  vhost_user_test_setup: -M virt, -cpu max -device vhost-user-gpio-pci,id=
=3Dgpio0,addr=3D04.0,chardev=3Dchr-vhost-user-test
  restart_qemu_or_continue: starting -M virt, -cpu max -device vhost-user-g=
pio-pci,id=3Dgpio0,addr=3D04.0,chardev=3Dchr-vhost-user-test -m 256 -object=
 memory-backend-memfd,id=3Dmem,si
  ze=3D256M, -numa node,memdev=3Dmem -chardev socket,id=3Dchr-vhost-user-te=
st,path=3D/tmp/vhost-test-01rNam/vhost-user-test.sock
  chr_event: 1
  vu_gpio_get_protocol_features: 0x202
  vu_gpio_get_protocol_features: sent 20 byte reply
  qemu_chr_be_event: closing chr-vhost-user-test/disconnected:unix:/tmp/vho=
st-test-01rNam/vhost-user-test.sock
  virtio_pci_set_guest_notifiers: assign:false nvqs:2/0
  qemu-system-aarch64: ../../hw/virtio/virtio-pci.c:1004: virtio_pci_set_gu=
est_notifiers: Assertion `assign || nvqs =3D=3D proxy->nvqs_with_notifiers'=
 failed.
  qemu_chr_be_event: closing char0/disconnected:unix:/tmp/qtest-740831.qmp

The vu_gpio_get_protocol_features seems to succeed in sending the reply
but hangs at that point and eventually times out and the whole thing is
torn down. Compared to the vhost-net test which runs a lot more cleanly.

  # Start of read-guest-mem tests
  subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pc=
i-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/read-guest-mem/=
memfile/subprocess
  virtio_net_register_nodes: dbg
  virtio_gpio_register_nodes: dbg
  qos_set_machines_devices_available: query machines
  qos_set_machines_devices_available: qom-list-types
  qemu_chr_be_event: closing char0/(null)
  qemu_chr_be_event: closing qtest/(null)
  run_one_test: -M virt, -cpu max -device virtio-net-pci,netdev=3Dhs0,addr=
=3D04.0
  run_one_test: -M virt, -cpu max -device virtio-net-pci,netdev=3Dhs0,addr=
=3D04.0
  test_server_create_chr: created chr-vhost-user-test unix:/tmp/vhost-test-=
jtqo81/vhost-user-test.sock,server=3Don,wait=3Doff
  vhost_user_test_setup: -M virt, -cpu max -device virtio-net-pci,netdev=3D=
hs0,addr=3D04.0
  restart_qemu_or_continue: starting -M virt, -cpu max -device virtio-net-p=
ci,netdev=3Dhs0,addr=3D04.0 -m 256 -object memory-backend-memfd,id=3Dmem,si=
ze=3D256M, -numa node,memdev=3Dmem=20
  -chardev socket,id=3Dchr-vhost-user-test,path=3D/tmp/vhost-test-jtqo81/vh=
ost-user-test.sock -netdev vhost-user,id=3Dhs0,chardev=3Dchr-vhost-user-tes=
t,vhostforce=3Don
  chr_event: 1=20=20=20=20=20=20=20=20=20=20
  vu_net_get_protocol_features: 0x42
  vu_net_get_protocol_features: sent 20 byte reply
  virtio_set_status: 0x55896cab9510/0
  virtio_set_status: 0x55896cab9510/0
  restart_qemu_or_continue: returned from qtest_start
  qos_machine_new: aarch64/virt
  qos_driver_new: virtio-net-pci
  virtio_set_status: 0x55896cab9510/0
  virtio_set_status: 0x55896cab9510/0
  virtio_set_status: 0x55896cab9510/1
  virtio_set_status: 0x55896cab9510/3
  virtio_set_status: 0x55896cab9510/7
  virtio_set_started: true
  virtio_pci_set_guest_notifiers: assign:true nvqs:2/0
  vhost_dev_start: 0x55896c1902c0 0x55896cab9510
  vu_net_set_features: 0x40000000
  test_read_guest_mem: start
  vhost_user_test_cleanup: shutting down
  qemu_chr_be_event: closing chr-vhost-user-test/disconnected:unix:/tmp/vho=
st-test-jtqo81/vhost-user-test.sock
  qemu-system-aarch64:qemu_chr_be_event: closing chr-vhost-user-test/(null)
   Failed to set msg fds.
  qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argumen=
t (22)
  qemu-system-aarch64: Failed to set msg fds.=20
  qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argumen=
t (22)
  virtio_pci_set_guest_notifiers: assign:false nvqs:2/2
  virtio_set_status: 0x55896cab9510/7
  qemu_chr_be_event: closing chr-vhost-user-test/(null)
  qemu_chr_be_event: closing char0/(null)
  qemu_chr_be_event: closing qtest/(null)

I'm open to any suggestions of the best way to track down where the
chardev might be torn down and by who. Could it be the lifetime of the
QMP and vhost-user sockets is being limited somehow?

The backtrace shows the chardev in the state of G_IO_HUP which makes it
seem like the vhost-user daemon has dropped the connection as soon as it
has sent the protocol request reply?

--=20
Alex Benn=C3=A9e

