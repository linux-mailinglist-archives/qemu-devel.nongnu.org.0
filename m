Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025904F19A4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:00:21 +0200 (CEST)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbR00-0006oS-KB
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:00:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQyu-0005xS-1w
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nbQys-0003sZ-0d
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649095149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7/9NJJUl84V1HPpZAI5Ujk0qdu+7pN9VekhR6LXlgs=;
 b=hSi7HdI3W6ssuHUs0tIAnYCKQNiTY9qRdrdxH5rdf3Ei9JEMVHXXQEIw7EVIJ80sSGdg/W
 q7PbHmizNRjvrAf1uDfyM6obGgN7a7YV2N+xaCwEgdwPcvHe3qKPRqwIQyZIUQ/roU2DK4
 NJCtXUO2PSH2a39LsJWe89mhogMcvpI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-IW3EpjVCO2mf_-cigJAKEw-1; Mon, 04 Apr 2022 13:59:07 -0400
X-MC-Unique: IW3EpjVCO2mf_-cigJAKEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m3-20020a05600c3b0300b0038e74402cb6so6039wms.8
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 10:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=O7/9NJJUl84V1HPpZAI5Ujk0qdu+7pN9VekhR6LXlgs=;
 b=E+qE+xqxRfdFeRGV8ZQ/ApAS1cr8RWX9BMRoNPzYADkgXwQ9eqMa8XhSj2jSH5xFpz
 Lc0efWv5cNcmW/WTqlPmyRIIfVmCCVsFdBU6HylboUIfE9X6WnJN2Rc7onwHsWpX28j9
 QDFHoRjG7WjTx1SApKLPPNvRWi6C3o2VHQLv/QLRvdsZN/JNSwi3her5KNZz8iiaTpKI
 h9qps8/r0UsWugLS2vzOEypCFXf5pycxBTTySjvKm5vZHjsd1+MnkRn65AVmyl2tKk6d
 8LptlOKQIjscCeRG1qJk02Rdv5ARRltWoa7hkThA0TazPZvHuRGQJJmefPBrl9sEAswp
 zkkA==
X-Gm-Message-State: AOAM531ULyXt5vzttjCUH+kuuh6sVm+QAM6tqrmXmJQDoOd64kG/pqOj
 +Yc7uNnOiZlA8Vj/oAWa/xMpoog+2q8EZfPgwi6xwjltN6x7Cbg/iTSNXXSZAOacvCfC7PlnNJh
 OkzGZQ4PVNufU2As=
X-Received: by 2002:a5d:5255:0:b0:203:ec9c:6d5e with SMTP id
 k21-20020a5d5255000000b00203ec9c6d5emr763548wrc.70.1649095146599; 
 Mon, 04 Apr 2022 10:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGpYjCYM22JKksHkOnGzj97BE9BlvHLqRJwPflalUqItunlVZSjTceO1BTD6DYVzFTZRJBqQ==
X-Received: by 2002:a5d:5255:0:b0:203:ec9c:6d5e with SMTP id
 k21-20020a5d5255000000b00203ec9c6d5emr763526wrc.70.1649095146293; 
 Mon, 04 Apr 2022 10:59:06 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m4-20020a1c2604000000b0038e7c406557sm187912wmm.11.2022.04.04.10.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:59:05 -0700 (PDT)
Date: Mon, 4 Apr 2022 18:59:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-gpio
 (!working)
Message-ID: <Yksx58Lv5dv5GRUS@work-vm>
References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
 <20220121151534.3654562-1-alex.bennee@linaro.org>
 <87r16iwij6.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87r16iwij6.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@rehat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Bennée (alex.bennee@linaro.org) wrote:
> 
> (expanding the CC list for help, anyone have a better idea about how
> vhost-user qtests should work/see obvious issues with this patch?)

How exactly does it fail?

DAve

> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > We don't have a virtio-gpio implementation in QEMU and only
> > support a vhost-user backend. The QEMU side of the code is minimal so
> > it should be enough to instantiate the device and pass some vhost-user
> > messages over the control socket. To do this we hook into the existing
> > vhost-user-test code and just add the bits required for gpio.
> >
> > Based-on: 20220118203833.316741-1-eric.auger@redhat.com
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> >
> > ---
> >
> > This goes as far as to add things to the QOS tree but so far it's
> > failing to properly start QEMU with the chardev socket needed to
> > communicate between the mock vhost-user daemon and QEMU itself.
> > ---
> >  tests/qtest/libqos/virtio-gpio.h | 34 +++++++++++
> >  tests/qtest/libqos/virtio-gpio.c | 98 ++++++++++++++++++++++++++++++++
> >  tests/qtest/vhost-user-test.c    | 34 +++++++++++
> >  tests/qtest/libqos/meson.build   |  1 +
> >  4 files changed, 167 insertions(+)
> >  create mode 100644 tests/qtest/libqos/virtio-gpio.h
> >  create mode 100644 tests/qtest/libqos/virtio-gpio.c
> >
> > diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virtio-gpio.h
> > new file mode 100644
> > index 0000000000..abe6967ae9
> > --- /dev/null
> > +++ b/tests/qtest/libqos/virtio-gpio.h
> > @@ -0,0 +1,34 @@
> > +/*
> > + * virtio-gpio structures
> > + *
> > + * Copyright (c) 2022 Linaro Ltd
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
> > +#define TESTS_LIBQOS_VIRTIO_GPIO_H
> > +
> > +#include "qgraph.h"
> > +#include "virtio.h"
> > +#include "virtio-pci.h"
> > +
> > +typedef struct QVhostUserGPIO QVhostUserGPIO;
> > +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
> > +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
> > +
> > +struct QVhostUserGPIO {
> > +    QVirtioDevice *vdev;
> > +};
> > +
> > +struct QVhostUserGPIOPCI {
> > +    QVirtioPCIDevice pci_vdev;
> > +    QVhostUserGPIO gpio;
> > +};
> > +
> > +struct QVhostUserGPIODevice {
> > +    QOSGraphObject obj;
> > +    QVhostUserGPIO gpio;
> > +};
> > +
> > +#endif
> > diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
> > new file mode 100644
> > index 0000000000..62c8074777
> > --- /dev/null
> > +++ b/tests/qtest/libqos/virtio-gpio.c
> > @@ -0,0 +1,98 @@
> > +/*
> > + * virtio-gpio nodes for testing
> > + *
> > + * Copyright (c) 2022 Linaro Ltd
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qemu/module.h"
> > +#include "qgraph.h"
> > +#include "virtio-gpio.h"
> > +
> > +static void *qvirtio_gpio_get_driver(QVhostUserGPIO *v_gpio,
> > +                                       const char *interface)
> > +{
> > +    if (!g_strcmp0(interface, "vhost-user-gpio")) {
> > +        return v_gpio;
> > +    }
> > +    if (!g_strcmp0(interface, "virtio")) {
> > +        return v_gpio->vdev;
> > +    }
> > +
> > +    fprintf(stderr, "%s not present in virtio-gpio-device\n", interface);
> > +    g_assert_not_reached();
> > +}
> > +
> > +static void *qvirtio_gpio_device_get_driver(void *object,
> > +                                              const char *interface)
> > +{
> > +    QVhostUserGPIODevice *v_gpio = object;
> > +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
> > +}
> > +
> > +static void *virtio_gpio_device_create(void *virtio_dev,
> > +                                         QGuestAllocator *t_alloc,
> > +                                         void *addr)
> > +{
> > +    QVhostUserGPIODevice *virtio_device = g_new0(QVhostUserGPIODevice, 1);
> > +    QVhostUserGPIO *interface = &virtio_device->gpio;
> > +
> > +    interface->vdev = virtio_dev;
> > +
> > +    virtio_device->obj.get_driver = qvirtio_gpio_device_get_driver;
> > +
> > +    return &virtio_device->obj;
> > +}
> > +
> > +/* virtio-gpio-pci */
> > +static void *qvirtio_gpio_pci_get_driver(void *object, const char *interface)
> > +{
> > +    QVhostUserGPIOPCI *v_gpio = object;
> > +    if (!g_strcmp0(interface, "pci-device")) {
> > +        return v_gpio->pci_vdev.pdev;
> > +    }
> > +    return qvirtio_gpio_get_driver(&v_gpio->gpio, interface);
> > +}
> > +
> > +static void *virtio_gpio_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
> > +                                      void *addr)
> > +{
> > +    QVhostUserGPIOPCI *virtio_spci = g_new0(QVhostUserGPIOPCI, 1);
> > +    QVhostUserGPIO *interface = &virtio_spci->gpio;
> > +    QOSGraphObject *obj = &virtio_spci->pci_vdev.obj;
> > +
> > +    virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
> > +    interface->vdev = &virtio_spci->pci_vdev.vdev;
> > +
> > +    obj->get_driver = qvirtio_gpio_pci_get_driver;
> > +
> > +    return obj;
> > +}
> > +
> > +static void virtio_gpio_register_nodes(void)
> > +{
> > +    QPCIAddress addr = {
> > +        .devfn = QPCI_DEVFN(4, 0),
> > +    };
> > +
> > +    QOSGraphEdgeOptions edge_opts = { };
> > +
> > +    /* vhost-user-gpio-device */
> > +    edge_opts.extra_device_opts = "id=gpio0,chardev=vhgpio0";
> > +    qos_node_create_driver("vhost-user-gpio-device",
> > +                            virtio_gpio_device_create);
> > +    qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
> > +    qos_node_produces("vhost-user-gpio-device", "vhost-user-gpio");
> > +
> > +    /* virtio-gpio-pci */
> > +    edge_opts.extra_device_opts = "id=gpio0,addr=04.0,chardev=vhgpio0";
> > +    add_qpci_address(&edge_opts, &addr);
> > +    qos_node_create_driver("vhost-user-gpio-pci", virtio_gpio_pci_create);
> > +    qos_node_consumes("vhost-user-gpio-pci", "pci-bus", &edge_opts);
> > +    qos_node_produces("vhost-user-gpio-pci", "vhost-user-gpio");
> > +}
> > +
> > +libqos_init(virtio_gpio_register_nodes);
> > diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> > index ee30f54796..4f8789424b 100644
> > --- a/tests/qtest/vhost-user-test.c
> > +++ b/tests/qtest/vhost-user-test.c
> > @@ -43,6 +43,7 @@
> >                          " -numa node,memdev=mem"
> >  #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
> >  #define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
> > +#define QEMU_CMD_GPIO   " -device vhost-user-gpio-pci,id=gpio0,chardev=%s,vhostforce=on"
> >  
> >  #define HUGETLBFS_MAGIC       0x958458f6
> >  
> > @@ -137,6 +138,7 @@ enum {
> >  
> >  enum {
> >      VHOST_USER_NET,
> > +    VHOST_USER_GPIO,
> >  };
> >  
> >  typedef struct TestServer {
> > @@ -194,6 +196,14 @@ static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
> >                             chr_opts, s->chr_name);
> >  }
> >  
> > +static void append_vhost_gpio_opts(TestServer *s, GString *cmd_line,
> > +                             const char *chr_opts)
> > +{
> > +    g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_GPIO,
> > +                           s->chr_name, s->socket_path,
> > +                           chr_opts, s->chr_name);
> > +}
> > +
> >  static void append_mem_opts(TestServer *server, GString *cmd_line,
> >                              int size, enum test_memfd memfd)
> >  {
> > @@ -1014,3 +1024,27 @@ static void register_vhost_user_test(void)
> >                   test_multiqueue, &opts);
> >  }
> >  libqos_init(register_vhost_user_test);
> > +
> > +static struct vhost_user_ops g_vu_gpio_ops = {
> > +    .type = VHOST_USER_GPIO,
> > +
> > +    .append_opts = append_vhost_gpio_opts,
> > +
> > +    .set_features = vu_net_set_features,
> > +    .get_protocol_features = vu_net_get_protocol_features,
> > +};
> > +
> > +static void register_vhost_gpio_test(void)
> > +{
> > +    QOSGraphTestOptions opts = {
> > +        .before = vhost_user_test_setup,
> > +        .subprocess = true,
> > +        .arg = &g_vu_gpio_ops,
> > +    };
> > +
> > +    qemu_add_opts(&qemu_chardev_opts);
> > +
> > +    qos_add_test("read-guest-mem/memfile",
> > +                 "vhost-user-gpio", test_read_guest_mem, &opts);
> > +}
> > +libqos_init(register_vhost_gpio_test);
> > diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> > index 8c8ee15553..f581330d8b 100644
> > --- a/tests/qtest/libqos/meson.build
> > +++ b/tests/qtest/libqos/meson.build
> > @@ -42,6 +42,7 @@ libqos_srcs = files('../libqtest.c',
> >          'virtio-scsi.c',
> >          'virtio-serial.c',
> >          'virtio-iommu.c',
> > +        'virtio-gpio.c',
> >          'generic-pcihost.c',
> >  
> >          # qgraph machines:
> 
> 
> -- 
> Alex Bennée
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


