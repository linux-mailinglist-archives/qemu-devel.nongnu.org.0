Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57926FF9BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:04:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBZQ-0003HK-BL; Thu, 11 May 2023 15:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBZI-0003Gh-Fl
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:03:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBZF-0001N6-Nx
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:03:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so63205515e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683831788; x=1686423788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1r+QyRiGfiksC4nzY/CNhYYX2VeU3wzQBhPFp1m6nvw=;
 b=DaGCysNZJtj95ky63u+vvso/3u51HVedODzyWvZrAbv2WyHjOb3lQh+NHQLhvWGDNG
 dQCKuGxjTJFjkf90dbJ018t1a2/wUsOU4xywPsSN/YtITUk9kKfH88djJ8Z1ks5X0dqN
 THN5xOyEFh2cYtXcK10vc6xiIXGx/0yb9YcXppt4Q03FVxIdieQfQIylx1LmCLn1AD87
 QF41qy6nRIkVOWYgmNDaGKr+vRjjqgTNx6QPEf0v2chiUe/uom0JeZXOPSq/Pf8MIfn3
 e8Qn3Ql+2xr7WwtDvTkhEFKYY7HzFa+3+yXsqO130lf5nzxBD/TMrDT7oGiueeEBoMzR
 dQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683831788; x=1686423788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1r+QyRiGfiksC4nzY/CNhYYX2VeU3wzQBhPFp1m6nvw=;
 b=lZIdAHqCuJ+viqqBUvAubOrIb/5tWlbcyL85uljPYRqvpKeWt4FCLudN14CHciCmqe
 MH3BpfEx6bJdTSNqi0fm/Dj+LX3vW33I2FGcyl8UftJE9IZpbRHaLIcNSKeU+ZooHvle
 Z/gSCcJwrTj4waLLcd4wbrs50x+IUzCsgqjwngHpSRuRhexNO0KA+/HJ2wIl2SHFIYRR
 NyUi0pdZ6FtVnU273RNbDIlEaNmCqDiyzz2aDytnQ/GLRRtxf1m8s967A4g1cMI4a5p4
 qNmhvwvsIneFjfofbus31LxGwa9kd1ZXJTq+EELfYmPpt5zNSWJCQ1IkE2vcf3dWPkTE
 /KKw==
X-Gm-Message-State: AC+VfDzl7UCfD8efUGe1N+h27uH9QkhBtniuWkHKQK8SfNPdfYQAJKDw
 K2LpgZKzTFotVaNirWTSSvLKeYoMbnI/EGmvzgk=
X-Google-Smtp-Source: ACHHUZ6IiLQ7CLklvNQKF9ESyWEGAQupA9gS1+Ij2YwZGy2r7EZKYvHVNWPA6ySqa29PnMb8l2EHAA==
X-Received: by 2002:a7b:cd89:0:b0:3f4:2610:5cc7 with SMTP id
 y9-20020a7bcd89000000b003f426105cc7mr9813620wmj.9.1683831787954; 
 Thu, 11 May 2023 12:03:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003f435652aaesm6508396wmc.11.2023.05.11.12.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 12:03:07 -0700 (PDT)
Message-ID: <0de07b1e-1371-9bad-11e0-e57d8fb379fe@linaro.org>
Date: Thu, 11 May 2023 21:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-2-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406100052.3355632-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/4/23 12:00, Song Gao wrote:
> When ipi mailbox is used, cpu index is decoded from iocsr register.
> cpu maybe does not exist. This patch adss NULL pointer check on
> ipi device.

How can that happens from a guest vcpu context?

> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> index 0563d83a35..39e899df46 100644
> --- a/hw/intc/loongarch_ipi.c
> +++ b/hw/intc/loongarch_ipi.c
> @@ -86,11 +86,12 @@ static void ipi_send(uint64_t val)
>       /* IPI status vector */
>       data = 1 << (val & 0x1f);
>       cs = qemu_get_cpu(cpuid);
> -    cpu = LOONGARCH_CPU(cs);
> -    env = &cpu->env;
> -    address_space_stl(&env->address_space_iocsr, 0x1008,
> -                      data, MEMTXATTRS_UNSPECIFIED, NULL);
> -
> +    if (cs) {
> +        cpu = LOONGARCH_CPU(cs);
> +        env = &cpu->env;
> +        address_space_stl(&env->address_space_iocsr, 0x1008,
> +                          data, MEMTXATTRS_UNSPECIFIED, NULL);
> +    }

Is that the hardware behavior?

Could logging the invalid cpuid request be useful?

        else {

            //log or trace event here
        }
>   }


