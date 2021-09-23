Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB69417180
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:07:46 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjzV-0007EV-KI
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs2-0006fB-KN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:02 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs0-0002iG-S6
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:02 -0400
Received: by mail-qk1-x733.google.com with SMTP id t4so27496678qkb.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hPq0dTFKZ0unuFekgY5+qSBaW/LlfogL/EB8HRbEWwA=;
 b=XqvDE5gGpOBuLgyP0im7w+ewxziWaW54UJOZedo9LrXw+dG8qhg3wddYBVPm3daNFB
 nPAuxrpcK4B2JhAQamt5BdMV9Au9zIfGKkvHa2Wn2a8ELzX8Cu0aqzysSU21l4jgxIVL
 HtVRq2Tpe5AOlfWFk3k7R/dwiSW87wl73H7OTGTAynepYfCiRIlaz7w7JNX2vRcoOU6y
 3GbiQMY/KElrErHgWSk/LD/em+p46mgyTGLp5OcXR9A29Cc0du6xtd+SscAIyjbQ3hu/
 dZvuss2Awi5flKmm1HCH9/XwrIflC3yo5KdRgXtNnvlAl3d/2nAor8KZiHa4rCMomHTr
 e2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hPq0dTFKZ0unuFekgY5+qSBaW/LlfogL/EB8HRbEWwA=;
 b=PFwHQD0bfC+sPrFR/Yn7Rvrmk+HxZb/Mi5co4z8NYQh5izt42cfvCJbglbFDXfW9yy
 AH8E3mHGg/fFRcPfJDR4Gt/0QNez9CVLbFRtaL0GRrPbpdu9fwfCUXshrzIaHwxKmLZr
 RTmjsrW0WggRN19XMHmPrIpgK1qstTEWVR8sApORmTuQ/pnaLcAI6moJIqbUQOhrj6ZV
 bbMHQCOmewmzRPElNfOc7Du9hhEI6VSG596GTC/gha8OKD7cOMtQasraIzsXF08dIU9q
 LOWUAYZW7bjvOpkiHHEdvy42rBeN0jvZyxRHtVG0b8Q9tPzfud6VyXCzDYYDFMrZYySJ
 8i8w==
X-Gm-Message-State: AOAM532A90PZ2vp/gVOCXXKNlmN3kFHlicNXdzAMG03epSpmDrl8hIO5
 en0Evn+8TZCejN/OgQ62cyT1+w==
X-Google-Smtp-Source: ABdhPJwSMc/08yx/bRBxfAHglRbCQCqZEQKXc8SD3vvKiD0HTtRs2q8VcLlaJozTJNwIVqIFp8ieOw==
X-Received: by 2002:a05:620a:1983:: with SMTP id
 bm3mr9993946qkb.340.1632484800028; 
 Fri, 24 Sep 2021 05:00:00 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id l28sm6175923qkl.127.2021.09.24.04.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:59 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e66d76d0-a463-5a01-e508-bb592c9cce97@linaro.org>
Date: Thu, 23 Sep 2021 10:43:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kevans@freebsd.org, Guy Yur <guyyur@gmail.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
>           /* no page was there, so we allocate one */
>           void *p = mmap(host_start, qemu_host_page_size, prot,
> -                       flags | MAP_ANON, -1, 0);
> +                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);

I don't understand this change, given that the actual fd passed is always -1.


r~

