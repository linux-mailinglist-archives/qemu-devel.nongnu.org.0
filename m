Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AA6A08FA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB6B-0007RQ-7D; Thu, 23 Feb 2023 07:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVB67-0007PI-BL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:53:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVB65-0006z5-Hn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677156796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxRHoavd4MDmnqbIu/ZiSEYwI9vrqzu7Su5XsON/qAY=;
 b=Sbo+IF3mdjZpAs8zE/qcLvnIz0RltK5cas/arTfQOVTSEH7YCz8UhrSqwWkNNZHTxoXAcN
 56jcK3jsGqlJq2uwmZs/Jb22fT4J953AZ3zb5Ar34m1RhhkWJafGX3LrR05gjX3zYFbpQV
 B2eDlj/wSnbyTbu4FLs68PzUZ6Ldtu4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-HZks_ctvMPuc-1PHSrh1jA-1; Thu, 23 Feb 2023 07:53:15 -0500
X-MC-Unique: HZks_ctvMPuc-1PHSrh1jA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so5170884wmj.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 04:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxRHoavd4MDmnqbIu/ZiSEYwI9vrqzu7Su5XsON/qAY=;
 b=ll5vMR0UtDaeKjWXNUxachIMp9CO9bGd98HQw8beowmJyYThb5/2C/OkW3AePbJIiZ
 aj7HiszoX3Qgc6enxsY7xvScgzLrd23CiYgT//5Fo7qhx6qWbBMH6JoKOfw9XXicoQ+W
 3Ct72Bvx1Av/eR0ZYCBzl9IXbvvRSWphYjyDFFAs9og9o6M9e3eTdldCPMAwfwBs3SKN
 eWF4vqB8klFP2BQV1ToYuF5xRU8VfpCM/vRZsjqePpAwibTXgWnUIivNQ3Zvv5CE/qU9
 8VH6EWRXS26tJ1xjmU5trvsFg5o3IuRLlbPIVtgWqYjSz+VYcOGAAjqKtmGYyyKMK652
 QDzw==
X-Gm-Message-State: AO0yUKUuak6eSgDE+Rw2KQ67QMRayc2W3R/JW6CQxC6Kh55KjXVNsXCj
 EYuaXol9fsnSdisHf90Kp6MjcIN7Vi35uFG3BMcOjMUFwszTo8/1DrZds/ByRWfOcUIajek6Yuy
 oqXsBgLnVTvB4AbA=
X-Received: by 2002:a5d:6950:0:b0:2bf:cfb4:2e1 with SMTP id
 r16-20020a5d6950000000b002bfcfb402e1mr10823693wrw.45.1677156794181; 
 Thu, 23 Feb 2023 04:53:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/L9zPBxv9S/OC02opzujXuGfsuJlgG4MIe0xcMDd7fYDFMq1nf+trYQ1oVjS/UdxtdoNUF0A==
X-Received: by 2002:a5d:6950:0:b0:2bf:cfb4:2e1 with SMTP id
 r16-20020a5d6950000000b002bfcfb402e1mr10823662wrw.45.1677156793883; 
 Thu, 23 Feb 2023 04:53:13 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 v26-20020a5d591a000000b002c573cff730sm7162515wrd.68.2023.02.23.04.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 04:53:12 -0800 (PST)
Message-ID: <4bd16293-62e8-d7ea-dab4-9e5cb0208812@redhat.com>
Date: Thu, 23 Feb 2023 13:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-3-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 02/11] s390x/cpu topology: add topology entries on CPU
 hotplug
