Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D352D0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:49:26 +0200 (CEST)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdiV-0001j9-1B
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrdey-0000ij-GJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrdes-0003yK-OQ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652957125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO7k9a3VDUNcWJKEzdBq/UG40e+ezY5gctr0sD6A4l8=;
 b=Rn/+ULjBrnYCiorzyYs++sWxIwp++9YE+3R1NMHym3EmgUC8IeUuUS/9Q1/XEhhrgPeyWA
 2rxfN3b9gh9Ke1u0L3yqPR/nw2i/k0W/1FTM/Hg6DVFxopgzA6lLHyIm88TiO2fqqcngOA
 X+356mEsILV1Nu8CZ0o7NVyn1Z1EYFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-G_Lh08DnNbGZAsPDe8hd6Q-1; Thu, 19 May 2022 06:45:24 -0400
X-MC-Unique: G_Lh08DnNbGZAsPDe8hd6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 e6-20020adfef06000000b0020d08e465e2so1416448wro.3
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=GO7k9a3VDUNcWJKEzdBq/UG40e+ezY5gctr0sD6A4l8=;
 b=KmQsJ7aECTIGpTOwG1cmE56vJfU50/hWWoKpL5wke2OFQnT4jBj9d/2wU4LSc22kyT
 cNom7cFN+rMjcAP1Xx/KnJp/uIpzjUdCxYh7TvyvcZ8Ern8ERuJKT7/wkg6V6g0FnC1r
 5TbxDJsobAOxzOLECydvcjcxRfJUIPYntSuzW1QgRa0YP4a2WAQI3mmuS/gG8AixK7Hb
 pc8IkNR0Gg3GkWIEHRwL44rLg6PYLyOIi88rN+ULnEysVs56ZfihRx/515ictXw1+1vQ
 lxBxAjIz+2m4CahW6j/Z6r/fqFZiELVW8Kh1xkQoxb13HTvSOqnd2PEJe7dEcn6qiIDU
 PZ8Q==
X-Gm-Message-State: AOAM533qNQdIc3CDqkpilE7mi3Q8ef6TCt5tmdaANue5mzHvQSNM7AwC
 xzB+z+YHl5pUdm6LyQddDMJnRoeRalvEwF6vSrMAxruKIBAY6GWNUBbPsZKClg8MmC/x5xRhit+
 YPTRqYTD+oxOStlo=
X-Received: by 2002:a5d:5253:0:b0:20d:fc0:a3ff with SMTP id
 k19-20020a5d5253000000b0020d0fc0a3ffmr3385833wrc.505.1652957123287; 
 Thu, 19 May 2022 03:45:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTZK/GY+85BeqlHtAC3WP8BiWHuh5GxGivdwQxridEoYwofvgpMufbyvYMDpZsax9Il2baqQ==
X-Received: by 2002:a5d:5253:0:b0:20d:fc0:a3ff with SMTP id
 k19-20020a5d5253000000b0020d0fc0a3ffmr3385797wrc.505.1652957122930; 
 Thu, 19 May 2022 03:45:22 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 v15-20020adf8b4f000000b0020d02cbbb87sm4872100wra.16.2022.05.19.03.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 03:45:22 -0700 (PDT)
Message-ID: <f18cc9b2-c897-d15b-706f-7a2cba2a1484@redhat.com>
Date: Thu, 19 May 2022 12:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-4-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 03/13] s390x: topology: CPU topology objects and
 structures
