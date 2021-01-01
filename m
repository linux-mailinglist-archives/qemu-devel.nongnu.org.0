Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0D2E859C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:49:58 +0100 (CET)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRMz-0002uM-85
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRMG-0002U9-IV
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:49:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRME-0001Ek-OR
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:49:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c133so9691277wme.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EG2uooXrSX3BNaDjyWNewt1Bi4cIWodBvhrVsBcXXiE=;
 b=YjDy+bc27u0t7e9lL+nBPa07XQjMGwTDWLHBli2Ef8yyldRK3p1tZfPZBWuLzAs+vz
 oNr1MmvH4b+WeTON2XaKTwkt8PqdNwWLeqa4I5P6XDP4Rwnyleh87sVYhA8A4oRQalyk
 tsMi5XbGPieTqm0d/nX/pc3PaUogmu55T4RZnWbsOg8y7yKYz3iyJRq2dNpOknEAgAGV
 aChcoIsrYEg2S/AiWX+NJDpqHgl7D0di9gUKK+FnosR3AsoxZfWroKKNSEuWgvMgSBik
 LJ1EaOEneTmagt17uNUfwbElhsVpV6CKwG29voGOF4lMRoMiW3Gh13WNfgRNdQqKZSKH
 lFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EG2uooXrSX3BNaDjyWNewt1Bi4cIWodBvhrVsBcXXiE=;
 b=YtT/2IOI9TQRL4MnH1MkVIrSdSjvK5WjAai02nqhheU4ZA0jc2jL9NszUsZjkx5ivY
 kyMTUYA2/6vLiB6ilyB6HaBBCwXM4soRBTPlFXPoq4p7epD5TedPDBnLlvLWak7GcrxJ
 h9GuYD/704rPYZbXjdnqQytrAWusafc65lTJhSem6rpPeBjTVxDn4QdlAUI+klasQ4MF
 MEINhgMnb54SjIRRrO0hg86FvXd4GDpsXej+WK1lS3g0Y5vmPOHuQYCcwhlJBjrA/nUu
 C1oJkkfKFnsdkO92EHtnr2/3cuFKoX3MwoVpWieL5rmqTtutfq5zHZKuGburAfg6fgRh
 7Efw==
X-Gm-Message-State: AOAM530EkTFn4e1bw03Z3sdX8Vg4uX74PjOijlVXz8Z3lmwIT+Rb0XQs
 yY0DiB1xkcNt+yy3y4QO9+I=
X-Google-Smtp-Source: ABdhPJzpJvdzlZ0DOqnAHC3weM4+CyfXDnYalzonRJ1613knBaqWxLwBxaq+xUlvVPC8EpBbIBrNBw==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr16459103wmk.70.1609534149275; 
 Fri, 01 Jan 2021 12:49:09 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id a25sm18137992wmb.25.2021.01.01.12.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:49:08 -0800 (PST)
Subject: Re: [PATCH V19 3/5] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <chenhuacai@kernel.org>
References: <20201221110538.3186646-1-chenhuacai@kernel.org>
 <20201221110538.3186646-4-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c9b6985b-aa86-b5ea-48b3-b35b8f75321b@amsat.org>
Date: Fri, 1 Jan 2021 21:49:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221110538.3186646-4-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 12:05 PM, Huacai Chen wrote:
> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  MAINTAINERS               |   2 +
>  hw/mips/loongson3_bootp.c | 151 ++++++++++++++++++++++++
>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build       |   1 +
>  4 files changed, 395 insertions(+)
>  create mode 100644 hw/mips/loongson3_bootp.c
>  create mode 100644 hw/mips/loongson3_bootp.h
...

> +struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +};
> +
> +extern const struct MemmapEntry virt_memmap[];

I'd rather avoid this extern (pass MemmapEntry as argument?).
Anyhow, not a big deal ;)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

