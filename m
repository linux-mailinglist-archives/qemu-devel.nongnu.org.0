Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBABE2FBECC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:21:25 +0100 (CET)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vd6-0006HA-ON
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1v0t-00018U-7T
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:41:55 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1v0r-0001Vv-9t
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:41:54 -0500
Received: by mail-pg1-x536.google.com with SMTP id q7so13393611pgm.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=teoFIjHTxxemjEhw6yQFudejaRj5aytDCRbSfMh6bro=;
 b=YBNPM2mDKEPhp6+dBaXjGiIyS3nhsBSpE0cZlwoRu/WzmrOqcShFoNbN9iVKK7j9rY
 pWyyB9EoIWKOEQA2K2TOjgnnBB7r/zJ76q/RAdliL+zj5cSRnoZf8V1lH5EtmPNFmdJz
 yan2oprXGKPjNje7MEVo7OKYPn3PJjYj/Tqer2JWUDSPEn8+n0Bp0k4U/Jsskyue/+5S
 kMCTIMZAEBJzJRyrVGXxYylQEnqT/i16JkxMdwb3YTLxnVjpjxGY3tkpclGSbyis6WBk
 TtTxvm7U13MKalnkSClOl5UGOdl++jqJjc3d8dEAzVob4OfzPLoSQVXZpFABy569+T3M
 krvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=teoFIjHTxxemjEhw6yQFudejaRj5aytDCRbSfMh6bro=;
 b=t9i12QjusT0aNm1xN+rYmuE4tzcEtefnKpysWnsYNJk+oP9FFoQ0JoRxPONpHgH49d
 Jf7VDFYQtxYT080M8x3SrxJr9uaWYVChkNfsPYrys/hK79pWxDeZaOQqDMOYfo4YBMbA
 NEV7ZvzzEQwFn+v4CA0Mza721l+tKLRlXt9sSKfHMXI/t1lmZWTATN13sg3ySK3wByJP
 1sbxCMfKRTlyjvIqZ5AeqhIQzuA4QcX29VP1iVqtAHH/wujEXBsA8t2T0SG5KgFbLyxZ
 2lkcJBeJh8q4py/7RZbiQaapst23XixNjrr+OXLds8rEIfJObngZtyS28vdgD8kAN7/q
 22Cw==
X-Gm-Message-State: AOAM530zxrMc66OxaiXURos41V/DBQSKcy0/Yg+6S47VPzwVspzOqyOl
 mLq6QfEMYAZD+XLvfX1LdFuYeA==
X-Google-Smtp-Source: ABdhPJwPo7EnAX5RxZCBDh19WQY734oWk4H5pUYqxhJucFNoOzx4JmrmWqAZ4gdbRuIfc65eyZRy6g==
X-Received: by 2002:a62:4e43:0:b029:1a4:684c:87ea with SMTP id
 c64-20020a624e430000b02901a4684c87eamr5374554pfb.75.1611078111306; 
 Tue, 19 Jan 2021 09:41:51 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id l3sm4036008pjz.27.2021.01.19.09.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:41:50 -0800 (PST)
Subject: Re: [PATCH v3 10/21] linux-user: Fix guest_addr_valid vs reserved_va
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-11-richard.henderson@linaro.org>
 <CAFEAcA_O6FMNCLZ=rzEkehbrnwmyF3X_qgFYSNobi=EqKL5-WQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <390dffbb-84e6-ff01-2117-758d50871ecd@linaro.org>
Date: Tue, 19 Jan 2021 07:41:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_O6FMNCLZ=rzEkehbrnwmyF3X_qgFYSNobi=EqKL5-WQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 7:03 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 22:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
>> use -R <reserved_va> to restrict the memory address of the guest.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/exec/cpu_ldst.h | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
>> index 4e6ef3d542..e62f4fba00 100644
>> --- a/include/exec/cpu_ldst.h
>> +++ b/include/exec/cpu_ldst.h
>> @@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
>>  /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
>>  #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
>>
>> -#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
>> -#define guest_addr_valid(x) (1)
>> -#else
>> -#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
>> -#endif
>> +static inline bool guest_addr_valid(abi_ulong x)
>> +{
>> +    return x <= GUEST_ADDR_MAX;
>> +}
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Looking back at patch 9 -- if we always check against
> GUEST_ADDR_MAX here, should we also do that for h2g_valid(),
> or are the two uses different ?
> (The v2->v3 changes list for patch 9 suggests we may have
> had this discussion previously, but I forget the details...)

I had thought we should always check GUEST_ADDR_MAX.

If something is outside G_A_M, then it doesn't fit
into the reserved_va that either (1) the user requested
via the command-line or (2) for which the guest has
constraints (e.g. TARGET_VIRT_ADDR_SPACE_BITS for sh4
or mips, requiring 31-bit addresses).


r~

