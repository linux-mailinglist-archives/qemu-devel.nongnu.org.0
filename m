Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3488366450C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:39:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFdd-0007NF-7k; Tue, 10 Jan 2023 09:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFFdZ-0007IQ-Ci
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:30:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFFdX-0000kF-He
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673360998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Mdbv1G64fK2AhDOfIQsT2A/oo3wn+sJmLF67R19hxs=;
 b=ZtqDhguxDMFWQI3kDmWj2rfsF+0Ilc5Fi7QwpwaOuyKYXeXUwMqVOKHsBa1UpL8XUEWkZs
 EwTN1kVj1ZT33Ii7t9szY4+up4mxRxY7cLnbwu2DJve8zPihUJBVuJf7xkLkl7XOc9J4UK
 oYo/VrjRVx9o8IvwCBvNjWGC/N08Eu0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-PBE1THV5PWyAj2A4k4Yfxw-1; Tue, 10 Jan 2023 09:29:57 -0500
X-MC-Unique: PBE1THV5PWyAj2A4k4Yfxw-1
Received: by mail-qk1-f200.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so8816943qko.15
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 06:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Mdbv1G64fK2AhDOfIQsT2A/oo3wn+sJmLF67R19hxs=;
 b=xhnLhDp2K805Iklcrra4/0DilvciTVmTV75YPR0juDgyEAL6KyR7z1AlleLYG7vLZp
 vTg5dVrCFV9TRvi6RJM5oDjjEVzaufELBmdzwzLJ93qrFT/W/ZAujW8iMLfxDWxwQC/t
 GBRvyyM7GQcMuuJQwq3CN6eTUOa+ZcZkXXm+JL0v4mldKNNtWIYH8fB0UZLEL/KUGyQB
 LicvU/Gb3/jjejjKU2rF3Ko3Uosb8spfnukfN/ZsV35d5jmjUTQnP57WNCJ43n9poKhk
 b3wxdDbq620TeF4wnpveAJOrHIaJFV5MbFfDgCVkKVIIjffduqhp0IwVq3L1YESHKLU+
 sSaw==
X-Gm-Message-State: AFqh2kr5na3HILORkuvQGWv/Ujtlp2DwIgm28qiAYNDrglkDu9c6lL38
 vf9BmOahAc2EgGh78MxS4Y0kYWwWS/VDZRJbr1crz/nm/76d5WT3llVTdqo6E2UuLIecQMBYm83
 IYjJoWt/VrYgeWE4=
X-Received: by 2002:a05:622a:4d47:b0:3a6:46b4:2a6b with SMTP id
 fe7-20020a05622a4d4700b003a646b42a6bmr106800039qtb.27.1673360996572; 
 Tue, 10 Jan 2023 06:29:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZGnkw4qQORntpkkAZWTj8hOW2+/J7s2o1QV08mVVhhKkLRkEVJi6r0FHboC8QeUQfmo81uA==
X-Received: by 2002:a05:622a:4d47:b0:3a6:46b4:2a6b with SMTP id
 fe7-20020a05622a4d4700b003a646b42a6bmr106800002qtb.27.1673360996267; 
 Tue, 10 Jan 2023 06:29:56 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a430c00b006ee949b8051sm7167900qko.51.2023.01.10.06.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 06:29:55 -0800 (PST)