In-Reply-To: <20230222142105.84700-3-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/02/2023 15.20, Pierre Morel wrote:
> The topology information are attributes of the CPU and are
> specified during the CPU device creation.
...
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> index 83f31604cc..fa7f885a9f 100644
> --- a/include/hw/s390x/cpu-topology.h
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -10,6 +10,47 @@
>   #ifndef HW_S390X_CPU_TOPOLOGY_H
>   #define HW_S390X_CPU_TOPOLOGY_H
>   
> +#include "qemu/queue.h"
> +#include "hw/boards.h"
> +#include "qapi/qapi-types-machine-target.h"
> +
>   #define S390_TOPOLOGY_CPU_IFL   0x03
>   
> +typedef struct S390Topology {
> +    uint8_t *cores_per_socket;
> +    CpuTopology *smp;
> +    CpuS390Polarization polarization;
> +} S390Topology;
> +
> +#ifdef CONFIG_KVM
> +bool s390_has_topology(void);
> +void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error **errp);
> +#else
> +static inline bool s390_has_topology(void)
> +{
> +       return false;
> +}
> +static inline void s390_topology_setup_cpu(MachineState *ms,
> +                                           S390CPU *cpu,
> +                                           Error **errp) {}
> +#endif
> +
> +extern S390Topology s390_topology;
> +int s390_socket_nb(S390CPU *cpu);
> +
> +static inline int s390_std_socket(int n, CpuTopology *smp)
> +{
> +    return (n / smp->cores) % smp->sockets;
> +}
> +
> +static inline int s390_std_book(int n, CpuTopology *smp)
> +{
> +    return (n / (smp->cores * smp->sockets)) % smp->books;
> +}
> +
> +static inline int s390_std_drawer(int n, CpuTopology *smp)
> +{
> +    return (n / (smp->cores * smp->sockets * smp->books)) % smp->books;

Shouldn't that be " % smp->drawers" instead?

> +}
> +
>   #endif
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..59f2cc15c7
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,270 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright IBM Corp. 2022
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
> +#include "hw/qdev-properties.h"
> +#include "hw/boards.h"
> +#include "qemu/typedefs.h"
> +#include "target/s390x/cpu.h"
> +#include "hw/s390x/s390-virtio-ccw.h"
> +#include "hw/s390x/cpu-topology.h"
> +
> +/*
> + * s390_topology is used to keep the topology information.
> + * .cores_per_socket: tracks information on the count of cores
> + *                    per socket.
> + * .smp: keeps track of the machine topology.
> + *
> + */
> +S390Topology s390_topology = {
> +    /* will be initialized after the cpu model is realized */
> +    .cores_per_socket = NULL,
> +    .smp = NULL,
> +    .polarization = S390_CPU_POLARIZATION_HORIZONTAL,
> +};
> +
> +/**
> + * s390_socket_nb:
> + * @cpu: s390x CPU
> + *
> + * Returns the socket number used inside the cores_per_socket array
> + * for a cpu.
> + */
> +int s390_socket_nb(S390CPU *cpu)
> +{
> +    return (cpu->env.drawer_id * s390_topology.smp->books + cpu->env.book_id) *
> +           s390_topology.smp->sockets + cpu->env.socket_id;
> +}
> +
> +/**
> + * s390_has_topology:
> + *
> + * Return value: if the topology is supported by the machine.
> + */
> +bool s390_has_topology(void)
> +{
> +    return false;
> +}
> +
> +/**
> + * s390_topology_init:
> + * @ms: the machine state where the machine topology is defined
> + *
> + * Keep track of the machine topology.
> + *
> + * Allocate an array to keep the count of cores per socket.
> + * The index of the array starts at socket 0 from book 0 and
> + * drawer 0 up to the maximum allowed by the machine topology.
> + */
> +static void s390_topology_init(MachineState *ms)
> +{
> +    CpuTopology *smp = &ms->smp;
> +
> +    s390_topology.smp = smp;
> +    s390_topology.cores_per_socket = g_new0(uint8_t, smp->sockets *
> +                                            smp->books * smp->drawers);
> +}
> +
> +/**
> + * s390_topology_cpu_default:
> + * @cpu: pointer to a S390CPU
> + * @errp: Error pointer
> + *
> + * Setup the default topology if no attributes are already set.
> + * Passing a CPU with some, but not all, attributes set is considered
> + * an error.
> + *
> + * The function calculates the (drawer_id, book_id, socket_id)
> + * topology by filling the cores starting from the first socket
> + * (0, 0, 0) up to the last (smp->drawers, smp->books, smp->sockets).
> + *
> + * CPU type, entitlement and dedication have defaults values set in the
> + * s390x_cpu_properties, however entitlement is forced to 0 'none' when
> + * the polarization is horizontale.
> + */
> +static void s390_topology_cpu_default(S390CPU *cpu, Error **errp)
> +{
> +    CpuTopology *smp = s390_topology.smp;
> +    CPUS390XState *env = &cpu->env;
> +
> +    /* All geometry topology attributes must be set or all unset */
> +    if ((env->socket_id < 0 || env->book_id < 0 || env->drawer_id < 0) &&
> +        (env->socket_id >= 0 || env->book_id >= 0 || env->drawer_id >= 0)) {
> +        error_setg(errp,
> +                   "Please define all or none of the topology geometry attributes");
> +        return;
> +    }
> +
> +    /* Check if one of the geometry topology is unset */
> +    if (env->socket_id < 0) {
> +        /* Calculate default geometry topology attributes */
> +        env->socket_id = s390_std_socket(env->core_id, smp);
> +        env->book_id = s390_std_book(env->core_id, smp);
> +        env->drawer_id = s390_std_drawer(env->core_id, smp);
> +    }
> +
> +    if (s390_topology.polarization == S390_CPU_POLARIZATION_HORIZONTAL) {
> +        env->entitlement = 0;

Should this be S390_CPU_ENTITLEMENT_HORIZONTAL instead of 0 ?

> +    }
> +}

  Thomas