In-Reply-To: <20220420115745.13696-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 20/04/2022 13.57, Pierre Morel wrote:
> We use new objects to have a dynamic administration of the CPU topology.
> The highest level object in this implementation is the s390 book and
> in this first implementation of CPU topology for S390 we have a single
> book.
> The book is built as a SYSBUS bridge during the CPU initialization.
> Other objects, sockets and core will be built after the parsing
> of the QEMU -smp argument.
> 
> Every object under this single book will be build dynamically
> immediately after a CPU has be realized if it is needed.
> The CPU will fill the sockets once after the other, according to the
> number of core per socket defined during the smp parsing.
> 
> Each CPU inside a socket will be represented by a bit in a 64bit
> unsigned long. Set on plug and clear on unplug of a CPU.
> 
> For the S390 CPU topology, thread and cores are merged into
> topology cores and the number of topology cores is the multiplication
> of cores by the numbers of threads.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c         | 361 ++++++++++++++++++++++++++++++++
>   hw/s390x/meson.build            |   1 +
>   hw/s390x/s390-virtio-ccw.c      |   4 +
>   include/hw/s390x/cpu-topology.h |  74 +++++++
>   target/s390x/cpu.h              |  47 +++++
>   5 files changed, 487 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 include/hw/s390x/cpu-topology.h
> 
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..b7131b4ac3
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,361 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright 2021 IBM Corp.

