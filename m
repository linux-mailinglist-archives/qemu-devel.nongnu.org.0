Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54651532A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:19:23 +0200 (CEST)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTVS-0008U1-5i
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntShL-0000UM-IA
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntShH-0008Dn-NR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653391650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhG5Ck13GAPrVJ8vbRNY/0IdFeWvv/sdaevWgalHSV0=;
 b=FFYo3Iqv49VZjV4SKF8/4o9ukAOAIVWuvtRHPrRXoWbT9Z6pyqxwTsAnb1X/trcEYlKEBg
 +gulMabIYtmN+Ngos30m6xUjFqGU10lNeWkxTfWQ2TklZaL8zQRH89O81BiXJzK71HUSjZ
 avhCGYah/PgMzFi5qY1JDNvuPv7e3uY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-mCIW_b32PPafZPzLIg0g2w-1; Tue, 24 May 2022 07:27:29 -0400
X-MC-Unique: mCIW_b32PPafZPzLIg0g2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso6960191wma.1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bhG5Ck13GAPrVJ8vbRNY/0IdFeWvv/sdaevWgalHSV0=;
 b=HIIfH6ghm4PFmOYnC3/rKpm+WzCQUwifGIdQhmyDTt2P1jdRh9RAtZ+l9A6y1qHGtS
 iHK6YNZPPa8Xv6jAG3HpvWCoZIHfJOw2UxZj9ptSYhF0UHdBYBdFC/sjqXfvEbyToG/W
 hGy4Mgnc21CB7Pwwy30+WyvGNROh/bsj1YF/jvHxs/rRNCM5jukIk3z9OCwF729AbeOz
 2Y/c0CviXjSZVdWpCNq/fBsPHNAoy/E4qZ1XpG9Z6EcFo37uPVdte0XqQzSafXDIcfKU
 BjZkaLkeg9OBcijUhRplpD5kbPBwgHjkuc3cB6FAvQsvt/8fgaxVe8OiweG0iMIgzRK3
 HQxA==
X-Gm-Message-State: AOAM533t8U5HBy1tuSHItBI/DFpDfcukQDutQy1obLy0GE7EBynK0hEY
 pU1sEaSWBt9wrp9LlNGLRGPxRy7W5keMAxXPcHtVNGNz40VC0n4JhAVAM+jtBYcO+uXIqam69tg
 VFksyfVDqgylYoQA=
X-Received: by 2002:a05:6000:1f0a:b0:20e:674a:ce2 with SMTP id
 bv10-20020a0560001f0a00b0020e674a0ce2mr22220260wrb.450.1653391648496; 
 Tue, 24 May 2022 04:27:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypT0T4ipNG9nB+q5Xa3blcQoYRizXV4S+8aqy+n5YSEXzafFH9TBbGRIax40l9njwM0/vvXw==
X-Received: by 2002:a05:6000:1f0a:b0:20e:674a:ce2 with SMTP id
 bv10-20020a0560001f0a00b0020e674a0ce2mr22220225wrb.450.1653391648250; 
 Tue, 24 May 2022 04:27:28 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a7bc5c1000000b003976525c38bsm95660wmk.3.2022.05.24.04.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:27:27 -0700 (PDT)
Message-ID: <87783273-6abd-f31e-f5f3-a5cf21b1594f@redhat.com>
Date: Tue, 24 May 2022 13:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 10/13] s390x: kvm: topology: interception of PTF
 instruction
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-11-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420115745.13696-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 13.57, Pierre Morel wrote:
> When the host supports the CPU topology facility, the PTF
> instruction with function code 2 is interpreted by the SIE,
> provided that the userland hypervizor activates the interpretation
> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> The PTF instructions with function code 0 and 1 are intercepted
> and must be emulated by the userland hypervizor.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c         | 50 ++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-virtio-ccw.h |  6 ++++
>   target/s390x/kvm/kvm.c             | 14 +++++++++
>   3 files changed, 70 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 93d1a43583..1ffaddebcc 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c

Why do you put this into s390-virtio-ccw.c and not into cpu_topology.c ?

> @@ -434,6 +434,56 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
>       s390_pv_prep_reset();
>   }
>   
> +/*
> + * s390_handle_ptf:
> + *
> + * @register 1: contains the function code
> + *
> + * Function codes 0 and 1 handle the CPU polarization.
> + * We assume an horizontal topology, the only one supported currently
> + * by Linux, consequently we answer to function code 0, requesting
> + * horizontal polarization that it is already the current polarization
> + * and reject vertical polarization request without further explanation.
> + *
> + * Function code 2 is handling topology changes and is interpreted
> + * by the SIE.
> + */
> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
> +{
> +    CPUS390XState *env = &cpu->env;
> +    uint64_t reg = env->regs[r1];
> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        s390_program_interrupt(env, PGM_OPERATION, ra);
> +        return 0;
> +    }
> +
> +    if (env->psw.mask & PSW_MASK_PSTATE) {
> +        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
> +        return 0;
> +    }
> +
> +    if (reg & ~S390_TOPO_FC_MASK) {
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        return 0;
> +    }
> +
> +    switch (fc) {
> +    case 0:    /* Horizontal polarization is already set */
> +        env->regs[r1] |= S390_PTF_REASON_DONE;
> +        return 2;
> +    case 1:    /* Vertical polarization is not supported */
> +        env->regs[r1] |= S390_PTF_REASON_NONE;
> +        return 2;
> +    default:
> +        /* Note that fc == 2 is interpreted by the SIE */
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +    }
> +
> +    return 0;
> +}
> +
>   static void s390_machine_reset(MachineState *machine)
>   {
>       S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
> index 3331990e02..ac4b4a92e7 100644
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
> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
> +
>   struct S390CcwMachineClass {
>       /*< private >*/
>       MachineClass parent_class;
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 27b3fbfa09..e3792e52c2 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -98,6 +98,7 @@
>   
>   #define PRIV_B9_EQBS                    0x9c
>   #define PRIV_B9_CLP                     0xa0
> +#define PRIV_B9_PTF                     0xa2
>   #define PRIV_B9_PCISTG                  0xd0
>   #define PRIV_B9_PCILG                   0xd2
>   #define PRIV_B9_RPCIT                   0xd3
> @@ -1453,6 +1454,16 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
>       }
>   }
>   
> +static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
> +{
> +    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
> +    int ret;
> +
> +    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
> +    setcc(cpu, ret);

So you're still setting the CC in case the s390_handle_ptf() function 
injected a program interrupt? ... feels wrong. Maybe the CC should be set 
within s390_handle_ptf() instead?

  Thomas


> +    return 0;
> +}
> +
>   static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
>   {
>       int r = 0;
> @@ -1470,6 +1481,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
>       case PRIV_B9_RPCIT:
>           r = kvm_rpcit_service_call(cpu, run);
>           break;
> +    case PRIV_B9_PTF:
> +        r = kvm_handle_ptf(cpu, run);
> +        break;
>       case PRIV_B9_EQBS:
>           /* just inject exception */
>           r = -1;


