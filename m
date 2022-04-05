Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA224F35D7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:54:51 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjdy-0001Ap-7B
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbjZ8-0004Ce-EA
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:49:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbjZ6-0005cU-0Q
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:49:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id q19so12490107wrc.6
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IjBmp4ABlRhXEDpbkc6HTatqKoRVmCrlTCRSM+MbLb4=;
 b=Cqbwej2yycdIVtsJ1/K3plpZ6NsaJybSQfNN+4leSGroHtzjatyYS9Q84yOkBLAnRu
 Yyq/zkqLFw7lj1NpDXuyS2ESV8AtAUgraYPH3SOyovh0i1xTVwQX5uTT6KWDsFIM9vIr
 YyufXgE+O9lBn+4ZwPePfiSXsVnhkVGfrCyP3A5myL4n3XHr0zFwXZ3T4bApUEJHSY6h
 ACXRq98Fg6QuJgYGfYWGZc77pgrBxijxYHJeH5SUys/y1UHOiEHpxrDUKbOPLAg1Qpii
 XtjHor86txHHLL4YvPOIJ2k3ZHyHBflyppRraZZD8mvPBqbniRv6nT9p6VlVDHa8QSNR
 l+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IjBmp4ABlRhXEDpbkc6HTatqKoRVmCrlTCRSM+MbLb4=;
 b=E3qba5U9bOv1kCTnwIaVZGA9b7igWrX1PwWIlES4SYaZQ6IB0mVrHUdTWxvYA2PeHR
 q6qUXEBEHuPw6qxz7K97Fb6rY0CcVWwCNUcPmDeG28MxzKbeNP3urv2odBn+5pPvcCTt
 VwMQbUDKy5Sm6BSXLZVkbqe9HFYGNVXUpkxj9AG+92tTXqbE/WwEDYOYHr42gEQs/I1c
 juGOOpY5yi1WgwZFJ+LxsJ5q1mUtupZ/97U3IvAyWTWGp27Mxal+Vwf1rhar8Qg41bmn
 Wd8gFsQENlmuux1A+1pUqGCL4qsIfw/61+syp6KZiQAIvfMk8g1pXMWMWzIMAjNU6GtG
 xniw==
X-Gm-Message-State: AOAM5313FLEjgbHBXHqogP5sfc4AlkEMJvP7mTh0vWAxAhoe2UU8dmic
 AM0nyt/eFQGmkN1qzS0IH+giUA==
X-Google-Smtp-Source: ABdhPJyTvNkNUtnU+269e1vGagFZs6+9N2fkUWa1dpiYT9IaL6DDcPyM8ZcyDnGq8JZ5OwOPilyFzg==
X-Received: by 2002:a5d:5889:0:b0:204:1ccf:a04 with SMTP id
 n9-20020a5d5889000000b002041ccf0a04mr2782612wrf.197.1649166585926; 
 Tue, 05 Apr 2022 06:49:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm2438577wmq.21.2022.04.05.06.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:49:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 885861FFB7;
 Tue,  5 Apr 2022 14:49:43 +0100 (BST)
References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
 <20220121151534.3654562-1-alex.bennee@linaro.org>
 <87r16iwij6.fsf@linaro.org> <Yksx58Lv5dv5GRUS@work-vm>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH] tests/qtest: attempt to enable tests for
 virtio-gpio (!working)
Date: Tue, 05 Apr 2022 14:46:49 +0100
In-reply-to: <Yksx58Lv5dv5GRUS@work-vm>
Message-ID: <878rsjljwo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@rehat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>>=20
>> (expanding the CC list for help, anyone have a better idea about how
>> vhost-user qtests should work/see obvious issues with this patch?)
>
> How exactly does it fail?

