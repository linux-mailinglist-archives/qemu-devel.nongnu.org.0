Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D137D53A14E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 11:53:49 +0200 (CEST)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwL2y-0004iy-P2
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 05:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwL1d-00041J-Tb
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwL1O-0003IE-0Z
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 05:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654077129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8SLZ/gpBAnuu2nonvDs04H2zRpGtTgk07BIA/nAZcg=;
 b=U9u0NCv6wt+HRBDAP5+7APgPVlJbuWH0EWVgDPT7aHOvCVmxozuYqGr3FKAviyXEciZDHG
 rut4xc+G1CdKDSTqFFOeYcc2cVhvupJT+Kuh9c1GEceswfaa/nNoHvrpwSa0KgTXa0tPUE
 sJozVDP7Uh2cieOdLlm3CNjHw55l8Zo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-93o6yLVhMomEgTyX9SxEfA-1; Wed, 01 Jun 2022 05:52:08 -0400
X-MC-Unique: 93o6yLVhMomEgTyX9SxEfA-1
Received: by mail-wr1-f70.google.com with SMTP id
 bt14-20020a056000080e00b002100d89c219so184626wrb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 02:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=S8SLZ/gpBAnuu2nonvDs04H2zRpGtTgk07BIA/nAZcg=;
 b=j+BolYVPjJVjanjBWclRn0lUyjahZcXohhGWLbd/ESIKxgoPuMwW0F5T2K5hsuypIY
 tWHAke+Cq7/9H+3vzHX/mdZi4Uffxs3EAfe1LulFnqbX4Do/iJV2zhD/69EgFoc1HaFD
 oTVP2hU0OFMMteAIgj0WTz3pMcXMsENDOQ+1tTDClIjVQgUdNfAMzkL1abMZV4xNOrWV
 eg00IGQSwlRTQLIlRHLWoEMEq6s7UGYhSW1HTkb3CDDeEMevJgp/qwV26oqaRNLgZQrU
 MHB6KYeGL/TzKqYHY1nq3seFSDHUe1TXPR3v4plmejP5QHldA7kqzMxVdo3UDPwc8+S+
 eL9g==
X-Gm-Message-State: AOAM533w7goGs5x0AJKqv7fTesqfEzTzVIN1+vknNWVm0cFil9aOs/rN
 3XmpXdHLFIk2ZAXAx8k+Ca4izacYzAOes7AtTbXaJ8ejB2IusUsjPbspkTNO/YpnnS1XVQCAVBG
 guKvU3P+z71oLRyE=
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id
 ay7-20020a5d6f07000000b0020fe7b660e9mr36876424wrb.452.1654077126995; 
 Wed, 01 Jun 2022 02:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfmJEhuKto8dWe9djv8V0HWrJDK7LLd/Gekw/NvZ02056FHNaptIVSZJ7/IPYBN3KebVhicw==
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id
 ay7-20020a5d6f07000000b0020fe7b660e9mr36876408wrb.452.1654077126724; 
 Wed, 01 Jun 2022 02:52:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a1cf713000000b0039c18d3fe27sm1361545wmh.19.2022.06.01.02.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 02:52:06 -0700 (PDT)
Message-ID: <5b19dd64-d6be-0371-da63-0dd0b78a3a5c@redhat.com>
Date: Wed, 1 Jun 2022 11:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220524190305.140717-1-mjrosato@linux.ibm.com>
 <20220524190305.140717-3-mjrosato@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 2/8] target/s390x: add zpci-interp to cpu models
In-Reply-To: <20220524190305.140717-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 24.05.22 21:02, Matthew Rosato wrote:
> The zpci-interp feature is used to specify whether zPCI interpretation is
> to be used for this guest.

We have

DEF_FEAT(SIE_PFMFI, "pfmfi", SCLP_CONF_CHAR_EXT, 9, "SIE: PFMF
interpretation facility")

and

DEF_FEAT(SIE_SIGPIF, "sigpif", SCLP_CPU, 12, "SIE: SIGP interpretation
facility")


Should we call this simply "zpcii" or "zpciif" (if the official name
includes "Facility")

> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/s390x/s390-virtio-ccw.c          | 1 +
>  target/s390x/cpu_features_def.h.inc | 1 +
>  target/s390x/gen-features.c         | 2 ++
>  target/s390x/kvm/kvm.c              | 1 +
>  4 files changed, 5 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 047cca0487..b33310a135 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
>      static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
>  
>      ccw_machine_7_1_instance_options(machine);
> +    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
>      s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
>  }
>  
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index e86662bb3b..4ade3182aa 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
>  DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
>  DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
>  DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
> +DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")

How is this feature exposed to the guest, meaning, how can the guest
sense support?

Just a gut feeling: does this toggle enable the host to use
interpretation and the guest cannot really determine the difference
whether it's enabled or not? Then, it's not a guest CPU feature. But
let's hear first what this actually enables :)

>  
>  /* Features exposed via the PLO instruction. */
>  DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in general registers)")
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index c03ec2c9a9..f991646c01 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -554,6 +554,7 @@ static uint16_t full_GEN14_GA1[] = {
>      S390_FEAT_HPMA2,
>      S390_FEAT_SIE_KSS,
>      S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,
>  };
>  
>  #define full_GEN14_GA2 EmptyFeat
> @@ -650,6 +651,7 @@ static uint16_t default_GEN14_GA1[] = {
>      S390_FEAT_GROUP_MSA_EXT_8,
>      S390_FEAT_MULTIPLE_EPOCH,
>      S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,

I'm curious, should we really add this to the default model?

This implies that on any setup where we don't have zpci interpretation
support (including missing kernel support), that a basic "-cpu z14" will
no longer work with the new machine type.

If, OTOH, we expect this feature to be around in any sane installation,
then it's good to include it in the

-- 
Thanks,

David / dhildenb


