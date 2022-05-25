Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A35346BE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 00:39:28 +0200 (CEST)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntzf4-0002SP-JM
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 18:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntzd5-0001j1-3K
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:37:23 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntzd2-0006Hm-TK
 for qemu-devel@nongnu.org; Wed, 25 May 2022 18:37:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id i40so28766150eda.7
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+x43bF/VI3FWiRLjCwG9t5G3uFFiPYxB41efH9539XY=;
 b=SwTvVZfvnLalOJIm+rprjgQhZ49QHxxMdNnDDOlKBCCZdLWznNDqqUlRklGxdFC+4F
 2TZVNKFtkcqgOXLQCGLPDz5EuieyujC7faQyVllXNJkZo4JN90q80wSrhzn18H5zE8Em
 nPR+XPM/lLfFMUEYimr01XoYqx34euoN+jYIZt8ZyCSZ1Ta9Alk7llU1ISfaNYep3TIE
 BFVzFkjg/d+6yBUioN5z1hAzPkUR/nc5d8hgbP2MgLd5SV3xGBtcJv9dCQr5oYHGhCRk
 9qYfpxpogc80ZyEPqFwwYBQtWIJ//WoSjb8ho8mU+j4LayAU6qQ/9+OeFmer2fbzC9Sd
 Cg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+x43bF/VI3FWiRLjCwG9t5G3uFFiPYxB41efH9539XY=;
 b=4TYbWWqCrbI6EyFz2M/wd6oquCUerl9zDvjL/U8oEY74RUTJ+ivWew6PfoWtsOWvfx
 z3vqb2diYgC+fyQAzZi6GsFxPvKcsMnloWErBi8Rak/5NCPTzFZn2hTXcW7qZPumj80L
 YSG3XVjvxVlEdsj1BKjRn96r8JTkgPGYUhoc6cTwpjalCXT/kybtYFVPj3T6yQnkXtpd
 p5L296jg3mCzjfQZyLTt0Nj66bTzs4oE/H/Zym61Bq4BBTV5wCjw5SLn7bYhFKm+rln9
 8U8LUanSzM3YIJz7kcE2kPEkUYHiQjFALQbv6zvwXl8W5eiI9ONohDA0StQYO2QLasO6
 MN3Q==
X-Gm-Message-State: AOAM533hxavKyPiL9yHTWcwvdMSEr8vMZQTVLqoVzpjpMTuO4ZKn3QNr
 tOVMrH+hs0Y7y2s9FRnhZetqFA==
X-Google-Smtp-Source: ABdhPJxSxahDMW0xYwaHWtzMe6KSz6thBKp5a5tRkEq2m/TqCH/8I/+KxaMuFKEtvHCOKRDPEuT9qQ==
X-Received: by 2002:a05:6402:1cc1:b0:428:a06e:a30f with SMTP id
 ds1-20020a0564021cc100b00428a06ea30fmr36165093edb.377.1653518239207; 
 Wed, 25 May 2022 15:37:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ov12-20020a170906fc0c00b006febe0b57efsm4949604ejb.72.2022.05.25.15.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 15:37:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E62EC1FFB7;
 Wed, 25 May 2022 23:37:16 +0100 (BST)
