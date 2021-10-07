Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A089142536A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:50:06 +0200 (CEST)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSqb-0006WJ-Cq
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYSkn-000160-8G
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYSkh-0007h4-Tg
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633610639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbKUR/+RivSVntsH78ulnu8MuuZuoSfRXdRvN3+B9gY=;
 b=KhEtrcO09IElJxvxJoMW1jbExIvjV0gPeeQ094+Us4d1MtQiOh3IHbrEuDWXCAcPsw5Gsm
 JK5E1ztnbfNDFJ8hQv81zqFOcgd3YdknV1ICNEQ6Yt8j5i0jH+0uqtdLn0mwiUz3GWXFrh
 TVUbpne6uOYOzjMJPSILefo+s54jguw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-kI0psjnZOPaSwj2bvpkjaQ-1; Thu, 07 Oct 2021 08:43:55 -0400
X-MC-Unique: kI0psjnZOPaSwj2bvpkjaQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so4584360wrv.19
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sbKUR/+RivSVntsH78ulnu8MuuZuoSfRXdRvN3+B9gY=;
 b=O0Sk9PiN95CAcneX4FUjqiMvaXnC3NfoHQ5At8vGSS27zWba9P1q2onCWAlDwJ4zhC
 kNHMDt4zYVqnZC200p/55ma8FkgkRMZyctL3lMyWr4mQQBZ13yyOejtzhYqu/vfuHRzQ
 t0cpdEW723WYg4iDqQbNzAOYr3tR3HrGXGU4d5tAVdDLQD/uS6Af536B6yEOEw+CFKlt
 LfvQBwzSI6i58IU1BiXfcY5yYZ93oqOsoOOjiyMkkU2wZlB6+ptUGfQGbbcfMJPIi9JR
 DsWPuXNRl6McpUW+t/Hd7Nu4mEpax32T/yu1Q1BHjzH6RaEtTTFvTJYMlbD0QtXgEvaH
 iBWg==
X-Gm-Message-State: AOAM532q5YZyLkozCMrhL1FZxwJEbpzc8y+Df3QgdmSPJJU3zaM/6y4Q
 enXiHBiGjYIT+cUTus9+eGbL/22u+IrzKbausj3a71Q6K0EoOHNRmBRJODGCIyfXrmecosXiRy9
 af/BCNgbtodQF6LI=
X-Received: by 2002:a1c:29c7:: with SMTP id p190mr4348922wmp.65.1633610634304; 
 Thu, 07 Oct 2021 05:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4aBPSKPdG99XTy0c1dMkF4oAePulg/OoSVtMr2PHSrQu7U3LZoK+eLYfGiWI72bhTYLqhig==
X-Received: by 2002:a1c:29c7:: with SMTP id p190mr4348883wmp.65.1633610633900; 
 Thu, 07 Oct 2021 05:43:53 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y15sm17526559wrp.44.2021.10.07.05.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:43:53 -0700 (PDT)
Subject: Re: [PATCH] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211007093438.657198-1-eric.auger@redhat.com>
 <2a18df90-dde0-50af-787a-39c13c7cb4a7@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b2762a29-65e7-74ac-848d-be3f243062cf@redhat.com>
