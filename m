Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D635F6F0A70
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:02:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4zr-0000Yt-Ox; Thu, 27 Apr 2023 13:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps4zp-0000TF-B1
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps4zn-0003SY-DL
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 13:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682614886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4zoErSLaQl1SOUc0u/z6DpijlIxuPjTbsUTISxc4uc=;
 b=NtXGLBNVLujv1iqfu+VvZ10Ucaw+lldoS5eOVo8aMa0SUh0LWqoDaoPc7/YdG6u9e+AorF
 rvBWg7pGLfL9I9xDsSzfMd8P/72ZE3JrrH6+W5PxyXjpQ41inLweNmWT7/JQpedk+pbo3n
 6OSXe/SCt0Xp9uf8jL/K/5jCBwMsOmo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-IgYDZaaDMhGXgT7gCf_Gzw-1; Thu, 27 Apr 2023 13:01:11 -0400
X-MC-Unique: IgYDZaaDMhGXgT7gCf_Gzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16ef3be6eso53841305e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 10:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682614865; x=1685206865;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+4zoErSLaQl1SOUc0u/z6DpijlIxuPjTbsUTISxc4uc=;
 b=AJGceKfel6+2x4GNbS9jgi8W1yZuTHCJRVq7SvTxnh9Rl5LP2p5ve9OrCchbJ2y7YS
 qLtSXa5wq7YGSaQdyq+u9sDXT7ittGfv+EOgRJ8wcH8/Ogz1NxKvrq/rD2bL1Y+96zNn
 BAgbj8u/8VmZln80QkGw4SnRmeph/rbGS2OyzaEczh6yjcA0KkyX74xHizgtAmULpovH
 Iowhknj4mlWnbeG21OejoqIhWJATT0KH5IJsVgbogGlpXzkPmzakUC17RU/edtPrUA/f
 BHsBqrUwgFVjj0NVRn7Y9GJ5P4AUMuyNbyjD0T1CIhDVd2zl4LLmIGZUMaIOp3b/Fm3D
 7Jaw==
X-Gm-Message-State: AC+VfDzxPsClD/jtkKsckPnobgP8zDdoCRyJFqje/+ik4ZPAqoFiJfN9
 hpad0jMd8l3K+lhRBAu0t0T+MosUKHcsH8zEXx8HoHXdVUdE1OKbSgOgEKDPqtYDHMBNH/+OYOE
 0GV5Om5u4RhqJoS8=
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr2044733wma.36.1682614865603; 
 Thu, 27 Apr 2023 10:01:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VyhNB35sMDCQitTJ3ajd2QxivcoZ4rss2QtvL0GpG7N7Lyp2rvije8x0FdvNo7nTV5tTH6w==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr2044707wma.36.1682614865316; 
 Thu, 27 Apr 2023 10:01:05 -0700 (PDT)
Received: from [192.168.8.102] (tmo-097-86.customers.d1-online.com.
 [80.187.97.86]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm33386819wmn.2.2023.04.27.10.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 10:01:04 -0700 (PDT)
Message-ID: <7ce19a3d-7b5a-1449-10c2-ee63c1471537@redhat.com>
Date: Thu, 27 Apr 2023 19:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-4-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v20 03/21] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
In-Reply-To: <20230425161456.21031-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/04/2023 18.14, Pierre Morel wrote:
> On interception of STSI(15.1.x) the System Information Block
> (SYSIB) is built from the list of pre-ordered topology entries.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   MAINTAINERS                     |   1 +
>   include/hw/s390x/cpu-topology.h |  24 +++
>   include/hw/s390x/sclp.h         |   1 +
>   target/s390x/cpu.h              |  72 ++++++++
>   hw/s390x/cpu-topology.c         |  13 +-
>   target/s390x/kvm/cpu_topology.c | 308 ++++++++++++++++++++++++++++++++
>   target/s390x/kvm/kvm.c          |   5 +-
>   target/s390x/kvm/meson.build    |   3 +-
>   8 files changed, 424 insertions(+), 3 deletions(-)
>   create mode 100644 target/s390x/kvm/cpu_topology.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bb7b34d0d8..de9052f753 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1659,6 +1659,7 @@ M: Pierre Morel <pmorel@linux.ibm.com>
>   S: Supported
>   F: include/hw/s390x/cpu-topology.h
>   F: hw/s390x/cpu-topology.c
> +F: target/s390x/kvm/cpu_topology.c

It's somewhat weird to have one file "cpu-topology.c" (in hw/s390x, with a 
dash), and one file cpu_topology.c (in target/s390x, with an underscore) ... 
could you come up with a better naming? Maybe call the new file 
stsi-topology.c or so?

> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index bb7cfb0cab..9f97989bd7 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -561,6 +561,25 @@ typedef struct SysIB_322 {
>   } SysIB_322;
>   QEMU_BUILD_BUG_ON(sizeof(SysIB_322) != 4096);


Maybe add a short comment here what MAG stands for (magnitude fields?)?
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
> +} SysIB_151x;
> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
...

> diff --git a/target/s390x/kvm/cpu_topology.c b/target/s390x/kvm/cpu_topology.c
> new file mode 100644
> index 0000000000..86a286afe2
> --- /dev/null
> +++ b/target/s390x/kvm/cpu_topology.c
> @@ -0,0 +1,308 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2022,2023
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/s390x/pv.h"
> +#include "hw/sysbus.h"
> +#include "hw/s390x/sclp.h"
> +#include "hw/s390x/cpu-topology.h"
> +
> +/**
> + * fill_container:
> + * @p: The address of the container TLE to fill
> + * @level: The level of nesting for this container
> + * @id: The container receives a uniq ID inside its own container

s/uniq/unique/

  Thomas


