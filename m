Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987072EF848
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:39:51 +0100 (CET)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxby-0002Mu-MG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxaX-0001mk-BP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:38:22 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxaU-00085F-5E
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:38:21 -0500
Received: by mail-io1-xd2a.google.com with SMTP id i18so10906100ioa.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u1bFn6zOXatJdW2roz8Jc/oo97j9yPSMsnKVWj3Uy8M=;
 b=ulLELMYLwCl9xWFMhLzPlwNANZc8d+IVF/7Hmb2/KGQrcxDnVQ0CE1nqvkt2JFQsXO
 BOE4mFustPX/zUeJG5N+9EgwLH99Mi4PtDbbIu6hlF4eLI7WDX0nBugo3HaTBVSiAxMK
 8Yq6nUyLYctVNBXPDXUQkVhblW5crYbi9LfGhB9EtVU5h543drIXy7B2AbguyAW/gAm7
 43yTKCcS1O1lEZFdWwT/lplpBtt8BoMsOzdDWQ2qEPyVn0sh1NzAl92Omfr95T1gtl4j
 NYls2MZTYlUQx7EnpE0cpXND5M2HryjwZy75FqilJ7KcgOVvtT2HB4zLNMciOuJxLt4N
 M20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u1bFn6zOXatJdW2roz8Jc/oo97j9yPSMsnKVWj3Uy8M=;
 b=XNSME0m6qcAgE3WEAkghflxQm8m7+QdAou+s02JWsT6lHDOpgY/TXSORoVu53+GaQm
 W8OZjdPxyzQKOgLK+qVVPQd+7gGOTRausKn36SS0lsNNfV+3expEQUao6PSr+AheGG2h
 lks7EXbdHg5adTvIGU80CNxDlLhytmh0D2Ob6/oMT37J/cwHMgmvbOWlgCdzKrLqxYPF
 hc3sk2FiLdbD+ZT+h/GnMMMTiwXe/q9bq7imn9IwU3GeuANE7pydVP+YzvfAR7BHkUnt
 sniSx6m9bCIH+suAJt3PmoLxd9li9o5+a9tNs56RUJRY3FJzcrgreVhup9os1qUyAiFi
 YH/Q==
X-Gm-Message-State: AOAM531l7/NKXi+uxUUvpOIKlf9YvF2lDwuCJrGYSSDqvI1XqDWMvrE2
 I/krsV9JQW9UGVXfjym2e/jqmw==
X-Google-Smtp-Source: ABdhPJwPumtrtj/iljTOrtFLkWgIR7OTajP/JOaXa9TDqk1gjjsg593hzUBYdutY5dplGdHuVz9xUA==
X-Received: by 2002:a6b:928b:: with SMTP id u133mr6516226iod.145.1610134697081; 
 Fri, 08 Jan 2021 11:38:17 -0800 (PST)
Received: from ?IPv6:2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c?
 ([2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c])
 by smtp.gmail.com with ESMTPSA id a18sm7942806ilt.52.2021.01.08.11.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 11:38:16 -0800 (PST)
Subject: Re: [PATCH v2 2/4] s390x/tcg: Fix RISBHG
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <20210108132049.8501-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d239f69-57aa-b213-578f-a5d8a219bf16@linaro.org>
Date: Fri, 8 Jan 2021 09:38:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108132049.8501-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 3:20 AM, David Hildenbrand wrote:
> RISBHG is broken and currently hinders clang-11 builds of upstream kernels
> from booting: the kernel crashes early, while decompressing the image.
> 
>   [...]
>    Kernel fault: interruption code 0005 ilc:2
>    Kernel random base: 0000000000000000
>    PSW : 0000200180000000 0000000000017a1e
>          R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
>    GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000fffffff0
>          0000000000000000 00000000fffffff4 000000000000000c 00000000fffffff0
>          00000000fffffffc 0000000000000000 00000000fffffff8 00000000008e25a8
>          0000000000000009 0000000000000002 0000000000000008 000000000000bce0
> 
> One example of a buggy instruction is:
> 
>     17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32
> 
> With %r14 = 0x9 and %r1 = 0x7 should result in %r1 = 0x900000007, however,
> results in %r1 = 0.
> 
> Let's interpret values of i3/i4 as documented in the PoP and make
> computation of "mask" only based on i3 and i4 and use "pmask" only at the
> very end to make sure wrapping is only applied to the high/low doubleword.
> 
> With this patch, I can successfully boot a v5.11-rc2 kernel built with
> clang-11, and gcc builds keep on working.
> 
> Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


