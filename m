Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28DB4D21C1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:40:55 +0100 (CET)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfhW-0003ds-TI
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfeQ-0001lT-5i
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:37:42 -0500
Received: from [2607:f8b0:4864:20::52c] (port=45599
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfeO-0007JV-Ov
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:37:41 -0500
Received: by mail-pg1-x52c.google.com with SMTP id z4so17319301pgh.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pi23hacx9RMlBvtPk+WcRNckrT5azs+gvRanbODudaI=;
 b=MtmrOaTR+ei/UO78beF1KH5F64dVtxmIcBYXsnhHiO5F8Rw3L36aXLMOsDngpgV5tL
 iB1d0k43z82J/zKyMtg4J3UVTuEUfFm2Tw7WLPaITIGYVQEVIghCZNCycurZb+9xuYVu
 5akC3Jb4TCQjhWVf8h6uka+dEWSPiQreKNTPdkbdn9kEw/4MUiHtwNyuissBXQVYrGQ/
 IPoYxL8/eh7mlV3PPqxXc+c0grlTg57YuZZ+CV9bVaHFb38Cikts35UOXZpL3Pf/TjT0
 zT0Q1EipwDo6efqmpLjwXkT9UEgwyBU//l2b4uVl2UDXjR1Cr8Xpm4g+a3bOLjSrs5w5
 oJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pi23hacx9RMlBvtPk+WcRNckrT5azs+gvRanbODudaI=;
 b=I98HRSpqcvYm0/t+6R6qeVdtf9l5Ex5dp30i2koQ+6gxA/yHnkXcshd46i5dLvpzTj
 ehGeLwzPCNZmPRFfyOhNDbqIpmYfLOmMmyTby38CTJ2tDyuSUqixQtV0SHd46SMmRZwS
 HTbcH7r/8WTWb8YylY6cuqphKnFVLgik0tG6PlJsJMntjK0mpIIMW614YcuOvZvYf/zQ
 2ly1A0nh7FYY3Wpe0BVdlsIjjjJS85/mAFBkWPI4Q+XrSOAw7Ot57V9/Rt3FFs0g6OdZ
 MagKS4kldlx2Rd/tJ6JkJfV9DQH6A1+bp1ilmUdOjQziQXL+OfMk/Lqc2fwUzp2z1nD4
 Q7ZA==
X-Gm-Message-State: AOAM532qKKCv0B4fI7h+PsPQrXgw707xWLip34i9+JNonm6S8IeyyLQh
 04uRFBLdu67nx3xpS854I3kv+w==
X-Google-Smtp-Source: ABdhPJzoHiPuB9OCTEhBeHU2BdwT+nmd6g4LRRM/4Qv+Sryh6KRsB44UYIRURijsD+jKS7RNmb+jdQ==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id
 q16-20020a056a00089000b004f6686ea8a9mr19583478pfj.83.1646768258731; 
 Tue, 08 Mar 2022 11:37:38 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 y13-20020a056a00180d00b004f733bc57e5sm3260880pfa.192.2022.03.08.11.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:37:38 -0800 (PST)
Message-ID: <75fedf20-b5e7-44ad-9c21-232a3d3c55b8@linaro.org>
Date: Tue, 8 Mar 2022 09:37:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 15/33] target/nios2: Use hw/registerfields.h for
 CR_TLBMISC fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-16-richard.henderson@linaro.org>
 <CAFEAcA9nJchuHFyyQjfh+fbVBYs6keLz8hmDCKj0-F5zvMSV8A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9nJchuHFyyQjfh+fbVBYs6keLz8hmDCKj0-F5zvMSV8A@mail.gmail.com>
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 00:46, Peter Maydell wrote:
>> @@ -130,24 +128,25 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
>>   void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
>>   {
>>       Nios2CPU *cpu = env_archcpu(env);
>> +    uint32_t new_pid = FIELD_EX32(v, CR_TLBMISC, PID);
>> +    uint32_t old_pid = FIELD_EX32(env->mmu.tlbmisc_wr, CR_TLBMISC, PID);
>> +    uint32_t way = FIELD_EX32(v, CR_TLBMISC, WAY);
>>
>> -    trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
>> +    trace_nios2_mmu_write_tlbmisc(way,
>>                                     (v & CR_TLBMISC_RD) ? 'R' : '.',
>>                                     (v & CR_TLBMISC_WR) ? 'W' : '.',
>>                                     (v & CR_TLBMISC_DBL) ? '2' : '.',
>>                                     (v & CR_TLBMISC_BAD) ? 'B' : '.',
>>                                     (v & CR_TLBMISC_PERM) ? 'P' : '.',
>>                                     (v & CR_TLBMISC_D) ? 'D' : '.',
>> -                                  (v & CR_TLBMISC_PID_MASK) >> 4);
>> +                                  new_pid);
>>
>> -    if ((v & CR_TLBMISC_PID_MASK) !=
>> -        (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
>> -        mmu_flush_pid(env, (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >>
>> -                           CR_TLBMISC_PID_SHIFT);
>> +    if (new_pid != old_pid) {
>> +        mmu_flush_pid(env, old_pid);
>>       }
>> +
>>       /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
>>       if (v & CR_TLBMISC_RD) {
>> -        int way = (v >> CR_TLBMISC_WAY_SHIFT);
>>           int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
>>           Nios2TLBEntry *entry =
>>               &env->mmu.tlb[(way * cpu->tlb_num_ways) +
> 
> 
> Any reason for hoisting the declaration of 'way' up to the top of the
> function ?

For use in the tracepoint, rather than extracting it twice.


r~

