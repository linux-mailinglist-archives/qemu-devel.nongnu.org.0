Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C756482F9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dml-0000mG-IM; Fri, 09 Dec 2022 08:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dmP-0000kS-VM
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3dm9-0007jI-CW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdIkgy6BMRJ7r/sade2qdtqGA4Czc9DE5XCsMjvzwps=;
 b=in5KFeiy353tp3tFBsNCTQVbkx1cNBFcZ3sH65HHHQybov+MDTXrGtuDuYiO3n2B8RPPzV
 vulTo87X97D17J5YwiPXT667f0yZlu7qT+RHKjVnhK8YSJ8AyhnT5Vjs5qXgQo42v5xkIx
 vVlwxodAJY/7hoSZGkhJcpCKdkEsZZQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-UXfFtRdQPLCUXyBlehs5uA-1; Fri, 09 Dec 2022 08:50:51 -0500
X-MC-Unique: UXfFtRdQPLCUXyBlehs5uA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so988366wra.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 05:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UdIkgy6BMRJ7r/sade2qdtqGA4Czc9DE5XCsMjvzwps=;
 b=gksIfRoUOH1QWO0KLZgoDuV63Jl8iV6lzi+NbZEPiYOXbLC3eb5FHsoq2cf4TLql5Q
 6ykpfSCr28vfpCgCM0GuQm8NKr4cUhSQ+npnvVdGQSCcKVcD06HdyusikqzOpr0v0dEf
 WYSwwhKwqmupibKyNMSHeX9j0nfIIoiyVYBmdE6dHjNOfBWz4HFt0v/YxHjNmtukx/5Z
 vwfnaQnYMhpr8pWOdf0Uln0gcPhRiuX2DvSB7DGLkRjYGmkeK6gBA39M2CG6bpJb/jEc
 EY0s+0E2Q+VNGHuBogy/BwdauRlzoCj9qf7XaVY/odZ7q3kRDEZ1cI3JMwb4E4TLLfsX
 Ubyw==
X-Gm-Message-State: ANoB5pk6yM9ahAyQm9rdQKBZ64fkZoZeY8UStQzvFEOfkfthyYjbPKGM
 xGylrEI4DLTt0si9NCxJRfDMsiLG72hi1ENQneRwlWHUu3jj8LnvzqQTrjGsUAOJD63xHxc7j+v
 rY1GWNr6fMAUjY60=
X-Received: by 2002:a05:600c:348a:b0:3c6:e63e:89aa with SMTP id
 a10-20020a05600c348a00b003c6e63e89aamr5086732wmq.6.1670593850430; 
 Fri, 09 Dec 2022 05:50:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4hgYz57feDfx3gQAIUTjMoGk2YWf2IxJA0RI3KDh7nNxWom8c+WkUNGbJES5lR/4S4VdNNQQ==
X-Received: by 2002:a05:600c:348a:b0:3c6:e63e:89aa with SMTP id
 a10-20020a05600c348a00b003c6e63e89aamr5086702wmq.6.1670593850200; 
 Fri, 09 Dec 2022 05:50:50 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 i10-20020a1c540a000000b003d1f2c3e571sm7855692wmb.33.2022.12.09.05.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 05:50:49 -0800 (PST)
Message-ID: <be4571a6-edaa-3291-1b31-6f309c00a9f9@redhat.com>
Date: Fri, 9 Dec 2022 14:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v13 1/7] s390x/cpu topology: Creating CPU topology device
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221208094432.9732-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 08/12/2022 10.44, Pierre Morel wrote:
> We will need a Topology device to transfer the topology
> during migration and to implement machine reset.
> 
> The device creation is fenced by s390_has_topology().
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
[...]
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..b3e59873f6
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,149 @@
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
> +/**
> + * s390_has_topology
> + *
> + * Return false until the commit activating the topology is
> + * commited.
> + */
> +bool s390_has_topology(void)
> +{
> +    return false;
> +}
> +
> +/**
> + * s390_get_topology
> + *
> + * Returns a pointer to the topology.
> + *
> + * This function is called when we know the topology exist.
> + * Testing if the topology exist is done with s390_has_topology()
> + */
> +S390Topology *s390_get_topology(void)
> +{
> +    static S390Topology *s390Topology;
> +
> +    if (!s390Topology) {
> +        s390Topology = S390_CPU_TOPOLOGY(
> +            object_resolve_path(TYPE_S390_CPU_TOPOLOGY, NULL));
> +    }
> +
> +    assert(s390Topology);

I think you can move the assert() into the body of the if-statement.

> +    return s390Topology;
> +}
> +
> +/**
> + * s390_init_topology
> + * @machine: The Machine state, used to retrieve the SMP parameters
> + * @errp: the error pointer in case of problem
> + *
> + * This function creates and initialize the S390Topology with
> + * the QEMU -smp parameters we will use during adding cores to the
> + * topology.
> + */
> +void s390_init_topology(MachineState *machine, Error **errp)
> +{
> +    DeviceState *dev;
> +
> +    if (machine->smp.threads > 1) {
> +        error_setg(errp, "CPU Topology do not support multithreading");

s/CPU Toplogy do/CPU topology does/

> +        return;
> +    }
> +
> +    dev = qdev_new(TYPE_S390_CPU_TOPOLOGY);
> +
> +    object_property_add_child(&machine->parent_obj,
> +                              TYPE_S390_CPU_TOPOLOGY, OBJECT(dev));
> +    object_property_set_int(OBJECT(dev), "num-cores",
> +                            machine->smp.cores, errp);
> +    object_property_set_int(OBJECT(dev), "num-sockets",
> +                            machine->smp.sockets, errp);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp);
> +}

  Thomas


