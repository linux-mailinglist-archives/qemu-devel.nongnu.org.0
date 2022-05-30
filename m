Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD815377D2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:55:58 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvc7x-0001pM-4j
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvc2V-0007zT-1j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvc2R-0006Tl-PY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653904214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvCKazyuj+a9pV4y20xO04FSRK4F1Z3Tn8PphXwW3bk=;
 b=f2gy2f4O6JgNgAyx/b5k6Ebqf/00q8Vek3INzuDJme7t/co4iU3qu9EgXBmVA/cQ74B4lt
 DCGLev1GV1Wt0F6aC0UK+CAX6D0eT4DmuKi0LWX9lOMvR/syhGgUQ/3se1c1aC2mtOGkxG
 FPdF27r3Z8Ie4rxBpClS1r3bGeilhyk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-5CldvgzROgSAhuS0_VrP3w-1; Mon, 30 May 2022 05:50:13 -0400
X-MC-Unique: 5CldvgzROgSAhuS0_VrP3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso9464650wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 02:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZvCKazyuj+a9pV4y20xO04FSRK4F1Z3Tn8PphXwW3bk=;
 b=4e6ivnOAqgG0XazmzuEqXyutGi+CxCIHjDaPJj0LyIl8U29xlYkSrHNkLcamQxVEbj
 4V8KPm4beldBPuafEK6jy68IcVoHXken2gvgoDIv4mhrdX8Z4Tg8lNKZUkQnKkBc28sC
 5LOUCVvWc38OgHk8x84wcLvO929kGSQArGgawIJ1vIRxQullZ4S2CRf56uQjLnZp03Yr
 uvhRTonKQZHyZW1ifQ65PM0SP+fRLt4yzoJ5YCuHVDNiy8tNRFpcPr5q7+VeGXcJTOqO
 0Mhsk3PnmiuaT4BolJB9NpN3YN+r0LAwovqEL1yzWMsG6PC30lw/+jnugr32IKDW+u8C
 SptA==
X-Gm-Message-State: AOAM530fHf06m0JJG451SxvHmdDHtY9scXr3g19Ioeyd9RF3RjpABSJz
 C/CfmOjl2gxwRPdIBjJcePQb3D3vWc+Vn9sR5SKH0hsRooyHXQoWRSBpKjMtmZg68EfG12dtBCm
 yeBWTNOwmCiFmcQQ=
X-Received: by 2002:a05:6000:16ca:b0:210:3d2:9bae with SMTP id
 h10-20020a05600016ca00b0021003d29baemr18980556wrf.311.1653904212235; 
 Mon, 30 May 2022 02:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyclu3JoTdAzeNdqr6p01D8U7MoAUhHLANH9G+bSLEykF1x8h9rInNa9DD/T/abPU8zy+TiyA==
X-Received: by 2002:a05:6000:16ca:b0:210:3d2:9bae with SMTP id
 h10-20020a05600016ca00b0021003d29baemr18980538wrf.311.1653904212017; 
 Mon, 30 May 2022 02:50:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 8-20020a1c0208000000b003942a244ed1sm9910119wmc.22.2022.05.30.02.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 02:50:11 -0700 (PDT)
Message-ID: <9337daf2-57bf-d2ee-6731-8f10251fbf17@redhat.com>
Date: Mon, 30 May 2022 11:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tests/tcg/s390x: Test overflow conditions
Content-Language: en-US
To: Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, thuth@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org
References: <20220527101104.26679-1-gautamnagrawal@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220527101104.26679-1-gautamnagrawal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 27.05.22 12:11, Gautam Agrawal wrote:
> Add a test to check for overflow conditions in s390x.
> This patch is based on the following patches :
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
>  
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> ---
>  tests/tcg/s390x/Makefile.target |  1 +
>  tests/tcg/s390x/overflow.c      | 58 +++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 tests/tcg/s390x/overflow.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 3124172736..7f86de85b9 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -16,6 +16,7 @@ TESTS+=shift
>  TESTS+=trap
>  TESTS+=signals-s390x
>  TESTS+=branch-relative-long
> +TESTS+=overflow
>  
>  VECTOR_TESTS=vxeh2_vs
>  VECTOR_TESTS+=vxeh2_vcvt
> diff --git a/tests/tcg/s390x/overflow.c b/tests/tcg/s390x/overflow.c
> new file mode 100644
> index 0000000000..ea8a410b1a
> --- /dev/null
> +++ b/tests/tcg/s390x/overflow.c
> @@ -0,0 +1,58 @@
> +#include <stdio.h>
> +
> +int overflow_add_32(int x, int y)
> +{
> +    int sum;
> +    return __builtin_add_overflow(x, y, &sum);
> +}
> +
> +int overflow_add_64(long long x, long long y)
> +{
> +    long sum;

Just wondering, why "long long" in input and "long" in output?

> +    return __builtin_add_overflow(x, y, &sum);
> +}
> +
> +int overflow_sub_32(int x, int y)
> +{
> +    int sum;
> +    return __builtin_sub_overflow(x, y, &sum);
> +}
> +
> +int overflow_sub_64(long long x, long long y)
> +{
> +    long sum;
> +    return __builtin_sub_overflow(x, y, &sum);

nit: I'd call all local variables "ret" or "res".


Apart from that LGTM.

-- 
Thanks,

David / dhildenb


