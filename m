Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CD53B3D0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 08:47:14 +0200 (CEST)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwebx-0000Vj-8e
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 02:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nweXB-0007xP-6y
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 02:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nweX7-0001aX-JO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 02:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654152132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=574tRNdw1zELox2QErzmq+Cyhjp8DiaXiBMBY5U1rHA=;
 b=CLpXQDqAo0U21AcBgpCWUli3ImaaM0Ma6TLJ9afrTjk0k9E11VWTSPRXrx+gRk2XozRlUi
 cVjNW5aoPQHxp1Cp5qPq6Q6gDjEC/p9lcMFLgPkaJqSzqiqhkpIigRcQa97tcAfLsd2A2m
 HY1IRb3Ih+40QeitTD/Fly32Amwjylo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-U6_DJBOsO6moBug2Mh-aVg-1; Thu, 02 Jun 2022 02:42:09 -0400
X-MC-Unique: U6_DJBOsO6moBug2Mh-aVg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so4682522wmb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 23:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=574tRNdw1zELox2QErzmq+Cyhjp8DiaXiBMBY5U1rHA=;
 b=XTXqjXJTt719c7zswbLKd6RxVIOQgedqZ2O0Ax36nYipzQbwVhDu1+1r8IxxV92pcs
 rppdFLfoDc1RDM5RaOhAOr1HwCBHeOsP2xZP5N7+GNRtF0IyRFAbVnDOOXmgto9BiQwr
 zti832IRffhril0sfccro3R71eQMeadj4Ej0nz7ShdExibK1X9Kuk2ctMbqef1fgDmGv
 OxbyZjHdJP9oX2DENrT8mrrl96Ci5Du0Yw4lrdjHHTEU1UHs1yZt+8f8X98p3/cPAWy2
 OGLbqf9OHaydzy4xXSTu0z/HOwuq86zGxXRz9/Ho6CSNqkQ0PNCx/KqSfNotG/bDoy8Y
 Yvxw==
X-Gm-Message-State: AOAM533+6fbpAWLbtULoTCcmR9NHiISDsu0MnavrkUTo88lo33H/Vlf1
 RgER4A+LQQAmRZA2lYJdQBV//kYDDlxsutfY5zswBgdhRmRg3jIEbfgi1sQE9BbZwkDH1uu+wb2
 7/sWsSZ7Dv9gOb6A=
X-Received: by 2002:adf:e19a:0:b0:210:157c:7b3c with SMTP id
 az26-20020adfe19a000000b00210157c7b3cmr2239381wrb.121.1654152128621; 
 Wed, 01 Jun 2022 23:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn07USshTPhhBYbAYcVAPE60iA9pWXVsOGmMGWPV/GDTowBejby4qh3N1KMrfesjlCtDCFQg==
X-Received: by 2002:adf:e19a:0:b0:210:157c:7b3c with SMTP id
 az26-20020adfe19a000000b00210157c7b3cmr2239354wrb.121.1654152128311; 
 Wed, 01 Jun 2022 23:42:08 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-51.web.vodafone.de.
 [109.43.179.51]) by smtp.gmail.com with ESMTPSA id
 a5-20020adffac5000000b0021023877ac5sm3221050wrs.107.2022.06.01.23.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 23:42:07 -0700 (PDT)
Message-ID: <f36d00d1-be66-6dc8-d0aa-37319b1f8e57@redhat.com>
Date: Thu, 2 Jun 2022 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] tests/tcg/s390x: Test overflow conditions
Content-Language: en-US
To: Gautam Agrawal <gautamnagrawal@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com,
 richard.henderson@linaro.org
References: <20220531183524.40948-1-gautamnagrawal@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220531183524.40948-1-gautamnagrawal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 31/05/2022 20.35, Gautam Agrawal wrote:
> Add a test to check for overflow conditions in s390x.
> This patch is based on the following patches :
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
> 
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> ---
> Changes since v1:
> - Corrected the "long" data type to "long long"
> - Changed local variable name in overflow function to "res"
> 
>   tests/tcg/s390x/Makefile.target |  1 +
>   tests/tcg/s390x/overflow.c      | 58 +++++++++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
>   create mode 100644 tests/tcg/s390x/overflow.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 3124172736..7f86de85b9 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -16,6 +16,7 @@ TESTS+=shift
>   TESTS+=trap
>   TESTS+=signals-s390x
>   TESTS+=branch-relative-long
> +TESTS+=overflow
>   
>   VECTOR_TESTS=vxeh2_vs
>   VECTOR_TESTS+=vxeh2_vcvt
> diff --git a/tests/tcg/s390x/overflow.c b/tests/tcg/s390x/overflow.c
> new file mode 100644
> index 0000000000..1c59c2cb70
> --- /dev/null
> +++ b/tests/tcg/s390x/overflow.c
> @@ -0,0 +1,58 @@
> +#include <stdio.h>
> +
> +int overflow_add_32(int x, int y)
> +{
> +    int res;
> +    return __builtin_add_overflow(x, y, &res);
> +}
> +
> +int overflow_add_64(long long x, long long y)
> +{
> +    long long res;
> +    return __builtin_add_overflow(x, y, &res);
> +}
> +
> +int overflow_sub_32(int x, int y)
> +{
> +    int res;
> +    return __builtin_sub_overflow(x, y, &res);
> +}
> +
> +int overflow_sub_64(long long x, long long y)
> +{
> +    long long res;
> +    return __builtin_sub_overflow(x, y, &res);
> +}
> +
> +int a1_add = -2147483648;
> +int b1_add = -2147483648;
> +long long a2_add = -9223372036854775808ULL;
> +long long b2_add = -9223372036854775808ULL;
> +
> +int a1_sub;
> +int b1_sub = -2147483648;
> +long long a2_sub = 0L;
> +long long b2_sub = -9223372036854775808ULL;
> +
> +int main()
> +{
> +    int ret = 0;
> +
> +    if (!overflow_add_32(a1_add, b1_add)) {
> +        fprintf(stderr, "data overflow while adding 32 bits\n");
> +        ret = 1;
> +    }
> +    if (!overflow_add_64(a2_add, b2_add)) {
> +        fprintf(stderr, "data overflow while adding 64 bits\n");
> +        ret = 1;
> +    }
> +    if (!overflow_sub_32(a1_sub, b1_sub)) {
> +        fprintf(stderr, "data overflow while subtracting 32 bits\n");
> +        ret = 1;
> +    }
> +    if (!overflow_sub_64(a2_sub, b2_sub)) {
> +        fprintf(stderr, "data overflow while subtracting 64 bits\n");
> +        ret = 1;
> +    }
> +    return ret;
> +}

Thinking a little bit more about this, there is nothing specific to s390x in 
here, so I think we could even move this test to tests/tcg/multiarch/ so 
that other architectures benefit from this test as well...

Alex, would that be OK for you?

  Thomas


