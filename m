Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1863EC02
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fYt-0001vj-BE; Thu, 01 Dec 2022 04:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0fYf-0001uL-96
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:08:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0fYd-0000LG-EN
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669885717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxMB75eWtFF0uMoLEmcBdzPho0iX+ChWmUeNxOWjHHQ=;
 b=ItR3RWcUyz8T+a3cJ00p0kvQWwcJfDMzIvd+HeqAkm0vM0HtUW/li1vj/H51DgM3mB7L55
 CbTJzEStQL7fZyQ5ManmoHDATawjlg9UgtRX2Hh1Bn9xyKY83rA+a9P/IFZ/+FBDa4+7VX
 cU9QZqDRqdIuJfaLDncgGZRknRYXb2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-hyNXv8Y-Mua1x_1L2oNssQ-1; Thu, 01 Dec 2022 04:08:36 -0500
X-MC-Unique: hyNXv8Y-Mua1x_1L2oNssQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so567052wms.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 01:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QxMB75eWtFF0uMoLEmcBdzPho0iX+ChWmUeNxOWjHHQ=;
 b=c0uTIUPHST1rBt2zNpqklNVQTnB+gmpNLYDIfquctzvbDJPE9422R971qHIVln7nQY
 AiFFGJALc1uijNh4tLBp4uvOBY7OMpwoZxWMtFFP3xgUkx0Y4ICASQlnQAd3FEg872sL
 FWQFDmlDkdCqZFe7+l28WhJf+ouKPF7PbXbSvODSYTks3OpebePVN8nVXPxJcfn0MnOl
 lz6q53owD6ILTZfrHVUl1lPBRrQzeVSqkzkRG84ogq7daVk/ReZLrnQd6omVB0QSz1ZJ
 rk+DfPT7B9H6+30XJk28MdMa2mr/PMCHP+5XjkjUYBI+NWZlYvzUe5Pzo8kAsriVTbRQ
 GknQ==
X-Gm-Message-State: ANoB5pkk0aJxzJzIB42f2x4hVuKpmNlER6tKIuZl2OyHyZfBuMGUVagi
 BbIaELwOIHL/KB6nsbYFLPjGCOGqtlk70ImL1mdzJDM8zfUy+qiDGw268KsrHyyXBfuW26rjf4F
 XvCQkfNYLo8mLU4U=
X-Received: by 2002:a5d:6b0c:0:b0:241:c595:9f05 with SMTP id
 v12-20020a5d6b0c000000b00241c5959f05mr37181290wrw.439.1669885715589; 
 Thu, 01 Dec 2022 01:08:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5UGx+VPpgBoJL4qDPhFrPR0TJKg4mQJDVgnOt/k9kp2qtdYpGndR+q9NhcXCRv71hLWUY8oA==
X-Received: by 2002:a5d:6b0c:0:b0:241:c595:9f05 with SMTP id
 v12-20020a5d6b0c000000b00241c5959f05mr37181274wrw.439.1669885715397; 
 Thu, 01 Dec 2022 01:08:35 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003cfa81e2eb4sm5118156wmo.38.2022.12.01.01.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:08:34 -0800 (PST)
Message-ID: <b61c8e4d-cae9-b267-a00b-007401b95bfb@redhat.com>
Date: Thu, 1 Dec 2022 10:08:31 +0100
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
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v12 1/7] s390x/cpu topology: Creating CPU topology device
In-Reply-To: <20221129174206.84882-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 29/11/2022 18.42, Pierre Morel wrote:
> We will need a Topology device to transfer the topology
> during migration and to implement machine reset.
> 
> The device creation is fenced by s390_has_topology().
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 2e64ffab45..973bbdd36e 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -44,6 +44,7 @@
>   #include "hw/s390x/pv.h"
>   #include "migration/blocker.h"
>   #include "qapi/visitor.h"
> +#include "hw/s390x/cpu-topology.h"
>   
>   static Error *pv_mig_blocker;
>   
> @@ -102,6 +103,24 @@ static void s390_init_cpus(MachineState *machine)
>       }
>   }
>   
> +static DeviceState *s390_init_topology(MachineState *machine, Error **errp)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_S390_CPU_TOPOLOGY);
> +
> +    object_property_add_child(&machine->parent_obj,
> +                              TYPE_S390_CPU_TOPOLOGY, OBJECT(dev));
> +    object_property_set_int(OBJECT(dev), "num-cores",
> +                            machine->smp.cores * machine->smp.threads, errp);

I wonder what will happen if we ever support multithreading on s390x later? 
... won't this cause some oddities when migrating older machines types with 
smp.threads > 1 later? Maybe we should prohibit to enable the CPU topology 
instead if a user tried to use threads > 1 with an older machine type?

  Thomas


> +    object_property_set_int(OBJECT(dev), "num-sockets",
> +                            machine->smp.sockets, errp);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp);
> +
> +    return dev;
> +}


