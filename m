Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B811A42D360
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:17:51 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mauzu-0005dM-Sg
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mauyx-0004vO-Tg
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mauyv-00080g-VQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634195809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NabZi1KVvh/NRuRZ7uTVim1K8MxHRdpJjTfzykbrkpU=;
 b=SVb4SBEV3jh+VxyblWW6RnpSunmNdAvkdlzKxrLtBfJsOdXe5qIcP/wcwofzOQ1C0/U6Xi
 f4e5mEF+drsOKSff3NDdkONisMRXK0+58fP7TvN7TO+V3LMFNLc0mgmM6svtKhuo+wQ6WB
 3UKkuNmw3XURMQD641mFxnwRq4Jnh5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-7yErjdzvOmSOOlzvPKjfrg-1; Thu, 14 Oct 2021 03:16:46 -0400
X-MC-Unique: 7yErjdzvOmSOOlzvPKjfrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p12-20020adfc38c000000b00160d6a7e293so3793054wrf.18
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 00:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NabZi1KVvh/NRuRZ7uTVim1K8MxHRdpJjTfzykbrkpU=;
 b=2k1hJUCP3meMhQG5dWBWNOn57LBrotI6yz1kdgkfDEntykLkK4GVaxpyyiWPfk3tqb
 PhlvSP5iRCL0Pj91SqC3g4Pt99idKKu3rfZ6ZlU3zc3vNmjaHhS/mDM7gqY9hTXBOW9B
 OBC69WXK3t8dHIdOJr8XzKl/U6oRNeCi5KwzkzYjv4Lwja4bGX8qB1ujAQfS0YpOz560
 BsvlZbjV78kEmk+0TueO7kQxnOe1Fs7ndmEoy8tuoTEKqZR5dA3uHxe9n0VrEOnuBo/W
 uophlbmU8k7WY2HIoMf6PJrUSXy31QQrpaU421W+zuMExFVRyp9Dsx8GKrL4LzDC2FDG
 YSJQ==
X-Gm-Message-State: AOAM531r49idYyZlCQGXNTypyE138VFilQHgDoFxARKSid8AlLXoJ63P
 vZbs1c+gYluS+33CtcJH0/622sJGKzWT+38FGh66r5I6x12ZofGhqiHa219+rZGVApy5B+ItH/k
 134LK/jd1toCC2sA=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr4679328wra.428.1634195804954; 
 Thu, 14 Oct 2021 00:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKhra56vRRHtET6559UVQPHC2BF8rOHppk07IQmBWhor2NXOFI41wUHO2Ji6jj6Ph3apOjzA==
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr4679294wra.428.1634195804653; 
 Thu, 14 Oct 2021 00:16:44 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o6sm2117554wri.49.2021.10.14.00.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 00:16:44 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] s390x: topology: CPU topology objects and
 structures
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-4-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <184be580-113d-6661-f88e-84846615b2a1@redhat.com>
Date: Thu, 14 Oct 2021 09:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1631800254-25762-4-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/09/2021 15.50, Pierre Morel wrote:
> We use new objects to have a dynamic administration of the CPU topology.
> The highest level object in this implementation is the s390 book and
> in this first implementation of CPU topology for S390 we have a single
> book.
> The book is built as a SYSBUS bridge during the CPU initialization.
> 
> Every object under this single book will be build dynamically
> immediately after a CPU has be realized if it is needed.
> The CPU will fill the sockets once after the other, according to the
> number of core per socket defined during the smp parsing.
> 
> Each CPU inside a socket will be represented by a bit in a 64bit
> unsigned long. Set on plug and clear on unplug of a CPU.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c         | 353 ++++++++++++++++++++++++++++++++
>   hw/s390x/meson.build            |   1 +
>   hw/s390x/s390-virtio-ccw.c      |   4 +
>   include/hw/s390x/cpu-topology.h |  67 ++++++
>   target/s390x/cpu.h              |  47 +++++
>   5 files changed, 472 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 include/hw/s390x/cpu-topology.h
> 
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..f0ffd86a4f
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,353 @@
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
> +     * We assume that all CPU are identical IFL, shared and
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

Are these "64" an artificial limit by the hardware? Or is it just an 
implementation detail in your code since you chose to use a uint64_t 
variable for the mask? In the latter case, why not use a bitfield? ... 
anyway, could you please add some more comments to the code why you are 
using "64" here? (e.g. the sentences "Each CPU inside a socket will be 
represented by a bit in a 64bit
  unsigned long. Set on plug and clear on unplug of a CPU." should  go into 
the cpu-topology.c file, too).

  Thomas


