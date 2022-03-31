Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA44ED768
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:59:35 +0200 (CEST)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZraY-0004cY-JZ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:59:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZrZE-0003pL-53
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:58:13 -0400
Received: from [2a00:1450:4864:20::62d] (port=36403
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZrZA-0002Ee-Kq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:58:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bi12so47042585ejb.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XToN3vxo+nFmM6TCL6S3hupMunMN0P6nWRI3xIWNkFs=;
 b=CuRZNp88c11Xmd9bpzbMGOLhzua2tw7mLJXZp0NzmPiMyCxFYIpMVvmS2tS4Ob7IBe
 mExmyW6lE3leLLwXWEnZuI2bbnMDAhy+ETWWau6YcTxPNNgzD83fwFbCNKSZD8ncaj5T
 jzbXj1UOklFXYl8ouD07AUpMHR2hEGPoQTCdv14iOWzi8yV6wtwhpPmNv+kh9awFuWlU
 KIVpRMocv+vOwCFULj/vsUW9BF9IrFklP5nrSanGuuYAfjY7D+ua3LZzekNQL8TZVQzV
 CeD2QlvrJOJTDKr8oAuPqnY7vKz6uJ7I2Log579hSeQCgWdtoxOTKsiycONvj0tqxwYC
 Mx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XToN3vxo+nFmM6TCL6S3hupMunMN0P6nWRI3xIWNkFs=;
 b=If5zDiuXuCctPK759XfBBDGbcLABJXZaX1kWYT+YaBWdmOES+8ntnUwZm+LtQ3o49z
 ztZjXQKexM60zTD9PBfEhrZjQpydUWP5EYw7ZkfObPQ7KQfCzz8oxTCTNcNSvJKidTCD
 WnKFPxC482Rhcmp1ooYJeRpanJxc6LTkRU1G/LwNfNstJvnjO4rwPjP/IqnMk163RJvB
 XWIy6Z0X+r14ikVIOKzCHU3bhwzRFk2ksEmrrHCw5IgIBiXswPKdx4ZjVewUGAPJpEgq
 PITyetTA4GtiFSONC0/Y7Y2VWaaDsGFDDmL1DHvLWnuWvpMuv7degpTDrqAlSAmYCNkE
 NHsw==
X-Gm-Message-State: AOAM533/gqfhqunI3xPHv6Be4rePeZAQLWQu1sti2C1CcpzvmxE/rBdb
 pFHwCfw84MlFEVz5BWUgxtKVEg==
X-Google-Smtp-Source: ABdhPJzBJ1i5kpXI96qw/+jNzQzEyRHtOIXFgNYZz9Y4fHdJM4b/EAGNA1HtTskNjGQogmzvVPZkdA==
X-Received: by 2002:a17:906:5418:b0:6df:a07f:764b with SMTP id
 q24-20020a170906541800b006dfa07f764bmr4096053ejo.27.1648720686988; 
 Thu, 31 Mar 2022 02:58:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170906728800b006e0351df2dcsm9345789ejl.70.2022.03.31.02.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 02:58:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7225F1FFB7;
 Thu, 31 Mar 2022 10:58:05 +0100 (BST)
References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
 <20220121151534.3654562-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] tests/qtest: attempt to enable tests for
 virtio-gpio (!working)
Date: Thu, 31 Mar 2022 10:52:56 +0100
In-reply-to: <20220121151534.3654562-1-alex.bennee@linaro.org>
Message-ID: <87r16iwij6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@rehat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


