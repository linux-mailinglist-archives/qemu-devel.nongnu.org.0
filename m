Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157E64A1F3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4j9D-0001l5-GI; Mon, 12 Dec 2022 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4j91-0001gk-Oy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:46:59 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4j8z-0001Vj-1p
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:46:59 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso7293552oth.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mvVUqfY+vBiJ/I/vUi5mCtlvmhfRC7pFnMmc9bg4800=;
 b=cKSACtG1zg4qawIANbpBMuI1n8SIUf4+e2rliRkJgXBFcBV0Aw8n+hJ6GUvTW8tEEe
 egahl8TJ7k+YQoMDNiY9UeCAacVWb/wktKvpbe9qg9JajIMwE6Q5Xm6JMmC4F+X2bLyJ
 1eZPkF5qhVpHOSujEvA4HnzQdNo+nwx0OyeA1OSG/NvT9GU8t/JQHWg6wfzD+dqfN2+q
 8coFyt72jufRRdeSaEmkNfwe84kFRO+u6heXEES8zKvpD4JYC0b6aJTNI3NvtXNSVcTH
 5HmNZWnITYZyl51LjpAB7xKQFI5JnGBZ1GM1OC0VtPa+iETl3u+pt+Ebz1IdQUrwGyfX
 QioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mvVUqfY+vBiJ/I/vUi5mCtlvmhfRC7pFnMmc9bg4800=;
 b=Yt+gDqx+N4Yx7eQpiDrNxTej7et8hidvqxYg72GTiSNYESYUbKU2QxGlCwCHGwoSiz
 JTZp+rhQl4ENAa4EaVRpHJWGOOuvyqI8cN38IZkqWi/drXT8cwYb5ebNZp7oZvOnJk0h
 e7gc7Ty2CdNjY0K/grp2kZYRpg9QfJYhbfaGqq2rQo+hy+kGJeon7IaWXyFDC0TVGRT9
 9E2BaG2IsoqqJWGa+h9+UKGusnxLJTaLtAEBHFXBmsKkiUAqYQP4YrNGoEFV+ivqrWsF
 cGXB0s/hHvF583PUDB8neSPLpPwlhq/JYzHhnFMzYVXnYt1TzaDlbyMRtNieekfoa7qI
 UoPg==
X-Gm-Message-State: ANoB5pml4rIDwHqSnVaIxHn5PyEei3+2H9oWLWt6wOseWDCndE2qvcPR
 EQ8C2PJLjvqKdL/1G+E10Z8y1w==
X-Google-Smtp-Source: AA0mqf5aHKTwoD2PbP/NqzHR1mJPVqKjm0ZGxLdRBaIkaxVISlYU67+Hv/yDEZt6nDoG9m13MCkHMQ==
X-Received: by 2002:a05:6830:1297:b0:661:dfeb:a96e with SMTP id
 z23-20020a056830129700b00661dfeba96emr8630035otp.25.1670852810480; 
 Mon, 12 Dec 2022 05:46:50 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006706dc07b51sm4040199otf.4.2022.12.12.05.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:46:49 -0800 (PST)
Message-ID: <848525ae-83e2-1dbd-14c4-d9b0192c4089@linaro.org>
Date: Mon, 12 Dec 2022 07:46:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 01/11] hw/mips/bootloader: Handle buffers as
 opaque arrays
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-2-philmd@linaro.org>
 <dc1751e4-221d-dd00-f1cb-feab1dc8f9eb@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <dc1751e4-221d-dd00-f1cb-feab1dc8f9eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

On 12/11/22 14:52, Philippe Mathieu-Daudé wrote:
> On 11/12/22 21:45, Philippe Mathieu-Daudé wrote:
>> It is irrelevant to the API what the buffers to fill are made of.
>> In particular, some MIPS ISA have 16-bit wide instructions.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/mips/bootloader.c         | 55 +++++++++++++++++++++---------------
>>   hw/mips/malta.c              | 19 +++++++------
>>   include/hw/mips/bootloader.h | 10 +++----
>>   3 files changed, 48 insertions(+), 36 deletions(-)
> 
> 
>> diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
>> index fffb0b7da8..c32f6c2835 100644
>> --- a/include/hw/mips/bootloader.h
>> +++ b/include/hw/mips/bootloader.h
>> @@ -11,16 +11,16 @@
>>   #include "exec/cpu-defs.h"
>> -void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
>> -void bl_gen_jump_kernel(uint32_t **p,
>> +void bl_gen_jump_to(void **ptr, target_ulong jump_addr);
>> +void bl_gen_jump_kernel(void **ptr,
>>                           bool set_sp, target_ulong sp,
>>                           bool set_a0, target_ulong a0,
>>                           bool set_a1, target_ulong a1,
>>                           bool set_a2, target_ulong a2,
>>                           bool set_a3, target_ulong a3,
>>                           target_ulong kernel_addr);
>> -void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
>> -void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
>> -void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
>> +void bl_gen_write_ulong(void **ptr, target_ulong addr, target_ulong val);
>> +void bl_gen_write_u32(void **ptr, target_ulong addr, uint32_t val);
>> +void bl_gen_write_u64(void **ptr, target_ulong addr, uint64_t val);
> 
> And I forgot to squash this...:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> -- >8 --
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index edda87e23c..b6dd9fb200 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -323,7 +323,7 @@ static void boston_register_types(void)
>   }
>   type_init(boston_register_types)
> 
> -static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
> +static void gen_firmware(void *p, hwaddr kernel_entry, hwaddr fdt_addr)
>   {
>       uint64_t regaddr;
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 34befa5dd5..cfc8ca6ae4 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -179,7 +179,7 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
>       /* Second part of the bootloader */
>       p = (uint32_t *)(base + 0x040);
> 
> -    bl_gen_jump_kernel(&p,
> +    bl_gen_jump_kernel((void **)&p,
>                          true, ENVP_VADDR - 64,
>                          true, 2, true, ENVP_VADDR,
>                          true, ENVP_VADDR + 8,
> ---
> 


