Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5D52B423
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:04:31 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEfW-0008Vb-0M
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEcm-0007hb-Lr
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEcj-0003Q7-Sj
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652860896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAl2bjEIAetEBRabM2lB8bJRFmizaHWXMjTDRpC0K/M=;
 b=FaE2fRmDuVppzqyPquSjMqDdINFfGT7T6+CHDH9CU+sBkrN+ZezFzYNs+FfLch4fgbA6va
 romdeOP79Cfzb8mVlAYELgvgX9dO+nsu8GTAOE1VfurCS468Ca4u78Zdqzh/La/8neQVZg
 b8NDYaBR662gleW0hD1X5Iia78zeWvs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-XwrCDd6mOBuEFDnCymzHjg-1; Wed, 18 May 2022 04:01:35 -0400
X-MC-Unique: XwrCDd6mOBuEFDnCymzHjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i127-20020a1c3b85000000b003970bec7fd9so554755wma.9
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MAl2bjEIAetEBRabM2lB8bJRFmizaHWXMjTDRpC0K/M=;
 b=YChQg74e/cxy9ST4+5UIALUzUuee31sijLqJ6z7nbtGZPAHqmS5L9kfi4av5tbhXAM
 2hoBLXq9rN0blBunOZ2n/93v1WMt2KNqFjue2ji2i5tMgRGautF8yKpefPnMUXxNY8qC
 +d3A+/KRmc580C7IejLFuEAfP1dz+CjdHzzyyncD3N1hG3rRrlVv2Z3weQnqFalP9COA
 YsBeCLn+bUH+/2yAI5a07VzTG/EpF3P1FcV5MIIRQol4Q0lB6y3baTcbwnwP9BYU1zIn
 y+JluJ7ZSymD9/WvSDUI8eIyGbxUEX+mR1d6TVEC8G4iatW/DOxkeYQOHxgl7yw8Dl45
 9z4Q==
X-Gm-Message-State: AOAM533FIick6outtB0kO65MYEZ6jHKttE7NtEAR/r0Y9GAHMleyzrXb
 hDvZ/lLH7K4pjJgmVP7AXlkBdiJYqAwDMIalKczXEFyyg5v6SAnRcohax2iRbVYdD9MANb1f9bm
 Z8oays6b967uvDRA=
X-Received: by 2002:a05:600c:3d89:b0:397:104:b1c9 with SMTP id
 bi9-20020a05600c3d8900b003970104b1c9mr14843981wmb.84.1652860894406; 
 Wed, 18 May 2022 01:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTuV5UFWfWPMdtdFPQFTF1GHcHutlZSVAg9dOVmkjZ8iGTy9IVzodBNzvTDfcfXtnJReuDpA==
X-Received: by 2002:a05:600c:3d89:b0:397:104:b1c9 with SMTP id
 bi9-20020a05600c3d8900b003970104b1c9mr14843943wmb.84.1652860894014; 
 Wed, 18 May 2022 01:01:34 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm1171224wre.94.2022.05.18.01.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 01:01:33 -0700 (PDT)
Message-ID: <f7ca365a-1e7e-d0a8-8a0e-5cf744cd1d20@redhat.com>
Date: Wed, 18 May 2022 10:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/9] target/s390x: add zpci-interp to cpu models
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 david@redhat.com
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-4-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220404181726.60291-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/04/2022 20.17, Matthew Rosato wrote:
> The zpci-interp feature is used to specify whether zPCI interpretation is
> to be used for this guest.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c          | 1 +
>   target/s390x/cpu_features_def.h.inc | 1 +
>   target/s390x/gen-features.c         | 2 ++
>   target/s390x/kvm/kvm.c              | 1 +
>   4 files changed, 5 insertions(+)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9..b190234308 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -805,6 +805,7 @@ static void ccw_machine_6_2_instance_options(MachineState *machine)
>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
>   
>       ccw_machine_7_0_instance_options(machine);
> +    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
>       s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
>   }
>   
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index e86662bb3b..4ade3182aa 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
>   DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
>   DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
>   DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
> +DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")
>   
>   /* Features exposed via the PLO instruction. */
>   DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in general registers)")
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 22846121c4..9db6bd545e 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -554,6 +554,7 @@ static uint16_t full_GEN14_GA1[] = {
>       S390_FEAT_HPMA2,
>       S390_FEAT_SIE_KSS,
>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,
>   };
>   
>   #define full_GEN14_GA2 EmptyFeat
> @@ -650,6 +651,7 @@ static uint16_t default_GEN14_GA1[] = {
>       S390_FEAT_GROUP_MSA_EXT_8,
>       S390_FEAT_MULTIPLE_EPOCH,
>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
> +    S390_FEAT_ZPCI_INTERP,
>   };

If you add something to the default model, I think you also need to add some 
compatibility handling to the machine types. See e.g. commit 84176c7906f as 
an example.

  Thomas