(expanding the CC list for help, anyone have a better idea about how
vhost-user qtests should work/see obvious issues with this patch?)

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We don't have a virtio-gpio implementation in QEMU and only
> support a vhost-user backend. The QEMU side of the code is minimal so
> it should be enough to instantiate the device and pass some vhost-user
> messages over the control socket. To do this we hook into the existing
> vhost-user-test code and just add the bits required for gpio.
>
> Based-on: 20220118203833.316741-1-eric.auger@redhat.com
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
>
> ---
>
> This goes as far as to add things to the QOS tree but so far it's
> failing to properly start QEMU with the chardev socket needed to
> communicate between the mock vhost-user daemon and QEMU itself.
> ---
>  tests/qtest/libqos/virtio-gpio.h | 34 +++++++++++
>  tests/qtest/libqos/virtio-gpio.c | 98 ++++++++++++++++++++++++++++++++
>  tests/qtest/vhost-user-test.c    | 34 +++++++++++
>  tests/qtest/libqos/meson.build   |  1 +
>  4 files changed, 167 insertions(+)
>  create mode 100644 tests/qtest/libqos/virtio-gpio.h
>  create mode 100644 tests/qtest/libqos/virtio-gpio.c
>
> diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio=
-gpio.h
> new file mode 100644
> index 0000000000..abe6967ae9
> --- /dev/null
> +++ b/tests/qtest/libqos/virtio-gpio.h
> @@ -0,0 +1,34 @@
> +/*
> + * virtio-gpio structures
> + *
> + * Copyright (c) 2022 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
> +#define TESTS_LIBQOS_VIRTIO_GPIO_H
> +
> +#include "qgraph.h"
> +#include "virtio.h"
> +#include "virtio-pci.h"
> +
> +typedef struct QVhostUserGPIO QVhostUserGPIO;
> +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
> +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
> +
> +struct QVhostUserGPIO {
> +    QVirtioDevice *vdev;
> +};
> +
> +struct QVhostUserGPIOPCI {
> +    QVirtioPCIDevice pci_vdev;
> +    QVhostUserGPIO gpio;
> +};
> +
> +struct QVhostUserGPIODevice {
> +    QOSGraphObject obj;
> +    QVhostUserGPIO gpio;
> +};
> +
> +#endif
> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio=
-gpio.c
> new file mode 100644
> index 0000000000..62c8074777
> --- /dev/null
> +++ b/tests/qtest/libqos/virtio-gpio.c
> @@ -0,0 +1,98 @@
> +/*
> + * virtio-gpio nodes for testing
> + *
> + * Copyright (c) 2022 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qemu/module.h"
> +#include "qgraph.h"
> +#include "virtio-gpio.h"
> +
> +static void *qvirtio_gpio_get_driver(QVhostUserGPIO *v_gpio,
> +                                       const char *interface)
> +{
> +    if (!g_strcmp0(interface, "vhost-user-gpio")) {
> +        return v_gpio;
> +    }
> +    if (!g_strcmp0(interface, "virtio")) {
> +        return v_gpio->vdev;
> +    }
> +
> +    fprintf(stderr, "%s not present in virtio-gpio-device\n", interface);
> +    g_assert_not_reached();
> +}
> +
> +static void *qvirtio_gpio_device_get_driver(void *object,
> +                                              const char *interface)
> +{
> +    QVhostUserGPIODevice *v_gpio =3D object;
> +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
> +}
> +
> +static void *virtio_gpio_device_create(void *virtio_dev,
> +                                         QGuestAllocator *t_alloc,
> +                                         void *addr)
> +{
> +    QVhostUserGPIODevice *virtio_device =3D g_new0(QVhostUserGPIODevice,=
 1);
> +    QVhostUserGPIO *interface =3D &virtio_device->gpio;
> +
> +    interface->vdev =3D virtio_dev;
> +
> +    virtio_device->obj.get_driver =3D qvirtio_gpio_device_get_driver;
> +
> +    return &virtio_device->obj;
> +}
> +
> +/* virtio-gpio-pci */
> +static void *qvirtio_gpio_pci_get_driver(void *object, const char *inter=
face)
> +{
> +    QVhostUserGPIOPCI *v_gpio =3D object;
> +    if (!g_strcmp0(interface, "pci-device")) {
> +        return v_gpio->pci_vdev.pdev;
> +    }
> +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
> +}
> +
> +static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t_al=
loc,
> +                                      void *addr)
> +{
> +    QVhostUserGPIOPCI *virtio_spci =3D g_new0(QVhostUserGPIOPCI, 1);
> +    QVhostUserGPIO *interface =3D &virtio_spci->gpio;
> +    QOSGraphObject *obj =3D &virtio_spci->pci_vdev.obj;
> +
> +    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
> +    interface->vdev =3D &virtio_spci->pci_vdev.vdev;
> +
> +    obj->get_driver =3D qvirtio_gpio_pci_get_driver;
> +
> +    return obj;
> +}
> +
> +static void virtio_gpio_register_nodes(void)
> +{
> +    QPCIAddress addr =3D {
> +        .devfn =3D QPCI_DEVFN(4, 0),
> +    };
> +
> +    QOSGraphEdgeOptions edge_opts =3D { };
> +
> +    /* vhost-user-gpio-device */
> +    edge_opts.extra_device_opts =3D "id=3Dgpio0,chardev=3Dvhgpio0";
> +    qos_node_create_driver("vhost-user-gpio-device",
> +                            virtio_gpio_device_create);
> +    qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts=
);
> +    qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
> +
> +    /* virtio-gpio-pci */
> +    edge_opts.extra_device_opts =3D "id=3Dgpio0,addr=3D04.0,chardev=3Dvh=
gpio0";
> +    add_qpci_address(&edge_opts, &addr);
> +    qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create=
);
> +    qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
> +    qos_node_produces("vhost-user-gpio-pci", "vhost-user-gpio");
> +}
> +
> +libqos_init(virtio_gpio_register_nodes);
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index ee30f54796..4f8789424b 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -43,6 +43,7 @@
>                          " -numa node,memdev=3Dmem"
>  #define QEMU_CMD_CHR    " -chardev socket,id=3D%s,path=3D%s%s"
>  #define QEMU_CMD_NETDEV " -netdev vhost-user,id=3Dhs0,chardev=3D%s,vhost=
force=3Don"
> +#define QEMU_CMD_GPIO   " -device vhost-user-gpio-pci,id=3Dgpio0,chardev=
=3D%s,vhostforce=3Don"
>=20=20
>  #define HUGETLBFS_MAGIC       0x958458f6
>=20=20
> @@ -137,6 +138,7 @@ enum {
>=20=20
>  enum {
>      VHOST_USER_NET,
> +    VHOST_USER_GPIO,
>  };
>=20=20
>  typedef struct TestServer {
> @@ -194,6 +196,14 @@ static void append_vhost_net_opts(TestServer *s, GSt=
ring *cmd_line,
>                             chr_opts, s->chr_name);
>  }
>=20=20
> +static void append_vhost_gpio_opts(TestServer *s, GString *cmd_line,
> +                             const char *chr_opts)
> +{
> +    g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_GPIO,
> +                           s->chr_name, s->socket_path,
> +                           chr_opts, s->chr_name);
> +}
> +
>  static void append_mem_opts(TestServer *server, GString *cmd_line,
>                              int size, enum test_memfd memfd)
>  {
> @@ -1014,3 +1024,27 @@ static void register_vhost_user_test(void)
>                   test_multiqueue, &opts);
>  }
>  libqos_init(register_vhost_user_test);
> +
> +static struct vhost_user_ops g_vu_gpio_ops =3D {
> +    .type =3D VHOST_USER_GPIO,
> +
> +    .append_opts =3D append_vhost_gpio_opts,
> +
> +    .set_features =3D vu_net_set_features,
> +    .get_protocol_features =3D vu_net_get_protocol_features,
> +};
> +
> +static void register_vhost_gpio_test(void)
> +{
> +    QOSGraphTestOptions opts =3D {
> +        .before =3D vhost_user_test_setup,
> +        .subprocess =3D true,
> +        .arg =3D &g_vu_gpio_ops,
> +    };
> +
> +    qemu_add_opts(&qemu_chardev_opts);
> +
> +    qos_add_test("read-guest-mem/memfile",
> +                 "vhost-user-gpio", test_read_guest_mem, &opts);
> +}
> +libqos_init(register_vhost_gpio_test);
> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.bu=
ild
> index 8c8ee15553..f581330d8b 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -42,6 +42,7 @@ libqos_srcs =3D files('../libqtest.c',
>          'virtio-scsi.c',
>          'virtio-serial.c',
>          'virtio-iommu.c',
> +        'virtio-gpio.c',
>          'generic-pcihost.c',
>=20=20
>          # qgraph machines:


--=20
Alex Benn=C3=A9e

