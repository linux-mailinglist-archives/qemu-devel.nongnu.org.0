Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCAA3B8338
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:34:58 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyaMj-0003mE-1H
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyaKa-0001XH-4b
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lyaKW-0002sr-1C
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625059958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOw32z3Ko6fnf22fKwlLDB/jsg2t5fuwx+xPEvP+kN8=;
 b=aBKB/aAT1DNwIPiJ+ruyvIk6BFCw2qg6fq9kbxiE1iJ7vq/r8oe9q0OViF7izvCP8lFSCN
 sW1eBjKIrXp8VomJI6TSKWSy3ZKJQDqRK5QjwESnUn9aYsuM+ma5PA+Wr3svnNDnGxzGEq
 0AhvD4jQOhJq11M1AUneClaRZfBxdFw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Tnma4aipNU2CuKViFhUasA-1; Wed, 30 Jun 2021 09:32:36 -0400
X-MC-Unique: Tnma4aipNU2CuKViFhUasA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t12-20020a7bc3cc0000b02901f290c9c44eso757994wmj.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 06:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NOw32z3Ko6fnf22fKwlLDB/jsg2t5fuwx+xPEvP+kN8=;
 b=Kxwu1HOIPR8JMoYjCGF7CU134tUUvYK0ga3FUh+5+luchuUO8m5WXc79J7au483Vy9
 vovQwG1kj2K0uOB9Gn+mb9Fgb0TR8r5a77cNGWgJPs40BI5JtEOFyvodqsX+t8Gr97K7
 JCNPZwtIvM7mx7Kku4KXsG7iHDSsU4ZKgPycg9+ywsP7N2iGWExFQ/Vc92Wb2ci9zAD0
 6R6hMc72cwXcPhT7Fwsil1mGhvYA1y/Jy87wRV8dH8/WQF/qYprlnOvZpQbMCu+0iewV
 gZOYAL+Vm8jRXq9iTVyZjtBj6UVwzMVCGpiwfbZpz8lEG1cahV8LOA0dwvpLQVZyEz5d
 RRWw==
X-Gm-Message-State: AOAM531bmPu6zNkmovSEdMhNOWRYK98J+nfCci8vVS1ghsxzhZRksM4G
 MyhCS2TdXisIZCuO4JqcOjPZd3zHUFinD7W3tMyKJDl/2HuKg/78vwfunVbYsYkl94EbSC1c4uJ
 TPnFQl4tNtS12smY=
X-Received: by 2002:adf:e906:: with SMTP id f6mr10275876wrm.30.1625059954902; 
 Wed, 30 Jun 2021 06:32:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjwb40AaHsajZxGEkwsIyGVLUK/IZGoAQGPZ6yY4YkdyqAc2pBwYHNcmnAWbw0y/HD3X1u8w==
X-Received: by 2002:adf:e906:: with SMTP id f6mr10275840wrm.30.1625059954630; 
 Wed, 30 Jun 2021 06:32:34 -0700 (PDT)
Received: from [192.168.3.132] (p4ff239b1.dip0.t-ipconnect.de. [79.242.57.177])
 by smtp.gmail.com with ESMTPSA id l9sm6218399wrp.14.2021.06.30.06.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 06:32:34 -0700 (PDT)
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
Date: Wed, 30 Jun 2021 15:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622201923.150205-2-borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22.06.21 22:19, Christian Borntraeger wrote:
> This defines 5 new facilities and the new 3931 and 3932 machines.
> As before the name is not yet known and we do use gen16a and gen16b.
> The new features are part of the full model.
> 
> The default model is still empty (same as z15) and will be added
> in a separate patch at a later point in time.
> 
> Also add the dependencies of new facilities and as a fix for z15 add
> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
> S390_VECTOR_PACKED_DECIMAL.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>   target/s390x/cpu_features_def.h.inc |  5 +++++
>   target/s390x/cpu_models.c           |  6 ++++++
>   target/s390x/gen-features.c         | 14 ++++++++++++++
>   3 files changed, 25 insertions(+)
> 
> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
> index 7db3449e0434..c71caee74411 100644
> --- a/target/s390x/cpu_features_def.h.inc
> +++ b/target/s390x/cpu_features_def.h.inc
> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
>   DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
>   DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>   DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")

Usually we use "eh" for enhancement. Which would result in "beareh" or 
alternatively "beh". But maybe the "enhancement" part is not actually an 
enhancement, but instead this facility is more like the etoken or unpack 
facility ...

> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility")

Would "pai" be a more appropriate feature name?


-- 
Thanks,

David / dhildenb


