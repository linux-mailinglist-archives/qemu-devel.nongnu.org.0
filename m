Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DAD401F1D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 19:22:40 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNIKM-0002dA-Np
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 13:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNIJD-0001sY-Q3
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 13:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNIJC-00012N-4F
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 13:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630948885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWe7gBy03b3kZavRPlCMhXFdVXnxIZzYtH1nHvjphrs=;
 b=EsvRvtlgcRPEuhXMAf9vJgjAah8zwUIStzrf7Lwvvlba5JqagOGvInftPmeR6ql0n58gkF
 9+J8z1IDO/j2RXS3n9nCXfsER58jDQTJ4HNBErs5nH+pmZiE/wbO5xdyGbL4pbze+rq6VG
 htBqId0V1cE5xvBArhgEOeU+/1LIcyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-wDts-rVNP_Sfja5m8qlK8g-1; Mon, 06 Sep 2021 13:21:22 -0400
X-MC-Unique: wDts-rVNP_Sfja5m8qlK8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 e33-20020a05600c4ba100b002f8993a54f8so4150556wmp.7
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 10:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CWe7gBy03b3kZavRPlCMhXFdVXnxIZzYtH1nHvjphrs=;
 b=VkJvL/BhDwqRYriALiufRu1RiVQzsJdMKvraMUamQ2z6sWKK+cM1Etmomi6Ge2kwVE
 P9B8GEfRIALaaJEsmKKwJyFGkP0fVnksj+QUWPFQKf5aKWafsu5t/uYhuLh5LN4/Jbja
 vejwTa9M9C2FDK6KeG1TTkQQjPMOGobYdw4GrXFUUluoBxnISix8+IkL3YwikF9Bc3bz
 aku0XRNLQHk/K4GYKmgL1mAw2NNnKByRF0wC3mIJ4kEMS1C+sznRQfOSUPzHib0SWivh
 VbESHVdHfZ4dJtfm6TsEBxqchtoIIH5s1zyYj9wcYnQqsTy7Y5sDbW5+0LhGWmc/YVF9
 nREA==
X-Gm-Message-State: AOAM533Y1jR8CAEkjD+HGo9tqStAsmbyjqR7fJ+e0LGP/oOJMxFWM1Bk
 Tn50qsygGZRfJXDboLPav3L7SmlcsXUGQXwQ26ejtWnYq8dXXVBacKXqwwZseaT9Q5R76yQfOgs
 FeTK40y0pyZTDRRU=
X-Received: by 2002:a5d:5642:: with SMTP id j2mr14662927wrw.264.1630948880921; 
 Mon, 06 Sep 2021 10:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1dbBiAR/E2y6xJ6DhHstY4kRHsXt3JhaRfwfciNz97OOD/J6URaKbkC6NY8wgYEKzO1ky2g==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr14662896wrw.264.1630948880632; 
 Mon, 06 Sep 2021 10:21:20 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831a0.dip0.t-ipconnect.de.
 [217.232.49.160])
 by smtp.gmail.com with ESMTPSA id v21sm8935786wra.92.2021.09.06.10.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 10:21:20 -0700 (PDT)
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-3-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/5] s390x: kvm: topology: interception of PTF
 instruction
Message-ID: <2792cefe-effa-7463-844e-5f6008e14b3d@redhat.com>
Date: Mon, 6 Sep 2021 19:21:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1626975764-22131-3-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 19.42, Pierre Morel wrote:
> Interception of the PTF instruction depending on the new
> KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c         | 45 ++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-virtio-ccw.h |  7 +++++
>   target/s390x/kvm/kvm.c             | 21 ++++++++++++++
>   3 files changed, 73 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index e4b18aef49..500e856974 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -404,6 +404,49 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
>       s390_pv_prep_reset();
>   }
>   
> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
> +{
> +    S390CcwMachineState *ms = S390_CCW_MACHINE(qdev_get_machine());
> +    CPUS390XState *env = &cpu->env;
> +    uint64_t reg = env->regs[r1];
> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        s390_program_interrupt(env, PGM_OPERAND, ra);

I think that should be PGM_OPERATION instead?

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
> +        env->regs[r1] = S390_PTF_REASON_DONE; > +        return 2;
> +    case 1:    /* Vertical polarization is not supported */
> +        env->regs[r1] = S390_PTF_REASON_NONE;


This way, you're clearing the bits in the FC field. Is this intended by the 
architecture? If I get the PoP right, it just sets the bits in the RC field, 
but likely it should not clear the 1 in the FC field? Did you try on LPAR or 
z/VM to see what happens there?

> +        return 2;
> +    case 2:    /* Report if a topology change report is pending */
> +        if (ms->topology_change_report_pending) {
> +            ms->topology_change_report_pending = false;
> +            return 1;
> +        }
> +        return 0;
> +    default:
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        break;

Just a matter of taste - but you could drop the break here.

> +    }
> +
> +    return 0;
> +}
> +
>   static void s390_machine_reset(MachineState *machine)
>   {
>       S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
> @@ -433,6 +476,8 @@ static void s390_machine_reset(MachineState *machine)
>           run_on_cpu(cs, s390_do_cpu_ipl, RUN_ON_CPU_NULL);
>           break;
>       case S390_RESET_MODIFIED_CLEAR:
> +        /* clear topology_change_report pending condition on subsystem reset */
> +        ms->topology_change_report_pending = false;
>           /*
>            * Susbsystem reset needs to be done before we unshare memory
>            * and lose access to VIRTIO structures in guest memory.
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
> index 3331990e02..fbde357332 100644
> --- a/include/hw/s390x/s390-virtio-ccw.h
> +++ b/include/hw/s390x/s390-virtio-ccw.h
> @@ -27,9 +27,16 @@ struct S390CcwMachineState {
>       bool aes_key_wrap;
>       bool dea_key_wrap;
>       bool pv;
> +    bool topology_change_report_pending;
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
> index 5b1fdb55c4..9a0c13d4ac 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -97,6 +97,7 @@
>   
>   #define PRIV_B9_EQBS                    0x9c
>   #define PRIV_B9_CLP                     0xa0
> +#define PRIV_B9_PTF                     0xa2
>   #define PRIV_B9_PCISTG                  0xd0
>   #define PRIV_B9_PCILG                   0xd2
>   #define PRIV_B9_RPCIT                   0xd3
> @@ -1452,6 +1453,16 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
>       }
>   }
>   
> +static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
> +{
> +    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
> +    uint8_t ret;

Why is ret an uint8_t ? s390_handle_ptf() returns an "int".

> +    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
> +    setcc(cpu, ret);
> +    return 0; > +}

  Thomas


