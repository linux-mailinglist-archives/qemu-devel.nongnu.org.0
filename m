Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF66621207
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOMo-0007VN-Iq; Tue, 08 Nov 2022 08:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osOMl-0007UK-89
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:10:11 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osOMh-0004x9-MR
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:10:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso13286628pjc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+L3vgOxPyHeFKtT1+l+E7jVdmDq/CM5cqSp6+JHzd4=;
 b=HG0VhuqAg+Mc0XQcbUEdzsQRVzyTz5Y9mU/p4w1jmEPgrBsEoVK9g/wxc/dAc040ld
 lYo2C+4Hj56ZURQDM5jMPz5DBfwoSBFEYQ1qsKhh2sQ5V5cRBsmINfcIQ+MJJnpfMqnt
 +0kDcoTZzgCzl51+eTytYOQi4WgJZHBXipX4/0LVCRlz5EyfSdjAeHSQocWEh6MnZNSJ
 JcaiTEotkV11yG5ygl4FLzFp/Yld/XmtiZzj9V8l/seTJtNFz5RAPEv6rCbSyUa3+wtE
 oOvzHMtOX2GT/d9xvuxoDNazBixYZJtTLMdBemaTzJ7bkq8jfmDkpGTJLftXOKAXePcD
 US1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+L3vgOxPyHeFKtT1+l+E7jVdmDq/CM5cqSp6+JHzd4=;
 b=dM9R5D9MUQw6Q8TO377Ac5293Er44v/okRAr6Ye5qCbg1NRk3DkBZLO/7vuJ3fJUpd
 XhzZw6gPOewMh3VF1IPTm895gd99wwtPCLqNObpfBNeP7e9HluKR8kTI8DRUQP7EwFEb
 j/gEkSr5SywwIjF9viI4EVwNprjFttqhoWgHpSpD1fwkCBFcgWWcNqQjIhuG1aVZdTTz
 H7E+59muv+CVi0CRdvYqeJWRS+wX3jBbeHlTzLBdaoYnAO6zMrbJXhE3hQ52HJ0NGK+q
 /JvO9OKyOCWyA61/MCa8654gZ7OErSLp27DCOmxyJK4Q7+eyGcigWuhq2ZXPtRzwk1IF
 /VqQ==
X-Gm-Message-State: ACrzQf1ZCy4fXFcGSBlUKjAo3XSNkAdYmuekyWk7XWkCdbWVGprPmz9E
 wJ3NqQD7z5KRHaRGM77k1QTAnw==
X-Google-Smtp-Source: AMsMyM5/W+yorqxGnC+ZFWsm1yBIsz0AguErjixVcZhVQwoK8rTxnQt4MgT/Mlha1R2HKHrkCUa56A==
X-Received: by 2002:a17:902:db06:b0:187:4736:f77d with SMTP id
 m6-20020a170902db0600b001874736f77dmr35778396plx.113.1667913004971; 
 Tue, 08 Nov 2022 05:10:04 -0800 (PST)
Received: from ?IPV6:2001:8003:d918:7a00:10f1:4c74:6b10:4a93?
 ([2001:8003:d918:7a00:10f1:4c74:6b10:4a93])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170902c1d300b00172e19c2fa9sm6927655plc.9.2022.11.08.05.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 05:10:04 -0800 (PST)
Message-ID: <50ebdf82-740e-f239-7e2b-162a22b758fc@linaro.org>
Date: Wed, 9 Nov 2022 00:09:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] target/loongarch: Fix loongarch fdt addr confict
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: stefanha@gmaiDDDl.com, yangxiaojuan@loongson.cn, maobibo@loongson.cn
References: <20221108130204.926434-1-gaosong@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221108130204.926434-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 11/9/22 00:02, Song Gao wrote:
> Fix LoongArch check-tcg error:
>    TEST    hello on loongarch64
> qemu-system-loongarch64: Some ROM regions are overlapping
> These ROM regions might have been loaded by direct user request or by default.
> They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
> Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.
> 
> The following two regions overlap (in the memory address space):
>    hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
>    fdt (addresses 0x0000000000200000 - 0x0000000000300000)
> make[1]: *** [Makefile:177: run-hello] Error 1
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   tests/tcg/loongarch64/system/kernel.ld |  7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/tcg/loongarch64/system/kernel.ld b/tests/tcg/loongarch64/system/kernel.ld
> index f1a7c0168c..2110cfe8be 100644
> --- a/tests/tcg/loongarch64/system/kernel.ld
> +++ b/tests/tcg/loongarch64/system/kernel.ld
> @@ -2,8 +2,11 @@ ENTRY(_start)
>   
>   SECTIONS
>   {
> -    /* Linux kernel legacy start address.  */
> -    . = 0x9000000000200000;
> +    /*
> +     * Linux kernel legacy start address.
> +     * FDT is load at 0x200000, kernel image size must be smaller than 1M
> +     */
> +    . = 0x100000;

Or start above the fdt at 3M, to avoid that limitation?
The comment about the Linux kernel start address no longer applies.

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

