Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8A3320A82
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:19:54 +0100 (CET)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDoeP-0003yZ-Ne
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDoay-0002Ty-84
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:16:20 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDoaw-0002fO-Nv
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:16:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h98so11364903wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OVf7pK3AuaEc2+KIPWXw5z9KUGR1gQC0jTPbpm8i+DI=;
 b=Sa3yytDdoMMKEIb4JHyTint4KA0/XdA7AhchLS/q2sPxP6sPIOPY+2HTG3X91CqO+p
 KLGnJZVJVDbZFuv38lAk1pVJDyFDNvskSLhe+NyesJ4lsd9I4KYC0b2A6RkUgIEn/A74
 5+Al6NwyLMck2J95n+eyFLLkYK3dqxx47/cKOjr/3BEehciBetu2Q8FarwEYk6JoWML+
 5ndrXk8kKQ4m2UNXTrYTckbuLBpRwWld3yQE/tyQftI2H+2NpMorncXL2bryIQqdyIF5
 EWkR9ZC/N96HsqdhzcR6QymwMrpzGEyI7/3UN+vDSBSQMLuRUXLBCAU/X3yDwe4zQh0y
 /JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OVf7pK3AuaEc2+KIPWXw5z9KUGR1gQC0jTPbpm8i+DI=;
 b=tYNI9SvwsCPkA5RuZZpmCZpHkUYfLEBWWnM1ZegYF+u4Hd0TDIYwyP73ayRCmtjwad
 DmetAMq6ONxsLKNPoRfZ3IjD6/SNDhqYC89U2N0s3fr8ueg4sh1S78Aa24YcmV3yFtdT
 3SjkFma5SWGDXQEtczZJWaiDEIqUYvAydcvBScvoQkl0wZk0c1y0vf79YudMpn2wo24q
 vLtH3VtmYxquo3+jJQfnhY2273HPiyNNMG1A4JgBzx9eEQpbu45pJtqGEZO8PGLCnnIQ
 dzNuJpM4dQ5yyA7G7CvpGU/Xugnlh2IptBY8URCYClutLr5r4wBup/Fqn3d7d72sZsjs
 qNSQ==
X-Gm-Message-State: AOAM532OUd021b0/xbk2zOKqpx8/M8ekncc0mdwpi4UcC5CzDtXywrZX
 kMwzmcJ3Amyr2fNXl4cxv0U=
X-Google-Smtp-Source: ABdhPJz3OuaaRx0/ZFne+2B+axR2JaqogIor4W34iSfmZXsOQRNhDQwLAA5eD6t51hrErinrNgWLBA==
X-Received: by 2002:a5d:4a88:: with SMTP id o8mr14610442wrq.155.1613913376911; 
 Sun, 21 Feb 2021 05:16:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t16sm6338042wrq.53.2021.02.21.05.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:16:16 -0800 (PST)
Subject: Re: [PATCH v3 1/4] hw/mips: Add a bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
 <20210127065424.114125-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c00b9fa-71cc-932f-c152-ab8796e58160@amsat.org>
Date: Sun, 21 Feb 2021 14:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:54 AM, Jiaxun Yang wrote:
> Add a bootloader helper to generate simple bootloaders for kernel.
> It can help us reduce inline hex hack and also keep MIPS release 6
> compatibility easier.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  include/hw/mips/bootloader.h |  49 +++++++++++
>  hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build          |   2 +-
>  3 files changed, 214 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/mips/bootloader.h
>  create mode 100644 hw/mips/bootloader.c
> 
> diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
> new file mode 100644
> index 0000000000..2a0e1a11c9
> --- /dev/null
> +++ b/include/hw/mips/bootloader.h
> @@ -0,0 +1,49 @@
> +#ifndef HW_MIPS_BOOTLOADER_H
> +#define HW_MIPS_BOOTLOADER_H
> +
> +#include "exec/cpu-defs.h"
> +
> +void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
> +void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
> +                        target_ulong a1, target_ulong a2, target_ulong a3,
> +                        target_ulong kernel_addr);
> +void bl_gen_write_ulong(uint32_t **p, target_ulong val, target_ulong addr);
> +void bl_gen_write_u32(uint32_t **p, uint32_t val, target_ulong addr);
> +void bl_gen_write_u64(uint32_t **p, uint64_t val, target_ulong addr);

Again, if you don't mind, I inverted bl_gen_write() arguments:

  void bl_gen_write_TYPE(uint32_t **p, target_ulong addr, TYPE val);

> +typedef enum bl_reg {
> +    BL_REG_ZERO = 0,
> +    BL_REG_AT = 1,
> +    BL_REG_V0 = 2,
> +    BL_REG_V1 = 3,
> +    BL_REG_A0 = 4,

And moved the enum declaration to the source file.

