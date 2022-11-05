Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264F61DF04
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 23:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orRIS-0005rQ-6E; Sat, 05 Nov 2022 18:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orRIP-0005m8-0J
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 18:05:45 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orRIN-00052m-Du
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 18:05:44 -0400
Received: by mail-il1-x12b.google.com with SMTP id 7so4217272ilg.11
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=maDre7JlP+47x0u3UeMty3N52EW/Dey5/c0OMJhSD20=;
 b=TVFordx7Vtm6fZbAWxWFYYBsRFKf4OL1ZiZ0xpyw4j/yOZ0UMMMn4xBm7PI9HY/FGL
 itU0iAT8sTsWy9dw+aYT7N/AYfemJVOeYuqU+P2+UQiJN1mJU9Qu9ceYvrDW8HloGZI/
 lnjqctDoEf7v5YLvTsg35bA776SYmjoo1ipaJPEsgeAqBK7QQrhEdqh80/KKkTja43fc
 XoT8udS/rI7XOihvF5wIGdLx31pzHu+wPk7XNJtVm4Z6wcqOb/wGXol0wn6UjElCPTXt
 avDIwCkPmR64M5ZU4MyOlRbI6pehtZbyGX7GQ/jeCV6XyTsLmTJ7XuIVt1hN2mHzkYGn
 32nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=maDre7JlP+47x0u3UeMty3N52EW/Dey5/c0OMJhSD20=;
 b=1azM6u+RsOzPGxMgYm9Nrtk/PA1elZLejv3UrMZ/8RHfhJ+gdSNYJwMIELnd4axz2n
 UFmdEswGjMxc653cns7plO3PFgiItsVTb2ixDY8YkRGZdbSUVbWYOlPbUsGGvOQ1qNC+
 4eUuGStqSpo2IRoM7ORrFulPSPeOVMDRBqo5sCW+z9nPd3fk6oiR94rRCM9H/eje73OI
 3o+v6vwRTJGYZgEi+1ctQWnrNn4k3a9AyMXUboBt4RkVrXLKj+oxgX8RiLsuovvFqGUr
 v4BuN0dCyKsqUJ8lnMoEpYV6nKzo8JVkaQahNVj0rE7aYnkl6Rqby0WEIsqxyHHtC/bF
 HIJg==
X-Gm-Message-State: ACrzQf0TfwGqBVwgQzJdMoYM1e8D1R97clEdyd3OX66aLVyV61Ziuwwz
 YlgRvuQvlC0JhErU0FUVFyHqIQ==
X-Google-Smtp-Source: AMsMyM6MI8F7H3fmCBksBH+KuPFe52jpTmf7vUPyQOamrI1rGq7zfOTKCVTn0S5Jj4M1J7WAONzqPQ==
X-Received: by 2002:a92:dac2:0:b0:300:c4e1:8b76 with SMTP id
 o2-20020a92dac2000000b00300c4e18b76mr14137242ilq.319.1667685942030; 
 Sat, 05 Nov 2022 15:05:42 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.160.8])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05660226cb00b006bcd45fe42bsm1254469ioo.29.2022.11.05.15.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 15:05:41 -0700 (PDT)
Message-ID: <8fdb76d5-1035-0f35-d2bf-4bdee653d67a@linaro.org>
Date: Sun, 6 Nov 2022 09:05:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-7.2] accel/tcg: Suppress compiler warning with flag
 -Wclobbered
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221105114424.622563-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221105114424.622563-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 22:44, Stefan Weil wrote:
> At least some versions of gcc show a warning when compiler flag -Wclobbered
> is used (tested with gcc on Debian bookworm i386 and with cross gcc for
> Windows on Debian bullseye).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   accel/tcg/translate-all.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 921944a5ab..90191d97ec 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -743,6 +743,8 @@ void page_collection_unlock(struct page_collection *set)
>   #endif /* !CONFIG_USER_ONLY */
>   
>   /* Called with mmap_lock held for user mode emulation.  */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wclobbered"
>   TranslationBlock *tb_gen_code(CPUState *cpu,
>                                 target_ulong pc, target_ulong cs_base,
>                                 uint32_t flags, int cflags)
> @@ -1020,6 +1022,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>       }
>       return tb;
>   }
> +#pragma GCC diagnostic pop

No, I think this is a real setjmp problem.
I'll send a patch for this and a similar error in disas/nanomips.c.


r~