2022 now?

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
> +    if (socket->bus->num_children >= (ms->smp.cores * ms->smp.threads)) {

You can drop the innermost parentheses.

Also, can this situation ever happen? If not, please turn it into an 
assert() instead.

> +        return NULL;

You return NULL here, but the callers don't check for NULL and use the 
pointer anyway. So either this should not return NULL or you have to check 
the value at the calling site.

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

You already look up the MachineState pointer in s390_topology_new_cpu() ... 
so to optimize a little bit, you could pass it in as parameter here instead.

> +    if (book->bus->num_children >= ms->smp.sockets) {
> +        return NULL;

Here again - the callers do not check for NULL pointer values, so this 
should either not return NULL or the callers need to be changed.

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
> +/*
> + * s390_get_cores:
> + * @socket: the socket to search into
> + * @origin: the origin specified for the S390TopologyCores
> + *
> + * returns a pointer to a S390TopologyCores structure within a socket having
> + * the specified origin.
> + * First search if the socket is already containing the S390TopologyCores
> + * structure and if not create one with this origin.
> + */
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
> +
> +/*
> + * s390_get_socket:
> + * @book: The book to search into
> + * @socket_id: the identifier of the socket to search for
> + *
> + * returns a pointer to a S390TopologySocket structure within a book having
> + * the specified socket_id.
> + * First search if the book is already containing the S390TopologySocket
> + * structure and if not create one with this socket_id.
> + */
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
> + * an entry in the topology, we just keep it empty.
> + * We do not need to worry about not finding a topology level
> + * entry this would have been caught during smp parsing.
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
> +     * At the core level, each CPU is represented by a bit in a 64bit
> +     * unsigned long. Set on plug and clear on unplug of a CPU.
> +     * The firmware assume that all CPU in the core description have the same
> +     * type, polarization and are all dedicated or shared.
> +     * In the case a socket contains CPU with different type, polarization
> +     * or dedication then they will be defined in different CPU containers.
> +     * Currently we assume all CPU are identical and the only reason to have
> +     * several S390TopologyCores inside a socket is to have more than 64 CPUs
> +     * in that case the origin field, representing the offset of the first CPU
> +     * in the CPU container allows to represent up to the maximal number of
> +     * CPU inside several CPU containers inside the socket container.
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
> +        ret = g_strdup_printf("_:%02d", socket->socket_id);
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
> +    bus = qbus_new(TYPE_S390_TOPOLOGY_SOCKET_BUS, dev,
> +                   TYPE_S390_TOPOLOGY_SOCKET_BUS);
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

If you just want to duplicate a static string, please g_strdup() instead.

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
> +    bus = qbus_new(TYPE_S390_TOPOLOGY_BOOK_BUS, dev,
> +                   TYPE_S390_TOPOLOGY_BOOK_BUS);
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
> +
> +static void topology_register(void)
> +{
> +    type_register_static(&cpu_cores_info);
> +    type_register_static(&socket_bus_info);
> +    type_register_static(&socket_info);
> +    type_register_static(&book_bus_info);
> +    type_register_static(&book_info);
> +}
> +
> +type_init(topology_register);
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 28484256ec..74678861cf 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -2,6 +2,7 @@ s390x_ss = ss.source_set()
>   s390x_ss.add(files(
>     'ap-bridge.c',
>     'ap-device.c',
> +  'cpu-topology.c',
>     'ccw-device.c',
>     'css-bridge.c',
>     'css.c',
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9..179846e3a3 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -42,6 +42,7 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/s390x/pv.h"
>   #include "migration/blocker.h"
> +#include "hw/s390x/cpu-topology.h"
>   
>   static Error *pv_mig_blocker;
>   
> @@ -88,6 +89,7 @@ static void s390_init_cpus(MachineState *machine)
>       /* initialize possible_cpus */
>       mc->possible_cpu_arch_ids(machine);
>   
> +    s390_topology_setup(machine);
>       for (i = 0; i < machine->smp.cpus; i++) {
>           s390x_new_cpu(machine->cpu_type, i, &error_fatal);
>       }
> @@ -305,6 +307,8 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
>       g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
>       ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);
>   
> +    s390_topology_new_cpu(cpu->env.core_id);

Why not pass the "ms" MachineState value to s390_topology_new_cpu() here, so 
you don't have to look it up there again?

>       if (dev->hotplugged) {
>           raise_irq_cpu_hotplug();
>       }
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> new file mode 100644
> index 0000000000..e6e013a8b8
> --- /dev/null
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -0,0 +1,74 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright 2021 IBM Corp.

2022 now?

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +#ifndef HW_S390X_CPU_TOPOLOGY_H
> +#define HW_S390X_CPU_TOPOLOGY_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +#define S390_TOPOLOGY_CPU_TYPE    0x03
> +
> +#define S390_TOPOLOGY_POLARITY_H  0x00
> +#define S390_TOPOLOGY_POLARITY_VL 0x01
> +#define S390_TOPOLOGY_POLARITY_VM 0x02
> +#define S390_TOPOLOGY_POLARITY_VH 0x03
> +
> +#define TYPE_S390_TOPOLOGY_CORES "topology cores"
> +    /*
> +     * Each CPU inside a socket will be represented by a bit in a 64bit
> +     * unsigned long. Set on plug and clear on unplug of a CPU.
> +     * All CPU inside a mask share the same dedicated, polarity and
> +     * cputype values.
> +     * The origin is the offset of the first CPU in a mask.
> +     */
> +struct S390TopologyCores {
> +    DeviceState parent_obj;
> +    uint8_t id;
> +    bool dedicated;
> +    uint8_t polarity;
> +    uint8_t cputype;

What's the benefit of using uint8_ts here? Why not simply an "int"?

> +    uint16_t origin;
> +    uint64_t mask;
> +    int cnt;
> +};
> +typedef struct S390TopologyCores S390TopologyCores;
> +OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyCores, S390_TOPOLOGY_CORES)
> +
> +#define TYPE_S390_TOPOLOGY_SOCKET "topology socket"
> +#define TYPE_S390_TOPOLOGY_SOCKET_BUS "socket-bus"
> +struct S390TopologySocket {
> +    DeviceState parent_obj;
> +    BusState *bus;
> +    uint8_t socket_id;

Again, why uint8_t ?

> +    int cnt;
> +};
> +typedef struct S390TopologySocket S390TopologySocket;
> +OBJECT_DECLARE_SIMPLE_TYPE(S390TopologySocket, S390_TOPOLOGY_SOCKET)
> +#define S390_MAX_SOCKETS 4
> +
> +#define TYPE_S390_TOPOLOGY_BOOK "topology book"
> +#define TYPE_S390_TOPOLOGY_BOOK_BUS "book-bus"
> +struct S390TopologyBook {
> +    SysBusDevice parent_obj;
> +    BusState *bus;
> +    uint8_t book_id;

dito

> +    int cnt;
> +};
> +typedef struct S390TopologyBook S390TopologyBook;
> +OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyBook, S390_TOPOLOGY_BOOK)
> +#define S390_MAX_BOOKS 1
> +
> +S390TopologyBook *s390_init_topology(void);
> +
> +S390TopologyBook *s390_get_topology(void);
> +void s390_topology_setup(MachineState *ms);
> +void s390_topology_new_cpu(int core_id);
> +
> +#endif

  Thomas


