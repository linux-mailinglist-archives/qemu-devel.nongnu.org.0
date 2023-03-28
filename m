Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A26CC999
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:48:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDQ4-0008WN-Sc; Tue, 28 Mar 2023 13:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phDQ1-0008WA-UF
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:47:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phDPy-0001ne-UR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:47:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q206so7699991pgq.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680025653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ve56bHM/0g3UU7PynkTrD2IuyY4H8fS34AX95lk3vvE=;
 b=zabweljXUCA/Mr3t/akcdAT2QQuhL9o8+R4pdv3qBFHNrPsEanRkQYNJLN/7tMRKe7
 K6ggrl/ghLKek0C3OI48dIkcUo3k5xlUEbY7BrTr+9B5KbRQGtHtA+IxrMzwwKnpYeBB
 A77HDK2aaBFyN86kuKE+5gLzprKoqDEZlPwNUc+Hr3slf8770xT1d7UewAav+6Yo+Tgk
 3b3thYTNlYmw5k3xX2k8xthLTHyMD+ZUaSLfTqyF7K55zSVBJiOTT4q5ZSz//p1rGQxj
 zQcIXiD5l4SUS5R/hIAMEt0sYfzdnh258Zm2veU9t76mM9kS5fM2D6eNRhFoMEzuAzZO
 fABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680025653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ve56bHM/0g3UU7PynkTrD2IuyY4H8fS34AX95lk3vvE=;
 b=jtiyDaaJg42HNledgAJ/YJB1J0fiO8st+QDEiDK20D6fVy6tOnuRgifLWTqXby7nUs
 V42gtN642mO6oLwa2Ef0sm13x1HtJMHGS7vcyhL3hDrKdAQ6FCP1k9WEanQWzcSbrA99
 R+E+h4mJ5jdK6YQJ7AAdeTRKmTit4JNe2ZJZ42RgyTgTqpf6fSneQMVTUsDG/wWVXtGf
 Q149BYFpMRv8yfTWxThEPeP+64QliDCAmiddM2G5Fhl+YcCpt2NX2W9TY/3TZtdcv5+i
 jBqSALcRc7sNS4rvoejSqGOPtqyhSEzRkF8W/DUSYc2/LMjdNtJYdPJXY6uzbPEmvLdY
 mZGA==
X-Gm-Message-State: AAQBX9fzTWx+KPxsOKskw9YBQB2q2HA+6iSV1ugNvG93sRg/TWo6WApF
 hOMSbfRQ1FtitF4OZqtckBhgFTs1KVhSB6AVh/0=
X-Google-Smtp-Source: AKy350bHXW9Z0hOKPJxFk1H8Ti1u+XJjoKyeo51K+816UEAIMaThyEiFzCvVJGeVIB7awMQYxNEW3g==
X-Received: by 2002:aa7:8f15:0:b0:5a8:31a1:2f05 with SMTP id
 x21-20020aa78f15000000b005a831a12f05mr16058313pfr.5.1680025653253; 
 Tue, 28 Mar 2023 10:47:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a62aa0f000000b006259e883ee9sm18978086pff.189.2023.03.28.10.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:47:32 -0700 (PDT)
Message-ID: <81ceba14-5003-4215-8f61-54c57fbc3378@linaro.org>
Date: Tue, 28 Mar 2023 10:47:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 v2 10/12] linux-user: Pass last not end to
 probe_guest_base
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Laurent Vivier <laurent@vivier.eu>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
 <20230327211824.1785547-11-richard.henderson@linaro.org>
 <c6273091-da88-03b9-4137-8ad19f4cf9e3@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c6273091-da88-03b9-4137-8ad19f4cf9e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/28/23 06:51, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 27/3/23 23:18, Richard Henderson wrote:
