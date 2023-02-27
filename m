Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4256A41DF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcno-000432-1C; Mon, 27 Feb 2023 07:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWcnO-0003XU-BN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWcnH-0001HS-1u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677501590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cMMqs3SVTvebSpFoMCgni9IV5ypQSyPPBlVp3D5v8+4=;
 b=T5fdLO+mZ2rQVrKZzXJPVj+zj+1qxEIO3VyEMbzpUt2KyLH04u2SUQB5wtuYAZap613Bg9
 GJnINkEBliyoV4cFQ7B9PEvLNW0kt5quDBzHbKF2864B1WiJMOydRr6G3VRJdKdyQ6nuhO
 dspLKDT5kK3OoUkXI9uakea8zVVbS8M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-wXzaKjFYOJimgSjWuadRKA-1; Mon, 27 Feb 2023 07:39:48 -0500
X-MC-Unique: wXzaKjFYOJimgSjWuadRKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso2851515wmh.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMMqs3SVTvebSpFoMCgni9IV5ypQSyPPBlVp3D5v8+4=;
 b=JQ+RhmR64PZgiAMVqh/irg2AIxDCnuqxnUCIt9oqE95iOiGONWe7DIwpY8A2wAUO7e
 de0jVoofnQvH5H2MRUWnJDWkQKiHFVFzdWLyO7yqGUYPiHX3Z/q5hP3kNRVFNyPNw+yl
 ROYB8B5Y6PlhbLXiBrbOy4nWhtzqlzuUFzUZ4pEnxKDkS3TSx20O5Kh9dVk1brILP/H+
 URiJohgReuU49O7chyEcWuaf3v3PI/2zozN50+JfqrhXa7Qb69I2j+HBXxfjvy+OWwhS
 5JXW2dgAOF7H3Tj3VV9uNY/VtMDnN+mDUH5iokNImyu5CqJ9bCh6XCrGGObhZa3wadxR
 vtfw==
X-Gm-Message-State: AO0yUKWtEkj/h9FkVR7zwO0j6rRB43sLQA9t19fCSHLJ+rSdY6euBCcL
 UwCCAkprtBt2Ijr2ALm0Zy9vFRXTE/QnE8sIza/VOLfWp0yXAK51tGYfSbJhm7qG8SY1t8SfTc9
 X18gWyzKOIUedFDA=
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr16862849wmp.21.1677501587841; 
 Mon, 27 Feb 2023 04:39:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9KPsx6+1T3kuKidRwsQAIPZyfimjAZLiWjTRLNbUcke4Oge0qHZsM8yzLru/NcsBv3NBFMiw==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr16862831wmp.21.1677501587534; 
 Mon, 27 Feb 2023 04:39:47 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c00c600b003e21dcccf9fsm12279156wmm.16.2023.02.27.04.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:39:47 -0800 (PST)
Message-ID: <f6854f27-2c32-dc07-883d-9cbfc9d49c48@redhat.com>
Date: Mon, 27 Feb 2023 13:39:45 +0100
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
 <20230222142105.84700-7-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 06/11] s390x/cpu topology: interception of PTF
 instruction
In-Reply-To: <20230222142105.84700-7-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/02/2023 15.21, Pierre Morel wrote:
> When the host supports the CPU topology facility, the PTF
> instruction with function code 2 is interpreted by the SIE,
> provided that the userland hypervisor activates the interpretation
> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> The PTF instructions with function code 0 and 1 are intercepted
> and must be emulated by the userland hypervisor.
> 
> During RESET all CPU of the configuration are placed in
> horizontal polarity.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   include/hw/s390x/s390-virtio-ccw.h |  6 +++
>   hw/s390x/cpu-topology.c            | 85 ++++++++++++++++++++++++++++++
>   target/s390x/kvm/kvm.c             | 11 ++++
>   3 files changed, 102 insertions(+)
> 
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
> index 9bba21a916..c1d46e78af 100644
> --- a/include/hw/s390x/s390-virtio-ccw.h
> +++ b/include/hw/s390x/s390-virtio-ccw.h
> @@ -30,6 +30,12 @@ struct S390CcwMachineState {
>       uint8_t loadparm[8];
>   };
>   
> +#define S390_PTF_REASON_NONE (0x00 << 8)
> +#define S390_PTF_REASON_DONE (0x01 << 8)
> +#define S390_PTF_REASON_BUSY (0x02 << 8)
> +#define S390_TOPO_FC_MASK 0xffUL
> +void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
> +
>   struct S390CcwMachineClass {
>       /*< private >*/
>       MachineClass parent_class;
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index 08642e0e04..40253a2444 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -87,6 +87,89 @@ static void s390_topology_init(MachineState *ms)
>       QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
>   }
>   
> +/**
> + * s390_topology_set_cpus_entitlement:
> + * @polarization: polarization requested by the caller
> + *
> + * Set all CPU entitlement according to polarization and
> + * dedication.
> + * Default vertical entitlement is S390_CPU_ENTITLEMENT_MEDIUM as
> + * it does not require host modification of the CPU provisioning
> + * until the host decide to modify individual CPU provisioning
> + * using QAPI interface.
> + * However a dedicated vCPU will have a S390_CPU_ENTITLEMENT_HIGH
> + * entitlement.
> + */
> +static void s390_topology_set_cpus_entitlement(int polarization)
> +{
> +    CPUState *cs;
> +
> +    CPU_FOREACH(cs) {
> +        if (polarization == S390_CPU_POLARIZATION_HORIZONTAL) {
> +            S390_CPU(cs)->env.entitlement = 0;

Maybe use S390_CPU_ENTITLEMENT_HORIZONTAL instead of "0" ?

> +        } else if (S390_CPU(cs)->env.dedicated) {
> +            S390_CPU(cs)->env.entitlement = S390_CPU_ENTITLEMENT_HIGH;
> +        } else {
> +            S390_CPU(cs)->env.entitlement = S390_CPU_ENTITLEMENT_MEDIUM;
> +        }
> +    }
> +}

With the nit above fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


