Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4023DBFCE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:29:01 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z7s-0003Et-28
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z0e-0001yo-Ic
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:21:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z0c-0002Rd-Ie
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:21:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id j1so16848273pjv.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3w9RyQbLqyNnWIHeU7IeYXzqWdT3r7DenwCKfapmhRc=;
 b=RetsUmMzBT3zhU6Rt+GzPokUC3La6NJDzeDBxKVX2rOOlV1BAlIUrCugAjcXkRYjpo
 G3xi5OI6ZArn+lB1S3wq23eY+KRVFUVLdOLOK3t/3CDeRsMpTXXXKuidlqZ18H+HAbbF
 4avmokZ6ehCx2caiSFXjQ9x7tXMx5p28TsbvY+7kVzpb/Swsvip/bIcF+QtonHUnI7US
 9XeQs115h1iDf8/jG823YNxDe0LQgUNv2LWY2+BvHmd1lo2cu80MeeSFzFIQv/olMXVo
 QGTcQb032gW8w07YlskNPjdcG9NnH4ZlnYBr2Fb8RwX/SdxhfvtZncIE+Zx8FEFhVvjQ
 Erew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3w9RyQbLqyNnWIHeU7IeYXzqWdT3r7DenwCKfapmhRc=;
 b=ISFeosz0WSu1iecBcNT35fGmFDY8caL87MZrIQ7S9qqIl7x/b4+zi6dJIlw5rjZ2FF
 KR+32kqcNNrGJctVehMosxjtX3fV2IUs2M3Vl5SZ/6dC9BrJ8Rj7ZaWF2U0IlbQtZfCv
 IR2nzOFO2BtZJmdWKgg/uELbBksG6thR1hugtkDtQf08E4NnjrdFNlIRzHPdK8rWi6jP
 zN+ebU7rxkE9pUIAbKYnts+xuoQ235RzDwSusoipz7rvl5u7ggaGrds2LSyBxXsXPhVB
 eV2G5UU8aFOcv3jmKs07Yb2iiULBWCR8sePMZ+8q/w0yAA2eNrBg8ZjxZOWQ4HavZNDz
 bHjw==
X-Gm-Message-State: AOAM533YceGQk//GTz+CXDP4etfY2QvxR0uIOENqV8L6opi2Yv1bFwgW
 2vBe7xAEIQ287ivBmkPPCBXJnPB2BMif7g==
X-Google-Smtp-Source: ABdhPJwp4Ug9nmsjNqVnyCTjLk+frOhIiDerHYW7lyrXNM+vwp6bUgznNqM25i8JlqZfh33sDMx/Kg==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr4844085pjh.173.1627676489314; 
 Fri, 30 Jul 2021 13:21:29 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id lt14sm3304936pjb.2.2021.07.30.13.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:21:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 46/53] target/arm: Implement MVE fp vector
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-47-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0912ef0-2109-ca0c-7b72-3161dbad3699@linaro.org>
Date: Fri, 30 Jul 2021 10:21:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-47-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp vector comparisons VCMP and VPT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 18 +++++++++++
>   target/arm/mve.decode      | 39 +++++++++++++++++++----
>   target/arm/mve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 22 +++++++++++++
>   4 files changed, 137 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

