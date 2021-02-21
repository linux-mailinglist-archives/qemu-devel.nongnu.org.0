Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFA320C16
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:33:45 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsc3-0008U3-Vl
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDsZI-0007GD-BA
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:30:53 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDsZG-0006cC-OO
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 12:30:52 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v15so16673790wrx.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 09:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UUBDIkK7G7hhhiiUDd3iPrPT25QPjaujgZVKGESuqIw=;
 b=sgMIEwa+3ywDGQBCboIYKl9HIKoQHffJ6ExF0PX+7PlxJijMNf9lLZFCA64BOJDbdm
 QwHbElYoka/uzZ6uD9mToY0vriiPWblJV36DRWSKtqVlvboErSCp8ojHiNCSUfUqH1QT
 /0JQPi7/zkJEKDeGdeBY2Q75UBeeNMjQ78uT7zjU3wDzjsklic8/K0tdvgFhViihjOKC
 EeKSwqE8AnioGXnCOhqP2bSx1IZ7l6zpBw5MWd/kLGlr5QE1rpigZl0hJFsGNEnR1pjv
 kAhKUlZiQ5HM8zIR/ekr4Yl3rsecptdVmXt9s+NVOKCHB1k8PdQEfIe9n5zdjEB/Ug2u
 e6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UUBDIkK7G7hhhiiUDd3iPrPT25QPjaujgZVKGESuqIw=;
 b=Hs9L0oP9a83M+EEOJaHA9J4LJttA/qKKuZCQ2v73f5tXTTj/bzHFNWsxH9G1L49zkf
 mhv31k/bq2yW3CVuDnXIXsi6z8GG13KdxW/QMpwWp1TSE1BCPBnxUwucOcwZGQJN388k
 /6ykeTIsRqqNsUGEr683uk26XFI79UKj+IXF/3s+aFNnedukW+JD5umagWHpORav4PEV
 YydqApOR4WbyU8Ld4IgfJI7OaiJjG5z4wlpdAAPrLY85IlrTC1gJvF8Q/gSYp3AxLTw7
 T6fSm+XISL3Jwq9y92uDaRAB/KLPHrBICHrh3SDHRIh1W4xMsPyZudaAUJW0LphaosMr
 6jbA==
X-Gm-Message-State: AOAM532/r5o391uvzZBeh5AW6wIJN9HmsiXMQz/+CgU7ame/x3ejttmm
 P+r4QZMRxG2JABr54DTcCdQ=
X-Google-Smtp-Source: ABdhPJxsqQuXeogGkMXvpMXhO8770W8CTDFJdTBV1X+Embe7jQPa51VSkBDoiaZYhvw9qFQeaPCk1g==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr18251962wra.204.1613928647853; 
 Sun, 21 Feb 2021 09:30:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b83sm18499179wmd.4.2021.02.21.09.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 09:30:47 -0800 (PST)
Subject: Re: [PULL 02/43] hw/mips: Add a bootloader helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <18524263-62d8-39c2-057a-11c01f262c3e@amsat.org>
Date: Sun, 21 Feb 2021 18:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221143432.2468220-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 3:33 PM, Philippe Mathieu-Daudé wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Add a bootloader helper to generate simple bootloaders for kernel.
> It can help us reduce inline hex hack and also keep MIPS release 6
> compatibility easier.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210127065424.114125-2-jiaxun.yang@flygoat.com>
> [PMD: Restricted bl_reg enum to C source, inverted bl_gen_write() args]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/mips/bootloader.h |  14 +++
>  hw/mips/bootloader.c         | 200 +++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build          |   2 +-
>  3 files changed, 215 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/mips/bootloader.h
>  create mode 100644 hw/mips/bootloader.c
> 
> diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
> new file mode 100644
> index 00000000000..88eb9f49180
> --- /dev/null
> +++ b/include/hw/mips/bootloader.h
> @@ -0,0 +1,14 @@
> +#ifndef HW_MIPS_BOOTLOADER_H
> +#define HW_MIPS_BOOTLOADER_H

Missing license...

> +
> +#include "exec/cpu-defs.h"
> +
> +void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
> +void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
> +                        target_ulong a1, target_ulong a2, target_ulong a3,
> +                        target_ulong kernel_addr);
> +void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
> +void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
> +void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
> +
> +#endif
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> new file mode 100644
> index 00000000000..6ec83144909
> --- /dev/null
> +++ b/hw/mips/bootloader.c
> @@ -0,0 +1,200 @@
> +/*
> + * Utility for QEMU MIPS to generate it's simple bootloader
> + *
> + * Instructions used here are carefully selected to keep compatibility with
> + * MIPS Release 6.
> + *
> + * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */

