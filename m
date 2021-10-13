Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A4B42B904
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:27:51 +0200 (CEST)
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYg1-00062i-T0
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maYe7-0005C4-RI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maYe4-0002hV-JC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634109947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6H5bv9/hUeMy1fBxMfT9KmiSdFgS3IlZsEuimDNw5k=;
 b=SOoIpBC6AhXG7ywwkUMlVsixyEmGl0f8SQV4vkax1a8X78NbmRjhEJpw8dooC8WcOI/AZn
 VjlpH/43gKf5UpjhFnEnXfHhFqdSZUSqPEOz5HHHaKAOGigzt58NE5R6fzxkItkNf+HQdP
 S1qKrnOKn7L2h3Z8VG3J6z0WVsNbFrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-r4k4SydEN4SSDjNTyuEIWA-1; Wed, 13 Oct 2021 03:25:46 -0400
X-MC-Unique: r4k4SydEN4SSDjNTyuEIWA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1264623wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6H5bv9/hUeMy1fBxMfT9KmiSdFgS3IlZsEuimDNw5k=;
 b=Hhq5SjfreXwtxoB4kjSow3BRMIorU2PmD8cvha7wH4iF/eAQuiuDpI9Ke6zmFQ7XjY
 RTyHN7D9YuMH3LMcGWF/zshAfJURg1bAfQsm/W7FeH+1QGIkXzOijetJtURuIyAvMXnu
 edTOeDYwP71X6ACHpDHq2JJUp/kYruEDBbCGPPt0gXO1l26NJSurrmqR+0lutaQusR1K
 Z5qSA77SkAqJHernRfCwonH1yeleg7HT0a3ArgVwIHNJsSlad0/FdBr5cXkiK0/+UofF
 xTZm3axlHAbDldpWCHe1zpE3MlZtmKktlj0pRKCj/z+JPMXjPdmoGjZOgWwg4hnfNVCd
 MF/w==
X-Gm-Message-State: AOAM5338w/S4UQfUJgrAGETVnu96ObVq7m9Esjlms6pYoftnM537lJA0
 pP0VDTKdaQs0ToyG0fHFtSvW6qFWWilunGkx7EmFf0aLM2PfUC5Zuau7QDSw7/vA5Ti60YtZ9b0
 GDBYbQF7gljQW9vw=
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr36749821wrg.23.1634109944958; 
 Wed, 13 Oct 2021 00:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwesxB+LGNaXBenu2xjY07CCxNFZecx/0QVFpTv3Bl01uYGt/S/Nc9UI4StcVAJNHVaXvRbNg==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr36749794wrg.23.1634109944661; 
 Wed, 13 Oct 2021 00:25:44 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id z6sm8527037wro.25.2021.10.13.00.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 00:25:44 -0700 (PDT)
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF
 instruction
Message-ID: <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
Date: Wed, 13 Oct 2021 09:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/09/2021 15.50, Pierre Morel wrote:
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
>   hw/s390x/s390-virtio-ccw.c         | 36 ++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-virtio-ccw.h |  6 +++++
>   target/s390x/kvm/kvm.c             | 15 +++++++++++++
>   3 files changed, 57 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 61aeccb163..894f013139 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -404,6 +404,42 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
>       s390_pv_prep_reset();
>   }
>   

Could you please add a comment in front of this function, with some 
explanations? If I've got that right, it's currently rather only a "dummy" 
function, rejecting FC 0 and 1, and FC 2 is always handled by the SIE, right?

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
> index 5b1fdb55c4..dd036961fe 100644
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
> @@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>       kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
> +    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);

Should this maybe rather be done in the last patch, to avoid a state where 
PTF is available, but STSI 15 is not implemented yet (when bisecting through 
these commits later)?

  Thomas


