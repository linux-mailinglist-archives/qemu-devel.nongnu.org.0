Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BE5876FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:11:23 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIl7j-000412-3B
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIl3s-0001Lq-7C
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:07:27 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIl3o-00038Z-L3
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:07:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t2so12530371ply.2
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 23:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=xUdfo57afokyhzW7L9nt+AZVjtWo7syTfBHlkWRVqx8=;
 b=Wq3AzKf8ziPovyIhYpfpeUAM+Hrrl29+h7NlBO+yCZsU+NOz347+i+SjRfCMCbjeNj
 0PQjXlfsKNMPVG5aQK8WLxCC4lwCTO52UahC5gkfkJfYiRPt/kElPp62L3GEaicDoRuJ
 ZEObrtkEc/HADNtMZOTkimywg4bszSdHBFP720svLOhk9YvQs5gIFPjgk0DKi+yTnieC
 Xa70m4glnEH0p5ou+VR/S2VX6YK47o10CMRhBFsuWqKCkcgKQYCjY+md+h8fB9U059w/
 cl9ToPcHsxgtOOEM3NclYECkaxT09gQDISmIPfwY4QdNOOqUVsgge44xMd8amhzySX8x
 a8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=xUdfo57afokyhzW7L9nt+AZVjtWo7syTfBHlkWRVqx8=;
 b=hKc/0QguC8w/KhMrvb9CBFl0/NE+NoUBN5nSMN4SdE3LrAgasJq8CmG3Tea+9PmrBa
 Zkrlkxrgr8pnEB7VaBD/xPvwuqfBllzFeCfEQabMFTgQ2dePcqRR5RMGIDWoLio3NcZQ
 KEX5fF2sw7gzKxmV8elK6ptj5NH26lPCb1e651RtZqRsgNKZ+z+qaXrBzv54eODOaJtX
 6yfHJECBipdunAIufeHsiwaT/LWEIli/4YOcDZwbX8RCgyvgS3dVH6dTJIhhGnQq6lfx
 ZqVNOhFdnntw44jYORB7e8lICJyBTJXTOVeGAFIxMfkptYcKGv15MKbwXpYYSDCl3zbB
 0fVg==
X-Gm-Message-State: ACgBeo0d64gyH1RtgMqNiDiTtoVTjGxKh2dF9tAph7B2jdb04csCXSxm
 bdxrjZgaLtpStkb4+OWO3eo=
X-Google-Smtp-Source: AA6agR5I8BlJTi6cObUT0jKaPCfF8l2vGlN6IMLkIETamyB03sNxwpV0Lx2wMzi/Kr/+7EM52CYNHg==
X-Received: by 2002:a17:90a:1b8e:b0:1f3:7c7:9c3 with SMTP id
 w14-20020a17090a1b8e00b001f307c709c3mr23149549pjc.8.1659420438807; 
 Mon, 01 Aug 2022 23:07:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902f60e00b0016c4331e61csm10674181plg.137.2022.08.01.23.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:07:18 -0700 (PDT)
Message-ID: <b2a281e8-8597-daab-2bfc-b8ffedf3c49c@amsat.org>
Date: Tue, 2 Aug 2022 08:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, laurent@vivier.eu
Cc: qemu-devel@nongnu.org
References: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
 <20220801200928.73741-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20220801200928.73741-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/8/22 22:09, Jiaxun Yang wrote:
> AT_BASE_PLATFORM is a elf auxiliary vector pointing to a string
> to pass some architecture information.

We can be more specific.

"See getauxval(3) man-page."

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   linux-user/elfload.c | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index ce902dbd56..e7666c5c60 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1718,6 +1718,10 @@ static inline void init_thread(struct target_pt_regs *regs,
>   
>   #endif /* TARGET_HEXAGON */
>   
> +#ifndef ELF_BASE_PLATFORM
> +#define ELF_BASE_PLATFORM (NULL)
> +#endif
> +
>   #ifndef ELF_PLATFORM
>   #define ELF_PLATFORM (NULL)
>   #endif
> @@ -2148,8 +2152,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       int i;
>       abi_ulong u_rand_bytes;
>       uint8_t k_rand_bytes[16];
> -    abi_ulong u_platform;
> -    const char *k_platform;
> +    abi_ulong u_platform, u_base_platform;
> +    const char *k_platform, *k_base_platform;
>       const int n = sizeof(elf_addr_t);
>   
>       sp = p;
> @@ -2171,6 +2175,22 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>           }
>       }
>   
> +    u_base_platform = 0;
> +    k_base_platform = ELF_BASE_PLATFORM;
> +    if (k_base_platform) {
> +        size_t len = strlen(k_base_platform) + 1;
> +        if (STACK_GROWS_DOWN) {
> +            sp -= (len + n - 1) & ~(n - 1);
> +            u_base_platform = sp;
> +            /* FIXME - check return value of memcpy_to_target() for failure */
> +            memcpy_to_target(sp, k_base_platform, len);
> +        } else {
> +            memcpy_to_target(sp, k_base_platform, len);
> +            u_base_platform = sp;
> +            sp += len + 1;
> +        }
> +    }
> +
>       u_platform = 0;
>       k_platform = ELF_PLATFORM;
>       if (k_platform) {
> @@ -2212,6 +2232,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       }
>   
>       size = (DLINFO_ITEMS + 1) * 2;
> +    if (k_base_platform)
> +        size += 2;
>       if (k_platform)
>           size += 2;
>   #ifdef DLINFO_ARCH_ITEMS
> @@ -2289,6 +2311,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
>   #endif
>   
> +    if (u_base_platform) {
> +        NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
> +    }
>       if (u_platform) {
>           NEW_AUX_ENT(AT_PLATFORM, u_platform);
>       }


