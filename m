Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F52DF0BE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 18:48:19 +0100 (CET)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqgL3-0000SP-KD
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 12:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kqgJO-0008RU-Qo
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 12:46:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kqgJN-0004ZX-49
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 12:46:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r4so6566640wmh.5
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGSZS7zjwrMuzJsJG+d3G6gDlFATDkMR38tCSn7OqWY=;
 b=UWeGQh+KlMra7YzsYV3c/vHm8aigtpBDR8vXbAVxqz58bRp2e5U37hIuNmmPjNvZ9t
 qX7qt+PEl4K1XSMRm8DdN7m+BtwOSMWr5PYaaxBLkil5un3N4Grz/RgOi0EAtIgqOjq7
 rFHeHX26fiwUmkjWSlv3NDHTrZu6Mq3fhDa9lnkEQ7HW8hWznQ83sa7dXHeHE7+a+GQQ
 5bImnsx1iDA7fS1dikon+NM5JRJmlrFy/Z7GnSlGWaBN2Kvr8RuORdIxJOnQTcwZ36mV
 tlLXIv+KYiPd3kUO++XHZFmhIiOxVflvkObzr1hA26rTHmN8JPm8na0QAYmKFnkj3MmW
 PoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGSZS7zjwrMuzJsJG+d3G6gDlFATDkMR38tCSn7OqWY=;
 b=s5Mg3Wp1PN5E5ZaX6Ithh+Y0YJBkg3OP54KWyRVJSpnDtUVdOQvlYZDSi8X2L9RKmw
 TdCtFODjtwv4skVmYZr6+13FJQ6BbyjexXzZqkwOtroGI37PrbwBOnWbnP0gtZ9nb28z
 3LrEWq//OXGmtVYqEcxgcJfLAYcBsFQO3Ce11EP3ZExykAFFcvAa35Z6qyUUjnTH0NRH
 P5UShDUr+wHHQBAFvobwTzJILxmkEbDls88MlbK7cNkcmlhtNksBJKkyJ4rkTA1ityjd
 mDdR2BrJSNWixG5ODbwcomFrqdmX1PT2TH+Yfgi51mRuQIPpPUPNsc2C/1tyHiMB6s3e
 LiXQ==
X-Gm-Message-State: AOAM530aPNcKBxdocc6zUB0pVYebNGiY1/f4JxSgtiH/b3ctWJe5mk5k
 /gjejBQET3xCVSDfrY7k9JQ=
X-Google-Smtp-Source: ABdhPJySlSXzimgHNnq/z451pJcguQduvNkXWgfsHFCLGen70IcTJke8CwFoXt5htgYFzPx4Qddqug==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr9100067wmk.31.1608399991165; 
 Sat, 19 Dec 2020 09:46:31 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id o7sm18938420wrw.62.2020.12.19.09.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 09:46:30 -0800 (PST)
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
To: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
 <3695fc3b-e477-deb9-fdb3-270ead41e04c@vivier.eu>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Message-ID: <271b80d2-cdf9-4339-1c61-c0ca8c79d4b3@gmail.com>
Date: Sat, 19 Dec 2020 18:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3695fc3b-e477-deb9-fdb3-270ead41e04c@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/12/20 11:55, Laurent Vivier wrote:
> Le 17/12/2020 à 11:17, Giuseppe Musacchio a écrit :
>> Some ELF binaries encode the .bss section as an extension of the data
>> ones by setting the segment p_memsz > p_filesz. Some other binaries take
>> a different route and encode it as a stand-alone PT_LOAD segment with
>> p_filesz = 0 and p_memsz > 0.
>>
>> Both the encodings are actually correct per ELF specification but the
>> ELF loader had some troubles in handling the former: with the old logic
>> it was very likely to get Qemu to crash in zero_bss when trying to
>> access unmapped memory.
>>
>> zero_bss isn't meant to allocate whole zero-filled segments but to
>> "complete" a previously mapped segment with the needed zero bits.
>>
>> The fix is pretty simple, if the segment is completely zero-filled we
>> simply allocate one or more pages (according to p_memsz) and avoid
>> calling zero_bss altogether.
> 
> So, the current code manages the bss segment when the memory page has already
> been allocated for the data segment by zeroing it:
> 
> +----------------------------------+
>  PAGE                              |
>  ----------+------------+          |
>  DATA      |   BSS      |          |
> 
> So your patch fixes the case when there is no data segment and thus no page
> to complete:
> 
> +----------------------------------+
>  PAGE                              |
>  ----------+                       |
>  BSS       |                       |
> 
> 
> But could we have a case where the BSS starts in a page allocated for the
> data segment but needs more pages?
> 
> +----------------------------------+----------------------------------+
>  PAGE                              | PAGE                             |
>  ------------------------+----------------------------+               |
>  DATA                    | BSS                        |               |
> 
> In this case we should also allocate the page, and the previous case is only a
> special case (data segment = 0) of this one.
> 

