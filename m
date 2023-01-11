Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4A66588F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXyL-0005jB-C0; Wed, 11 Jan 2023 05:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFXy1-0005gR-D2
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:04:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFXxz-0002gx-Gj
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673431454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ws57bKhCFEIuKPB2whL4Z/ylGixJw3tf3/cpkOfXajE=;
 b=I2+0aDaSeR2AYgQHwKjwjqdMJN4z5iG9Wb9WobqHVDCFj2bGIRwTGiE24og4qRcOlZVLvc
 iGlL/mbmzRiARLQ3+OVsmSOWE1nT7Ydvm3GXhc/BoE9nZUpMX6uCWjBXmgQWXEymGeXWjA
 z0O0+w+nWQ0UitDzqrUqln9dPvGZur8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-bcNcBzJcPBqrInDQrnFl0w-1; Wed, 11 Jan 2023 05:04:13 -0500
X-MC-Unique: bcNcBzJcPBqrInDQrnFl0w-1
Received: by mail-ua1-f71.google.com with SMTP id
 a5-20020ab00805000000b0052816f498d8so6567245uaf.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ws57bKhCFEIuKPB2whL4Z/ylGixJw3tf3/cpkOfXajE=;
 b=UBGVUDMDd0ws8td5sRoK9mJSXaBgnTq5Qbll4ztSO+NzmoI1y/zU3Vw0Y6xSJqFouE
 4/CBUO7voZx9AKUxITQ/A8iG2lYtsn/ty1ybgFNbIJp+6xCjdwkqg9NlvcqG3+B4PUJ6
 QZQ3uzv9UaZJBehaVlVhDBxHobeWQqyjfSIPqilAg0DB6Fv1X2wPF9eU6D/5BeTUt4yf
 lWs4MoznTIKrdVgCcebtC/IWqiTqEj+FF7SuaSa8tfBY8rSBHJSBIfCsLODs2RLzEcEP
 GjKzks3MWFeq/H+GVVnutlCof/u3Ej4ZPVhbqk4+Q1odoIs6Rst2KfHwBufhlSpFSJm1
 rdFw==
X-Gm-Message-State: AFqh2kpPw8EzKNNL1yWi/e5utKZDIXouYLOxMGwqKcBNgGvqhXf8hWdk
 cob1rSqkjHH5sTRly8kBMsAdhQSK7P5N+4sObdbBGfh57+j81K8g3CdsIjfYD5zCyOjXoGfEmas
 7ZDxLzdLRtouwFOM=
X-Received: by 2002:a67:e208:0:b0:3c7:f2c1:93b9 with SMTP id
 g8-20020a67e208000000b003c7f2c193b9mr34245228vsa.4.1673431453064; 
 Wed, 11 Jan 2023 02:04:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjnzgsgJJgjCqD3C1Cyv45Y2MgPPRJorKUF4GN0qROCnrOdLUxHQmLxeI8bgmisnsGaMoauw==
X-Received: by 2002:a67:e208:0:b0:3c7:f2c1:93b9 with SMTP id
 g8-20020a67e208000000b003c7f2c193b9mr34245203vsa.4.1673431452785; 
 Wed, 11 Jan 2023 02:04:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 u8-20020a37ab08000000b00702311aea78sm8652658qke.82.2023.01.11.02.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:04:12 -0800 (PST)
Message-ID: <69555196-ffde-8176-24d9-b8935fe6f365@redhat.com>
Date: Wed, 11 Jan 2023 11:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 07/11] target/s390x/cpu topology: activating CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-8-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-8-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to

Remove the "," in above line?

> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
> the topology facility for the guest in the case the topology

I'd like to suggest to add "in the host CPU model" after "facility".

> is available in QEMU and in KVM.
> 
> The feature is disabled by default and fenced for SE
> (secure execution).
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c   |  2 +-
>   target/s390x/cpu_models.c |  1 +
>   target/s390x/kvm/kvm.c    | 13 +++++++++++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index e6b4692581..b69955a1cd 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -52,7 +52,7 @@ static int s390_socket_nb(s390_topology_id id)
>    */
>   bool s390_has_topology(void)
>   {
> -    return false;
> +    return s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY);
>   }
>   
>   /**
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index c3a4f80633..3f05e05fd3 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -253,6 +253,7 @@ bool s390_has_feat(S390Feat feat)
>           case S390_FEAT_SIE_CMMA:
>           case S390_FEAT_SIE_PFMFI:
>           case S390_FEAT_SIE_IBS:
> +        case S390_FEAT_CONFIGURATION_TOPOLOGY:
>               return false;
>               break;
>           default:
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index fb63be41b7..4e2a2ff516 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2470,6 +2470,19 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
>           set_bit(S390_FEAT_UNPACK, model->features);
>       }
>   
> +    /*
> +     * If we have support for CPU Topology prevent overrule
> +     * S390_FEAT_CONFIGURATION_TOPOLOGY with S390_FEAT_DISABLE_CPU_TOPOLOGY

That S390_FEAT_DISABLE_CPU_TOPOLOGY looks like a leftover from v12 ?

Apart from that, patch looks fine to me now.

  Thomas


> +     * implemented in KVM, activate the CPU TOPOLOGY feature.
> +     */
> +    if (kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY, 0) < 0) {
> +            error_setg(errp, "KVM: Error enabling KVM_CAP_S390_CPU_TOPOLOGY");
> +            return;
> +        }
> +        set_bit(S390_FEAT_CONFIGURATION_TOPOLOGY, model->features);
> +    }
> +
>       /* We emulate a zPCI bus and AEN, therefore we don't need HW support */
>       set_bit(S390_FEAT_ZPCI, model->features);
>       set_bit(S390_FEAT_ADAPTER_EVENT_NOTIFICATION, model->features);


