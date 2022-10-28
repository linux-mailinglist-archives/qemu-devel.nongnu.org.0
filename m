Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB40611A96
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:01:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUak-0002M4-J8; Fri, 28 Oct 2022 15:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooUai-0002LG-FJ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:00:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooUaN-00086m-TK
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:00:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id l2so5588543pld.13
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gGcUOE/Sdk33raic7JXwzRU0YQmcKtSitsKgceT4mco=;
 b=FU2c7UjamwLAZ6MLajiDE+5J0iMEsKZlczm7D0JiiAEMtxSfag50yai85M0StB5ANb
 KA00FpdyirA+ZZA9zbpbgnEmv8OFA08YxlqeP0H0NuSYZiQ9OpYULMLaWxQi5XUMe7P5
 YM7z3F0g+GCJ2p5OOGtZxrCWilMhdjV8dgga9BqeB1jt91ZSVssu/ANhE9CD3QvqtYZv
 0x9uxfyXmc4aqPdYizV1Xm6/zlwkm2dUU2D0GN1+A1MwSuazzVdvrMh+kzQe4JkBX8x4
 u72hAMyLAW1/rr9/Ev5wK2+h84MqSfBgRLxRLYGXf1yexniCaE0BAkEFsVK9QtTjjtiP
 bLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gGcUOE/Sdk33raic7JXwzRU0YQmcKtSitsKgceT4mco=;
 b=lCepzb/LcozB/nJIn0qKBLU7XCb6JavEOAVT0IPr/JT+DLZXMA4jOPE4sAyGCexiPf
 F38EDROuCQFFtmjvoe76EwhwWQRzKOjKG/znYK/P8nhLZmtLNbUrGvIoP1f7EMRkF2PM
 BpvcJLtjhO/rFTq89R9Xk+k7XQ0ZXUu65NOnNhsfxzj4py5ekbCefpASW0jyvofnGMCw
 I2fSQmQWIy1AiI+EDKCBCjS5BagEOLnmaYuML9OMmEOW1X2HQSsF08wWcTkRIx+CDZMm
 +J/Nd1CTE+RufQAwk7QUr4n5M59p5IMNCiSt9Vp9tCUZ64a0wZB8esk5IKYosFvJ35Xn
 u4/Q==
X-Gm-Message-State: ACrzQf0COgR5DuK04RwvymHpMVR04SMCWWO0RurDY+5I/QsDFOuRzv5D
 QPhTvcAYgIrzVEbTvn675aPihA==
X-Google-Smtp-Source: AMsMyM5tUumw4g7x45bDfqu8Hvrs2Bk5xgVLgFwv3U6C/gzKZQa1rIR9YnSGadzhp4395dXJOdjU3w==
X-Received: by 2002:a17:90b:2751:b0:20a:e437:a9e8 with SMTP id
 qi17-20020a17090b275100b0020ae437a9e8mr17485923pjb.181.1666983595890; 
 Fri, 28 Oct 2022 11:59:55 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a170903235200b0017808db132bsm3426330plh.137.2022.10.28.11.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 11:59:55 -0700 (PDT)
Message-ID: <f238a64f-6a32-8147-12f5-b3f3e47caded@linaro.org>
Date: Sat, 29 Oct 2022 05:59:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] accel/tcg: Fix concurrent pthread_create() and
 munmap()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221028124227.2354792-1-iii@linux.ibm.com>
 <20221028124227.2354792-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028124227.2354792-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 23:42, Ilya Leoshkevich wrote:
> munmap() flushes jump cache on all CPUs if the unmapped range contains
> a translation block. This currently includes new CPUs (i.e. qemu-user
> threads), for which there is no jump cache yet, which leads to a null
> pointer dereference.
> 
> Fix by skipping new CPUs.
> 
> Fixes: a976a99a2975 ("include/hw/core: Create struct CPUJumpCache")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/tb-maint.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index c8e921089df..2a063f91aa6 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -241,6 +241,11 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
>           CPU_FOREACH(cpu) {
>               CPUJumpCache *jc = cpu->tb_jmp_cache;
>   
> +            if (unlikely(!jc)) {
> +                /* This is a new CPU that is not initialized yet. */
> +                continue;
> +            }
> +

Interesting that the new cpu gets linked before realize.  I wonder if cpu_list_add should 
be moved from the top of cpu_exec_realizefn to the end.

Thanks for the test case.  I'll have a closer look.


r~

