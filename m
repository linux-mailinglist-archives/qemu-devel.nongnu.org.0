Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC343448B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:11:25 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3sr-0007AF-39
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3hR-0001JV-PL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:59:38 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3hP-00027P-AC
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:59:36 -0400
Received: by mail-pl1-x629.google.com with SMTP id b14so5492109plg.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 21:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jfa5QRp+yJdbUoWZqv3OArZ/EOkpkDxzFe656f7fM3E=;
 b=DUAc7blD3J/iMJzuANVuiuubZafCEDFA2P0hJqyxd66bEbgWE6syOjzjprtmK38myT
 VXFywYPaOfZMmuwHv3UmOldYnSWyNdw/zV0tWJqhxQoloM2IrANCupPiA53SHeNahqM4
 RbEoSIT8r0g2ny8xv0oZwXPNW8pKy1jX8lBhqTyC8ah/guZzweAe63ErJ1Zv04MwpCF5
 53zNyeN75TrEu/RH/7m+vmYnbJqgX9fgtRvEPibRrixGJ2CUkZp7I3r3SI0D4RF225Vf
 2GAwZdu3vCXo+8pkDRzW5iUA34AQVMHDwkfSRYwzc+xWNTcIvKCE6uUh6H0dh3Nh2fr6
 1tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jfa5QRp+yJdbUoWZqv3OArZ/EOkpkDxzFe656f7fM3E=;
 b=d37FIdo+9XpFhf/syCGiqdKuOYm8BKZh6enGSrnabb4MG/5GUnYyZN/ivNZtXPqmNu
 teeIfW9sQCUuYxo3gF9OylMs3wRFLcwkU79a4A31ih19FcA5zK1h4IOH18pdDR2GM2Ef
 x6QY2jTx4woUmboFVRVXZTE71XeJUhjkYa6tXzYkDVTf4NHspkC3bEBiZw4jr3GYz7+C
 1pdu1AaRHsHSx7bvwvC4q5RWAgqTtx2wMMVKAJ4m4E1WwcGuDhptssTtHuEyibP0edGZ
 GcIGsR53N1t79VZSFJPQIxQ2WC0iFsoK2uWHIPl9e9yF4WMl+hQBo7o2O1r0CObJV2C9
 kxFw==
X-Gm-Message-State: AOAM531O0OGcq60BL2VNoqRgeIRdZxrFqkt17+Ylu+ljiDpRhl4cVH++
 NUMi7xozNRS5krLx63qyYs0LIw==
X-Google-Smtp-Source: ABdhPJzzmLxLNvvZCvqkVSpeu0e/32EQ8P17A2YMOrkvqaU+j548Affd6Qb3gS+n2h7feTDiNgFFRg==
X-Received: by 2002:a17:903:1110:b0:13f:d25c:eac5 with SMTP id
 n16-20020a170903111000b0013fd25ceac5mr7967819plh.5.1634705973519; 
 Tue, 19 Oct 2021 21:59:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l1sm810349pgt.39.2021.10.19.21.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 21:59:33 -0700 (PDT)
Subject: Re: [PATCH 10/31] target/loongarch: Add loongarch interrupt and
 exception handle
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-11-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e60cce0-6b0a-341c-b1e6-c0ba22d88671@linaro.org>
Date: Tue, 19 Oct 2021 21:59:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-11-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> This patch Add loongarch interrupt and exception handle.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c | 293 +++++++++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.h |   6 +-
>   2 files changed, 298 insertions(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 7fa3851251..3e3cf233db 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -45,7 +45,10 @@ static const char * const excp_names[EXCP_LAST + 1] = {
>       [EXCP_TLBPE] = "TLB priviledged error",
>       [EXCP_TLBNX] = "TLB execute-inhibit",
>       [EXCP_TLBNR] = "TLB read-inhibit",
> +    [EXCP_EXT_INTERRUPT] = "interrupt",
>       [EXCP_DBP] = "debug breakpoint",
> +    [EXCP_IBE] = "instruction bus error",
> +    [EXCP_DBE] = "data bus error",
>   };

More incomplete update from before.

> +/* Check if there is pending and not masked out interrupt */
> +static inline bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
> +{
> +    uint32_t pending;
> +    uint32_t status;
> +    bool r;
> +
> +    pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
> +    status  = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
> +
> +    r = (pending & status) != 0;
> +    return r;

Return the expression directly?

> +}
> +
> +static inline unsigned int get_vint_size(CPULoongArchState *env)
> +{
> +    unsigned int size = 0;
> +    uint64_t vs = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
> +
> +    switch (vs) {
> +    case 0:
> +        break;
> +    case 1:
> +        size = 2 * 4;   /* #Insts * inst_size */
> +        break;
> +    case 2:
> +        size = 4 * 4;
> +        break;
> +    case 3:
> +        size = 8 * 4;
> +        break;
> +    case 4:
> +        size = 16 * 4;
> +        break;
> +    case 5:
> +        size = 32 * 4;
> +        break;
> +    case 6:
> +        size = 64 * 4;
> +        break;
> +    case 7:
> +        size = 128 * 4;
> +        break;

This is a pretty simple expression to turn into a switch.

> +#define is_refill(cs, env) (((cs->exception_index == EXCP_TLBL) \
> +        || (cs->exception_index == EXCP_TLBS))  \
> +        && (env->error_code & EXCP_TLB_NOMATCH))

This should be a function, not a macro.
It's probably worth computing once, not multiple times within loongarch_cpu_do_interrupt.

> +    default:
> +        qemu_log("Error: exception(%d) '%s' has not been supported\n",
> +                 cs->exception_index, excp_names[cs->exception_index]);

../qemu/target/loongarch/cpu.c: In function ‘loongarch_cpu_do_interrupt’:
../qemu/target/loongarch/cpu.c:250:9: error: array subscript [0, 16] is outside array 
bounds of ‘const char * const[17]’ [-Werror=array-bounds]
   250 |         qemu_log("Error: exception(%d) '%s' has not been supported\n",
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   251 |                  cs->exception_index, excp_names[cs->exception_index]);
       |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../qemu/target/loongarch/cpu.c:36:27: note: while referencing ‘excp_names’
    36 | static const char * const excp_names[EXCP_LAST + 1] = {
       |                           ^~~~~~~~~~
cc1: all warnings being treated as errors

> @@ -223,6 +509,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>   #ifndef CONFIG_USER_ONLY
>       ls3a5k_mmu_init(env);
> +    env->exception_base = 0x1C000000;
>   #endif

What is exception_base if it's not EENTRY?  Too much copying from MIPS?


r~

