Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F075D665ECB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:08:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFchk-0001zJ-HP; Wed, 11 Jan 2023 10:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFcgy-0001hr-4L
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:07:14 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFcgu-0008LK-Sj
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:07:03 -0500
Received: by mail-qt1-x836.google.com with SMTP id e22so1475339qts.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cf/lJoArq8QrnipC49cD1Zh4f8VhsnbBmzMv7uBKIic=;
 b=JtRAqPgXWIQhTIJ/pvk9nHYyl7YD9joVmZx7bvBLPEfghgcyasYNpGEfImgnL21RZM
 Vu3LV7gd9NY3k30xaHijY9Vg0DQbiyxJAjEHqf+s9pWiPiikulqgKmoYH1kce92Aibcl
 yl84iRyD1nJ5jDH5UY/79s5T6x7lNYs8KHXW3whmtwFBVb/H40VKRmgOuiLWWrTmEvDT
 +z54+0Ji1v0WqejbtVy4wjc73ivZFxPlbsKPySg1aicbJ0299CFo8AfIW7zQLZMmpMmA
 nQNb4iI87PSSI3NUhU4g31bGpQaDIAEK7KD/iKiuiWN6x+ogimpzelpSABwID15eK1j6
 wpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cf/lJoArq8QrnipC49cD1Zh4f8VhsnbBmzMv7uBKIic=;
 b=WK9V+ccQfmb1jjtj2462ysciTnxByRebHiunBpMDUKY8c8ED4iB5s31NKH2s9Ekxea
 6Y5uHx3VX+t35KXc9/p8c/ZyxKftQ3M+Tt1sf6kpikEvbzMXiHGdSxjOjMYfZOb2Zypj
 UxGaSRDTQcd7JXpq6ZvYHEcShtVAn9HvTABMMyTz9gxhdHqXqPpTadTdHTMgsiBQVZHt
 p07Vrx+zmtgahav6vtwxQcmb/pKLWMJklDSlb8lHEN8wJH2nYXuZNO8WYM+5HWYn2Wdi
 V2VWNYdwgQbX3HHaZO/8A4XUsUnCdaB9XOmIFA7a8EptZQSnYgh0Nao1LJxtlWlZ6MZz
 +JhA==
X-Gm-Message-State: AFqh2kqj4Qbz10XmMnVdeEyo1J070EGg21uK8uquwX24TtXjLG80gt4w
 4FV3XIXaQ30Diz94ysUNHMBGqA==
X-Google-Smtp-Source: AMrXdXtsl7+BdVbfYQ/BdyMcVxwR67zbAtKaRlaPFHgzN6ZcSRGdIpIaDmwAMndXGaCkuYpOGow1PQ==
X-Received: by 2002:ac8:690c:0:b0:3ab:9974:3a06 with SMTP id
 bt12-20020ac8690c000000b003ab99743a06mr74358212qtb.38.1673449619237; 
 Wed, 11 Jan 2023 07:06:59 -0800 (PST)
Received: from ?IPV6:2607:fb90:8062:d32d:5ad4:bcd:2063:a06?
 ([2607:fb90:8062:d32d:5ad4:bcd:2063:a06])
 by smtp.gmail.com with ESMTPSA id
 m20-20020ac866d4000000b003a6a7a20575sm7661969qtp.73.2023.01.11.07.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:06:58 -0800 (PST)
Message-ID: <7ba0bf63-1b46-7f70-a0ff-6d62cc963d4f@linaro.org>
Date: Wed, 11 Jan 2023 07:06:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-4-richard.henderson@linaro.org>
 <87zgapl7az.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zgapl7az.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/11/23 01:59, Alex Bennée wrote:
>> @@ -3277,13 +3278,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>>           tcg_raise_tb_overflow(s);
>>       }
>>       s->current_frame_offset = off + size;
>> -
>> -    ts->mem_offset = off;
>>   #if defined(__sparc__)
>> -    ts->mem_offset += TCG_TARGET_STACK_BIAS;
>> +    off += TCG_TARGET_STACK_BIAS;
>>   #endif
>> -    ts->mem_base = s->frame_temp;
>> -    ts->mem_allocated = 1;
>> +
>> +    /* If the object was subdivided, assign memory to all the parts. */
>> +    if (ts->base_type != ts->type) {
>> +        int part_size = tcg_type_size(ts->type);
>> +        int part_count = size / part_size;
>> +
>> +        ts -= ts->temp_subindex;
> 
> Whats going on here? Are we jumping to a previous temp? What guarentees
> there is something at ts - ts->temp_subindex?

Yes.  Guaranteed by base_type != type.  See tcg_temp_new_internal -- it's the raison 
d'être of temp_subindex.


r~

