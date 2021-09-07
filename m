Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8388402475
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:35:10 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVdM-0000po-Mg
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVbL-0008DU-Be
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNVbI-0004Vb-H4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630999978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yivVwmje011ETbxfQJ0OlDV5Xm2C0azt8sjOaXJ69CM=;
 b=IBozeplz5ibW0VwG8Mbf9BzcfPXalx4hAALdC/U3YS7mV6lZbyLucfGeFBNQYgsjULp6Rq
 R2fYbLqf39Yb7z68wzPyFp5HN1yAfVsh7vd1FIWHISg53I0z4CBOOLch1SfygVnVavzeLv
 B81TmKn3+eS4NLekjz0PeNT9YtJl9yU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-IuXTt-vQPGmmpix4lDT_OA-1; Tue, 07 Sep 2021 03:32:55 -0400
X-MC-Unique: IuXTt-vQPGmmpix4lDT_OA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so792662wmj.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yivVwmje011ETbxfQJ0OlDV5Xm2C0azt8sjOaXJ69CM=;
 b=q9tdsrtTHAv0bitB3K8Fjwgwa+LtS6OHHTaD+Ign74g1d13bZOJRrQA3HxRyWHSu2x
 +ralqyYXOUc5NQSP1k0sXIP10gBCkVRPTAZKklZHoByxkBfVGCqFYWIBsKhDNCV3mPFR
 n6b7/eQ41Tfx6kkYRXNQTYMFhrTsL/MWcGXVhONSdSQN5eOksRd+FBCf/6Ix44nEtppx
 WGpsPWNCw2IV4ctEeEIgMkrTdr5WxQZPMK2tmfJCXuUJ42+8oGq46vAn7X7xJKCkjXM4
 V+O65BuibtsCbCbEJw2kUJgujVQ34APrhzaSvEH6Z2oHn3Hmv+4uPfxIG0UUQ5VdoNqK
 eIkw==
X-Gm-Message-State: AOAM531EZlAhgN5JYOWZVSAqZAa3tJVBNkTI3/Zo96mYSy7gUEiI6T3q
 RhoxC1THF5Zbcur6nuCuUPZYOhGc9Jh/Ih8rLHZou2Y5XYUVMnQevKfoVpGHmPOsAR514+Y72Sy
 mugMd1hjjxHWEN1I=
X-Received: by 2002:adf:f552:: with SMTP id j18mr16151419wrp.273.1630999974498; 
 Tue, 07 Sep 2021 00:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeh5FPnXQnssatmKdS7VlSFVKTlDquj+1cMjh1AMZfUcKJgH/W8nwrWvTZpfEAyy2hcrGzJQ==
X-Received: by 2002:adf:f552:: with SMTP id j18mr16151403wrp.273.1630999974264; 
 Tue, 07 Sep 2021 00:32:54 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id f20sm1507352wmb.32.2021.09.07.00.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:32:53 -0700 (PDT)
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/5] s390x: topology: CPU topology objects and
 structures
Message-ID: <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
Date: Tue, 7 Sep 2021 09:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19.42, Pierre Morel wrote:
> We use new objects to have a dynamic administration of the CPU topology.
> The highier level object is the S390 book. In a first implementation

s/highier/higher/ ... or highest ?

> we will have only a single S390 book.
> The book is built as a SYSBUS bridge during the CPU initialisation. > Every object under this single book will be build dynamically
> immediately after a CPU has be realized if it is needed.
> The CPU will fill the sockets once after the other, according to the
> number of core per socket defined during the smp parsing.
> 
> Each CPU inside a socket will be represented by a bit in a 64bit
> unsigned long. Set on plug and clear on unplug of a CPU.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c         | 334 ++++++++++++++++++++++++++++++++
>   hw/s390x/meson.build            |   1 +
>   hw/s390x/s390-virtio-ccw.c      |   4 +
>   include/hw/s390x/cpu-topology.h |  67 +++++++
>   4 files changed, 406 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 include/hw/s390x/cpu-topology.h
> 
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..73f91d5334
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,334 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright 2021 IBM Corp.
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> +
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/sysbus.h"
> +#include "hw/s390x/cpu-topology.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/boards.h"
> +#include "qemu/typedefs.h"
> +#include "target/s390x/cpu.h"
> +#include "hw/s390x/s390-virtio-ccw.h"
> +
> +static S390TopologyCores *s390_create_cores(S390TopologySocket *socket,
> +                                            int origin)
> +{
> +    DeviceState *dev;
> +    S390TopologyCores *cores;
> +    const MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    if (socket->bus->num_children >= ms->smp.cores) {
> +        return NULL;
> +    }
> +
> +    dev = qdev_new(TYPE_S390_TOPOLOGY_CORES);
> +    qdev_realize_and_unref(dev, socket->bus, &error_fatal);
> +
> +    cores = S390_TOPOLOGY_CORES(dev);
> +    cores->origin = origin;
> +    socket->cnt += 1;
> +
> +    return cores;
> +}
> +
> +static S390TopologySocket *s390_create_socket(S390TopologyBook *book, int id)
> +{
> +    DeviceState *dev;
> +    S390TopologySocket *socket;
> +    const MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    if (book->bus->num_children >= ms->smp.sockets) {
> +        return NULL;
> +    }
> +
> +    dev = qdev_new(TYPE_S390_TOPOLOGY_SOCKET);
> +    qdev_realize_and_unref(dev, book->bus, &error_fatal);
> +
> +    socket = S390_TOPOLOGY_SOCKET(dev);
> +    socket->socket_id = id;
> +    book->cnt++;
> +
> +    return socket;
> +}
> +