>> Pass the address of the last byte of the image, rather than
>> the first address past the last byte.  This avoids overflow
>> when the last page of the address space is involved.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/elfload.c  | 24 ++++++++++++------------
>>   linux-user/flatload.c |  2 +-
>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index fa4cc41567..dfae967908 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -2504,7 +2504,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong 
>> guest_loaddr,
>>           if (guest_hiaddr > reserved_va) {
>>               error_report("%s: requires more than reserved virtual "
>>                            "address space (0x%" PRIx64 " > 0x%lx)",
>> -                         image_name, (uint64_t)guest_hiaddr, reserved_va);
>> +                         image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
>>               exit(EXIT_FAILURE);
>>           }
>>       } else {
>> @@ -2512,7 +2512,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong 
>> guest_loaddr,
>>           if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
>>               error_report("%s: requires more virtual address space "
>>                            "than the host can provide (0x%" PRIx64 ")",
>> -                         image_name, (uint64_t)guest_hiaddr - guest_base);
>> +                         image_name, (uint64_t)guest_hiaddr + 1 - guest_base);
>>               exit(EXIT_FAILURE);
>>           }
>>   #endif
>> @@ -2525,18 +2525,18 @@ static void pgb_have_guest_base(const char *image_name, 
>> abi_ulong guest_loaddr,
>>       if (reserved_va) {
>>           guest_loaddr = (guest_base >= mmap_min_addr ? 0
>>                           : mmap_min_addr - guest_base);
>> -        guest_hiaddr = reserved_va;
>> +        guest_hiaddr = reserved_va - 1;
>>       }
>>       /* Reserve the address space for the binary, or reserved_va. */
>>       test = g2h_untagged(guest_loaddr);
>> -    addr = mmap(test, guest_hiaddr - guest_loaddr, PROT_NONE, flags, -1, 0);
>> +    addr = mmap(test, guest_hiaddr - guest_loaddr + 1, PROT_NONE, flags, -1, 0);
>>       if (test != addr) {
>>           pgb_fail_in_use(image_name);
>>       }
>>       qemu_log_mask(CPU_LOG_PAGE,
>> -                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
>> -                  __func__, addr, guest_hiaddr - guest_loaddr);
>> +                  "%s: base @ %p for %" PRIu64 " bytes\n",
>> +                  __func__, addr, (uint64_t)guest_hiaddr - guest_loaddr + 1);
>>   }
>>   /**
>> @@ -2680,7 +2680,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>>       if (hiaddr != orig_hiaddr) {
>>           error_report("%s: requires virtual address space that the "
>>                        "host cannot provide (0x%" PRIx64 ")",
>> -                     image_name, (uint64_t)orig_hiaddr);
>> +                     image_name, (uint64_t)orig_hiaddr + 1);
>>           exit(EXIT_FAILURE);
>>       }
>> @@ -2694,7 +2694,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>>            * arithmetic wraps around.
>>            */
>>           if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
>> -            hiaddr = (uintptr_t) 4 << 30;
>> +            hiaddr = UINT32_MAX;
>>           } else {
>>               offset = -(HI_COMMPAGE & -align);
>>           }
>> @@ -2702,7 +2702,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>>           loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>>       }
>> -    addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
>> +    addr = pgb_find_hole(loaddr, hiaddr - loaddr + 1, align, offset);
>>       if (addr == -1) {
>>           /*
>>            * If HI_COMMPAGE, there *might* be a non-consecutive allocation
>> @@ -2755,7 +2755,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong 
>> guest_loaddr,
>>       if (guest_hiaddr > reserved_va) {
>>           error_report("%s: requires more than reserved virtual "
>>                        "address space (0x%" PRIx64 " > 0x%lx)",
>> -                     image_name, (uint64_t)guest_hiaddr, reserved_va);
>> +                     image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
>>           exit(EXIT_FAILURE);
>>       }
>> @@ -3021,7 +3021,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>>               if (a < loaddr) {
>>                   loaddr = a;
>>               }
>> -            a = eppnt->p_vaddr + eppnt->p_memsz;
>> +            a = eppnt->p_vaddr + eppnt->p_memsz - 1;
>>               if (a > hiaddr) {
>>                   hiaddr = a;
>>               }
>> @@ -3112,7 +3112,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>>        * In both cases, we will overwrite pages in this range with mappings
>>        * from the executable.
>>        */
>> -    load_addr = target_mmap(loaddr, hiaddr - loaddr, PROT_NONE,
>> +    load_addr = target_mmap(loaddr, (size_t)hiaddr - loaddr + 1, PROT_NONE,
>>                               MAP_PRIVATE | MAP_ANON | MAP_NORESERVE |
>>                               (ehdr->e_type == ET_EXEC ? MAP_FIXED : 0),
>>                               -1, 0);
>> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
>> index e99570ca18..5efec2630e 100644
>> --- a/linux-user/flatload.c
>> +++ b/linux-user/flatload.c
>> @@ -448,7 +448,7 @@ static int load_flat_file(struct linux_binprm * bprm,
>>        * Allocate the address space.
>>        */
>>       probe_guest_base(bprm->filename, 0,
>> -                     text_len + data_len + extra + indx_len);
>> +                     text_len + data_len + extra + indx_len - 1);
> 
> Per linux-user/user-internals.h:
> 
> /**
>   * probe_guest_base:
>   * @image_name: the executable being loaded
>   * @loaddr: the lowest fixed address in the executable
>   * @hiaddr: the highest fixed address in the executable
>   *
>   * Creates the initial guest address space in the host memory space.
>   *
>   * If @loaddr == 0, then no address in the executable is fixed,
>   * i.e. it is fully relocatable.  In that case @hiaddr is the size
>   * of the executable.
>   *
>   * This function will not return if a valid value for guest_base
>   * cannot be chosen.  On return, the executable loader can expect
>   *
>   *    target_mmap(loaddr, hiaddr - loaddr, ...)
>   *
>   * to succeed.
>   */
> 
> Since here @loaddr == 0, "@hiaddr is the size of the executable",
> not "the first address past the last byte".
> 
> So we can not "Pass the address of the last byte of the image"
> to this API. Maybe the API description is incorrect, in that
> case your patch is right. Otherwise we might need to tune
> probe_guest_base().

I'll update the documentation.


r~


