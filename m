Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49B3B8F13
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:49:00 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysNX-00060E-4b
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lysMg-0005GI-PS
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lysMf-0000dT-4H
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625129284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjpfdxZKVnUWUkyGT1uiiKzeJRb0zh/aNjsFFoyDRQg=;
 b=TVzaWM9jCziRIeIbqAJkH86irnIJTbzAsjhI1tscMaHrmLNxVKpyOZpQUzrkOYQB9ywIXP
 y2B+VBqXrnkNqw9edV/Uti7+DmeXoLv32CNTEi22YsVQhRCNFT8ezaSH0peCldOqKauZp9
 68fAR+qDHge0theVJ6KJdem/pNeP2r4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-0ZvJmipnM5CXd4ufcdf8hA-1; Thu, 01 Jul 2021 04:48:03 -0400
X-MC-Unique: 0ZvJmipnM5CXd4ufcdf8hA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so4236520wmj.7
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 01:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zjpfdxZKVnUWUkyGT1uiiKzeJRb0zh/aNjsFFoyDRQg=;
 b=B7rXtsivM72Yr8kLYzfecQJiljakGiDnCk3z198nlUUeT1ab+iHCuHbnGD5VVWzlgr
 aXf6Wbva2+rf93UnPlfb8PVYNouO3NW1lH5gPpeIMBbIfPBRV27tmRXU2JHCQUKlpUw8
 bGJS7yDnpLUF+b9eYFvstwxUk6/CuhnqPI9IMUHCFjGxy8SViOKGj7Cxc6qgczmTil4a
 SXvmcZ523Lu8rBxyHl8XQIi76NOnTopRKM2zBSe3+juGcSCoVGYkV8xdenGGWTkeVgPA
 1RCz+kKjtpoBQENIBaPSVv/nAbvVC+KnJUO4MvKekqY7LcTNQXuEF4zQJiErXM+JksRX
 S/OA==
X-Gm-Message-State: AOAM5333HX13mO73QP58YHbFIPhf4DVmTLAUoGpg8TzjQSFdkGVqs0KV
 l8Ud0U0s96rZMumlf2UckhJ18gryZO48Rwu++0rWfjVG2N8cy10+8GNv80fE30DolmsWNL7sapL
 41govvuRBKN5FN5c=
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr42583680wmb.129.1625129281800; 
 Thu, 01 Jul 2021 01:48:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkrGYGRUAS4FwdHW95A9DWxHpR4rMyqjoriz38PXgiRtUmqjWyim7HiPcBSyvfZsc5jrpvRA==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr42583660wmb.129.1625129281587; 
 Thu, 01 Jul 2021 01:48:01 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23bca.dip0.t-ipconnect.de. [79.242.59.202])
 by smtp.gmail.com with ESMTPSA id n20sm22279121wmk.12.2021.07.01.01.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 01:48:01 -0700 (PDT)
Subject: Re: [PATCH fixup] s390x: fixup for "s390x/cpumodel: add 3931 and 3932"
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210701084348.26556-1-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2cc2bf2a-d1cd-d79a-318a-baf03e123045@redhat.com>
Date: Thu, 1 Jul 2021 10:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701084348.26556-1-borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.07.21 10:43, Christian Borntraeger wrote:
> as discussed we want to change some facility names. Please merge
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>   target/s390x/cpu_features_def.h.inc | 4 ++--
>   target/s390x/gen-features.c         | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index 6f92b155c3b1..33c67e36cf79 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -111,9 +111,9 @@ DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>   DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>   DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>   DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
> -DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility ")
> +DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility ")
>   DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility ")
> -DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility ")
> +DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility ")
>   
>   /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
>   DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index a7396d3d5f30..7d85322d6814 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -572,9 +572,9 @@ static uint16_t full_GEN15_GA1[] = {
>   static uint16_t full_GEN16_GA1[] = {
>       S390_FEAT_NNPA,
>       S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2,
> -    S390_FEAT_BEAR,
> +    S390_FEAT_BEAR_ENH,
>       S390_FEAT_RDP,
> -    S390_FEAT_ACTIVITY,
> +    S390_FEAT_PAI,
>   };
>   
>   
> 

For the final patch

Reviewed-by: David Hildenbrand <david@redhat.com>

thanks!

-- 
Thanks,

David / dhildenb


