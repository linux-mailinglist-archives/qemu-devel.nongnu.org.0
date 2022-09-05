Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF55AD8F5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:17:31 +0200 (CEST)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGf3-0007MI-R8
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGcL-0004jH-R0
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:14:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGcH-0000gL-Ov
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:14:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c11so8069392wrp.11
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ppwiu0C7rj5YMdHlmuoF0vx1Z+E1HyK/dvxKmCDMBYE=;
 b=MLhvU1C9hK7eqhovUL6qc4vuGDPixTKuPw4IEm9suQ992CS4yfDB8f4zjBOEyiVkwQ
 zgktxxtrnVFGXKJ1hUNHtvCF2rDdi1+jjA2RiWRsA1kPME0lUzc0AvMavkGHIuJqSfd2
 f0wTyifA5Rs4OK1t3+jKGYeZrfxsm1geBik4QiiGyLqnqT7G8SiKZ6Zvg4XNxa1whyrZ
 UBVsNUOTitiSp583k2trtqNSpCzdNxndiEjAACyJe4kBpbImUC6mEZxkU8xlpu9SYkWq
 iCwGxwHJTfIPAC4lKYXsMuGcz5YPLy+D5fJ9JU2fj8AmoQlVRfyj0qm58JVnSCAIOp5K
 CN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ppwiu0C7rj5YMdHlmuoF0vx1Z+E1HyK/dvxKmCDMBYE=;
 b=sbarjbS7VVy4l3OkruTU//9IBau2Pc48RjCE5p72ZcBJN/f/Wv7bH708i3Hh/EAt7d
 jOJJqNhgZtSSEp23HKf6jhBakLdPAiTgQYJ8dUFNuJzleizwipOO5MZmMnw8SxuZ5rFC
 3G0HD694sFe080pqcnG1ERxZO15OYZifgRHr6RmJznR10er8cVOtGIqIk1I7XFBu+vGq
 775KQ1Yo51rXqO72Le1qrSULcXy1qtmJnCK9l7PnFGI4e4qPuD8Z8Z1/1B0frKMZhhsj
 UI7Yfo5Pkcn+7QZwdU774wzf/MxeSx9NCmpC/a6nCyMpEK978hZ68cKXwHWluLbRRlOp
 hkGg==
X-Gm-Message-State: ACgBeo2ebCuGzNWrJ6QhXVICevfGN5N+I1HRDxenuoujctmuOlaCoknt
 ve1b4xPGRAx/ALV46qL3PFZmTw==
X-Google-Smtp-Source: AA6agR5XpRFg5PnA3HvXijRy66IczTZB6Jzo8yk8Ez0l8MEvGmCGWm3dfNyQEzEuCAlAz+bgLax/EQ==
X-Received: by 2002:a5d:6c6f:0:b0:226:f30d:95ba with SMTP id
 r15-20020a5d6c6f000000b00226f30d95bamr13449150wrz.170.1662401675954; 
 Mon, 05 Sep 2022 11:14:35 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002254880c049sm9565682wrs.31.2022.09.05.11.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:14:35 -0700 (PDT)
Message-ID: <ccf44208-d67c-f14d-dac3-f7a910309877@linaro.org>
Date: Mon, 5 Sep 2022 19:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PING PATCH v2] linux-user: Passthrough MADV_DONTNEED for certain
 file mappings
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220725125043.43048-1-iii@linux.ibm.com>
 <af00707e90837bfbdf7febae1d3327307948dcd7.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <af00707e90837bfbdf7febae1d3327307948dcd7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/1/22 09:45, Ilya Leoshkevich wrote:
>> +/*
>> + * For linux-user, indicates that the page is mapped with the same
>> semantics
>> + * in both guest and host.
>> + */
>> +#define PAGE_PASSTHROUGH 0x0800

I would expect a change to PAGE_STICKY in accel/tcg/translate-all.c, so that this bit is 
preserved across mprotect.  Yes?

>> @@ -845,7 +861,7 @@ static bool
>> can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
>>       }
>>   
>>       for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
>> -        if (!(page_get_flags(addr) & PAGE_ANON)) {
>> +        if (!(page_get_flags(addr) & (PAGE_ANON |
>> PAGE_PASSTHROUGH))) {

Do you want both PAGE_ANON and PAGE_PASSTHROUGH?
If not, is PAGE_PASSTHOUGH is sufficient by itself, why check PAGE_ANON?

> I would like to ping this patch and two others that I used for
> debugging it:
> 
> [PATCH] linux-user: Fix stracing in-memory mmap arguments
> https://patchew.org/QEMU/20220630165901.2459135-1-iii@linux.ibm.com/

Queued to linux-user-next.

> [PATCH] linux-user: Implement stracing madvise()
> https://patchew.org/QEMU/20220725134440.172892-1-iii@linux.ibm.com/

There are many more MADV_* than just the 5 you list.


r~

