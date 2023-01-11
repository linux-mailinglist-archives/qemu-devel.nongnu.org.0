Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026AA6656B6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:01:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWyW-0001o9-Mm; Wed, 11 Jan 2023 04:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFWyS-0001nO-3u
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:00:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFWyQ-0000sV-88
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673427636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fVZh4pfsJpmZbOYSBkRk4GHEkxKt9nd3zTIFVmbyEA=;
 b=V602NJHdQXe5+PCfkwg2jnIhyI4Jv0qlEQIjKmIKMhvVng/vrxBZZbKY9ENAxTR6V70Ne+
 p6MPL4ESSvYo5TBVyLgd9vP0Wy6q585qDIZv5x332tKqjrg/+OvxUdoa1qiPqVNjFR9iX8
 A0UHxEZelSVKmmkKua0xBIrhLt98csE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-PsMFFQkKOwmlEA9kksbR8g-1; Wed, 11 Jan 2023 04:00:34 -0500
X-MC-Unique: PsMFFQkKOwmlEA9kksbR8g-1
Received: by mail-qt1-f198.google.com with SMTP id
 ff17-20020a05622a4d9100b003abec48d547so5204594qtb.21
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6fVZh4pfsJpmZbOYSBkRk4GHEkxKt9nd3zTIFVmbyEA=;
 b=l3CmaQSghMcyaVuhX3pchUyXCb7xzAlJC9vdjPe4pS2/7M5nx8/2c1gZ/1M7Bk4kIT
 HwZwgx5ea8TNtsB+w39d6ayTkRVMiQL2+vkqg4dt+AfdZn4r86On5FMupvhUNDs8Z+rI
 Gh4/V1AWdogHZjPQ8PJV3AZ0FH1iyK18GzqrOKOFcImToQFvTI1DjZ+zW2AYgei+qUn5
 FND6N1n/FjQZ/v8uRSO8GOujWC/2aD8+KPpvyhYoD5X8LAylrW125D3AbkP/tLloBXhw
 /Op+3T/qWjroXKyu3+d9cLzReYqOOBGQcHsRttoL67LacLWL3cZB6N0plOJXprLHzux2
 gF9w==
X-Gm-Message-State: AFqh2kri/5e9v2szrY3W7/1haFUOpzOBBClu+sPWLK9scBZPwJSEUyMJ
 gttbSzyPFApQFtBxZg0Iyitk60ukN1j3CwlXfrDAn861jEkwrWqIyWtOGG4Zo3HgTpKJsORdT+N
 DDy58qQmQsGDu9VU=
X-Received: by 2002:a05:622a:4cc5:b0:3ac:c333:484 with SMTP id
 fa5-20020a05622a4cc500b003acc3330484mr19366738qtb.9.1673427634410; 
 Wed, 11 Jan 2023 01:00:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxxI6TtBwQ5lXVg/ea9lcDYALmua1c7tkdHLqfy2/kdbedjjtjdcEFiGQFUvYF7ebroQL6Xg==
X-Received: by 2002:a05:622a:4cc5:b0:3ac:c333:484 with SMTP id
 fa5-20020a05622a4cc500b003acc3330484mr19366697qtb.9.1673427634161; 
 Wed, 11 Jan 2023 01:00:34 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05620a448a00b006faa2c0100bsm8746892qkp.110.2023.01.11.01.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:00:33 -0800 (PST)
Message-ID: <f2433967-3c97-e4d7-9e2f-577b24c2369a@redhat.com>
Date: Wed, 11 Jan 2023 10:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 05/11] s390x/cpu topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-6-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105145313.168489-6-pmorel@linux.ibm.com>
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

On 05/01/2023 15.53, Pierre Morel wrote:
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
> bit of the SCA in the case of a subsystem reset.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
> index f9785564d0..649dae5948 100644
> --- a/target/s390x/kvm/kvm_s390x.h
> +++ b/target/s390x/kvm/kvm_s390x.h
> @@ -47,5 +47,6 @@ void kvm_s390_crypto_reset(void);
>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
> +int kvm_s390_topology_set_mtcr(uint64_t attr);
>   
>   #endif /* KVM_S390X_H */
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index c98b93a15f..14798ca305 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -122,6 +122,7 @@ static void subsystem_reset(void)
>               device_cold_reset(dev);
>           }
>       }
> +    s390_cpu_topology_reset();
>   }

Would it make sense to add a "if (s390_has_topology())" check around the new 
line?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>



