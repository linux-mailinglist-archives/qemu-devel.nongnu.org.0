Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C84CDDC5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:19:22 +0100 (CET)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEOX-0004pe-9s
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQENP-0003i1-Dm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:18:12 -0500
Received: from [2607:f8b0:4864:20::52c] (port=43664
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQENN-0008KC-N4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:18:10 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 27so8397206pgk.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PNqiX19TxWlFvIIiL30EdXuORy5qqf33js1MAcj7i+M=;
 b=nkvTnV4uqe9NeRDvWcltqxg3XeTnrqLAQNmDn17xcam3V3+OSkLdTrmgNSdRLfG1ql
 dEAWVgLLl8nuzYvaEe4N+ZmVZFzmFLIAWDGUjMPl2KfAMySpC3JR73j7Cpxx2aXd5YTK
 4Z79NUiFB40Zaf8c1TXS++rRc81UUrxOX2qIK4r+0VfRBxbGQBkSCRiqApGoFccyc+G8
 vAG5C11sjLFkDMsZZABuokvYgM9hfP76n2MRtXhDQXzhCi8rTpUYl4qrIhqvEUXpPNml
 vWh7xUloCpY9qHx/P1gDBa6NXN0am2JsDQz04apCeU5/W8AX0mK0obSVlK/uoyoHdKNp
 prJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PNqiX19TxWlFvIIiL30EdXuORy5qqf33js1MAcj7i+M=;
 b=0MDnK3ksm5rgDChndH+ffapuI01TL/Ea2hqPpJPq17tBufZAcubjosJ3IatQ0+y2Nn
 4a6a5mlokQ9y1zjZJE5HC5iOEtnAgC3gH2Skx4QgFXiZoImpisD/1h8nz3hcpeTuL7j0
 6w0pUlshSQ4TG+9lF0Jfr1j4Avgp2ZbbFnLtt4L2NteOpKBJnr4kDD8c++NtjLiRByDR
 GjpthMP3Gmv09OZrKog4MlrH6yJlBfMz1CFdX8Prr9l2C1QwQh2+rve2fyibDNbsSoKI
 aH2tupjj33kzKWAJ8zqccZfzQti0bGBkVTC54EgdYVrRS05OQAsJjyRHGOLCi9lBNesO
 rEsw==
X-Gm-Message-State: AOAM5313bYGucn6kv0inHR0+9asFCmrmoRAowAHcSETWwiB4r1Cs637P
 7fzP7w/nZ9hrQgRy3TwSkGguYQ==
X-Google-Smtp-Source: ABdhPJzgPDVrcY/YAOv7hyT3h/cQOpBQee8dXlt2RKfMFo+evAUbkCoSq7bYo2IKV5bq0R5kP2+xQg==
X-Received: by 2002:a63:d642:0:b0:378:a4c2:7b94 with SMTP id
 d2-20020a63d642000000b00378a4c27b94mr123808pgj.218.1646425088208; 
 Fri, 04 Mar 2022 12:18:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 om14-20020a17090b3a8e00b001beda339ea3sm5571878pjb.3.2022.03.04.12.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:18:07 -0800 (PST)
Message-ID: <d7fa1fd4-3946-4f06-0e49-523ab3ab8a86@linaro.org>
Date: Fri, 4 Mar 2022 10:18:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/9] util: Return valid allocation for
 qemu_try_memalign() with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304112126.2261039-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 01:21, Peter Maydell wrote:
> Currently qemu_try_memalign()'s behaviour if asked to allocate
> 0 bytes is rather variable:
>   * on Windows, we will assert
>   * on POSIX platforms, we get the underlying behaviour of
>     the posix_memalign() or equivalent function, which may be
>     either "return a valid non-NULL pointer" or "return NULL"
> 
> Explictly check for 0 byte allocations, so we get consistent
> behaviour across platforms.  We handle them by incrementing the size
> so that we return a valid non-NULL pointer that can later be passed
> to qemu_vfree().  This is permitted behaviour for the
> posix_memalign() API and is the most usual way that underlying
> malloc() etc implementations handle a zero-sized allocation request,
> because it won't trip up calling code that assumes NULL means an
> error.  (This includes our own qemu_memalign(), which will abort on
> NULL.)
> 
> This change is a preparation for sharing the qemu_try_memalign() code
> between Windows and POSIX.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   util/oslib-posix.c | 3 +++
>   util/oslib-win32.c | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