=E2=9E=9C  env QTEST_QEMU_BINARY=3D./qemu-system-aarch64 QTEST_QEMU_STORAGE=
_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon G_TEST_DBUS_DAEMON=3D=
/home/alex/lsrc/qemu.git/tests/dbus-v
mstate-daemon.sh QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D137 ./tests/=
qtest/qos-test -p /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vho=
st-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfi=
le
# random seed: R02S5d7667675b4f6dd3b8559f8db621296c
# starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-1245871.=
sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1245871.qmp,id=
=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -machine none -a=
ccel qtest
# Start of aarch64 tests
# Start of virt tests
# Start of generic-pcihost tests
# Start of pci-bus-generic tests
# Start of pci-bus tests
# Start of vhost-user-gpio-pci tests
# Start of vhost-user-gpio tests
# Start of vhost-user-gpio-tests tests
# Start of read-guest-mem tests
# child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhos=
t-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfil=
e/subprocess [1245877])
 exit status: 1 (error)
# child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhos=
t-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfil=
e/subprocess [1245877]) stdout: ""
# child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhos=
t-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfil=
e/subprocess [1245877]) stderr: "qemu-system-aarch64: -device vhost-user-gp=
io-pci,id=3Dgpio0,chardev=3Dchr-vhost-user-test,vhostforce=3Don: Duplicate =
ID 'gpio0' for device\nsocket_accept failed: Resource temporarily unavailab=
le\n**\nERROR:../../tests/qtest/libqtest.c:321:qtest_init_without_qmp_hands=
hake: assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)\n"
**
ERROR:../../tests/qtest/qos-test.c:189:subprocess_run_one_test: child proce=
ss (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpio-p=
ci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess =
[1245877]) failed unexpectedly
Bail out! ERROR:../../tests/qtest/qos-test.c:189:subprocess_run_one_test: c=
hild process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-u=
ser-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/s=
ubprocess [1245877]) failed unexpectedly
fish: =E2=80=9Cenv QTEST_QEMU_BINARY=3D./qemu-sy=E2=80=A6=E2=80=9D terminat=
ed by signal SIGABRT
(Abort)

Although it would be nice if I could individually run qos-tests with all
the make machinery setting things up.


