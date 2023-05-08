Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5646FB5F5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4jb-0000cx-GU; Mon, 08 May 2023 13:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4jT-0000TR-IL
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:33:10 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4jR-0005Rq-94
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:33:07 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-55a2cb9788dso70716867b3.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683567183; x=1686159183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PIVlBr3C0FTBG1Y67AdQfIKIXHJn8iUUEH1C1NI1Biw=;
 b=iXeIhScnNd73njMaKaZrvJT0Hee3pCaqAXPykPSJu/k5MCDC9WWao1WngK6GEpCnds
 SbiQ9lkBD+XLCDatOIZQGOtm+dPvkBzKV16wnTk8UAu0VKLrZ8cpdr9EG1FIUUxOMG4c
 OKJdXvCzevbGWWTGsln3KQ25DId47eNR/jeEgy+s8IXBIdEogrFxqBvbAHbS6m5tvt6j
 B9N959UnxrjepC1q9n5f6cjdtrcAABOZR+cAW/fwIHkMdM1krtsPwxc8van8AvHBdLkr
 zNrjZrLk1LHqc78W+RinPUAbV72vKq/y7bmP/4/ywjGJY7OpSi3LRw2IIioaWtCuuODT
 KX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567183; x=1686159183;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PIVlBr3C0FTBG1Y67AdQfIKIXHJn8iUUEH1C1NI1Biw=;
 b=Bbu4ucMx6QIKQm3PNiOYqyZzHh7uf7WDu8egXz3jg5tp17lK4aHnd/ORTNLKdC5+gr
 FyOeGwcOCeHHeOvun6wplLnjU0mZOr4CskyvW5QjP1So1dcITmXRlGyn9mbcJOO2F33C
 IBpTjw+Me+xlZYukuVmxYSOBCxlJKxXlLwETcB6qP6RVibRWyAe/mFgBd3eM4hN1zcpO
 MMvClKyHu19sSjO9W9eKz+wybDIDlQjeSZzEZ+n9JnqBiAYqBLL3oucr2tHDqfoBSkEB
 2NOgvT48+flU01AcjCOHFi/LwVQXYtDuB7CXC1+5xieZA0dDCr2zqn8f6lYmMp5g9jC9
 0wyw==
X-Gm-Message-State: AC+VfDyjOU3XV3J4pxTKMrhyNTzTZw3q/UPl9rWQOfrHsC/4zDWTz0PX
 hSfIZ10ejoDsj/8/5LjLbSsqrTKiTNTpwjgxeaq8nw==
X-Google-Smtp-Source: ACHHUZ7/1/G54rqJepZF7vUbp+1GPxkyulTgCeMfL/4WWCmmv9c7x/3sMrtorkCYQIy+/tpliRG1kA==
X-Received: by 2002:a81:84ce:0:b0:55a:3b80:c00d with SMTP id
 u197-20020a8184ce000000b0055a3b80c00dmr11214599ywf.25.1683567183278; 
 Mon, 08 May 2023 10:33:03 -0700 (PDT)
Received: from [192.168.110.227] ([172.58.139.115])
 by smtp.gmail.com with ESMTPSA id
 h188-20020a0dc5c5000000b00545c373f7c0sm2640978ywd.139.2023.05.08.10.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:33:02 -0700 (PDT)
Message-ID: <05e8478e-ebf9-c04d-3311-142cb6e11743@linaro.org>
Date: Mon, 8 May 2023 18:32:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-49-richard.henderson@linaro.org>
 <CAFEAcA8G_AAmPuNhX9k3AqAFStJ7mnMftoEH6N08abRz8i-ZSQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8G_AAmPuNhX9k3AqAFStJ7mnMftoEH6N08abRz8i-ZSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 14:18, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
>> index f0a4118bbb..60375804cd 100644
>> --- a/tcg/ppc/tcg-target.c.inc
>> +++ b/tcg/ppc/tcg-target.c.inc
>> @@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>>   {
>>       TCGLabelQemuLdst *ldst = NULL;
>>       MemOp opc = get_memop(oi);
>> -    unsigned a_bits = get_alignment_bits(opc);
>> +    MemOp a_bits, atom_a, atom_u;
>> +
>> +    /*
>> +     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
>> +     *
>> +     * Before 3.0, "An access that is not atomic is performed as a set of
>> +     * smaller disjoint atomic accesses. In general, the number and alignment
>> +     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
>> +     *
>> +     * As of 3.0, "the non-atomic access is performed as described in
>> +     * the corresponding list", which matches MO_ATOM_SUBALIGN.
>> +     */
>> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
>> +                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
>> +                                                  : MO_ATOM_IFALIGN,
>> +                                    false);
>>
> 
> Why doesn't this patch have changes to a HostAddress struct
> like all the other archs ?

Because the alignment as only required here, within prepare_host_addr.
The Power LQ instruction allows unaligned input, unlike x86 VMOVDQA.


r~


