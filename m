Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D532018B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:10:10 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEuX-00009C-FE
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEtT-0008AW-9n
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:09:03 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDEtR-0002TH-Tz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:09:03 -0500
Received: by mail-ej1-x631.google.com with SMTP id bl23so16636486ejb.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 15:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0+R3QelqYkfb2RGkXNPgIrGql30rgvy3ClXwOy9+rUM=;
 b=KQJ+/JsUk4vZmXPJwAayqVcrRpNeD4uxujRFPraczRrKHwhEoy3fUDk3+4/n8AKGQm
 YncBFsX6xYbQBS0SaVRdlvse7pgEeE6Cko+dto5eRgPOO/Vnvmb7mpgAzFsp+YLidX1e
 lhh9KH3bn4qDscblmjrXneI/i5HLqTklS4etdehnWHfOUQY871m/AqP4B8L+36JT2XBs
 p7UzrSicVWdBEpM0CigDxEMTnzxtm7eCIC9vX63XQawIH2uZaKdZwH3Mycf7CWmEgvO7
 us7Ye1kRSUktnDwb8QtnoIBD/HEHlfXfsXyqakgH4Qc1BTVBkIFhKri+xp55qHTeuZEW
 GQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0+R3QelqYkfb2RGkXNPgIrGql30rgvy3ClXwOy9+rUM=;
 b=WyfgekdGL69TiCo5MlzsgDPJezFtkifXcnZlt/cV3+VdE2bqN+5WqjQ7WWAe4zeMhS
 pix7xJHWVl+caFbFbMn3SkHmmkTKy/7RphWaVtf5dhmdmcKRqSK9kB/HZNjFlxJIZ6jA
 b+HcjxPLM0zISUnpuT3wwWMzrgbyT03ZzqxBgaamWA2GH0GiA5wKe3ndx1fJxxxudXDQ
 UJTisjxaVqCGldNJzQ2ep5T1NHjsCd/XVbrE+KXHDBInlg5BP8bs0GEwwsFbQh2MxNIm
 Iznc10IS3ow6jo5gBhKxEm+oHKAPlN24gNdSFX6oay8LIPYD28LK5AqeXNGlAyJgLXoA
 5KGA==
X-Gm-Message-State: AOAM531cI5yYPCxxQfTucTU0nGmFxs+G91fHsBw1P09XEAyVhyhAHI7V
 XDEgUkwZOJFT20E6dosnKvGi1KNoSaA=
X-Google-Smtp-Source: ABdhPJwoOQowty9lAB85QUVz2R2mdKO7QowHML+prgYg9rWV5IgwowP9jyT4FG/kZOIUZ4F3y7XJEA==
X-Received: by 2002:a17:907:7781:: with SMTP id
 ky1mr10523016ejc.255.1613776140198; 
 Fri, 19 Feb 2021 15:09:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u3sm5117890eje.63.2021.02.19.15.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:08:59 -0800 (PST)
Subject: Re: [PATCH] hw/intc/loongson_liointc: Fix per core ISR handling
To: Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
 <CAFEAcA9npBhN4mGT5wmPfjAX_qXObduRNW8ohPjy4dq9wO-2Rg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d0dd44ac-8312-60d8-32a6-1fdc80a4159e@amsat.org>
Date: Sat, 20 Feb 2021 00:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9npBhN4mGT5wmPfjAX_qXObduRNW8ohPjy4dq9wO-2Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 11:35 PM, Peter Maydell wrote:
> This patch has been reviewed and fixes a Coverity issue;
> Philippe, are you planning to take it through your MIPS tree?

Sorry felt through the crack, now applied to mips-next (I'll send
a pull request next week).

Thanks!

> 
> -- PMM
> 
> On Tue, 12 Jan 2021 at 01:28, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>
>> Per core ISR is a set of 32-bit registers spaced by 8 bytes.
>> This patch fixed calculation of it's size and also added check
>> of alignment at reading & writing.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/intc/loongson_liointc.c | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
>> index f823d484e0..cc11b544cb 100644
>> --- a/hw/intc/loongson_liointc.c
>> +++ b/hw/intc/loongson_liointc.c
>> @@ -41,7 +41,7 @@
>>  #define R_IEN_CLR               0x2c
>>  #define R_ISR_SIZE              0x8
>>  #define R_START                 0x40
>> -#define R_END                   0x64
>> +#define R_END                   (R_START + R_ISR_SIZE * NUM_CORES)
>>
>>  struct loongson_liointc {
>>      SysBusDevice parent_obj;
>> @@ -125,7 +125,12 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>>      }
>>
>>      if (addr >= R_START && addr < R_END) {
>> -        int core = (addr - R_START) / R_ISR_SIZE;
>> +        hwaddr offset = addr - R_START;
>> +        int core = offset / R_ISR_SIZE;
>> +
>> +        if (offset % R_ISR_SIZE) {
>> +            goto out;
>> +        }
>>          r = p->per_core_isr[core];
>>          goto out;
>>      }
>> @@ -169,7 +174,12 @@ liointc_write(void *opaque, hwaddr addr,
>>      }
>>
>>      if (addr >= R_START && addr < R_END) {
>> -        int core = (addr - R_START) / R_ISR_SIZE;
>> +        hwaddr offset = addr - R_START;
>> +        int core = offset / R_ISR_SIZE;
>> +
>> +        if (offset % R_ISR_SIZE) {
>> +            goto out;
>> +        }
>>          p->per_core_isr[core] = value;
>>          goto out;
>>      }
>> --
>> 2.30.0
>>
>>
> 

