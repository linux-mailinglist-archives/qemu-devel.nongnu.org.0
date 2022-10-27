Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BBB60F1FE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ony0g-0002ka-J7; Thu, 27 Oct 2022 04:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ony0X-0002Jw-79
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ony0U-0003Du-VO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666858374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMLmrjTYt/Ew4fpwtFpLeNDhZq2bPxydwKRGSfT/icc=;
 b=NuTAHoiYf1Awa9J71en/aeTGcfPWrza6hMgNWhZkHrpdPpvcR26uNj36ZzSGL62HoTrxy2
 Ns6uMWG9uYn34rLo4FSA3bAbJXpevuonsrYRigWKOcPVAb4vbDS3A+ByAd+SycYS3aGm4v
 yIXIcA377G1vqVgvQ2ILTd0XJ0qA6ZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-6sNKYCYMPVqJ0gY9r1Zuhg-1; Thu, 27 Oct 2022 04:12:52 -0400
X-MC-Unique: 6sNKYCYMPVqJ0gY9r1Zuhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so369739wmh.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yMLmrjTYt/Ew4fpwtFpLeNDhZq2bPxydwKRGSfT/icc=;
 b=fUuKFhDO38GzaA2CNnATSBpCCbVRYy9fXcFCIyvCwsrmbJ0AfKRuiiGSFqB3n4d1vS
 aenxs+c3IlgXaKSN+9T/wVmkAvqMEUZF2nOX1z40wZmjfJPNLPfP5U6/eePBZLm8QdCH
 n09EwyJPiLQtPHc/+9KaLS4Q/XwZE/PUc6ZEZA9JfB8nx7B9TcsZQNZhlVggVxRyMcN6
 N+KRjaZRWRSiQyrdMPDdVtev+v4kzosyvgcNrxdnW83tG7rDaJBjMLPfoqLE6rzs0v3S
 4gnOV5eNtzvRudg8yV2U5PMqNHobpdd9bLzSFPrDGgB5Fv5QjbN1syIN1z+WtajFt14w
 uhoA==
X-Gm-Message-State: ACrzQf3Y80lTmHDFp2uiPO2sMosQMjlhq0a0uiYg4N6Lq5HKxvKZTEEI
 KPeQyt5F9ZUh3JRzTapUPbLuqIeTxgrXTUjB7zvSjbvMN3icmAb7TTkgXIga6RSvo3Aj2W569PF
 6TXG1rIxkeQ/24/c=
X-Received: by 2002:a5d:64c7:0:b0:22e:43a6:2801 with SMTP id
 f7-20020a5d64c7000000b0022e43a62801mr32489036wri.612.1666858371530; 
 Thu, 27 Oct 2022 01:12:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Y7mu9Z/eNIgZoHr+NeSQKewBR2APxBCg/cG4RpWK4mzK9+m00W4RBznbgMhNNbGRx93BMdA==
X-Received: by 2002:a5d:64c7:0:b0:22e:43a6:2801 with SMTP id
 f7-20020a5d64c7000000b0022e43a62801mr32489007wri.612.1666858371285; 
 Thu, 27 Oct 2022 01:12:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a342933727sm4397657wms.3.2022.10.27.01.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 01:12:50 -0700 (PDT)
