Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED94026F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:15:32 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNY8Z-00040L-EB
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNY6z-0002lD-FG
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNY6x-0003tS-9I
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631009628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2R36AZ5i20DPQd6+OqBe960w75uaFmbhGgM2eVLZONo=;
 b=WCWk4rjE/vblcaynuFUdj5d3f7Xu8v2z54bNlOsEfo/3HCI7ClIcKwtdO1VG85FJVE6tPR
 LW2gGCrpEqwCSyPLLrm9e0Y8dam6yXTpRni6kq7Y8/3/NOiFmUfbFkPrEYIO0SN28tVZs2
 Kqa2HS+MDDTRI3pC1F4jt/MigFt+Ifo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-twXFRj_aOPiKh1DXRM1RdQ-1; Tue, 07 Sep 2021 06:13:47 -0400
X-MC-Unique: twXFRj_aOPiKh1DXRM1RdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso943334wmr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2R36AZ5i20DPQd6+OqBe960w75uaFmbhGgM2eVLZONo=;
 b=XobqupnnhF0yfsffcOVCPofXdqzI5VMlDVPwEWJqEWJeSaOPev08037dta83bwOLcg
 klkETV4xYz35Rfm65f5aCGqgNPBPii6NYfpZjlg2nafD+n0TpiOviZLDudFMK/DmiSVy
 C6DpWEZmGdUJ5wH9K6kXZq1Sa+9fvG0xnSmrHTvRPQLixnLRzSeIH25meotFfF2UcJjp
 xyGkItq8hfDD8CLIZH57q7/J/ZXv5Sc18KWSpOrxrotJ0KXgi/FdKuppLJG87fDOfDNA
 hH13o+EmyL4/Ct48LzbP1JzLfBHRTtovaUm3ni6mwoPnJZ3tl8ljC3NrGhlt6H8Px+1+
 vLQg==
X-Gm-Message-State: AOAM532qH/Sd6VAzmk3JRQaUhVgZpGBtdIrt/MyUnnXg9e3Z2p8008a4
 irqULhVw1AXy8T3e/hXvIlkFD9HLP8WFxW34a20RW9d4dOn6r5wfF0OzqRlr2LuHo0DtvieQqUy
 JzMPFrzU+NeIRRYY=
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr18183043wrz.242.1631009626722; 
 Tue, 07 Sep 2021 03:13:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxzHP11o+F5q4ine+37Et0tnNx9du8vYblWOX0lHw4s8CNpy4Yibyo/TgYchU2wFBJmscGZg==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr18183021wrz.242.1631009626502; 
 Tue, 07 Sep 2021 03:13:46 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23fca.dip0.t-ipconnect.de. [79.242.63.202])
 by smtp.gmail.com with ESMTPSA id v28sm10689474wrv.93.2021.09.07.03.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 03:13:46 -0700 (PDT)
Subject: Re: [PATCH v2] s390x/cpumodel: Add more feature to gen16 default model
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210907101017.27126-1-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <07225716-c7ea-1284-1669-5dc3f46a35b6@redhat.com>
Date: Tue, 7 Sep 2021 12:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907101017.27126-1-borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 12:10, Christian Borntraeger wrote:
> Add the new gen16 features to the default model and fence them for
> machine version 6.1 and earlier.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c  | 5 +++++
>   target/s390x/gen-features.c | 8 +++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4d25278cf20e..61aeccb163f7 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
>       ccw_machine_6_2_instance_options(machine);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_NNPA);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_BEAR_ENH);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_RDP);
> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAI);
>   }
>   
>   static void ccw_machine_6_1_class_options(MachineClass *mc)
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 7d85322d6814..7cb1a6ec10be 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -663,7 +663,13 @@ static uint16_t default_GEN15_GA1[] = {
>       S390_FEAT_ETOKEN,
>   };
>   
> -#define default_GEN16_GA1 EmptyFeat
> +static uint16_t default_GEN16_GA1[] = {
> +    S390_FEAT_NNPA,
> +    S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
> +    S390_FEAT_BEAR_ENH,
> +    S390_FEAT_RDP,
> +    S390_FEAT_PAI,
> +};
>   
>   /* QEMU (CPU model) features */
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


