Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48846B5FD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:31:08 +0100 (CET)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVsR-0007ys-61
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:31:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVrG-0007Hs-Ui
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:29:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVrC-0004qH-TU
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638865789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WmJIuu4jhpjmhGAhqoZ+0CxkzlisZ+ZZ82nu0EInI8=;
 b=BjNvpSdzTxhRajNk4lmwGBlfjQRDw1/uoK9gkQNCz6N8ibbD10ncSdfJGRbqDvjvsNAlBu
 DTlRFQXYIc9X8mZi7de7a/yufT5DC0I8YDSwZc4KtFU/1Zrq6WHLQX6AJv+GUC614/4Aka
 StrZVnu99rkbkEAR66HrSVN/wLNuoZ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-xONMNE1uN5eUsRX7Vk-VIg-1; Tue, 07 Dec 2021 03:29:44 -0500
X-MC-Unique: xONMNE1uN5eUsRX7Vk-VIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so2664668wrw.9
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=5WmJIuu4jhpjmhGAhqoZ+0CxkzlisZ+ZZ82nu0EInI8=;
 b=TiMwXldWBAW94dy8Lqfp2UGCOvtKh8vwjGLzM9dZilJ+cZG5hA0biyF4b292cHDhEY
 VaCTkDwo4U00WudZ672s3BxGByhLp4OrlgsCz6AC7WT7PFb5GYEVxWwYv+gSB+DD0SAQ
 pVxCAB+mad6a74n+y79l7+qr0GnvHdw7WC/arIWyFi9ZHo4ORSzWTgpwh13pdSLETh0e
 3eA6F6arZWnx6G7eC6SZZg18ux7Y5YVssgSyyIgQrPefGxJgrOPsCnMv9GhbyOjfN/Yb
 I7bTT6DTPzc9dc3DrTddzbdU8uZIN0edsOSPvFQ3nklIMxzLYg8PsvsK0dmh/8OXCOg1
 yGQw==
X-Gm-Message-State: AOAM533VK315Ci9z2KZoRg5qdXeG4F72+VxghAm4mR9hlSTAB/hou61w
 9roVrkmWk24EERsKY1Telg24gU9VK0+JeAKfIJQnmpX7HLPTtGT2K73PMILrruZgd/ABpRd9cKc
 0mJ9LF0N/hSZXz+Q=
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr5059284wmb.90.1638865783251;
 Tue, 07 Dec 2021 00:29:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJwlIEgrI2tq4c74FSzG8duAnWAOGpudT10khBvFi6X9UIrNrHy8g4GXRX6hvJoJrTFsIgKQ==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr5059245wmb.90.1638865782801;
 Tue, 07 Dec 2021 00:29:42 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id n1sm1983693wmq.6.2021.12.07.00.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:29:42 -0800 (PST)
Message-ID: <6b81b382-535f-41a1-5d9b-b6f0d7bebd06@redhat.com>
Date: Tue, 7 Dec 2021 09:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-3-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 2/6] tests/qtest: add some tests for virtio-net failover
In-Reply-To: <20211206222040.3872253-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.20, Laurent Vivier wrote:
> Add test cases to test several error cases that must be
> generated by invalid failover configuration.
> 
> Add a combination of coldplug and hotplug test cases to be
> sure the primary is correctly managed according the
> presence or not of the STANDBY feature.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/meson.build           |   3 +
>   tests/qtest/virtio-net-failover.c | 690 ++++++++++++++++++++++++++++++
>   2 files changed, 693 insertions(+)
>   create mode 100644 tests/qtest/virtio-net-failover.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c9d8458062ff..6d66bf522156 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -22,6 +22,9 @@ qtests_generic = \
>     (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and \
> +   config_all_devices.has_key('CONFIG_Q35') and \
> +   config_all_devices.has_key('CONFIG_VIRTIO_PCI') ? ['virtio-net-failover'] : []) + \

I think you should only add this to qtests_i386 for now, since you later add 
a check to skip on non-x86 architectures.