Message-ID: <5cf19913-b2d7-d72d-4332-27aa484f72e4@redhat.com>
Date: Tue, 10 Jan 2023 15:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-4-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
In-Reply-To: <20230105145313.168489-4-pmorel@linux.ibm.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> On interception of STSI(15.1.x) the System Information Block
> (SYSIB) is built from the list of pre-ordered topology entries.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 39ea63a416..78988048dd 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -561,6 +561,25 @@ typedef struct SysIB_322 {
>   } SysIB_322;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB_322) != 4096);
>   
> +#define S390_TOPOLOGY_MAG  6
> +#define S390_TOPOLOGY_MAG6 0
> +#define S390_TOPOLOGY_MAG5 1
> +#define S390_TOPOLOGY_MAG4 2
> +#define S390_TOPOLOGY_MAG3 3
> +#define S390_TOPOLOGY_MAG2 4
> +#define S390_TOPOLOGY_MAG1 5
> +/* Configuration topology */
> +typedef struct SysIB_151x {
> +    uint8_t  reserved0[2];
> +    uint16_t length;
> +    uint8_t  mag[S390_TOPOLOGY_MAG];
> +    uint8_t  reserved1;
> +    uint8_t  mnest;
> +    uint32_t reserved2;
> +    char tle[];
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIB_151x;
> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
> +
>   typedef union SysIB {
>       SysIB_111 sysib_111;
>       SysIB_121 sysib_121;
> @@ -568,9 +587,68 @@ typedef union SysIB {
>       SysIB_221 sysib_221;
>       SysIB_222 sysib_222;
>       SysIB_322 sysib_322;
> +    SysIB_151x sysib_151x;
>   } SysIB;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>   
> +/*
> + * CPU Topology List provided by STSI with fc=15 provides a list
> + * of two different Topology List Entries (TLE) types to specify
> + * the topology hierarchy.
> + *
> + * - Container Topology List Entry
> + *   Defines a container to contain other Topology List Entries
> + *   of any type, nested containers or CPU.
> + * - CPU Topology List Entry
> + *   Specifies the CPUs position, type, entitlement and polarization
> + *   of the CPUs contained in the last Container TLE.
> + *
> + * There can be theoretically up to five levels of containers, QEMU
> + * uses only one level, the socket level.

I guess that sentence needs an update again, now that you've re-added the 
books and drawers?

> + * A container of with a nesting level (NL) greater than 1 can only
> + * contain another container of nesting level NL-1.
> + *
> + * A container of nesting level 1 (socket), contains as many CPU TLE
> + * as needed to describe the position and qualities of all CPUs inside
> + * the container.
> + * The qualities of a CPU are polarization, entitlement and type.
> + *
> + * The CPU TLE defines the position of the CPUs of identical qualities
> + * using a 64bits mask which first bit has its offset defined by
> + * the CPU address orgin field of the CPU TLE like in:
> + * CPU address = origin * 64 + bit position within the mask
> + *
> + */
> +/* Container type Topology List Entry */
> +/* Container type Topology List Entry */

Duplicated comment.

> +typedef struct SysIBTl_container {
> +        uint8_t nl;
> +        uint8_t reserved[6];
> +        uint8_t id;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
> +
> +/* CPU type Topology List Entry */
> +typedef struct SysIBTl_cpu {
> +        uint8_t nl;
> +        uint8_t reserved0[3];
> +        uint8_t reserved1:5;
> +        uint8_t dedicated:1;
> +        uint8_t polarity:2;

Hmmm, yet another bitfield...

> +        uint8_t type;
> +        uint16_t origin;
> +        uint64_t mask;
> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_cpu;
> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
> +
> +/* Max size of a SYSIB structure is when all CPU are alone in a container */
> +#define S390_TOPOLOGY_SYSIB_SIZE (sizeof(SysIB_151x) +                         \
> +                                  S390_MAX_CPUS * (sizeof(SysIBTl_container) + \
> +                                                   sizeof(SysIBTl_cpu)))
> +
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
> +
>   /* MMU defines */
>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
>   #define ASCE_SUBSPACE         0x200       /* subspace group control           */
> diff --git a/target/s390x/kvm/cpu_topology.c b/target/s390x/kvm/cpu_topology.c
> new file mode 100644
> index 0000000000..3831a3264c
> --- /dev/null
> +++ b/target/s390x/kvm/cpu_topology.c
> @@ -0,0 +1,136 @@
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2022

Happy new year?

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
> +#include "hw/s390x/sclp.h"
> +#include "hw/s390x/cpu-topology.h"
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
> +static char *fill_tle_cpu(char *p, S390TopologyEntry *entry)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +    s390_topology_id topology_id = entry->id;

What about the reserved fields? Should they get set to 0 ?

> +    tle->nl = 0;
> +    tle->dedicated = topology_id.d;
> +    tle->polarity = topology_id.p;
> +    tle->type = topology_id.type;
> +    tle->origin = topology_id.origin;
> +    tle->mask = cpu_to_be64(entry->mask);

So here you're already taking care of swapping the endianess in case we ever 
run this code with TCG, too ... so I think it would be great to also 
eliminate the bitfield in SysIBTl_cpu to be really on the safe side.

> +    return p + sizeof(*tle);
> +}
...
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
> +{
> +    union {
> +        char place_holder[S390_TOPOLOGY_SYSIB_SIZE];
> +        SysIB_151x sysib;
> +    } buffer QEMU_ALIGNED(8) = {};
> +    int len;
> +
> +    if (!s390_has_topology() || sel2 < 2 || sel2 > SCLP_READ_SCP_INFO_MNEST) {
> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    len = setup_stsi(cpu, &buffer.sysib, sel2);
> +
> +    if (len > 4096) {

Maybe use TARGET_PAGE_SIZE instead of 4096 ?

> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    buffer.sysib.length = cpu_to_be16(len);
> +    s390_cpu_virt_mem_write(cpu, addr, ar, &buffer.sysib, len);

Is this supposed to work with protected guests, too? If so, I think you 
likely need to use s390_cpu_pv_mem_write() for protected guests?

  Thomas