References: <Yo5WsY4Kcr8x8LQj@stefanha-x1.localdomain>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [PATCH  v2 15/15] tests/qtest: enable tests for virtio-gpio
Date: Wed, 25 May 2022 23:35:53 +0100
In-reply-to: <Yo5WsY4Kcr8x8LQj@stefanha-x1.localdomain>
Message-ID: <878rqp1boj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Tue, May 24, 2022 at 04:40:56PM +0100, Alex Benn=C3=A9e wrote:
>> We don't have a virtio-gpio implementation in QEMU and only
>> support a vhost-user backend. The QEMU side of the code is minimal so
>> it should be enough to instantiate the device and pass some vhost-user
>> messages over the control socket. To do this we hook into the existing
>> vhost-user-test code and just add the bits required for gpio.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Eric Auger <eric.auger@redhat.com>
>> Message-Id: <20220408155704.2777166-1-alex.bennee@linaro.org>
>>=20
>> ---
>> v2
>>   - add more of the missing boilerplate
>>   - don't request LOG_SHMD
>>   - use get_features op
>>   - report VIRTIO_F_VERSION_1
>>   - more comments
>> ---
>>  tests/qtest/libqos/virtio-gpio.h |  35 +++++++
>>  tests/qtest/libqos/virtio-gpio.c | 171 +++++++++++++++++++++++++++++++
>>  tests/qtest/libqos/virtio.c      |   2 +-
>>  tests/qtest/vhost-user-test.c    |  66 ++++++++++++
>>  tests/qtest/libqos/meson.build   |   1 +
>>  5 files changed, 274 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/qtest/libqos/virtio-gpio.h
>>  create mode 100644 tests/qtest/libqos/virtio-gpio.c
>>=20
>> diff --git a/tests/qtest/libqos/virtio-gpio.h b/tests/qtest/libqos/virti=
o-gpio.h
>> new file mode 100644
>> index 0000000000..f11d41bd19
>> --- /dev/null
>> +++ b/tests/qtest/libqos/virtio-gpio.h
>> @@ -0,0 +1,35 @@
>> +/*
>> + * virtio-gpio structures
>> + *
>> + * Copyright (c) 2022 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#ifndef TESTS_LIBQOS_VIRTIO_GPIO_H
>> +#define TESTS_LIBQOS_VIRTIO_GPIO_H
>> +
>> +#include "qgraph.h"
>> +#include "virtio.h"
>> +#include "virtio-pci.h"
>> +
>> +typedef struct QVhostUserGPIO QVhostUserGPIO;
>> +typedef struct QVhostUserGPIOPCI QVhostUserGPIOPCI;
>> +typedef struct QVhostUserGPIODevice QVhostUserGPIODevice;
>> +
>> +struct QVhostUserGPIO {
>> +    QVirtioDevice *vdev;
>> +    QVirtQueue **queues;
>> +};
>> +
>> +struct QVhostUserGPIOPCI {
>> +    QVirtioPCIDevice pci_vdev;
>> +    QVhostUserGPIO gpio;
>> +};
>> +
>> +struct QVhostUserGPIODevice {
>> +    QOSGraphObject obj;
>> +    QVhostUserGPIO gpio;
>> +};
>> +
>> +#endif
>> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virti=
o-gpio.c
>> new file mode 100644
>> index 0000000000..762aa6695b
>> --- /dev/null
>> +++ b/tests/qtest/libqos/virtio-gpio.c
>> @@ -0,0 +1,171 @@
>> +/*
>> + * virtio-gpio nodes for testing
>> + *
>> + * Copyright (c) 2022 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "standard-headers/linux/virtio_config.h"
>> +#include "../libqtest.h"
>> +#include "qemu/module.h"
>> +#include "qgraph.h"
>> +#include "virtio-gpio.h"
>> +
>> +static QGuestAllocator *alloc;
>> +
>> +static void virtio_gpio_cleanup(QVhostUserGPIO *gpio)
>> +{
>> +    QVirtioDevice *vdev =3D gpio->vdev;
>> +    int i;
>> +
>> +    for (i =3D 0; i < 2; i++) {
>> +        qvirtqueue_cleanup(vdev->bus, gpio->queues[i], alloc);
>> +    }
>> +    g_free(gpio->queues);
>> +}
>> +
>> +/*
>> + * This handles the VirtIO setup from the point of view of the driver
>> + * frontend and therefor doesn't present any vhost specific features
>> + * and in fact masks of the re-used bit.
>> + */
>> +static void virtio_gpio_setup(QVhostUserGPIO *gpio)
>> +{
>> +    QVirtioDevice *vdev =3D gpio->vdev;
>> +    uint64_t features;
>> +    int i;
>> +
>> +    features =3D qvirtio_get_features(vdev);
>> +    features &=3D ~QVIRTIO_F_BAD_FEATURE;
>
> This looks questionable. qvirtio_get_features() should return VIRTIO
> feature bits. Is QVIRTIO_F_BAD_FEATURE masked out here because
> qvirtio_get_features() is returning raw vhost-user feature bits instead
> and you want to get rid of VHOST_USER_F_PROTOCOL_FEATURES?

Well it's an invalid bit for the driver/frontend<->hw/backend path -
although maybe we should error if we saw it?

>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