>     [
>     'cdrom-test',
>     'device-introspect-test',
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> new file mode 100644
> index 000000000000..f8f5fbb3c7fe
> --- /dev/null
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -0,0 +1,690 @@

Please add a short header with at least a one-liner what this is all about 
and at least a SPDX license information here.

> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +#include "libqos/pci.h"
> +#include "libqos/pci-pc.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qlist.h"
> +#include "qapi/qmp/qjson.h"
> +#include "libqos/malloc-pc.h"
> +#include "libqos/virtio-pci.h"
> +#include "hw/pci/pci.h"
> +
> +#define ACPI_PCIHP_ADDR_ICH9    0x0cc0
> +#define PCI_EJ_BASE             0x0008
> +
> +#define BASE_MACHINE "-M q35 -nodefaults " \
> +    "-device pcie-root-port,id=root0,addr=0x1,bus=pcie.0,chassis=1 " \
> +    "-device pcie-root-port,id=root1,addr=0x2,bus=pcie.0,chassis=2 "
> +
> +#define MAC_PRIMARY0 "52:54:00:11:11:11"
> +#define MAC_STANDBY0 "52:54:00:22:22:22"
> +
> +static QGuestAllocator guest_malloc;
> +static QPCIBus *pcibus;
> +
> +static QTestState *machine_start(const char *args, int numbus)
> +{
> +    QTestState *qts;
> +    QPCIDevice *dev;
> +    int i;

Nit: Use a more descriptive name instead of "i" - like "bus"?

> +    qts = qtest_init(args);
> +
> +    pc_alloc_init(&guest_malloc, qts, 0);
> +    pcibus = qpci_new_pc(qts, &guest_malloc);
> +    g_assert(qpci_secondary_buses_init(pcibus) == numbus);
> +
> +    for (i = 0; i < numbus; i++) {
> +        dev = qpci_device_find(pcibus, QPCI_DEVFN(i + 1, 0));
> +        g_assert_nonnull(dev);
> +
> +        qpci_device_enable(dev);
> +        qpci_iomap(dev, 4, NULL);
> +
> +        g_free(dev);
> +    }
> +
> +    return qts;
> +}
> +
> +static void machine_stop(QTestState *qts)
> +{
> +    qpci_free_pc(pcibus);
> +    alloc_destroy(&guest_malloc);
> +    qtest_quit(qts);
> +}
> +
> +static void test_error_id(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +    QDict *err;
> +
> +    qts = machine_start(BASE_MACHINE
> +                        "-device virtio-net,bus=root0,id=standby0,failover=on",
> +                        2);
> +
> +    resp = qtest_qmp(qts, "{'execute': 'device_add',"
> +                          "'arguments': {"
> +                          "'driver': 'virtio-net',"
> +                          "'bus': 'root1',"
> +                          "'failover_pair_id': 'standby0'"
> +                          "} }");
> +    g_assert(qdict_haskey(resp, "error"));
> +
> +    err = qdict_get_qdict(resp, "error");
> +    g_assert(qdict_haskey(err, "desc"));
> +
> +    g_assert_cmpstr(qdict_get_str(err, "desc"), ==,
> +                    "Device with failover_pair_id needs to have id");
> +
> +    qobject_unref(resp);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_error_pcie(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +    QDict *err;
> +
> +    qts = machine_start(BASE_MACHINE
> +                        "-device virtio-net,bus=root0,id=standby0,failover=on",
> +                        2);
> +
> +    resp = qtest_qmp(qts, "{'execute': 'device_add',"
> +                          "'arguments': {"
> +                          "'driver': 'virtio-net',"
> +                          "'id': 'primary0',"
> +                          "'bus': 'pcie.0',"
> +                          "'failover_pair_id': 'standby0'"
> +                          "} }");
> +    g_assert(qdict_haskey(resp, "error"));
> +
> +    err = qdict_get_qdict(resp, "error");
> +    g_assert(qdict_haskey(err, "desc"));
> +
> +    g_assert_cmpstr(qdict_get_str(err, "desc"), ==,
> +                    "Bus 'pcie.0' does not support hotplugging");
> +
> +    qobject_unref(resp);
> +
> +    machine_stop(qts);
> +}
> +
> +static QDict *find_device(QDict *bus, const char *name)
> +{
> +    const QObject *obj;
> +    QList *devices;
> +    QList *list;
> +
> +    devices = qdict_get_qlist(bus, "devices");
> +    if (devices == NULL) {
> +        return NULL;
> +    }
> +
> +    list = qlist_copy(devices);
> +    while ((obj = qlist_pop(list))) {
> +        QDict *device;
> +
> +        device = qobject_to(QDict, obj);
> +
> +        if (qdict_haskey(device, "pci_bridge")) {
> +            QDict *bridge;
> +            QDict *bridge_device;
> +
> +            bridge = qdict_get_qdict(device, "pci_bridge");
> +
> +            if (qdict_haskey(bridge, "devices")) {
> +                bridge_device = find_device(bridge, name);
> +                if (bridge_device) {
> +                    qobject_unref(list);
> +                    return bridge_device;
> +                }
> +            }
> +        }
> +
> +        if (!qdict_haskey(device, "qdev_id")) {
> +            continue;
> +        }
> +
> +        if (strcmp(qdict_get_str(device, "qdev_id"), name) == 0) {
> +            qobject_ref(device);
> +            qobject_unref(list);
> +            return device;
> +        }
> +    }
> +    qobject_unref(list);
> +
> +    return NULL;
> +}
> +
> +static QDict *get_bus(QTestState *qts, int num)
> +{
> +    QObject *obj;
> +    QDict *resp;
> +    QList *ret;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'query-pci' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    ret = qdict_get_qlist(resp, "return");
> +    g_assert_nonnull(ret);
> +
> +    while ((obj = qlist_pop(ret))) {
> +        QDict *bus;
> +
> +        bus = qobject_to(QDict, obj);
> +        if (!qdict_haskey(bus, "bus")) {
> +            continue;
> +        }
> +        if (qdict_get_int(bus, "bus") == num) {
> +            qobject_ref(bus);
> +            qobject_unref(resp);
> +            return bus;
> +        }
> +    }
> +    qobject_unref(resp);
> +
> +    return NULL;
> +}
> +
> +static char *get_mac(QTestState *qts, const char *name)
> +{
> +    QDict *resp;
> +    char *mac;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'qom-get', "
> +                     "'arguments': { "
> +                     "'path': %s, "
> +                     "'property': 'mac' } }", name);
> +
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    mac = g_strdup( qdict_get_str(resp, "return"));
> +
> +    qobject_unref(resp);
> +
> +    return mac;
> +}
> +
> +static void check_one_card(QTestState *qts, bool present,
> +                           const char *id, const char *mac)
> +{
> +    QDict *device;
> +    QDict *bus;
> +    char *addr;
> +
> +    bus = get_bus(qts, 0);
> +    device = find_device(bus, id);
> +    if (present) {
> +        char *path;
> +
> +        g_assert_nonnull(device);
> +        qobject_unref(device);
> +
> +        path = g_strdup_printf("/machine/peripheral/%s", id);
> +        addr = get_mac(qts, path);
> +        g_free(path);
> +        g_assert_cmpstr(mac, ==, addr);
> +        g_free(addr);
> +    } else {
> +       g_assert_null(device);
> +    }
> +
> +    qobject_unref(bus);
> +}
> +
> +static void test_on(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                        "-netdev user,id=hs0 "
> +                        "-device virtio-net,bus=root0,id=standby0,"
> +                        "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
> +                        "-device virtio-net,bus=root1,id=primary0,"
> +                        "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0,
> +                        2);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_on_mismatch(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-device virtio-net,bus=root0,id=standby0,"
> +                     "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
> +                     "-netdev user,id=hs1 "
> +                     "-device virtio-net,bus=root1,id=primary0,"
> +                     "failover_pair_id=standby1,netdev=hs1,mac="MAC_PRIMARY0,
> +                     2);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_off(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-device virtio-net,bus=root0,id=standby0,"
> +                     "failover=off,netdev=hs0,mac="MAC_STANDBY0" "
> +                     "-netdev user,id=hs1 "
> +                     "-device virtio-net,bus=root1,id=primary0,"
> +                     "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0,
> +                     2);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void start_virtio_net(QTestState *qts, int bus, int slot,
> +                             const char *id)
> +{
> +    QVirtioPCIDevice *dev;
> +    uint64_t features;
> +    QPCIAddress addr;
> +    QDict *resp;
> +    QDict *data;
> +
> +    addr.devfn = QPCI_DEVFN((bus << 5) + slot, 0);
> +    dev = virtio_pci_new(pcibus, &addr);
> +    g_assert_nonnull(dev);
> +    qvirtio_pci_device_enable(dev);
> +    qvirtio_start_device(&dev->vdev);
> +    features = qvirtio_get_features(&dev->vdev);
> +    features = features & ~(QVIRTIO_F_BAD_FEATURE |
> +                            (1ull << VIRTIO_RING_F_INDIRECT_DESC) |
> +                            (1ull << VIRTIO_RING_F_EVENT_IDX));
> +    qvirtio_set_features(&dev->vdev, features);
> +    qvirtio_set_driver_ok(&dev->vdev);
> +
> +    resp = qtest_qmp_eventwait_ref(qts, "FAILOVER_NEGOTIATED");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, id);
> +
> +    qobject_unref(resp);
> +}
> +
> +static void test_enabled(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-device virtio-net,bus=root0,id=standby0,"
> +                     "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
> +                     "-netdev user,id=hs1 "
> +                     "-device virtio-net,bus=root1,id=primary0,"
> +                     "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0" ",
> +                     2);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_hotplug_1(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-device virtio-net,bus=root0,id=standby0,"
> +                     "failover=on,netdev=hs0,mac="MAC_STANDBY0" "
> +                     "-netdev user,id=hs1 ", 2);
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_hotplug_1_reverse(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 "
> +                     "-device virtio-net,bus=root1,id=primary0,"
> +                     "failover_pair_id=standby0,netdev=hs1,mac="MAC_PRIMARY0" ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_hotplug_2(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_hotplug_2_reverse(void)
> +{
> +    QTestState *qts;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    /* XXX: sounds like a bug */

Could you elaborate?

> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    machine_stop(qts);
> +}
> +
> +static QDict *migrate_status(QTestState *qts)
> +{
> +    QDict *resp, *ret;
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'query-migrate' }");
> +    g_assert(qdict_haskey(resp, "return"));
> +
> +    ret = qdict_get_qdict(resp, "return");
> +    g_assert(qdict_haskey(ret, "status"));
> +    qobject_ref(ret);
> +    qobject_unref(resp);
> +
> +    return ret;
> +}
> +
> +static void test_migrate_out(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *data, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat > %s", (gchar *)opaque);
> +    const gchar *status;
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    start_virtio_net(qts, 1, 0, "standby0");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate', 'arguments': %p}", args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* the event is sent whan QEMU asks the OS to unplug the card */
> +    resp = qtest_qmp_eventwait_ref(qts, "UNPLUG_PRIMARY");
> +    g_assert(qdict_haskey(resp, "data"));
> +
> +    data = qdict_get_qdict(resp, "data");
> +    g_assert(qdict_haskey(data, "device-id"));
> +    g_assert_cmpstr(qdict_get_str(data, "device-id"), ==, "primary0");
> +
> +    qobject_unref(resp);
> +
> +    qtest_outl(qts, ACPI_PCIHP_ADDR_ICH9 + PCI_EJ_BASE, 1);
> +
> +    while (true) {
> +        ret = migrate_status(qts);
> +
> +        status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            break;
> +        }
> +        g_assert_cmpstr(status, !=, "failed");
> +        g_assert_cmpstr(status, !=, "cancelling");
> +        g_assert_cmpstr(status, !=, "cancelled");
> +        qobject_unref(ret);
> +    }
> +    qobject_unref(ret);
> +
> +    qtest_qmp_eventwait(qts, "STOP");
> +
> +    /*
> +     * in fact, the card is ejected from the point of view of kernel
> +     * but not really from QEMU to be able to hotplug it back if
> +     * migration fails. So we can't check that:
> +     *   check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +     *   check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +     */
> +
> +    machine_stop(qts);
> +}
> +
> +static void test_migrate_in(gconstpointer opaque)
> +{
> +    QTestState *qts;
> +    QDict *resp, *args, *ret;
> +    g_autofree gchar *uri = g_strdup_printf("exec: cat %s", (gchar *)opaque);
> +
> +    qts = machine_start(BASE_MACHINE
> +                     "-netdev user,id=hs0 "
> +                     "-netdev user,id=hs1 "
> +                     "-incoming defer ",
> +                     2);
> +
> +    check_one_card(qts, false, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "standby0",
> +                         "{'bus': 'root0',"
> +                         "'failover': 'on',"
> +                         "'netdev': 'hs0',"
> +                         "'mac': '"MAC_STANDBY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_device_add(qts, "virtio-net", "primary0",
> +                         "{'bus': 'root1',"
> +                         "'failover_pair_id': 'standby0',"
> +                         "'netdev': 'hs1',"
> +                         "'rombar': 0,"
> +                         "'romfile': '',"
> +                         "'mac': '"MAC_PRIMARY0"'}");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, false, "primary0", MAC_PRIMARY0);
> +
> +    args = qdict_from_jsonf_nofail("{}");
> +    g_assert_nonnull(args);
> +    qdict_put_str(args, "uri", uri);
> +
> +    resp = qtest_qmp(qts, "{ 'execute': 'migrate-incoming', 'arguments': %p}",
> +                     args);
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    qtest_qmp_eventwait(qts, "MIGRATION");
> +    qtest_qmp_eventwait(qts, "FAILOVER_NEGOTIATED");
> +
> +    check_one_card(qts, true, "standby0", MAC_STANDBY0);
> +    check_one_card(qts, true, "primary0", MAC_PRIMARY0);
> +
> +    qtest_qmp_eventwait(qts, "RESUME");
> +
> +    ret = migrate_status(qts);
> +    g_assert_cmpstr(qdict_get_str(ret, "status"), ==, "completed");
> +    qobject_unref(ret);
> +
> +    machine_stop(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    gchar *tmpfile = g_strdup_printf("/tmp/failover_test_migrate-%u-%u",
> +                                     getpid(), g_test_rand_int());

Could you please use g_get_tmp_dir() instead of hard-coding /tmp?

> +    const char *arch;
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    arch = qtest_get_arch();
> +    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> +        g_test_message("Skipping test for non-x86");
> +        return g_test_run();
> +    }

You could skip that architecture test if you only add the test to 
qtests_i386 in meson.build.

> +    qtest_add_func("failover-virtio-net/params/error/id", test_error_id);
> +    qtest_add_func("failover-virtio-net/params/error/pcie", test_error_pcie);
> +    qtest_add_func("failover-virtio-net/params/on", test_on);
> +    qtest_add_func("failover-virtio-net/params/on_mismatch",
> +                   test_on_mismatch);
> +    qtest_add_func("failover-virtio-net/params/off", test_off);
> +    qtest_add_func("failover-virtio-net/params/enabled", test_enabled);
> +    qtest_add_func("failover-virtio-net/hotplug_1", test_hotplug_1);
> +    qtest_add_func("failover-virtio-net/hotplug_1_reverse",
> +                   test_hotplug_1_reverse);
> +    qtest_add_func("failover-virtio-net/hotplug_2", test_hotplug_2);
> +    qtest_add_func("failover-virtio-net/hotplug_2_reverse",
> +                   test_hotplug_2_reverse);
> +    qtest_add_data_func("failover-virtio-net/migrate/out", tmpfile,
> +                        test_migrate_out);
> +    qtest_add_data_func("failover-virtio-net/migrate/in", tmpfile,
> +                        test_migrate_in);
> +
> +    ret = g_test_run();
> +
> +    unlink(tmpfile);
> +    g_free(tmpfile);
> +
> +    return ret;
> +}
> 

  Thomas


