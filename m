Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922668BC2A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:58:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP07j-0001Ir-Oi; Mon, 06 Feb 2023 06:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP07h-0001Hn-67
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP07f-0001Xe-Lj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675684642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uS4CtaqrUMD/f6x0WCVMDIkGkH5LrLtOJTV7xMEM8Mw=;
 b=aCXA+1SlM01nApaco/xD/u3LPUuDQ8BbKp3dGvdZDoeW6W9RRMmsJ+WD+RlMwl15RI5i6w
 ejkP6qTRYMq5YJ4MxyS+8zhwUKpUuUS7NULJf14d2Rir8oZTqO2DlKk5yKockAERfy8DA7
 P7tkulbIVbTFOjhCEYx+9Fq8JZuD1p4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-nxwp_pB2OP27uaW6roc16g-1; Mon, 06 Feb 2023 06:57:21 -0500
X-MC-Unique: nxwp_pB2OP27uaW6roc16g-1
Received: by mail-qt1-f200.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so6326558qtb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uS4CtaqrUMD/f6x0WCVMDIkGkH5LrLtOJTV7xMEM8Mw=;
 b=6SpFweDfUFMr2cW6aTLxlS4x7utFYfXYudmC5cPYThH/ZGorX7Pzbfg/nBiADVYpCp
 e0feLOdFFdu2uZBmATMxLMVcXrSeib/cqPsw/TMSVJwUp5zUHJ/0gXNW78mXJ5DhhDbV
 WHdnpC26BkO8P+dCOWV6moXhFPhMPXxuS4l16syuEgXqhnMto4BSovMNHy8QUUgywjnY
 hUDXs5MWZODU7kANEh7ea7PKe6YiZjNZn6QgCDUJlaihZR9jaPNud4dcwtgnqRKlqt+z
 qi+FGyqSIVQxRCnfnRVQjhpvZtxhPJynqjKzU9kv9KxCWuqrQHW8aqQFBRnGCpBYR2df
 2Akw==
X-Gm-Message-State: AO0yUKU/Y+BbzA1My11EyCTFl2jWUU79p10rD3ofA3BwvKijJ+5E0k1U
 zzAK0+FFFtpoPHEKiMrr2MVwoBG3km8AWn0RGuVVq0FXPeAtmPZnIgrD+hPkklnOEByn6cLbiLE
 1DgylVjEud+m0nyI=
X-Received: by 2002:ac8:73d9:0:b0:3b9:bc8c:c20b with SMTP id
 v25-20020ac873d9000000b003b9bc8cc20bmr16176806qtp.22.1675684641055; 
 Mon, 06 Feb 2023 03:57:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/Vdvgis8O0hl0sM5kvVlwPCy3C6j4RuwO89/z5o31Vk/ib9lywMQfxvIWNgX+uhayn0cNynA==
X-Received: by 2002:ac8:73d9:0:b0:3b9:bc8c:c20b with SMTP id
 v25-20020ac873d9000000b003b9bc8cc20bmr16176779qtp.22.1675684640812; 
 Mon, 06 Feb 2023 03:57:20 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 s20-20020a05620a16b400b0071f40a59fe5sm7205403qkj.127.2023.02.06.03.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:57:20 -0800 (PST)
Message-ID: <b74543e8-5646-49da-2fab-8c5c69169d97@redhat.com>
Date: Mon, 6 Feb 2023 12:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 07/11] target/s390x/cpu topology: activating CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-8-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230201132051.126868-8-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/02/2023 14.20, Pierre Morel wrote:
> The KVM capability KVM_CAP_S390_CPU_TOPOLOGY is used to
> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
> the topology facility in the host CPU model for the guest
> in the case the topology is available in QEMU and in KVM.
> 
> The feature is disabled by default and fenced for SE
> (secure execution).
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c   |  2 +-
>   target/s390x/cpu_models.c |  1 +
>   target/s390x/kvm/kvm.c    | 12 ++++++++++++
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index 1028bf4476..c33378577b 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -55,7 +55,7 @@ int s390_socket_nb(S390CPU *cpu)
>    */
>   bool s390_has_topology(void)
>   {
> -    return false;
> +    return s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY);
>   }
>   
>   /**
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 065ec6d66c..aca2c5c96b 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -254,6 +254,7 @@ bool s390_has_feat(S390Feat feat)
>           case S390_FEAT_SIE_CMMA:
>           case S390_FEAT_SIE_PFMFI:
>           case S390_FEAT_SIE_IBS:
> +        case S390_FEAT_CONFIGURATION_TOPOLOGY:
>               return false;
>               break;
>           default:
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index fb63be41b7..808e35a7bd 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2470,6 +2470,18 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
>           set_bit(S390_FEAT_UNPACK, model->features);
>       }
>   
> +    /*
> +     * If we have kernel support for CPU Topology indicate the
> +     * configuration-topology facility.
> +     */
> +    if (kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY, 0) < 0) {
> +            error_setg(errp, "KVM: Error enabling KVM_CAP_S390_CPU_TOPOLOGY");
> +            return;
> +        }
> +        set_bit(S390_FEAT_CONFIGURATION_TOPOLOGY, model->features);
> +    }

Not sure, but for the other capabilities, the kvm_vm_enable_cap() is rather 
done in kvm_arch_init() instead ... likely that it is properly available in 
case you don't run with the "host" cpu model? So should the 
kvm_vm_enable_cap(KVM_CAP_S390_CPU_TOPOLOGY) also be moved there (but of 
course keep the set_bit() here in kvm_s390_get_host_cpu_model())?

  Thomas


