Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EB5F17F6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 03:05:37 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeQwi-0001Ei-FF
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 21:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeQvJ-0008FS-1r
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 21:04:09 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeQvH-0003Qk-Dc
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 21:04:08 -0400
Received: by mail-qk1-x734.google.com with SMTP id d15so3832256qka.9
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bz7eVjrV74gCiz8P6gz2YkKN3TC7ZcytX8PLOjE4apg=;
 b=nyhDfqXczB/SG/Y5lm4RxyCXc89vRBv4dZ+jScXOz+c45M/ZDT/my8jZqHz2R1lE2Z
 UMD9AWN4tPTY4nYVGzi5GQukAztxgx1cZEOmbD+EZAhJ+/ZxCWFpV6HSdDuNWaJyQZlk
 sbwS3kB7HBO8ZRJOxBKQUDG1kkvhr8jcPHVNWVnasWPcrQCsZz3ZASiBrOoKJ169nQe3
 bwJyytm/+QDqhrTEj2WtDlTJVzldk7HN5l2kOxOA1sphGzSGA4iwp43MJsivL0Yk0Fgs
 4F93NPLHFhm8pWHjevzZqYcE3Pw7pTAWkYyWEvWSLLHUbqXDoLqD6XyFgYpzcEFi+oy3
 NmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bz7eVjrV74gCiz8P6gz2YkKN3TC7ZcytX8PLOjE4apg=;
 b=H1+vPCTqpsX5RgIATV1mndPDDAy/r9NvUHW8/cgP7YOL3y0lJTvBEAz7q8WRsvQ2W1
 ZiaoRVkivCSaWBl4mR6eAuFqzIPxy7uARfxx1eU4x/aXhCwHaa6Jjt7W5BCnCS6I/kI4
 rSnf1E+jthiq1X3s2wEffJGPfMzOM2AOKR7thyuNBmRTavX9eNin6IZGVDvDlaQVOiqj
 lGcs8fnyVTWxRauuDQIP89IzfdKj98e8xYk0gwt2B6UfSm67lomiL7hIo+8wwA3+8qQE
 JQAWZJczhpd0zY/PtFcDrWlWkMhCc535z21X8aBbm3n5so2v8hEhrlX6bUKltZbKGZpa
 sBwA==
X-Gm-Message-State: ACrzQf35ngVV0cuKtf9F5gzA5DkCheOpwHg//qTCI6GVVfsCV0wxp6yq
 vfu/jVCcthzW4CA+Bz4cVS3dhg==
X-Google-Smtp-Source: AMsMyM57H7NLCmvj33uzyUnu3UUHtFQWyMAHzMXhVd0Z9mkVPLzQwr8xsG43WcDsbqruXWjTFdpjZA==
X-Received: by 2002:a37:a17:0:b0:6cd:dbef:1e83 with SMTP id
 23-20020a370a17000000b006cddbef1e83mr8088077qkk.624.1664586244986; 
 Fri, 30 Sep 2022 18:04:04 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8093:866e:708f:f41c:9c24:8383?
 ([2605:ef80:8093:866e:708f:f41c:9c24:8383])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a0f0100b006bb8b5b79efsm4503381qkl.129.2022.09.30.18.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 18:04:04 -0700 (PDT)
Message-ID: <fba2a072-e50f-4321-d923-07500d969b33@linaro.org>
Date: Fri, 30 Sep 2022 18:04:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 19/23] target/i386: Use gen_jmp_rel for gen_jcc
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-20-richard.henderson@linaro.org>
 <CABgObfa3RE3o6cfUk-7qagubCcxUO7J3sFfp63O5z08-RQHBiQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfa3RE3o6cfUk-7qagubCcxUO7J3sFfp63O5z08-RQHBiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 06:09, Paolo Bonzini wrote:
> On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> -static inline void gen_jcc(DisasContext *s, int b,
>> -                           target_ulong val, target_ulong next_eip)
>> +static void gen_jcc(DisasContext *s, MemOp ot, int b, int diff)
>>   {
>> -    TCGLabel *l1, *l2;
>> +    TCGLabel *l1 = gen_new_label();
>>
>> -    if (s->jmp_opt) {
>> -        l1 = gen_new_label();
>> -        gen_jcc1(s, b, l1);
>> -
>> -        gen_goto_tb(s, 0, next_eip);
>> -
>> -        gen_set_label(l1);
>> -        gen_goto_tb(s, 1, val);
>> -    } else {
>> -        l1 = gen_new_label();
>> -        l2 = gen_new_label();
>> -        gen_jcc1(s, b, l1);
>> -
>> -        gen_jmp_im(s, next_eip);
>> -        tcg_gen_br(l2);
>> -
>> -        gen_set_label(l1);
>> -        gen_jmp_im(s, val);
>> -        gen_set_label(l2);
>> -        gen_eob(s);
>> -    }
>> +    gen_jcc1(s, b, l1);
>> +    gen_jmp_rel(s, ot, 0, 1);
>> +    gen_set_label(l1);
>> +    gen_jmp_rel(s, ot, diff, 0);
> 
> Might be worth a comment that jumps with 16-bit operand size truncate
> EIP even if the jump is not taken.

Hmm.  But is that correct?  That's not reflected by the pseudocode for Jcc.


r~

