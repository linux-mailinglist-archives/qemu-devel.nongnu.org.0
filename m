Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC259E480
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 15:33:15 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQU1q-0000x7-01
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 09:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQTzF-0007l3-Ow
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQTyz-00077z-4K
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661261415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZDMxaEuIdQKSuQqZQtMIgaw5oE1Md/xws3HZ974gr8=;
 b=ZxZVDYSnuW1vYvEbwXR1D6XyFObT0+Nvd2fwJLd26BGEXNOenbmKjDKls6gn8js5d5TeJn
 AqXxv6dPRPbn4bHlcIcBvVL8Y+ANyP7s5AKMjBMHpsG0O6tyhxPX+9/4YwQlLSBimTLyKv
 dxYyUdIiqJ+yRAc/uT77B8QOG0XZtv8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-xmFerCcrP-uK-bTJkyS2og-1; Tue, 23 Aug 2022 09:30:14 -0400
X-MC-Unique: xmFerCcrP-uK-bTJkyS2og-1
Received: by mail-wm1-f72.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso10269560wmq.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 06:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QZDMxaEuIdQKSuQqZQtMIgaw5oE1Md/xws3HZ974gr8=;
 b=24sGIb1xt2QSfd3+eq7PVhdaIH153wL0Cr3doqe0Q7VonTUrVjUz6uASlidFesbGbz
 rP/TTaaj3AYr14MCJNd9XXy/8BfYMfxdz06+jtwMo7XW3e+qSDuf+jaguw4A6areok5r
 22gj5l3HMVmIN9GnDzgA0TF2TP2v8VFwSs7GzUWhmQLJtSwQpf4NbsSkWa6eKQU19FIQ
 InpecVlO8Dv1ucc6JY9C5ZYXdiTmyZDb5k6Ci1JNGxOJRucgt9ODTSaSj0F5/I+k42lT
 rT4ZCIS4cwpndbtGzOi9o54k5+hBH6TGRaE8SBmHLMag7Pc+tVHDP/2eCptH5yHrh+Et
 sHEA==
X-Gm-Message-State: ACgBeo0OO94LCvuBhrlLbEzX/XffJfA6XcODqgNogGAObF5jhUyiKpNW
 XgblGZ3L9AUBpnZwe1y9+serG4fyvqqxYdYdLnTLTn3l6a/3o3gCZkdmF5RtBNkogaC/YzI1JIz
 tD4kNDKs/FPiVf0U=
X-Received: by 2002:a5d:4a11:0:b0:225:2f5e:c704 with SMTP id
 m17-20020a5d4a11000000b002252f5ec704mr13245452wrq.703.1661261412756; 
 Tue, 23 Aug 2022 06:30:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VPkqgtQASFvl0VXnyU15NJEWveqermBmzG/wRBBcecNvhy3MAC1nD76g/an01GGNmmOFi7Q==
X-Received: by 2002:a5d:4a11:0:b0:225:2f5e:c704 with SMTP id
 m17-20020a5d4a11000000b002252f5ec704mr13245419wrq.703.1661261412440; 
 Tue, 23 Aug 2022 06:30:12 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-217.web.vodafone.de.
 [109.43.178.217]) by smtp.gmail.com with ESMTPSA id
 g1-20020adffc81000000b0022520aba90asm14595051wrr.107.2022.08.23.06.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 06:30:11 -0700 (PDT)
Message-ID: <b6c981e0-56f5-25c3-3422-ed72c8561712@redhat.com>
Date: Tue, 23 Aug 2022 15:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
In-Reply-To: <20220620140352.39398-3-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/06/2022 16.03, Pierre Morel wrote:
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
>   hw/s390x/cpu-topology.c         | 391 ++++++++++++++++++++++++++++++++
>   hw/s390x/meson.build            |   1 +
>   hw/s390x/s390-virtio-ccw.c      |   6 +
>   include/hw/s390x/cpu-topology.h |  74 ++++++
>   target/s390x/cpu.h              |  47 ++++
>   5 files changed, 519 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
>   create mode 100644 include/hw/s390x/cpu-topology.h
...
> +bool s390_topology_new_cpu(MachineState *ms, int core_id, Error **errp)
> +{
> +    S390TopologyBook *book;
> +    S390TopologySocket *socket;
> +    S390TopologyCores *cores;
> +    int nb_cores_per_socket;
> +    int origin, bit;
> +
> +    book = s390_get_topology();
> +
> +    nb_cores_per_socket = ms->smp.cores * ms->smp.threads;
> +
> +    socket = s390_get_socket(ms, book, core_id / nb_cores_per_socket, errp);
> +    if (!socket) {
> +        return false;
> +    }
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

Maybe faster:

	origin = core_id & ~63;

By the way, where is this limitation to 64 coming from? Just because we're 
using a "unsigned long" for now? Or is this a limitation from the architecture?

> +    cores = s390_get_cores(ms, socket, origin, errp);
> +    if (!cores) {
> +        return false;
> +    }
> +
> +    bit = 63 - (core_id - origin);
> +    set_bit(bit, &cores->mask);
> +    cores->origin = origin;
> +
> +    return true;
> +}
...
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee..a586875b24 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -43,6 +43,7 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/s390x/pv.h"
>   #include "migration/blocker.h"
> +#include "hw/s390x/cpu-topology.h"
>   
>   static Error *pv_mig_blocker;
>   
> @@ -89,6 +90,7 @@ static void s390_init_cpus(MachineState *machine)
>       /* initialize possible_cpus */
>       mc->possible_cpu_arch_ids(machine);
>   
> +    s390_topology_setup(machine);

Is this safe with regards to migration? Did you tried a ping-pong migration 
from an older QEMU to a QEMU with your modifications and back to the older 
one? If it does not work, we might need to wire this setup to the machine 
types...

>       for (i = 0; i < machine->smp.cpus; i++) {
>           s390x_new_cpu(machine->cpu_type, i, &error_fatal);
>       }
> @@ -306,6 +308,10 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
>       g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
>       ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);
>   
> +    if (!s390_topology_new_cpu(ms, cpu->env.core_id, errp)) {
> +        return;
> +    }
> +
>       if (dev->hotplugged) {
>           raise_irq_cpu_hotplug();
>       }

  Thomas