If I correctly understand your example here this case should be already
handled by zero_bss: the first chunk of .bss is mapped as part of the
vaddr_len mapping and is zeroed by the memset, while the other chunk/page
is mapped in the `host_map_start < host_end` clause.

> so something like (approxymately):
> 
> if (eppnt->p_filesz != 0) {
>    target_mmap()
>    if (vaddr_ef < vaddr_mem) {
>        zero_bss(vaddr_ef, MIN(vaddr_mem, vaddr_ps + vaddr_len))
>    }
> }
> if (vaddr_ps + vaddr_len < vaddr_mem) {
>   target_mmap(vaddr_ps + vaddr_len, vaddr_ps + vaddr_len - vaddr_mem - 1,
>               elf_prot, MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> }
> 
> I think your fix is correct, but I'm wondering if we can have something more
> generic, if we can cover an other possible case.
> 
> If you think we don't need to introduce more complexity for a case that can't
> happen I will queue your patch as is.
> 
> Thanks,
> Laurent
> 
>> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
>> ---
>>  linux-user/elfload.c | 30 ++++++++++++++++++++----------
>>  1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 0b02a92602..a16c240e0f 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -2776,14 +2776,16 @@ static void load_elf_image(const char *image_name, int image_fd,
>>              vaddr = load_bias + eppnt->p_vaddr;
>>              vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
>>              vaddr_ps = TARGET_ELF_PAGESTART(vaddr);
>> -            vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
>> +
>> +            vaddr_ef = vaddr + eppnt->p_filesz;
>> +            vaddr_em = vaddr + eppnt->p_memsz;
>>  
>>              /*
>> -             * Some segments may be completely empty without any backing file
>> -             * segment, in that case just let zero_bss allocate an empty buffer
>> -             * for it.
>> +             * Some segments may be completely empty, with a non-zero p_memsz
>> +             * but no backing file segment.
>>               */
>>              if (eppnt->p_filesz != 0) {
>> +                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
>>                  error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
>>                                      MAP_PRIVATE | MAP_FIXED,
>>                                      image_fd, eppnt->p_offset - vaddr_po);
>> @@ -2791,14 +2793,22 @@ static void load_elf_image(const char *image_name, int image_fd,
>>                  if (error == -1) {
>>                      goto exit_mmap;
>>                  }
>> -            }
>>  
>> -            vaddr_ef = vaddr + eppnt->p_filesz;
>> -            vaddr_em = vaddr + eppnt->p_memsz;
>> +                /*
>> +                 * If the load segment requests extra zeros (e.g. bss), map it.
>> +                 */
>> +                if (eppnt->p_filesz < eppnt->p_memsz) {
>> +                    zero_bss(vaddr_ef, vaddr_em, elf_prot);
>> +                }
>> +            } else if (eppnt->p_memsz != 0) {
>> +                vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_memsz + vaddr_po);
>> +                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
>> +                                    MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS,
>> +                                    -1, 0);
>>  
>> -            /* If the load segment requests extra zeros (e.g. bss), map it.  */
>> -            if (vaddr_ef < vaddr_em) {
>> -                zero_bss(vaddr_ef, vaddr_em, elf_prot);
>> +                if (error == -1) {
>> +                    goto exit_mmap;
>> +                }
>>              }
>>  
>>              /* Find the full program boundaries.  */
>>
> 