Could you add a short comment in front of s390_get_cores, describing what it 
does? From the name, I would not expect that this function creates something 
automatically, so a comment explaining this would be nice.

> +static S390TopologyCores *s390_get_cores(S390TopologySocket *socket, int origin)
> +{
> +    S390TopologyCores *cores;
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &socket->bus->children, sibling) {
> +        cores = S390_TOPOLOGY_CORES(kid->child);
> +        if (cores->origin == origin) {
> +            return cores;
> +        }
> +    }
> +    return s390_create_cores(socket, origin);
> +}

dito.

> +static S390TopologySocket *s390_get_socket(S390TopologyBook *book,
> +                                           int socket_id)
> +{
> +    S390TopologySocket *socket;
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &book->bus->children, sibling) {
> +        socket = S390_TOPOLOGY_SOCKET(kid->child);
> +        if (socket->socket_id == socket_id) {
> +            return socket;
> +        }
> +    }
> +    return s390_create_socket(book, socket_id);
> +}
> +
> +/*
> + * s390_topology_new_cpu:
> + * @core_id: the core ID is machine wide
> + *
> + * We have a single book returned by s390_get_topology(),
> + * then we build the hierarchy on demand.
> + * Note that we do not destroy the hierarchy on error creating
> + * an entry in the topology, we just keept it empty.

s/keept/keep/

> + * We do not need to worry about not finding a topology level
> + * entry this would have been catched during smp parsing.

s/catched/caught/

> + */
> +void s390_topology_new_cpu(int core_id)
> +{
> +    const MachineState *ms = MACHINE(qdev_get_machine());
> +    S390TopologyBook *book;
> +    S390TopologySocket *socket;
> +    S390TopologyCores *cores;
> +    int cores_per_socket, sock_idx;
> +    int origin, bit;
> +
> +    book = s390_get_topology();
> +
> +    cores_per_socket = ms->smp.max_cpus / ms->smp.sockets;
> +
> +    sock_idx = (core_id / cores_per_socket);
> +    socket = s390_get_socket(book, sock_idx);
> +
> +    /*
> +     * We assert that all CPU are identical IFL, shared and

assert? Or did you mean assume? When reading something like "assert" I'd 
expect some error checking here...?

> +     * horizontal topology, the only reason to have several
> +     * S390TopologyCores is to have more than 64 CPUs.
> +     */
> +    origin = 64 * (core_id / 64);
> +
> +    cores = s390_get_cores(socket, origin);
> +
> +    bit = 63 - (core_id - origin);
> +    set_bit(bit, &cores->mask);
> +    cores->origin = origin;
> +}
> +
> +/*
> + * Setting the first topology: 1 book, 1 socket
> + * This is enough for 64 cores if the topology is flat (single socket)
> + */
> +void s390_topology_setup(MachineState *ms)
> +{
> +    DeviceState *dev;
> +
> +    /* Create BOOK bridge device */
> +    dev = qdev_new(TYPE_S390_TOPOLOGY_BOOK);
> +    object_property_add_child(qdev_get_machine(),
> +                              TYPE_S390_TOPOLOGY_BOOK, OBJECT(dev));
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +}
> +
> +S390TopologyBook *s390_get_topology(void)
> +{
> +    static S390TopologyBook *book;
> +
> +    if (!book) {
> +        book = S390_TOPOLOGY_BOOK(
> +            object_resolve_path(TYPE_S390_TOPOLOGY_BOOK, NULL));
> +        assert(book != NULL);
> +    }
> +
> +    return book;
> +}
> +
> +/* --- CORES Definitions --- */
> +
> +static Property s390_topology_cores_properties[] = {
> +    DEFINE_PROP_BOOL("dedicated", S390TopologyCores, dedicated, false),
> +    DEFINE_PROP_UINT8("polarity", S390TopologyCores, polarity,
> +                      S390_TOPOLOGY_POLARITY_H),
> +    DEFINE_PROP_UINT8("cputype", S390TopologyCores, cputype,
> +                      S390_TOPOLOGY_CPU_TYPE),
> +    DEFINE_PROP_UINT16("origin", S390TopologyCores, origin, 0),
> +    DEFINE_PROP_UINT64("mask", S390TopologyCores, mask, 0),
> +    DEFINE_PROP_UINT8("id", S390TopologyCores, id, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void cpu_cores_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> +
> +    device_class_set_props(dc, s390_topology_cores_properties);
> +    hc->unplug = qdev_simple_device_unplug_cb;
> +    dc->bus_type = TYPE_S390_TOPOLOGY_SOCKET_BUS;
> +    dc->desc = "topology cpu entry";
> +}
> +
> +static const TypeInfo cpu_cores_info = {
> +    .name          = TYPE_S390_TOPOLOGY_CORES,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(S390TopologyCores),
> +    .class_init    = cpu_cores_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_HOTPLUG_HANDLER },
> +        { }
> +    }
> +};
> +
> +/* --- SOCKETS Definitions --- */
> +static Property s390_topology_socket_properties[] = {
> +    DEFINE_PROP_UINT8("socket_id", S390TopologySocket, socket_id, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static char *socket_bus_get_dev_path(DeviceState *dev)
> +{
> +    S390TopologySocket *socket = S390_TOPOLOGY_SOCKET(dev);
> +    DeviceState *book = dev->parent_bus->parent;
> +    char *id = qdev_get_dev_path(book);
> +    char *ret;
> +
> +    if (id) {
> +        ret = g_strdup_printf("%s:%02d", id, socket->socket_id);
> +        g_free(id);
> +    } else {
> +        ret = g_malloc(6);
> +        snprintf(ret, 6, "_:%02d", socket->socket_id);

Why don't you use g_strdup_printf() here?

> +    }
> +
> +    return ret;
> +}
> +
> +static void socket_bus_class_init(ObjectClass *oc, void *data)
> +{
> +    BusClass *k = BUS_CLASS(oc);
> +
> +    k->get_dev_path = socket_bus_get_dev_path;
> +    k->max_dev = S390_MAX_SOCKETS;
> +}
> +
> +static const TypeInfo socket_bus_info = {
> +    .name = TYPE_S390_TOPOLOGY_SOCKET_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_size = 0,
> +    .class_init = socket_bus_class_init,
> +};
> +
> +static void s390_socket_device_realize(DeviceState *dev, Error **errp)
> +{
> +    S390TopologySocket *socket = S390_TOPOLOGY_SOCKET(dev);
> +    BusState *bus;
> +
> +    bus = qbus_create(TYPE_S390_TOPOLOGY_SOCKET_BUS, dev,
> +                      TYPE_S390_TOPOLOGY_SOCKET_BUS);
> +    qbus_set_hotplug_handler(bus, OBJECT(dev));
> +    socket->bus = bus;
> +}
> +
> +static void socket_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> +
> +    hc->unplug = qdev_simple_device_unplug_cb;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->bus_type = TYPE_S390_TOPOLOGY_BOOK_BUS;
> +    dc->realize = s390_socket_device_realize;
> +    device_class_set_props(dc, s390_topology_socket_properties);
> +    dc->desc = "topology socket";
> +}
> +
> +static const TypeInfo socket_info = {
> +    .name          = TYPE_S390_TOPOLOGY_SOCKET,
> +    .parent        = TYPE_DEVICE,
> +    .instance_size = sizeof(S390TopologySocket),
> +    .class_init    = socket_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_HOTPLUG_HANDLER },
> +        { }
> +    }
> +};
> +
> +static char *book_bus_get_dev_path(DeviceState *dev)
> +{
> +    return g_strdup_printf("00");
> +}
> +
> +static void book_bus_class_init(ObjectClass *oc, void *data)
> +{
> +    BusClass *k = BUS_CLASS(oc);
> +
> +    k->get_dev_path = book_bus_get_dev_path;
> +    k->max_dev = S390_MAX_BOOKS;
> +}
> +
> +static const TypeInfo book_bus_info = {
> +    .name = TYPE_S390_TOPOLOGY_BOOK_BUS,
> +    .parent = TYPE_BUS,
> +    .instance_size = 0,
> +    .class_init = book_bus_class_init,
> +};
> +
> +static void s390_book_device_realize(DeviceState *dev, Error **errp)
> +{
> +    S390TopologyBook *book = S390_TOPOLOGY_BOOK(dev);
> +    BusState *bus;
> +
> +    bus = qbus_create(TYPE_S390_TOPOLOGY_BOOK_BUS, dev,
> +                      TYPE_S390_TOPOLOGY_BOOK_BUS);
> +    qbus_set_hotplug_handler(bus, OBJECT(dev));
> +    book->bus = bus;
> +}
> +
> +static void book_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> +
> +    hc->unplug = qdev_simple_device_unplug_cb;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->realize = s390_book_device_realize;
> +    dc->desc = "topology book";
> +}
> +
> +static const TypeInfo book_info = {
> +    .name          = TYPE_S390_TOPOLOGY_BOOK,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(S390TopologyBook),
> +    .class_init    = book_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_HOTPLUG_HANDLER },
> +        { }
> +    }
> +};

I didn't spot any migration related code in here ... is this already 
migration-safe?

  Thomas


