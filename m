Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A283F3E91
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 10:01:44 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHiQJ-0004Jl-3Y
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 04:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHiOf-0003XE-UA
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:00:01 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHiOe-0002qd-6w
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 04:00:01 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so10090026pjb.2
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BzLb69KE3sI/qoFBeyJQ0nZw96fiXAf1o+2CZS2ZIHY=;
 b=GslRPnb3H/QxF+waTz1lubnsGSyrMvE7ehziXrIPbisb+UQckeZ+YK9djkzaQFGV47
 SG9vBsxUW3L/H5NH9EWyIqHiEg5YTinvV0qNFpI6H2SPWoleuQ4NsBM4HQmjLNMOI05A
 mCIU+vnEx+4hOi8KIK7XRWuy+9rCOY8lbY7dXexasZ99PCQGzQZ6jfutfu66b4eciwFo
 ap1cMo41iFDYzl/zfKWny/QQcYMC5BHCSldVuUZGqgLpYKOY+BZiP/AuYBsgOTv3sMsC
 wbb5KzQpA+X+9pIEGrEtH2y7iG3qf1T0HWuXKqxOroUXPXvtyEde97jy+f3f0oPYythL
 sLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BzLb69KE3sI/qoFBeyJQ0nZw96fiXAf1o+2CZS2ZIHY=;
 b=jV5FpXyX5lzgeIEcNmMAhe7ZLOxR/7aetUI37lnph7rzJ6D3bkxOoBsG9/031wedCb
 FdIwsvxO6kH5m5Fmz3+ClP2ysHtMhCaKNrwLoszGtWtBCY03U5Y1b+j5HB4dfnY6HB7w
 4qzGgdvXHTl6j+czgghdFsHcuxVMCRcOxs5y6hcsi8SLGVSbkGN3Souy9iplZep30Rf+
 MY6odlT+/jkRV6JPLotDrxYLX+sIKYoSFyLiZwXVyawYkU0FqBoiYUtwhXZ6/74EydTX
 0sEa/creO8JJ9GaLyYCRqkEpw+tvkrtk08k6ChurlN/1Y7L4ny0FOuXL9tDzg00hws6D
 kzsQ==
X-Gm-Message-State: AOAM531kawFza05YE1jIMw//m46Q/ccuKBMmDCelfVPgFkfj6d/hKR5J
 Aeg+NZCS/oKpqNi9uv6CE94tOZ8b6RwQbA==
X-Google-Smtp-Source: ABdhPJwma2dOQX1H5OZf11vcPcERWKmOJOkDgiy2+IMLpXaGbEngO0gnGWhiixzOWpb24jnblhcvFw==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr13919779pjb.56.1629619198285; 
 Sun, 22 Aug 2021 00:59:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x1sm11858811pfn.64.2021.08.22.00.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 00:59:58 -0700 (PDT)
Subject: Re: [PATCH v3 63/66] tcg/tci: Support raising sigbus for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-64-richard.henderson@linaro.org>
 <CAFEAcA9Ze3zzQ_O1rRJKaP-681RDJf288uQJx83GEduHetAegQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <490decb4-1cb1-b1b4-8d4b-a72de60d51b7@linaro.org>
Date: Sun, 22 Aug 2021 00:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ze3zzQ_O1rRJKaP-681RDJf288uQJx83GEduHetAegQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 3:14 AM, Peter Maydell wrote:
>> @@ -296,7 +296,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>>       uintptr_t ra = (uintptr_t)tb_ptr;
>>
>>   #ifdef CONFIG_SOFTMMU
>> -    switch (mop) {
>> +    switch (mop & (MO_BSWAP | MO_SSIZE)) {
>>       case MO_UB:
>>           return helper_ret_ldub_mmu(env, taddr, oi, ra);
>>       case MO_SB:
>> @@ -326,10 +326,14 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>>       }
>>   #else
>>       void *haddr = g2h(env_cpu(env), taddr);
>> +    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
>>       uint64_t ret;
>>
>>       set_helper_retaddr(ra);
>> -    switch (mop) {
>> +    if (taddr & a_mask) {
>> +        helper_unaligned_ld(env, taddr);
>> +    }
>> +    switch (mop & (MO_BSWAP | MO_SSIZE)) {
>>       case MO_UB:
>>           ret = ldub_p(haddr);
>>           break;
>> @@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>>   static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
>>                           MemOpIdx oi, const void *tb_ptr)
>>   {
>> -    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
>> +    MemOp mop = get_memop(oi);
>>       uintptr_t ra = (uintptr_t)tb_ptr;
> 
> Don't you need this bit in tci_qemu_st() as well ?

Which bit isn't present in st as well?
There's missing hunks in your reply, but afaics they're the same.

r~