>
> DAve
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> > We don't have a virtio-gpio implementation in QEMU and only
>> > support a vhost-user backend. The QEMU side of the code is minimal so
>> > it should be enough to instantiate the device and pass some vhost-user
>> > messages over the control socket. To do this we hook into the existing
>> > vhost-user-test code and just add the bits required for gpio.
>> >
>> > Based-on: 20220118203833.316741-1-eric.auger@redhat.com
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> > Cc: Paolo Bonzini <pbonzini@redhat.com>
>> >
>> > ---
>> >
>> > This goes as far as to add things to the QOS tree but so far it's
>> > failing to properly start QEMU with the chardev socket needed to
>> > communicate between the mock vhost-user daemon and QEMU itself.
>> > ---
>> >  tests/qtest/libqos/virtio-gpio.h | 34 +++++++++++
>> >  tests/qtest/libqos/virtio-gpio.c | 98 ++++++++++++++++++++++++++++++++
>> >  tests/qtest/vhost-user-test.c    | 34 +++++++++++
>> >  tests/qtest/libqos/meson.build   |  1 +
>> >  4 files changed, 167 insertions(+)
>> >  create mode 100644 tests/qtest/libqos/virtio-gpio.h
>> >  create mode 100644 tests/qtest/libqos/virtio-gpio.c
>> >
>> > diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/vir=
tio-gpio.h
>> > new file mode 100644
>> > index 0000000000..abe6967ae9
>> > --- /dev/null
>> > +++ b/tests/qtest/libqos/virtio-gpio.h
>> > @@ -0,0 +1,34 @@
>> > +/*
>> > + * virtio-gpio structures
>> > + *
>> > + * Copyright (c) 2022 Linaro Ltd
>> > + *
>> > + * SPDX-License-Identifier: GPL-2.0-or-later
>> > + */
>> > +
>> > +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
>> > +#define TESTS_LIBQOS_VIRTIO_GPIO_H
>> > +
>> > +#include "qgraph.h"
>> > +#include "virtio.h"
>> > +#include "virtio-pci.h"
>> > +
>> > +typedef struct QVhostUserGPIO QVhostUserGPIO;
>> > +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
>> > +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
>> > +
>> > +struct QVhostUserGPIO {
>> > +    QVirtioDevice *vdev;
>> > +};
>> > +
>> > +struct QVhostUserGPIOPCI {
>> > +    QVirtioPCIDevice pci_vdev;
>> > +    QVhostUserGPIO gpio;
>> > +};
>> > +
>> > +struct QVhostUserGPIODevice {
>> > +    QOSGraphObject obj;
>> > +    QVhostUserGPIO gpio;
>> > +};
>> > +
>> > +#endif
>> > diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/vir=
tio-gpio.c
>> > new file mode 100644
>> > index 0000000000..62c8074777
>> > --- /dev/null
>> > +++ b/tests/qtest/libqos/virtio-gpio.c
>> > @@ -0,0 +1,98 @@
>> > +/*
>> > + * virtio-gpio nodes for testing
>> > + *
>> > + * Copyright (c) 2022 Linaro Ltd
>> > + *
>> > + * SPDX-License-Identifier: GPL-2.0-or-later
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "libqtest.h"
>> > +#include "qemu/module.h"
>> > +#include "qgraph.h"
>> > +#include "virtio-gpio.h"
>> > +
>> > +static void *qvirtio_gpio_get_driver(QVhostUserGPIO *v_gpio,
>> > +                                       const char *interface)
>> > +{
>> > +    if (!g_strcmp0(interface, "vhost-user-gpio")) {
>> > +        return v_gpio;
>> > +    }
>> > +    if (!g_strcmp0(interface, "virtio")) {
>> > +        return v_gpio->vdev;
>> > +    }
>> > +
>> > +    fprintf(stderr, "%s not present in virtio-gpio-device\n", interfa=
ce);
>> > +    g_assert_not_reached();
>> > +}
>> > +
>> > +static void *qvirtio_gpio_device_get_driver(void *object,
>> > +                                              const char *interface)
>> > +{
>> > +    QVhostUserGPIODevice *v_gpio =3D object;
>> > +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
>> > +}
>> > +
>> > +static void *virtio_gpio_device_create(void *virtio_dev,
>> > +                                         QGuestAllocator *t_alloc,
>> > +                                         void *addr)
>> > +{
>> > +    QVhostUserGPIODevice *virtio_device =3D g_new0(QVhostUserGPIODevi=
ce, 1);
>> > +    QVhostUserGPIO *interface =3D &virtio_device->gpio;
>> > +
>> > +    interface->vdev =3D virtio_dev;
>> > +
>> > +    virtio_device->obj.get_driver =3D qvirtio_gpio_device_get_driver;
>> > +
>> > +    return &virtio_device->obj;
>> > +}
>> > +
>> > +/* virtio-gpio-pci */
>> > +static void *qvirtio_gpio_pci_get_driver(void *object, const char *in=
terface)
>> > +{
>> > +    QVhostUserGPIOPCI *v_gpio =3D object;
>> > +    if (!g_strcmp0(interface, "pci-device")) {
>> > +        return v_gpio->pci_vdev.pdev;
>> > +    }
>> > +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
>> > +}
>> > +
>> > +static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t=
_alloc,
>> > +                                      void *addr)
>> > +{
>> > +    QVhostUserGPIOPCI *virtio_spci =3D g_new0(QVhostUserGPIOPCI, 1);
>> > +    QVhostUserGPIO *interface =3D &virtio_spci->gpio;
>> > +    QOSGraphObject *obj =3D &virtio_spci->pci_vdev.obj;
>> > +
>> > +    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
>> > +    interface->vdev =3D &virtio_spci->pci_vdev.vdev;
>> > +
>> > +    obj->get_driver =3D qvirtio_gpio_pci_get_driver;
>> > +
>> > +    return obj;
>> > +}
>> > +
>> > +static void virtio_gpio_register_nodes(void)
>> > +{
>> > +    QPCIAddress addr =3D {
>> > +        .devfn =3D QPCI_DEVFN(4, 0),
>> > +    };
>> > +
>> > +    QOSGraphEdgeOptions edge_opts =3D { };
>> > +
>> > +    /* vhost-user-gpio-device */
>> > +    edge_opts.extra_device_opts =3D "id=3Dgpio0,chardev=3Dvhgpio0";
>> > +    qos_node_create_driver("vhost-user-gpio-device",
>> > +                            virtio_gpio_device_create);
>> > +    qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_o=
pts);
>> > +    qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
>> > +
>> > +    /* virtio-gpio-pci */
>> > +    edge_opts.extra_device_opts =3D "id=3Dgpio0,addr=3D04.0,chardev=
=3Dvhgpio0";
>> > +    add_qpci_address(&edge_opts, &addr);
>> > +    qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_cre=
ate);
>> > +    qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
>> > +    qos_node_produces("vhost-user-gpio-pci", "vhost-user-gpio");
>> > +}
>> > +
>> > +libqos_init(virtio_gpio_register_nodes);
>> > diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-te=
st.c
>> > index ee30f54796..4f8789424b 100644
>> > --- a/tests/qtest/vhost-user-test.c
>> > +++ b/tests/qtest/vhost-user-test.c
>> > @@ -43,6 +43,7 @@
>> >                          " -numa node,memdev=3Dmem"
>> >  #define QEMU_CMD_CHR    " -chardev socket,id=3D%s,path=3D%s%s"
>> >  #define QEMU_CMD_NETDEV " -netdev vhost-user,id=3Dhs0,chardev=3D%s,vh=
ostforce=3Don"
>> > +#define QEMU_CMD_GPIO   " -device vhost-user-gpio-pci,id=3Dgpio0,char=
dev=3D%s,vhostforce=3Don"
>> >=20=20
>> >  #define HUGETLBFS_MAGIC       0x958458f6
>> >=20=20
>> > @@ -137,6 +138,7 @@ enum {
>> >=20=20
>> >  enum {
>> >      VHOST_USER_NET,
>> > +    VHOST_USER_GPIO,
>> >  };
>> >=20=20
>> >  typedef struct TestServer {
>> > @@ -194,6 +196,14 @@ static void append_vhost_net_opts(TestServer *s, =
GString *cmd_line,
>> >                             chr_opts, s->chr_name);
>> >  }
>> >=20=20
>> > +static void append_vhost_gpio_opts(TestServer *s, GString *cmd_line,
>> > +                             const char *chr_opts)
>> > +{
>> > +    g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_GPIO,
>> > +                           s->chr_name, s->socket_path,
>> > +                           chr_opts, s->chr_name);
>> > +}
>> > +
>> >  static void append_mem_opts(TestServer *server, GString *cmd_line,
>> >                              int size, enum test_memfd memfd)
>> >  {
>> > @@ -1014,3 +1024,27 @@ static void register_vhost_user_test(void)
>> >                   test_multiqueue, &opts);
>> >  }
>> >  libqos_init(register_vhost_user_test);
>> > +
>> > +static struct vhost_user_ops g_vu_gpio_ops =3D {
>> > +    .type =3D VHOST_USER_GPIO,
>> > +
>> > +    .append_opts =3D append_vhost_gpio_opts,
>> > +
>> > +    .set_features =3D vu_net_set_features,
>> > +    .get_protocol_features =3D vu_net_get_protocol_features,
>> > +};
>> > +
>> > +static void register_vhost_gpio_test(void)
>> > +{
>> > +    QOSGraphTestOptions opts =3D {
>> > +        .before =3D vhost_user_test_setup,
>> > +        .subprocess =3D true,
>> > +        .arg =3D &g_vu_gpio_ops,
>> > +    };
>> > +
>> > +    qemu_add_opts(&qemu_chardev_opts);
>> > +
>> > +    qos_add_test("read-guest-mem/memfile",
>> > +                 "vhost-user-gpio", test_read_guest_mem, &opts);
>> > +}
>> > +libqos_init(register_vhost_gpio_test);
>> > diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson=
.build
>> > index 8c8ee15553..f581330d8b 100644
>> > --- a/tests/qtest/libqos/meson.build
>> > +++ b/tests/qtest/libqos/meson.build
>> > @@ -42,6 +42,7 @@ libqos_srcs =3D files('../libqtest.c',
>> >          'virtio-scsi.c',
>> >          'virtio-serial.c',
>> >          'virtio-iommu.c',
>> > +        'virtio-gpio.c',
>> >          'generic-pcihost.c',
>> >=20=20
>> >          # qgraph machines:
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>>=20


--=20
Alex Benn=C3=A9e

