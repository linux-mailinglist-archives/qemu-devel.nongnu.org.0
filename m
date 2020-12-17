Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3162DCFF9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:02:26 +0100 (CET)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpr3B-0002pz-S2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kpr0Y-0001WE-FO
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:59:43 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:47028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kpr0W-0001yZ-Fq
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:59:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id j22so19240185eja.13
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qyBNIXEkyIKDze58swQQJ1Zuz0yTUj5odXqzVFo7vU0=;
 b=ilggpVh3xAo0SrzGbCmiXV24wKZixYkcbHwsIvaG+vZbHPaDeSoH4J7gLyAnmdwAyN
 kI2xZ6y11qd3+SGYrOIdk3VWg59I7CSWhp7YP6J42c8d/3RAn7D5SEVZg9rzuIaZpHSg
 lk0GyFGes8hPjsvSf/kf/jwkGns2YwgkxvaDVvtkBV4j+BmIYIQ7LZCqXw3zVdJrXnFe
 J2FuMVxi/jNf1jwScqhxtPYrW25YkwnL0a4//p/4zAKjM5Af5mAMX0OGY6OkCLCpataz
 yN3I+weYuOeaeCQPRPEnn1JJw/D+Fd7naCgdiIMpGQ9ZSWQEZF0BvAYEHxHsBYv8iMGj
 nYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qyBNIXEkyIKDze58swQQJ1Zuz0yTUj5odXqzVFo7vU0=;
 b=f+6H+szNoyH8xOdg76ZzLSycKNPlP+9nACXWwCCzd/NrZ2fqfkNvyuK7J2apdZjhZY
 q534edqE4MLQw3Iy3Mvpqsh/IfhdkvhLCbAeQzN0KADE5YRpG8XLHEcO3DXbdLqA66KW
 KDcFfyjwxy4xwbzceKESdf65fNQNBSfdV18I+m+HG/RaNWOvILuYU+NpcNEAgzwhgJra
 ki4wLHU2U6hciVghy8glso75VgjdJyFRuI1gxn9CvRcieeNF/uVfoWZBI3SFcN/V4WFp
 5Z6tR3HBX1/7Rpiz4xQ0MRaPSZznPviIlTUFfluXfMg7oAXwIvVmeirRDQ1JGQDvVlLy
 lJdA==
X-Gm-Message-State: AOAM533YDbAcA5hqnl5c9JW3yvEvxBbF5WEmN+NRDkQRVSY4hS5OwaUP
 5Rh8ukJHI4WAd7EWPA2haX8=
X-Google-Smtp-Source: ABdhPJzvuEJeY3jKoy2NXAByx+W/D9kfqnJdkS7QvKlf4qCrI0/kDRsHnYuUPm9Pr8APGULQY5TGHw==
X-Received: by 2002:a17:906:74d9:: with SMTP id
 z25mr16842961ejl.217.1608202778805; 
 Thu, 17 Dec 2020 02:59:38 -0800 (PST)
Received: from [192.168.1.103] ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id q2sm16810030edv.93.2020.12.17.02.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 02:59:38 -0800 (PST)
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
To: Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
 <a8162f75-e8a1-9ad5-9524-1217b0ba935b@vivier.eu>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Message-ID: <027fc57d-97dc-9cbf-1572-c65606586cb8@gmail.com>
Date: Thu, 17 Dec 2020 11:59:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a8162f75-e8a1-9ad5-9524-1217b0ba935b@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=thatlemon@gmail.com; helo=mail-ej1-x632.google.com
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
 Ben Hutchings <ben@decadent.org.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "philippe.mathieu.daude@gmail.com" <philippe.mathieu.daude@gmail.com>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 11:48, Laurent Vivier wrote:
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
> 
> Is this also fixing what "linux-user/elfload: Fix handling of pure BSS segments" [1] patch fixes?
> 

Yes, I guess I'm not the first one to hit this problem.

> Thanks,
> Laurent
> [1] https://patchew.org/QEMU/20201118165206.2826-1-steplong@quicinc.com/
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

