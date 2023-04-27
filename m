Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89A6F06C3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:39:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1pW-0000hY-DG; Thu, 27 Apr 2023 09:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1pU-0000go-0W
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1pS-0006Tp-71
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682602713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHFntnekYXETfFFiCrSNt5DtnSXpqwhD/5/8kxtTcsA=;
 b=RIMFMCGE2IS1DOEuQ3NvYx3p0/mGOhDPPbncVeeBU0hpzXIUbo6/qpO6vBuDbv8W4XfoDz
 DhC9UtzdwLX5egjZXZwQucTXCzYemTVHF3P/1VVgeA5MXzNoiQMS+XI+FnMd429JcOzhte
 OAcYEWzM2vKxPrOwoD3Rzrz5G/ZWbSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-XJ8ryRHcPcSIrzszwsdlJA-1; Thu, 27 Apr 2023 09:38:31 -0400
X-MC-Unique: XJ8ryRHcPcSIrzszwsdlJA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so3154620f8f.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682602710; x=1685194710;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XHFntnekYXETfFFiCrSNt5DtnSXpqwhD/5/8kxtTcsA=;
 b=HfaB5IySmTfwBN/ELcDXA6IfS9r4FhUUSTPmQzf+ndbFmGt1aWhOCQZU+KhKJm51W4
 qOPnEd9/3xfQUy1jR1jyVKxZQ4f3TB+sv6mpauMabmmt5pS0ojz4jBnvlhDeUXNlriYL
 NqkIPyT3T9N8vrLuxtniKfwM814+qSI2nLvmDfHh5ZG27kpMcc/3c4KNZlCeoV3SbFO4
 Q4+Dr+h/R855vpxCgV3edcMjGqLvQoOqyxMHEsX2GEaykip9nVti5LMRWuwCsG9komD9
 mfzE0xMq49n5g8xM/U7905DjUXytbHjRq9Klb4pbDc74Yh3CIqG8/OLefxmrkv7lMDrj
 ARUQ==
X-Gm-Message-State: AC+VfDyoYdmrW9Imm1KrwSUbf0dxmkoaKsK/2yF3SuGazNbp/FpVI19Y
 IMdKTCQ5EQWKdXDaRuOUPiXsIzIx2XTQLDOtx2lO9bAdHW6M09GjIyGsRT6HXrDY+rUiCfuXL0P
 6f4QG/TT8/IYA+y8=
X-Received: by 2002:a5d:4611:0:b0:2f9:7841:f960 with SMTP id
 t17-20020a5d4611000000b002f97841f960mr1535220wrq.21.1682602710032; 
 Thu, 27 Apr 2023 06:38:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HKPEyrCnedzzIBCBcqoeLnK2efHxefTWPkCgCCVjmHcrNDNXPwJDn7e2CPT4IIqtm0xaJmw==
X-Received: by 2002:a5d:4611:0:b0:2f9:7841:f960 with SMTP id
 t17-20020a5d4611000000b002f97841f960mr1535182wrq.21.1682602709654; 
 Thu, 27 Apr 2023 06:38:29 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b002ff2c39d072sm18585239wrj.104.2023.04.27.06.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 06:38:29 -0700 (PDT)
Message-ID: <1a919123-f07b-572e-8a33-0e5f9a6ed75c@redhat.com>
Date: Thu, 27 Apr 2023 15:38:27 +0200
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
 <20230425161456.21031-3-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v20 02/21] s390x/cpu topology: add topology entries on CPU
 hotplug
In-Reply-To: <20230425161456.21031-3-pmorel@linux.ibm.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The topology information are attributes of the CPU and are
> specified during the CPU device creation.
> 
> On hot plug we:
> - calculate the default values for the topology for drawers,
>    books and sockets in the case they are not specified.
> - verify the CPU attributes
> - check that we have still room on the desired socket
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
> still get some advantage of the CPU topology.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..471e0e7292
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,259 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * CPU Topology

Since you later introduce a file with almost the same name in the 
target/s390x/ folder, it would be fine to have some more explanation here 
what this file is all about (especially with regards to the other file in 
target/s390x/).

> + *
> + * Copyright IBM Corp. 2022,2023
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/boards.h"
> +#include "qemu/typedefs.h"

qemu/typedefs.h is already included by osdep.h by default, no need to 
re-include it here.

> +#include "target/s390x/cpu.h"
> +#include "hw/s390x/s390-virtio-ccw.h"
> +#include "hw/s390x/cpu-topology.h"
...> +
> +/**
> + * s390_topology_setup_cpu:
> + * @ms: MachineState used to initialize the topology structure on
> + *      first call.
> + * @cpu: the new S390CPU to insert in the topology structure
> + * @errp: the error pointer
> + *
> + * Called from CPU Hotplug to check and setup the CPU attributes

s/Hotplug/hotplug/

> + * before the CPU is inserted in the topology.
> + * There is no need to update the MTCR explicitely here because it

s/explicitely/explicitly/

> + * will be updated by KVM on creation of the new CPU.
> + */
> +void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error **errp)
...

  Thomas



