Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB196CAC1A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:45:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqtb-0001SM-Uc; Mon, 27 Mar 2023 13:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqta-0001Rw-5n
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:44:38 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqtY-0005Mq-K8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:44:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id x15so8382633pjk.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679939068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2mBPuEHhAG1YTV3aSLP6Kgi5hVg/XWoZS4eYK+6sRw=;
 b=hezpDPXfJQupMI0rEAtS7H79qsCsLJbJFbnaWHOM7YZRUav4L15KkhyNBw/HT3cau/
 43qDoRf+/RRnEAvRUjBYyI50cJCAL4SHbuoXaSzIIXBdBpgQNIWVcfcZmAdHZ2AC4kr2
 tKCxF8417biHv7wYaYw+KO00I1//4urHsUrsdWBxHl9deXVAH6MdW0PTEsItCmM3+83H
 MhhUFR4HigURjN1G2ph/UZ2noxZYm7u+pq7u4pws8EGM7e03cLT0JiYVfKOFg5cReduU
 Y1I038tO6qJuQoZfFLVY2uULRY3MPhOKlMVtfqmli6zBQezvTDvFQn0PBk0v/yAiQCaQ
 qs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679939068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2mBPuEHhAG1YTV3aSLP6Kgi5hVg/XWoZS4eYK+6sRw=;
 b=EcFR6ILytAi+65PniF4t/ukrMA2XR9t5X5zhB8Kz5D7QC2vVszO8Iw+9AakVEIZCKG
 lCRmByZHFn9uM6iwCiml8OTCrQpISzEjVQVqDZdwmy9CxYm2jeDrszqAkkYd0IFd3K1Q
 KHJ7b9FskYj8cANgTXsLXGffwmHP7Zi3AscLbq+aBFRP4eg/KEgDzMNPUmjNqiv10Ev2
 /0iLk9sbflCPtglOeJQWmE1K235bIGLc+DP8eLDS03R8G0LSvrcGAhSsL1mBAAzOPoLY
 ImVOYV8lIvSHbF5Yco545HU49IIvHiMQ4XuMZDuyHbu/FIVq6MfLXx7aIL79TfUCxy2J
 QNBA==
X-Gm-Message-State: AAQBX9egJ4sIsNCMV+7bLOUQ5GkU3KOSOIMBo+1XuYejTN6wUTKWBXUN
 5ahRRvrprBEarMR++gwErMJCTA==
X-Google-Smtp-Source: AKy350ZfgY0XW2+13mzzE9WIMK1UMhoPYzcRfFQINH/axG+NjSKZWt+AyBLIJ69Uw4wGCmasjLMhYw==
X-Received: by 2002:a17:902:f08c:b0:1a1:a8eb:d33e with SMTP id
 p12-20020a170902f08c00b001a1a8ebd33emr9963030pla.8.1679939068206; 
 Mon, 27 Mar 2023 10:44:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 jk5-20020a170903330500b001a01bb92273sm19414794plb.279.2023.03.27.10.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 10:44:27 -0700 (PDT)
Message-ID: <63c805b9-f006-cdfb-4d07-5dbae84b7039@linaro.org>
Date: Mon, 27 Mar 2023 10:44:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/loongarch/virt: Fix virt_to_phys_addr function
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, f4bug@amsat.org,
 philmd@linaro.org
References: <20230327112313.3042829-1-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327112313.3042829-1-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/27/23 04:23, Tianrui Zhao wrote:
> The virt addr should mask TARGET_PHYS_ADDR_SPACE_BITS to
> get the phys addr, and this is used by loading kernel elf.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   hw/loongarch/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index b702c3f51e..f4bf14c1c8 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -399,7 +399,7 @@ static struct _loaderparams {
>   
>   static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
>   {
> -    return addr & 0x1fffffffll;
> +    return addr & MAKE_64BIT_MASK(0, TARGET_PHYS_ADDR_SPACE_BITS);
>   }
>   
>   static int64_t load_kernel_info(void)

Looks correct.  Any idea where this 29-bit value originated?

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

