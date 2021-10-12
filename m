Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF411429EA2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:29:16 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCDr-0004o6-TS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maCCB-0002np-8l
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maCC8-00049I-QH
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634023647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlOl23ru92weXBFpSR60EZhHWjIICQaCNtPweZCcieg=;
 b=KScpHZY/rluF6q+V1NGMMyHxyhI3UQP9O/+rIJt6EczzmI6J+Nwj5LVvgqLxStD5vz4jO8
 zRroXGbUKco4RjBavSflFKxa3Y99P8J3XJnfDk3D6pNFchpsBnQiw6KLwl4TDNm547BFWH
 frIXzQcw9GXhM2v1dyqSIAm24lWPqws=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-6kdS85aePCitwMW3o4QPbw-1; Tue, 12 Oct 2021 03:27:26 -0400
X-MC-Unique: 6kdS85aePCitwMW3o4QPbw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so15065361wrh.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OlOl23ru92weXBFpSR60EZhHWjIICQaCNtPweZCcieg=;
 b=ecyPz4pCo5a32MI6FoUHXd+YA3tIpbqp60lFJLZsGqiRw8v0F91MCoT2DGTQDbid66
 46MjAdWZ+Ss+GDURnB9ohwXoHd2qsHSqgitooeWZjnykebdpK7Yu0/k3II2QiWrlELXS
 loE5mpAr+y3vEShz8S/8QqVq4rNFC9eLNxWqMM+MJdNA7V6K3IP+btcbeAnJ2fkXJJfI
 ysSftRf+NzeNqGC9ZoZX1MfTcSDMJ0qroNyNm5qXcfLNSxIjpGy7k8iulf2L/PjHx9Yo
 56rhWOwRJMqtiasY3jf5B/nEXBx6FLmc8miBJ9NY100SsIKjOCvBa0BGct9zyvzemEEt
 BpTA==
X-Gm-Message-State: AOAM530EAp5jDj0kqndJ+STOOHNMK9RaKc78jyOUWU4Pp0kuuX4pZhEf
 ZfsQXrw59EHOTZSj3rOGDWH+DXv+Zdjuy77XY5QCRV2D4BqUQzwISE6ykBEzBiiS+undplZ9BET
 O4nEzY7to17Ob1Ic=
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3877630wmd.96.1634023645290; 
 Tue, 12 Oct 2021 00:27:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4yJupJFWE4Ay9boX/s56XuUa9Ti3yVg9on6YFS5PdzFhmbe8q6s1YOQ3uqFJhArs0d+GNng==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3877599wmd.96.1634023645033; 
 Tue, 12 Oct 2021 00:27:25 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u2sm9563030wrr.35.2021.10.12.00.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 00:27:24 -0700 (PDT)
Subject: Re: [PATCH 1/1] s390x:clp: implementing CLP immediate commands
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
 <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5efab45a-289a-5759-d6a5-5dbe7949f4ef@redhat.com>
Date: Tue, 12 Oct 2021 09:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: farman@linux.ibm.com, mjrosato@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/2021 14.06, Pierre Morel wrote:
> CLP immediate commands allow to query the Logical Processor
> available on the machine and to check for a specific one.
> 
> Let's add these commands.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c         | 33 ++++++++++++++++++++++++++++++++
>   include/hw/s390x/s390-pci-inst.h |  5 +++++
>   target/s390x/kvm/kvm.c           |  6 ++++++
>   3 files changed, 44 insertions(+)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 1c8ad91175..9fd0669591 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -156,6 +156,39 @@ out:
>       return rc;
>   }
>   
> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
> +                      uintptr_t ra)
> +{
> +    CPUS390XState *env = &cpu->env;
> +
> +    switch (r2) {
> +    case 0: /* Command Check */
> +        switch (i3 & 0x07) {
> +        case CLP_LPS_PCI: /* PCI */
> +            if (!s390_has_feat(S390_FEAT_ZPCI)) {
> +                setcc(cpu, 3);
> +                return 0;
> +            }
> +            /* fallthrough */
> +        case CLP_LPS_BASE: /* Base LP */
> +            setcc(cpu, 0);
> +            return 0;
> +        }
> +        setcc(cpu, 3);
> +        return 0;
> +    case 1: /* Command Query */
> +        env->regs[r1] = CLP_QUERY_LP_BASE;
> +        if (s390_has_feat(S390_FEAT_ZPCI)) {
> +            env->regs[r1] |= CLP_QUERY_LP_BASE >> CLP_LPS_PCI;
> +        }
> +        setcc(cpu, 0);
> +        return 0;
> +    }
> +
> +    s390_program_interrupt(env, PGM_SPECIFICATION, ra);

Just a matter of taste, but I'd rather put that into a "default:" case, so 
that the other cases could "break" instead of returning immediately.

> +    return 0;
> +}

All return statements return 0. Thus the return value does not really 
matter, you could also turn this into a "void" function.

>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>   {
>       ClpReqHdr *reqh;
> diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
> index a55c448aad..07721b08da 100644
> --- a/include/hw/s390x/s390-pci-inst.h
> +++ b/include/hw/s390x/s390-pci-inst.h
> @@ -101,6 +101,11 @@ typedef struct ZpciFib {
>   int pci_dereg_irqs(S390PCIBusDevice *pbdev);
>   void pci_dereg_ioat(S390PCIIOMMU *iommu);
>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
> +#define CLP_LPS_BASE 0
> +#define CLP_LPS_PCI  2
> +#define CLP_QUERY_LP_BASE (1UL << 63)
> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
> +                      uintptr_t ra);
>   int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
>   int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
>   int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 0a5f2aced2..af1316372d 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1345,7 +1345,13 @@ static uint64_t get_base_disp_rsy(S390CPU *cpu, struct kvm_run *run,
>   
>   static int kvm_clp_service_call(S390CPU *cpu, struct kvm_run *run)
>   {
> +    uint8_t r1 = (run->s390_sieic.ipb & 0x00f00000) >> 20;
>       uint8_t r2 = (run->s390_sieic.ipb & 0x000f0000) >> 16;
> +    uint8_t i3 = (run->s390_sieic.ipb & 0xff000000) >> 24;
> +
> +    if (i3 & 0x80) {
> +        return clp_immediate_cmd(cpu, r1, r2, i3, RA_IGNORED);
> +    }
>   
>       if (s390_has_feat(S390_FEAT_ZPCI)) {
>           return clp_service_call(cpu, r2, RA_IGNORED);
> 

Could you please adjust the TCG part accordingly, too?

  Thomas


