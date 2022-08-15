Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189559309F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 16:23:38 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNb0D-0001cX-O1
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 10:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNaxg-0007aj-Jq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNaxc-0003jm-V7
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660573255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udLxd9smZ4pFU4Q7Gmq0di5aabvLdmt3Ei2gF/vLJYA=;
 b=SdSpxEI7imm3oeR+D9Zawobj7/n5KKYwIwdrmgCrvRJ/eIg5wQdKz/30cu7nNgXCdTdNfL
 va5oFpMi0QkQPi+hRX299N7C8CDt0pEfabMfwFtCpK+XnT+NUZ2sODfEb3EE0GC/D6K+mZ
 ofbJH8KJf/aoZ/r1Atcn8gGPakbFdek=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13--5mnH8xvPEW697BLgagxxg-1; Mon, 15 Aug 2022 10:20:54 -0400
X-MC-Unique: -5mnH8xvPEW697BLgagxxg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z16-20020a05600c0a1000b003a5c18a66f0so3693266wmp.6
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 07:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=udLxd9smZ4pFU4Q7Gmq0di5aabvLdmt3Ei2gF/vLJYA=;
 b=EkOz1St0r+yuQkB5pgFLGXWY3BqQg+OD4Az+KRM6v2dlhnKD9joigmji/twNGDr0Po
 g/D3iUAr87/+1pSfmfKNREEXsNQyo4C3+okLlZDre3ukeueT4tRKFnnRFtqo2VnvvQxe
 Wj8RU9xoDW9gnFnEJpH0xvm1f3taXNtXP64xoUUjyTF8vdxnbVB1WD7DKlt0s51uL6pF
 leOTLQtuVS+jdC+kBq8R3ku36FpPwbyXXAyXc34CtQ33k1yYbnv7r09FWPIiln1M7HNW
 bbwkFS8W3GvUsUNwy67CSzXqT1wXqX8uHzCsY92+pLujcMc5qzbl5vbGgfjb2xLCNtF8
 MRPA==
X-Gm-Message-State: ACgBeo0wU2g3ffgGbW91FsNAh3VZnme52blqZ7lNOOGEKIzGuhTeUNVg
 jKjKoFsT88EMpVeohocweJJV2EvmiM4Ttp41n5lSzsU6YcdVm9P7Bfupcyiy8b+Hn3LnRmlJVVa
 5iz3fbdi9W88WAFI=
X-Received: by 2002:a05:600c:4caa:b0:3a5:4a14:854a with SMTP id
 g42-20020a05600c4caa00b003a54a14854amr10543502wmp.107.1660573253286; 
 Mon, 15 Aug 2022 07:20:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5KIc/OKfQaE4h2BRcxaJpbEEkjzkcMKhzgIUSNp2NRpnxs/8lTSiv4whpWIeFUMIATpgWCAw==
X-Received: by 2002:a05:600c:4caa:b0:3a5:4a14:854a with SMTP id
 g42-20020a05600c4caa00b003a54a14854amr10543481wmp.107.1660573253079; 
 Mon, 15 Aug 2022 07:20:53 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 i1-20020a1c5401000000b003a32167b8d4sm9928143wmb.13.2022.08.15.07.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 07:20:52 -0700 (PDT)
Message-ID: <46ac960d-bc92-05e3-37af-7ce371e6cf00@redhat.com>
Date: Mon, 15 Aug 2022 16:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/20] disas/nanomips: Remove __cond methods from class
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-6-milica.lazarevic@syrmia.com>
 <45cd1f33-7d72-26ce-55ed-66901bfe3675@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <45cd1f33-7d72-26ce-55ed-66901bfe3675@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/08/2022 13.07, Philippe Mathieu-Daudé wrote:
> On 15/8/22 09:26, Milica Lazarevic wrote:
>> NMD class methods with the conditional_function type like
>> NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
>> class. They're now declared global static functions. Therefore, typedef
>> of the function pointer, conditional_function is defined outside of the
>> class.
>>
>> Now that conditional_function type functions are not part of the NMD
>> class we can't access them using the this pointer. Thus, the use of
>> the this pointer has been deleted.
>>
>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>> ---
>>   disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
>>   disas/nanomips.h   | 14 ++------------
>>   2 files changed, 23 insertions(+), 33 deletions(-)
>>
>> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
>> index 039c353d0b..9e720d0e8d 100644
>> --- a/disas/nanomips.cpp
>> +++ b/disas/nanomips.cpp
>> @@ -787,7 +787,7 @@ int NMD::Disassemble(const uint16 * data, std::string 
>> & dis,
>>               if ((op_code & table[i].mask) == table[i].value) {
>>                   /* possible match */
>>                   conditional_function cond = table[i].condition;
>> -                if ((cond == 0) || (this->*cond)(op_code)) {
>> +                if ((cond == 0) || (cond)(op_code)) {
> 
> QEMU C style is more like this:
> 
>                     if ((cond == NULL) || cond(op_code)) {
> 
>>                       try
>>                       {
>>                           if (table[i].type == pool) {
> 
>> diff --git a/disas/nanomips.h b/disas/nanomips.h
>> index a795ed44e8..0e6670adf5 100644
>> --- a/disas/nanomips.h
>> +++ b/disas/nanomips.h
>> @@ -31,6 +31,8 @@ typedef uint32_t uint32;
>>   typedef uint16_t uint16;
>>   typedef uint64_t img_address;
>> +typedef bool(*conditional_function)(uint64 instruction);
> 
> Please add a space before the returned type. I'd rather
> prefix functions extracted from the NMD class with `nmd_`:

But adding a prefix will also increase the size of the patches quite a bit 
(well, maybe not for this identifier here, but certainly for some other 
spots), so I think it's fair to keep it without prefix here, too. Just my 
0.02 €.

  Thomas


