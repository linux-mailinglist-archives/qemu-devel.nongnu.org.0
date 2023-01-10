Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5CE664148
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 14:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEFF-0007O8-8d; Tue, 10 Jan 2023 08:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFEEk-0007IU-Cs
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFEEh-00050E-T4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673355615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lyt+LeqAra/2an80GVSavy/Ah+MElPYQlCaDsqLXoo=;
 b=J3B0pJ3NhWeCY9fzPASRONRGshP9QWSLIfMgkWFnr5pp9ICgxAwO5Ze9ie4k5+6k+5lD8P
 jJ2rCAaS+fH1saXNm/j5Rcng5Nch10soJhnighZx7dZtaLM8HOghinZPtI4l9e5Vgrw0lD
 K66lnRQ3rLBtvLeSpZAXS/9QyfjsbvI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-vLiGGGgZMsW96UX_wA9IPg-1; Tue, 10 Jan 2023 08:00:13 -0500
X-MC-Unique: vLiGGGgZMsW96UX_wA9IPg-1
Received: by mail-qt1-f198.google.com with SMTP id
 fp22-20020a05622a509600b003ab920c4c89so5456142qtb.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 05:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lyt+LeqAra/2an80GVSavy/Ah+MElPYQlCaDsqLXoo=;
 b=BzLog2jbMuaX9CSHLhHFhYc2pGWLj4X40YKAW/giiOwczPFcd3J3zaUb85V7bL3jcJ
 cGCFjvD9blg6G0scB8aAcrd9pFXO2DZwpMJ2+1blL0FiirTBF0BghRpTA83NJ9cAFQT+
 dr8/5I5bgb8bEMBlSsNsydxlbVJKVRmnf8ZAqkdZUSIOs3Ea4GbPMzwzywSBoWkj6jZy
 qGUW+hwAQXo0hGU5ZAo1SHjiz0eJbFDdJDp6JyGjTKWJyWvyo7HTxAA/QJjZWxftN/Mr
 Yc2Bpqc0ZRuYyVd9nYS9x1yM1AkrRpKlGLBeT14KZXdmysi+tq1SNLZjWXGSPzGit4vg
 wehA==
X-Gm-Message-State: AFqh2kr6zNCY/HQVikSQNJDox0Zamre9fPvzphZpz7cdmHyd9M+R81GA
 geiUPX30eL/wjCA5vomPJlebo4vQneNKeZ1hTXt76aTs37UaXxJurcNaMf0dD3Idl1YDuA9QY3t
 Lt1lEb4Lee4tf+2A=
X-Received: by 2002:a05:622a:a07:b0:39c:da20:626 with SMTP id
 bv7-20020a05622a0a0700b0039cda200626mr4675624qtb.48.1673355613366; 
 Tue, 10 Jan 2023 05:00:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsyzI1XcrBxI7qdGiOhKArruwrgxzRvM+y22AXkx12eOQm5ESrddG1TdhyP1H9zKvr7IKlhqQ==
X-Received: by 2002:a05:622a:a07:b0:39c:da20:626 with SMTP id
 bv7-20020a05622a0a0700b0039cda200626mr4675582qtb.48.1673355613004; 
 Tue, 10 Jan 2023 05:00:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05620a25ca00b006fa4cac54a5sm7069613qko.72.2023.01.10.05.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 05:00:12 -0800 (PST)
Message-ID: <5c8a22bb-5a35-d71e-9e5a-39675fa04e66@redhat.com>
Date: Tue, 10 Jan 2023 14:00:07 +0100
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
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-3-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 02/11] s390x/cpu topology: add topology entries on CPU
 hotplug
In-Reply-To: <20230105145313.168489-3-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/01/2023 15.53, Pierre Morel wrote:
> The topology information are attributes of the CPU and are
> specified during the CPU device creation.
> 
> On hot plug, we gather the topology information on the core,
> creates a list of topology entries, each entry contains a single
> core mask of each core with identical topology and finaly we
> orders the list in topological order.
> The topological order is, from higher to lower priority:
> - physical topology
>      - drawer
>      - book
>      - socket
>      - core origin, offset in 64bit increment from core 0.
> - modifier attributes
>      - CPU type
>      - polarization entitlement
>      - dedication
> 
> The possibility to insert a CPU in a mask is dependent on the
> number of cores allowed in a socket, a book or a drawer, the
> checking is done during the hot plug of the CPU to have an
> immediate answer.
> 
> If the complete topology is not specified, the core is added
> in the physical topology based on its core ID and it gets
> defaults values for the modifier attributes.
> 
> This way, starting QEMU without specifying the topology can
> still get some adventage of the CPU topology.

s/adventage/advantage/

> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   include/hw/s390x/cpu-topology.h |  48 ++++++
>   hw/s390x/cpu-topology.c         | 293 ++++++++++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c      |  10 ++
>   hw/s390x/meson.build            |   1 +
>   4 files changed, 352 insertions(+)
>   create mode 100644 hw/s390x/cpu-topology.c
> 
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> index d945b57fc3..b3fd752d8d 100644
> --- a/include/hw/s390x/cpu-topology.h
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -10,7 +10,11 @@
>   #ifndef HW_S390X_CPU_TOPOLOGY_H
>   #define HW_S390X_CPU_TOPOLOGY_H
>   
> +#include "qemu/queue.h"
> +#include "hw/boards.h"
> +
>   #define S390_TOPOLOGY_CPU_IFL   0x03
> +#define S390_TOPOLOGY_MAX_ORIGIN ((63 + S390_MAX_CPUS) / 64)
>   
>   #define S390_TOPOLOGY_POLARITY_HORIZONTAL      0x00
>   #define S390_TOPOLOGY_POLARITY_VERTICAL_LOW    0x01
> @@ -20,4 +24,48 @@
>   #define S390_TOPOLOGY_SHARED    0x00
>   #define S390_TOPOLOGY_DEDICATED 0x01
>   
> +typedef union s390_topology_id {
> +    uint64_t id;
> +    struct {
> +        uint64_t level_6:8; /* byte 0 BE */
> +        uint64_t level_5:8; /* byte 1 BE */
> +        uint64_t drawer:8;  /* byte 2 BE */
> +        uint64_t book:8;    /* byte 3 BE */
> +        uint64_t socket:8;  /* byte 4 BE */
> +        uint64_t rsrv:5;
> +        uint64_t d:1;
> +        uint64_t p:2;       /* byte 5 BE */
> +        uint64_t type:8;    /* byte 6 BE */
> +        uint64_t origin:2;
> +        uint64_t core:6;    /* byte 7 BE */
> +    };
> +} s390_topology_id;

Bitmasks are OK for code that will definitely only ever work with KVM ... 
but this will certainly fail completely if we ever try to get it running 
with TCG later. Do we care? ... if so, you should certainly avoid a bitfield 
here. Especially since most of the fields are 8-bit anyway and could easily 
be represented by a "uint8_t" variable. Otherwise, just ignore my comment.

> +#define TOPO_CPU_MASK       0x000000000000003fUL
> +
> +typedef struct S390TopologyEntry {
> +    s390_topology_id id;
> +    QTAILQ_ENTRY(S390TopologyEntry) next;
> +    uint64_t mask;
> +} S390TopologyEntry;
> +
> +typedef struct S390Topology {
> +    QTAILQ_HEAD(, S390TopologyEntry) list;
> +    uint8_t *sockets;

So this "uint8_t" basically is a hidden limit of a maximum of 256 sockets 
that can be used for per book? Do we check that limit somewhere? (I looked 
for it, but I didn't spot such a check)

> +    CpuTopology *smp;
> +} S390Topology;
> +
> +#ifdef CONFIG_KVM
> +bool s390_has_topology(void);
> +void s390_topology_set_cpu(MachineState *ms, S390CPU *cpu, Error **errp);
> +#else
> +static inline bool s390_has_topology(void)
> +{
> +       return false;
> +}
> +static inline void s390_topology_set_cpu(MachineState *ms,
> +                                         S390CPU *cpu,
> +                                         Error **errp) {}
> +#endif
> +extern S390Topology s390_topology;
> +
>   #endif
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..438055c612
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,293 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright IBM Corp. 2022

Want to update to 2023 now?

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
> + * .list: queue the topology entries inside which
> + *        we keep the information on the CPU topology.
> + *
> + * .smp: keeps track of the machine topology.
> + *
> + * .socket: tracks information on the count of cores per socket.
> + *
> + */
> +S390Topology s390_topology = {
> +    .list = QTAILQ_HEAD_INITIALIZER(s390_topology.list),
> +    .sockets = NULL, /* will be initialized after the cpu model is realized */
> +};
> +
> +/**
> + * s390_socket_nb:
> + * @id: s390_topology_id
> + *
> + * Returns the socket number used inside the socket array.
> + */
> +static int s390_socket_nb(s390_topology_id id)
> +{
> +    return (id.socket + 1) * (id.book + 1) * (id.drawer + 1); > +}
I think there might be an off-by-one error in here - you likely need a "- 1" 
at the very end.

For example, assume that we have one socket, one book and one drawer, so 
id.socket, id.book and id.drawer would all be 0. The function then returns 1 ...

> +static void s390_topology_init(MachineState *ms)
> +{
> +    CpuTopology *smp = &ms->smp;
> +
> +    s390_topology.smp = smp;
> +    if (!s390_topology.sockets) {
> +        s390_topology.sockets = g_new0(uint8_t, smp->sockets *
> +                                       smp->books * smp->drawers);

... but here you only allocated one byte. So you later access 
s390_topology.sockets[s390_socket_nb(id)], i.e. s390_topology.sockets[1] 
which is out of bounds.

> +    }
> +}

  Thomas



