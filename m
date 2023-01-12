Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D536866714D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFw8R-0002Wv-ST; Thu, 12 Jan 2023 06:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw8Q-0002Wb-2k
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFw8O-0000vT-FT
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Jnv11p8/p3gyPXhfzLFhgQ2bMLOcfy8scnrrZUdSr0=;
 b=XjFAZHhdD7aGXySm2wxEC6qg3i6AhlYaRmK6ugTJ9w+9qPB8M5G89mr+diYJh6h0/rxglw
 D6W6AIrvq5Vof+u/7Wo341Ncyjjp/4yvwKei9503eJxQjZyLC8mPx0AcaekeWDgXLUdMZ+
 x6QA7o5g9/nP2UncPzbo6PjXl4MmryU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-PvpPxfoIOIuOLJu5fyCfcg-1; Thu, 12 Jan 2023 06:52:38 -0500
X-MC-Unique: PvpPxfoIOIuOLJu5fyCfcg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso12356987wmb.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Jnv11p8/p3gyPXhfzLFhgQ2bMLOcfy8scnrrZUdSr0=;
 b=RUoTshE4EbABLArRhAXuMGsmkk5xMgMRBqoMfIgPEfeq6v1LGjvsiXOnxV6TZA5T0s
 PG9lLGDvM5RwfDZzhhquIr2aMpeq/Fp/kaQ8+zbCycKI7h/CdwIt1Fzx0PT4h2vB36Zs
 pG+99A0VJWfCRLMu5HZ8Ve2J1s0Dv1HG7zQ7OUECKBHDOokJWj8LkV0H1RTkMrTGZe1X
 5NV2wN5bf6EIF3euqL2wHaaNX7YjmK0YjLCmXmZdHNrfmzshMW6lV3V6LXEL167ssQRJ
 /qefex5/i7/F3OXNCSiCBKisukBzNoOMXX+9JO8CRuLYoeYk7haUFTazw6lDjeYSpx69
 UQbA==
X-Gm-Message-State: AFqh2krOtn5jpADIsIWyEkZb/N8AY883s5CDGwQPTvMXLAg6DMjRymW1
 7lgx6VVGCnKrZQGK+L7nsPacIzGp6k+nOV8h0QtuXfVChKfK9DOkEUXIZllR5C9tcCBmet6nRvK
 HTCMM/QeHxU9kPHE=
X-Received: by 2002:adf:ef0d:0:b0:2bc:8360:885 with SMTP id
 e13-20020adfef0d000000b002bc83600885mr8372913wro.21.1673524357016; 
 Thu, 12 Jan 2023 03:52:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqsT3dDr5vjdtlamMwWWOda3bUZMRGnbspNnRt7MCNDFd/eKnyFqG8kQzczXAPXKAAwU64cQ==
X-Received: by 2002:adf:ef0d:0:b0:2bc:8360:885 with SMTP id
 e13-20020adfef0d000000b002bc83600885mr8372900wro.21.1673524356793; 
 Thu, 12 Jan 2023 03:52:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm15955030wrk.105.2023.01.12.03.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 03:52:36 -0800 (PST)
Message-ID: <c338245c-82c3-ed57-9c98-f4d630fa1759@redhat.com>
Date: Thu, 12 Jan 2023 12:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 10/11] qapi/s390/cpu topology: POLARITY_CHANGE qapi
 event
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-11-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> When the guest asks to change the polarity this change
> is forwarded to the admin using QAPI.
> The admin is supposed to take according decisions concerning
> CPU provisioning.

I somehow doubt that an average admin will monitor QEMU for such events ... 
so this rather should be handled by upper layers like libvirt one day?

> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   qapi/machine-target.json | 21 +++++++++++++++++++++
>   hw/s390x/cpu-topology.c  |  2 ++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 927618a78f..10235cfb45 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -437,3 +437,24 @@
>     'returns': ['S390CpuTopology'],
>     'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>   }
> +
> +##
> +# @POLARITY_CHANGE:

I'd maybe rather call it CPU_POLARITY_CHANGE ... in case "polarity" is one 
day also used for some other devices.

> +#
> +# Emitted when the guest asks to change the polarity.
> +#
> +# @polarity: polarity specified by the guest

Please elaborate: Where does the value come from (the PTF instruction)? 
Which values are possible?

  Thomas


> +#
> +# Since: 8.0
> +#
> +# Example:
> +#
> +# <- { "event": "POLARITY_CHANGE",
> +#      "data": { "polarity": 0 },
> +#      "timestamp": { "seconds": 1401385907, "microseconds": 422329 } }
> +#
> +##
> +{ 'event': 'POLARITY_CHANGE',
> +  'data': { 'polarity': 'int' },
> +   'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM'] }
> +}
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index c3748654ff..45621387d5 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -19,6 +19,7 @@
>   #include "hw/s390x/s390-virtio-ccw.h"
>   #include "hw/s390x/cpu-topology.h"
>   #include "qapi/qapi-commands-machine-target.h"
> +#include "qapi/qapi-events-machine-target.h"
>   #include "qapi/qmp/qdict.h"
>   #include "monitor/hmp.h"
>   #include "monitor/monitor.h"
> @@ -128,6 +129,7 @@ void s390_topology_set_polarity(int polarity)
>           }
>       }
>       s390_cpu_topology_set();
> +    qapi_event_send_polarity_change(polarity);
>   }
>   
>   /*


