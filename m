Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35466A4FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWnWB-00065U-UB; Mon, 27 Feb 2023 19:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnW7-0005ti-Sk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:06:51 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnW6-0004A2-82
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:06:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id x34so8041599pjj.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y0JJOlHBOo6w/Oy3Fpf0uTTDQtH8l39MtoUNW82wAbU=;
 b=G6kAVEWc60iQzOooOiUVtc4T2jW2ZVrEJl+zv1Jb7H674PGusvE3QtaKIA0fpENhAd
 6YjO/uHqE3ZcO+3IIWsEeij4Gl/iubXo/yAXjbGphEfWw/P4ycxsc/eCknClvSHZ3rLh
 FEBEegSMXXvSGy+2yqLq7XbdNpglS53x/1Q4WWmYtuXuNDLz0igStpYFwwdyXRNQog19
 LVVtE3PY9W/Yn/V1bbsuOCwkHPwXZBz8JcRfTaqdWAs+6JW0AOsmX1GsTgm9gyi6DTab
 lp31wcJXRajXZyXfS8lcY5W6wEDBz6jz7wBJnZVobML5u8U5ooQJ806idf7M/1uGwz30
 8K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0JJOlHBOo6w/Oy3Fpf0uTTDQtH8l39MtoUNW82wAbU=;
 b=4XZvBrYB/WhauJagY7KK54qGNha/jkmHE38mh/GkUFdk0JcCaz2s/1j8uPVJcAugNP
 5HpGn7SMnlOZ35DGUK5Q4sqKD8y2CmlFES3Cx/NLbSDGvL2XCWFwkJJ/jWkUvut0cxpP
 WrngWyapaJ4qkpE5LfC3lfssLacbIUE5DxOEeGYW4SLGTwmDV6gimEVqt6CXOoCkVnAn
 P8HGi1mOq3mB6lQHcO2Sod0f17G/JpkwG/g9cxvFzUUEYRPR5i73j7zMHPHEU+bD2XIC
 2VxjnF615X2HH7x6x9/Txx8NYLDgTLmYS1QE65TpGltVRwmrGblE9R1kuCdnQC70O2Wt
 RXgg==
X-Gm-Message-State: AO0yUKX1dznS4xjbo6pDjHFLoBR9g4hffTrX6m3+agRMyLST2BLUAfoR
 zEgt59sOygz/ybxIfxflLuP8Zg==
X-Google-Smtp-Source: AK7set9WXO/IkDGKWzXq/VIn4v3HYZXILz6m99ptZKkgeN1R6puYFQyULmXEILVtOzYlYzRa9x7riw==
X-Received: by 2002:a05:6a20:b058:b0:cc:1fef:99ba with SMTP id
 dx24-20020a056a20b05800b000cc1fef99bamr1173013pzb.8.1677542808342; 
 Mon, 27 Feb 2023 16:06:48 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i71-20020a63874a000000b00502e7115cbdsm4546834pge.51.2023.02.27.16.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 16:06:47 -0800 (PST)
Message-ID: <b78c21e1-48bc-7798-03b2-b603842e69a6@linaro.org>
Date: Mon, 27 Feb 2023 14:06:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] loongarch: Add smbios command line option.
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, armbru@redhat.com,
 thuth@redhat.com, mst@redhat.com, sw@weilnetz.de, clg@kaod.org,
 danielhb413@gmail.com, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230227035905.1290953-1-gaosong@loongson.cn>
 <20230227035905.1290953-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227035905.1290953-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/26/23 17:59, Song Gao wrote:
> LoongArch has enabled CONFIG_SMBIOS, but didn't enable CLI '-smbios'.
> 
> Fixes: 3efa6fa1e629 ("hw/loongarch: Add smbios support")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Message-Id: <20230208094133.2945979-2-gaosong@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index beeb4475ba..d42f60fb91 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2585,7 +2585,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>       "                specify SMBIOS type 17 fields\n"
>       "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>       "                specify SMBIOS type 41 fields\n",
> -    QEMU_ARCH_I386 | QEMU_ARCH_ARM)
> +    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
>   SRST
>   ``-smbios file=binary``
>       Load SMBIOS entry from binary file.


