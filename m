Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5742DFFB6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 19:29:00 +0100 (CET)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krPvX-0007HM-IW
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 13:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krPuJ-0006Rm-5n
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krPuE-0001P9-8B
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608575256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLVBz4ho1BlnHhOoPeVOBE0g50ai2I9miHLGNoj9sos=;
 b=U9H/kLl8rcThscIBctwHW8KFJUXIVkNM98GBUxAgY270kCxa5pL22JY/3XPRf+3hqxqCm8
 uYfvYWhZ4gmKY/QKyl+srxkEwEwbAMRdF7YvRrckh66J7T2NO6w69DEfRxdcNYrY+QueM6
 4iG+J1lKH3wVlCg8QYgCOSsDbBfr7Yc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-XnYCMOCLNtmss8Om458SNw-1; Mon, 21 Dec 2020 13:27:34 -0500
X-MC-Unique: XnYCMOCLNtmss8Om458SNw-1
Received: by mail-wr1-f71.google.com with SMTP id 88so9267503wrc.17
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 10:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLVBz4ho1BlnHhOoPeVOBE0g50ai2I9miHLGNoj9sos=;
 b=WjXVDUH4c2OUeEg89JbecKGv3N/ez9rSp1DdAIM6Y7QyoROo8otnl3zs+C8v5iuhyi
 QNdeuEezi0n9bihwRgvvwhG5DsKzjmB5gkSNXJ8uHDsOQBp47o9gTwHLL6n7uPQJOMT5
 9GYMNaqavTM+xxViu9KV4pXCQYRx5w5ANWyLqgecbxIeEeFiLEqoI9I1VDEhJlPZvJRy
 Q/pDJVTlhbOnNa4e0d6yBTTyFYLkan/1pE3Z/Kth+769gh+gyDdgoE8yEcKYeSbhfnj2
 NyAfTf5r+9rdG0B6LigDJZL+RwjsISCnSZ6CjSzQjEAaldPkFofkSBx5NZgPqm/qkCtV
 l/7g==
X-Gm-Message-State: AOAM532nF/upyVnsY9U0d9/MmmUCdJ8RcSv2GLOz0k5FhwW5/bkhG8Xl
 NBosG3c8rgHWyxtEJT3wV5j3xUqXiIOh2E2rFZxga9xXQpSUSQ/NPj5u3b2qk/3vaPCf2d5xqg5
 64tdXeNGTMTPRn8I=
X-Received: by 2002:a05:600c:313:: with SMTP id
 q19mr17746560wmd.126.1608575253202; 
 Mon, 21 Dec 2020 10:27:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzILDzenMjbgW+UKGSGhFwEOILSI9eEHzERWcAvdYpXhi4jEfRnwiXwXC2MSVjpblctN6cMyg==
X-Received: by 2002:a05:600c:313:: with SMTP id
 q19mr17746536wmd.126.1608575253003; 
 Mon, 21 Dec 2020 10:27:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v4sm25371434wrw.42.2020.12.21.10.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 10:27:32 -0800 (PST)
Subject: Re: [PATCH v3] fuzz: map all BARs and enable PCI devices
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20201221181203.1853-1-alxndr@bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <86d86ea9-174d-6e11-c2bf-dac27a84abaf@redhat.com>
Date: Mon, 21 Dec 2020 19:27:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221181203.1853-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/20 19:12, Alexander Bulekov wrote:
> Prior to this patch, the fuzzer found inputs to map PCI device BARs and
> enable the device. While it is nice that the fuzzer can do this, it
> added significant overhead, since the fuzzer needs to map all the
> BARs (regenerating the memory topology), at the start of each input.
> With this patch, we do this once, before fuzzing, mitigating some of
> this overhead.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> ---
> 
> v3: Plug the memory-leak pointed out by Thomas:
>      https://gitlab.com/huth/qemu/-/jobs/920543745#L309
> 
>   tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 07ad690683..be76d47d2d 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -16,6 +16,7 @@
>   
>   #include "hw/core/cpu.h"
>   #include "tests/qtest/libqos/libqtest.h"
> +#include "tests/qtest/libqos/pci-pc.h"
>   #include "fuzz.h"
>   #include "fork_fuzz.h"
>   #include "exec/address-spaces.h"
> @@ -762,10 +763,29 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>       return 0;
>   }
>   
> +
> +static void pci_enum(gpointer pcidev, gpointer bus)
> +{
> +    PCIDevice *dev = pcidev;
> +    QPCIDevice *qdev;
> +    int i;
> +
> +    qdev = qpci_device_find(bus, dev->devfn);
> +    g_assert(qdev != NULL);
> +    for (i = 0; i < 6; i++) {
> +        if (dev->io_regions[i].size) {
> +            qpci_iomap(qdev, i, NULL);
> +        }
> +    }
> +    qpci_device_enable(qdev);
> +    g_free(qdev);
> +}
> +
>   static void generic_pre_fuzz(QTestState *s)
>   {
>       GHashTableIter iter;
>       MemoryRegion *mr;
> +    QPCIBus *pcibus;
>       char **result;
>   
>       if (!getenv("QEMU_FUZZ_OBJECTS")) {
> @@ -810,6 +830,10 @@ static void generic_pre_fuzz(QTestState *s)
>           exit(1);
>       }
>   
> +    pcibus = qpci_new_pc(s, NULL);
> +    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> +    qpci_free_pc(pcibus);
> +
>       counter_shm_init();
>   }
>   
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