Message-ID: <f3f6d325-08a7-3e3d-6d4d-6b5b55c172f0@redhat.com>
Date: Thu, 27 Oct 2022 10:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v10 2/9] s390x/cpu topology: reporting the CPU topology to
 the guest
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-3-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221012162107.91734-3-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/10/2022 18.21, Pierre Morel wrote:
> The guest can use the STSI instruction to get a buffer filled
> with the CPU topology description.
> 
> Let us implement the STSI instruction for the basis CPU topology
> level, level 2.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   include/hw/s390x/cpu-topology.h |   3 +
>   target/s390x/cpu.h              |  48 ++++++++++++++
>   hw/s390x/cpu-topology.c         |   8 ++-
>   target/s390x/cpu_topology.c     | 109 ++++++++++++++++++++++++++++++++
>   target/s390x/kvm/kvm.c          |   6 +-
>   target/s390x/meson.build        |   1 +
>   6 files changed, 172 insertions(+), 3 deletions(-)
>   create mode 100644 target/s390x/cpu_topology.c
> 
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> index 66c171d0bc..61c11db017 100644
> --- a/include/hw/s390x/cpu-topology.h
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -13,6 +13,8 @@
>   #include "hw/qdev-core.h"
>   #include "qom/object.h"
>   
> +#define S390_TOPOLOGY_POLARITY_H  0x00
> +
>   typedef struct S390TopoContainer {
>       int active_count;
>   } S390TopoContainer;
> @@ -29,6 +31,7 @@ struct S390Topology {
>       S390TopoContainer *socket;
>       S390TopoTLE *tle;
>       MachineState *ms;
> +    QemuMutex topo_mutex;
>   };
>   
>   #define TYPE_S390_CPU_TOPOLOGY "s390-topology"
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7d6d01325b..d604aa9c78 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -565,6 +565,52 @@ typedef union SysIB {
>   } SysIB;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>   
> +/* CPU type Topology List Entry */
> +typedef struct SysIBTl_cpu {
> +        uint8_t nl;
> +        uint8_t reserved0[3];
> +        uint8_t reserved1:5;
> +        uint8_t dedicated:1;
> +        uint8_t polarity:2;
> +        uint8_t type;
> +        uint16_t origin;
> +        uint64_t mask;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_cpu;
> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
> +
> +/* Container type Topology List Entry */
> +typedef struct SysIBTl_container {
> +        uint8_t nl;
> +        uint8_t reserved[6];
> +        uint8_t id;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
> +
> +#define TOPOLOGY_NR_MAG  6
> +#define TOPOLOGY_NR_MAG6 0
> +#define TOPOLOGY_NR_MAG5 1
> +#define TOPOLOGY_NR_MAG4 2
> +#define TOPOLOGY_NR_MAG3 3
> +#define TOPOLOGY_NR_MAG2 4
> +#define TOPOLOGY_NR_MAG1 5
> +/* Configuration topology */
> +typedef struct SysIB_151x {
> +    uint8_t  reserved0[2];
> +    uint16_t length;
> +    uint8_t  mag[TOPOLOGY_NR_MAG];
> +    uint8_t  reserved1;
> +    uint8_t  mnest;
> +    uint32_t reserved2;
> +    char tle[0];
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIB_151x;
> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
> +
> +/* Maxi size of a SYSIB structure is when all CPU are alone in a container */
> +#define S390_TOPOLOGY_SYSIB_SIZE (sizeof(SysIB_151x) +                         \
> +                                  S390_MAX_CPUS * (sizeof(SysIBTl_container) + \
> +                                                   sizeof(SysIBTl_cpu)))
> +
> +
>   /* MMU defines */
>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
>   #define ASCE_SUBSPACE         0x200       /* subspace group control           */
> @@ -843,4 +889,6 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>   
>   #include "exec/cpu-all.h"
>   
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
> +
>   #endif
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index 42b22a1831..c73cebfe6f 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -54,8 +54,6 @@ void s390_topology_new_cpu(int core_id)
>           return;
>       }
>   
> -    socket_id = core_id / topo->cpus;
> -
>       /*
>        * At the core level, each CPU is represented by a bit in a 64bit
>        * unsigned long which represent the presence of a CPU.
> @@ -76,8 +74,13 @@ void s390_topology_new_cpu(int core_id)
>       bit %= 64;
>       bit = 63 - bit;
>   
> +    qemu_mutex_lock(&topo->topo_mutex);
> +
> +    socket_id = core_id / topo->cpus;
>       topo->socket[socket_id].active_count++;
>       set_bit(bit, &topo->tle[socket_id].mask[origin]);
> +
> +    qemu_mutex_unlock(&topo->topo_mutex);
>   }
>   
>   /**
> @@ -101,6 +104,7 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
>       topo->tle = g_new0(S390TopoTLE, ms->smp.max_cpus);
>   
>       topo->ms = ms;
> +    qemu_mutex_init(&topo->topo_mutex);
>   }
>   
>   /**
> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
> new file mode 100644
> index 0000000000..df86a98f23
> --- /dev/null
> +++ b/target/s390x/cpu_topology.c
> @@ -0,0 +1,109 @@
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2022
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/s390x/pv.h"
> +#include "hw/sysbus.h"
> +#include "hw/s390x/cpu-topology.h"
> +#include "hw/s390x/sclp.h"
> +
> +#define S390_TOPOLOGY_MAX_STSI_SIZE (S390_MAX_CPUS *              \
> +                                     (sizeof(SysIB_151x) +        \
> +                                      sizeof(SysIBTl_container) + \
> +                                      sizeof(SysIBTl_cpu)))
> +
> +static char *fill_container(char *p, int level, int id)
> +{
> +    SysIBTl_container *tle = (SysIBTl_container *)p;
> +
> +    tle->nl = level;
> +    tle->id = id;
> +    return p + sizeof(*tle);
> +}
> +
> +static char *fill_tle_cpu(char *p, uint64_t mask, int origin)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +
> +    tle->nl = 0;
> +    tle->dedicated = 1;
> +    tle->polarity = S390_TOPOLOGY_POLARITY_H;
> +    tle->type = S390_TOPOLOGY_CPU_IFL;
> +    tle->origin = cpu_to_be64(origin * 64);
> +    tle->mask = cpu_to_be64(mask);
> +    return p + sizeof(*tle);
> +}
> +
> +static char *s390_top_set_level2(S390Topology *topo, char *p)
> +{
> +    MachineState *ms = topo->ms;
> +    int i, origin;
> +
> +    for (i = 0; i < ms->smp.sockets; i++) {
> +        if (!topo->socket[i].active_count) {
> +            continue;
> +        }
> +        p = fill_container(p, 1, i);
> +        for (origin = 0; origin < S390_TOPOLOGY_MAX_ORIGIN; origin++) {
> +            uint64_t mask = 0L;
> +
> +            mask = topo->tle[i].mask[origin];
> +            if (mask) {
> +                p = fill_tle_cpu(p, mask, origin);
> +            }
> +        }
> +    }
> +    return p;
> +}
> +
> +static int setup_stsi(SysIB_151x *sysib, int level)
> +{
> +    S390Topology *topo = s390_get_topology();
> +    MachineState *ms = topo->ms;
> +    char *p = sysib->tle;
> +
> +    qemu_mutex_lock(&topo->topo_mutex);
> +
> +    sysib->mnest = level;
> +    switch (level) {
> +    case 2:
> +        sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
> +        sysib->mag[TOPOLOGY_NR_MAG1] = topo->cpus;
> +        p = s390_top_set_level2(topo, p);
> +        break;
> +    }
> +
> +    qemu_mutex_unlock(&topo->topo_mutex);

Could you elaborate (maybe in the commit description) why you need a 
separate mutex here? ... I'd expect that all the STSI stuff is run with the 
BQL (big qemu lock) held (see kvm_arch_handle_exit()), so yet another mutex 
sounds rendundant to me here?

  Thomas