Date: Thu, 7 Oct 2021 14:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2a18df90-dde0-50af-787a-39c13c7cb4a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/7/21 2:22 PM, Thomas Huth wrote:
> On 07/10/2021 11.34, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> This applies on top of jean-Philippe's
>> [PATCH v4 00/11] virtio-iommu: Add ACPI support
>> branch can be found at:
>> https://github.com/eauger/qemu.git
>> branch qtest-virtio-iommu-v1
>>
>> To run the tests:
>> make tests/qtest/qos-test
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
>> QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 
>> tests/qtest/qos-test
>> ---
>>   tests/qtest/libqos/meson.build    |   1 +
>>   tests/qtest/libqos/virtio-iommu.c | 177 ++++++++++++++++++
>>   tests/qtest/libqos/virtio-iommu.h |  45 +++++
>>   tests/qtest/meson.build           |   1 +
>>   tests/qtest/virtio-iommu-test.c   | 295 ++++++++++++++++++++++++++++++
>>   5 files changed, 519 insertions(+)
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>>   create mode 100644 tests/qtest/virtio-iommu-test.c
>>
>> diff --git a/tests/qtest/libqos/meson.build
>> b/tests/qtest/libqos/meson.build
>> index 1f5c8f10539..ba90bbe2b81 100644
>> --- a/tests/qtest/libqos/meson.build
>> +++ b/tests/qtest/libqos/meson.build
>> @@ -40,6 +40,7 @@ libqos_srcs = files('../libqtest.c',
>>           'virtio-rng.c',
>>           'virtio-scsi.c',
>>           'virtio-serial.c',
>> +        'virtio-iommu.c',
>>             # qgraph machines:
>>           'aarch64-xlnx-zcu102-machine.c',
>> diff --git a/tests/qtest/libqos/virtio-iommu.c
>> b/tests/qtest/libqos/virtio-iommu.c
>> new file mode 100644
>> index 00000000000..f0858978e5e
>> --- /dev/null
>> +++ b/tests/qtest/libqos/virtio-iommu.c
>> @@ -0,0 +1,177 @@
>> +/*
>> + * libqos driver virtio-iommu-pci framework
>> + *
>> + * Copyright (c) 2021 Red Hat, Inc.
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License version 2 as published by the Free Software Foundation.
>
> Hmm, where did you copy that license information from? ... that's the
> bogus version which we already tried to get rid of in the past...
>
> It's either:
>
> - GNU *Library* General Public License version *2.0*
>
> or:
>
> - GNU *Lesser* General Public License version *2.1*
>
> ... but there was never a "Lesser" version 2 (in the sense of 2.0),
> since it has been renamed from Library to Lesser with the move from
> 2.0 to 2.1.
>
> Also, do you really want to limit to version 2/2.1 only? Or should
> this get the "or (at your option) any later version" statement for
> more flexibility?
>
> Anyway, a SPDX identifier for clarification would certainly help here.

sorry this code was written in 2020 when I developped the virtio-iommu
device. I will fix the license.
>
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see
>> <http://www.gnu.org/licenses/>
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqtest.h"
>> +#include "qemu/module.h"
>> +#include "qgraph.h"
>> +#include "virtio-iommu.h"
>> +#include "hw/virtio/virtio-iommu.h"
>> +
>> +static QGuestAllocator *alloc;
>> +
>> +/* virtio-iommu-device */
>> +static void *qvirtio_iommu_get_driver(QVirtioIOMMU *v_iommu,
>> +                                      const char *interface)
>> +{
>> +    if (!g_strcmp0(interface, "virtio-iommu")) {
>> +        return v_iommu;
>> +    }
>> +    if (!g_strcmp0(interface, "virtio")) {
>> +        return v_iommu->vdev;
>> +    }
>> +
>> +    fprintf(stderr, "%s not present in virtio-iommu-device\n",
>> interface);
>> +    g_assert_not_reached();
>> +}
>> +
>> +static void *qvirtio_iommu_device_get_driver(void *object,
>> +                                             const char *interface)
>> +{
>> +    QVirtioIOMMUDevice *v_iommu = object;
>> +    return qvirtio_iommu_get_driver(&v_iommu->iommu, interface);
>> +}
>> +
>> +static void virtio_iommu_cleanup(QVirtioIOMMU *interface)
>> +{
>> +    qvirtqueue_cleanup(interface->vdev->bus, interface->vq, alloc);
>> +}
>> +
>> +static void virtio_iommu_setup(QVirtioIOMMU *interface)
>> +{
>> +    QVirtioDevice *vdev = interface->vdev;
>> +    uint64_t features;
>> +
>> +    features = qvirtio_get_features(vdev);
>> +    features &= ~(QVIRTIO_F_BAD_FEATURE |
>> +                  (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
>> +                  (1ull << VIRTIO_RING_F_EVENT_IDX) |
>> +                  (1ull << VIRTIO_IOMMU_F_BYPASS));
>> +    qvirtio_set_features(vdev, features);
>> +    interface->vq = qvirtqueue_setup(interface->vdev, alloc, 0);
>> +    qvirtio_set_driver_ok(interface->vdev);
>> +}
>> +
>> +static void qvirtio_iommu_device_destructor(QOSGraphObject *obj)
>> +{
>> +    QVirtioIOMMUDevice *v_iommu = (QVirtioIOMMUDevice *) obj;
>> +    QVirtioIOMMU *iommu = &v_iommu->iommu;
>> +
>> +    virtio_iommu_cleanup(iommu);
>> +}
>> +
>> +static void qvirtio_iommu_device_start_hw(QOSGraphObject *obj)
>> +{
>> +    QVirtioIOMMUDevice *v_iommu = (QVirtioIOMMUDevice *) obj;
>> +    QVirtioIOMMU *iommu = &v_iommu->iommu;
>> +
>> +    virtio_iommu_setup(iommu);
>> +}
>> +
>> +static void *virtio_iommu_device_create(void *virtio_dev,
>> +                                        QGuestAllocator *t_alloc,
>> +                                        void *addr)
>> +{
>> +    QVirtioIOMMUDevice *virtio_rdevice = g_new0(QVirtioIOMMUDevice, 1);
>> +    QVirtioIOMMU *interface = &virtio_rdevice->iommu;
>> +
>> +    interface->vdev = virtio_dev;
>> +    alloc = t_alloc;
>> +
>> +    virtio_rdevice->obj.get_driver = qvirtio_iommu_device_get_driver;
>> +    virtio_rdevice->obj.destructor = qvirtio_iommu_device_destructor;
>> +    virtio_rdevice->obj.start_hw = qvirtio_iommu_device_start_hw;
>> +
>> +    return &virtio_rdevice->obj;
>> +}
>> +
>> +/* virtio-iommu-pci */
>> +static void *qvirtio_iommu_pci_get_driver(void *object, const char
>> *interface)
>> +{
>> +    QVirtioIOMMUPCI *v_iommu = object;
>> +    if (!g_strcmp0(interface, "pci-device")) {
>> +        return v_iommu->pci_vdev.pdev;
>> +    }
>> +    return qvirtio_iommu_get_driver(&v_iommu->iommu, interface);
>> +}
>> +
>> +static void qvirtio_iommu_pci_destructor(QOSGraphObject *obj)
>> +{
>> +    QVirtioIOMMUPCI *iommu_pci = (QVirtioIOMMUPCI *) obj;
>> +    QVirtioIOMMU *interface = &iommu_pci->iommu;
>> +    QOSGraphObject *pci_vobj =  &iommu_pci->pci_vdev.obj;
>> +
>> +    virtio_iommu_cleanup(interface);
>> +    qvirtio_pci_destructor(pci_vobj);
>> +}
>> +
>> +static void qvirtio_iommu_pci_start_hw(QOSGraphObject *obj)
>> +{
>> +    QVirtioIOMMUPCI *iommu_pci = (QVirtioIOMMUPCI *) obj;
>> +    QVirtioIOMMU *interface = &iommu_pci->iommu;
>> +    QOSGraphObject *pci_vobj =  &iommu_pci->pci_vdev.obj;
>> +
>> +    qvirtio_pci_start_hw(pci_vobj);
>> +    virtio_iommu_setup(interface);
>> +}
>> +
>> +
>> +static void *virtio_iommu_pci_create(void *pci_bus, QGuestAllocator
>> *t_alloc,
>> +                                   void *addr)
>> +{
>> +    QVirtioIOMMUPCI *virtio_rpci = g_new0(QVirtioIOMMUPCI, 1);
>> +    QVirtioIOMMU *interface = &virtio_rpci->iommu;
>> +    QOSGraphObject *obj = &virtio_rpci->pci_vdev.obj;
>> +
>> +    virtio_pci_init(&virtio_rpci->pci_vdev, pci_bus, addr);
>> +    interface->vdev = &virtio_rpci->pci_vdev.vdev;
>> +    alloc = t_alloc;
>> +
>> +    obj->get_driver = qvirtio_iommu_pci_get_driver;
>> +    obj->start_hw = qvirtio_iommu_pci_start_hw;
>> +    obj->destructor = qvirtio_iommu_pci_destructor;
>> +
>> +    return obj;
>> +}
>> +
>> +static void virtio_iommu_register_nodes(void)
>> +{
>> +    QPCIAddress addr = {
>> +        .devfn = QPCI_DEVFN(4, 0),
>> +    };
>> +
>> +    QOSGraphEdgeOptions opts = {
>> +        .extra_device_opts = "addr=04.0",
>> +    };
>> +
>> +    /* virtio-iommu-device */
>> +    qos_node_create_driver("virtio-iommu-device",
>> virtio_iommu_device_create);
>> +    qos_node_consumes("virtio-iommu-device", "virtio-bus", NULL);
>> +    qos_node_produces("virtio-iommu-device", "virtio");
>> +    qos_node_produces("virtio-iommu-device", "virtio-iommu");
>> +
>> +    /* virtio-iommu-pci */
>> +    add_qpci_address(&opts, &addr);
>> +    qos_node_create_driver("virtio-iommu-pci",
>> virtio_iommu_pci_create);
>> +    qos_node_consumes("virtio-iommu-pci", "pci-bus", &opts);
>> +    qos_node_produces("virtio-iommu-pci", "pci-device");
>> +    qos_node_produces("virtio-iommu-pci", "virtio");
>> +    qos_node_produces("virtio-iommu-pci", "virtio-iommu");
>> +}
>> +
>> +libqos_init(virtio_iommu_register_nodes);
>> diff --git a/tests/qtest/libqos/virtio-iommu.h
>> b/tests/qtest/libqos/virtio-iommu.h
>> new file mode 100644
>> index 00000000000..047e71cbe16
>> --- /dev/null
>> +++ b/tests/qtest/libqos/virtio-iommu.h
>> @@ -0,0 +1,45 @@
>> +/*
>> + * libqos driver virtio-iommu-pci framework
>> + *
>> + * Copyright (c) 2021 Red Hat, Inc.
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License version 2 as published by the Free Software Foundation.
>
> Please also fix the license statement here.
sure
>
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see
>> <http://www.gnu.org/licenses/>
>> + */
>> +
>> +#ifndef TESTS_LIBQOS_VIRTIO_IOMMU_H
>> +#define TESTS_LIBQOS_VIRTIO_IOMMU_H
>> +
>> +#include "qgraph.h"
>> +#include "virtio.h"
>> +#include "virtio-pci.h"
>> +
>> +typedef struct QVirtioIOMMU QVirtioIOMMU;
>> +typedef struct QVirtioIOMMUPCI QVirtioIOMMUPCI;
>> +typedef struct QVirtioIOMMUDevice QVirtioIOMMUDevice;
>> +
>> +struct QVirtioIOMMU {
>> +    QVirtioDevice *vdev;
>> +    QVirtQueue *vq;
>> +};
>> +
>> +struct QVirtioIOMMUPCI {
>> +    QVirtioPCIDevice pci_vdev;
>> +    QVirtioIOMMU iommu;
>> +};
>> +
>> +struct QVirtioIOMMUDevice {
>> +    QOSGraphObject obj;
>> +    QVirtioIOMMU iommu;
>> +};
>> +
>> +#endif
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c9d8458062f..982ffb3e38d 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -230,6 +230,7 @@ qos_test_ss.add(
>>     'virtio-rng-test.c',
>>     'virtio-scsi-test.c',
>>     'virtio-serial-test.c',
>> +  'virtio-iommu-test.c',
>>     'vmxnet3-test.c',
>>   )
>>   if have_virtfs
>> diff --git a/tests/qtest/virtio-iommu-test.c
>> b/tests/qtest/virtio-iommu-test.c
>> new file mode 100644
>> index 00000000000..d257d17d7d3
>> --- /dev/null
>> +++ b/tests/qtest/virtio-iommu-test.c
>> @@ -0,0 +1,295 @@
>> +/*
>> + * QTest testcase for VirtIO IOMMU
>> + *
>> + * Copyright (c) 2020 Red Hat, Inc.
>
> 2021, maybe?
sure
>
>> + * This work is licensed under the terms of the GNU GPL, version 2
>> or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqtest-single.h"
>> +#include "qemu/module.h"
>> +#include "libqos/qgraph.h"
>> +#include "libqos/virtio-iommu.h"
>> +#include "hw/virtio/virtio-iommu.h"
>> +
>> +#define PCI_SLOT_HP             0x06
>> +#define QVIRTIO_IOMMU_TIMEOUT_US (30 * 1000 * 1000)
>> +
>> +static QGuestAllocator *alloc;
>> +
>> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
>> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
>> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
>> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
>> +
>> +    g_assert_cmpint(input_range_start, ==, 0);
>> +    g_assert_cmphex(input_range_end, ==, 0xFFFFFFFFFFFFFFFF);
>
> I agree with Philippe, this needs an ULL suffix.
OK
>
>> +    g_assert_cmpint(domain_range_start, ==, 0);
>> +    g_assert_cmpint(domain_range_end, ==, 32);
>> +}
>> +
>> +/**
>> + * send_attach_detach - Send an attach/detach command to the device
>> + * @type: VIRTIO_IOMMU_T_ATTACH/VIRTIO_IOMMU_T_DETACH
>> + * @domain: domain the end point is attached to
>> + * @ep: end-point
>> + */
>> +static int send_attach_detach(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                              uint8_t type, uint32_t domain,
>> uint32_t ep)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_attach req; /* same layout as detach */
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>
> Why not simply using a "struct virtio_iommu_req_tail buffer" here?
yep
>
>> +    int ret;
>> +
>> +    req.head.type = type;
>> +    req.domain = domain;
>> +    req.endpoint = ep;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    qtest_memread(qts, wr_addr, buffer, wr_size);
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_map - Send a map command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + * @phys_start: base physical address
>> + * @flags: mapping flags
>> + */
>> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                    uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end,
>> +                    uint64_t phys_start, uint32_t flags)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_map req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>
> dito?
ok
>
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_MAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +    req.phys_start = phys_start;
>> +    req.flags = flags;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread(), please.
ok
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_unmap - Send an unmap command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + */
>> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                      uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_unmap req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>
> struct virtio_iommu_req_tail buffer ?
>
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread(), please.
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/* Test unmap scenari documented in the spec v0.12 */
>> +static void test_attach_detach(void *obj, void *data,
>> QGuestAllocator *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QTestState *qts = global_qtest;
>> +    int ret;
>> +
>> +    alloc = t_alloc;
>> +
>> +    /* type, domain, ep */
>> +
>> +    /* attach ep0 to domain 0 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* attach a non existing device (1) */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0,
>> 444);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* detach a non existing device (1) */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0,
>> 1);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* move ep0 from domain 0 to domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* detach ep0 to domain 0 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0,
>> 0);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL);
>> +
>> +    /* detach ep0 from domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +    ret = send_map(qts, v_iommu, 1, 0x0, 0xFFF, 0xa1000,
>> +                   VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
>> +    ret = send_map(qts, v_iommu, 1, 0x2000, 0x2FFF, 0xb1000,
>> +                   VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +}
>> +
>> +static void test_map_unmap(void *obj, void *data, QGuestAllocator
>> *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QTestState *qts = global_qtest;
>> +    int ret;
>> +
>> +    alloc = t_alloc;
>> +
>> +    /* attach ep0 to domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1,
>> 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    ret = send_map(qts, v_iommu, 0, 0, 0xFFF, 0xa1000,
>> VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* domain, virt start, virt end, phys start, flags */
>> +    ret = send_map(qts, v_iommu, 1, 0, 0xFFF, 0xa1000,
>> VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    ret = send_unmap(qts, v_iommu, 4, 0x10, 0xFFF);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0x10, 0xFFF);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE);
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 0x1000);
>> +    g_assert_cmpint(ret, ==, 0); /* unmap everything */
>> +
>> +    /* Spec example sequence */
>> +
>> +    /* 1 */
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* doesn't unmap anything */
>> +
>> +    /* 2 */
>> +    send_map(qts, v_iommu, 1, 0, 9, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,9] */
>> +
>> +    /* 3 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xb1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 5, 9, 0xb2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [5,9] */
>> +
>> +    /* 4 */
>> +    send_map(qts, v_iommu, 1, 0, 9, 0xc1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE); /* doesn't unmap
>> anything */
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 10);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* 5 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xd1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 5, 9, 0xd2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 5, 9);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* 6 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xe2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
>> +
>> +    /* 7 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000,
>> VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 14);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
>> +
>> +    send_unmap(qts, v_iommu, 1, 0, 100);
>> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000,
>> VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
>> +}
>> +
>> +static void register_virtio_iommu_test(void)
>> +{
>> +    qos_add_test("config", "virtio-iommu", pci_config, NULL);
>> +    qos_add_test("attach_detach", "virtio-iommu",
>> test_attach_detach, NULL);
>> +    qos_add_test("map_unmap", "virtio-iommu", test_map_unmap, NULL);
>> +}
>> +
>> +libqos_init(register_virtio_iommu_test);
>>
>
>  Thomas
>
Thanks!

Eric


