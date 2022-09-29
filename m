Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D75EEC09
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:44:08 +0200 (CEST)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odjWx-0006wu-0v
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjVm-0005b3-EN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:42:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjVk-0004cA-Rt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:42:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id b21so77495plz.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=2HSPaW9LltmAdXDGXQCvFjFoEWEEc0ygbrPpd/I8XLU=;
 b=bz0WECrLx4a3+6QvVNap3JzRzUVCSxsLMhFnZWEHbf1hUofOYQTXoobv/PbrdraLXW
 eZvV0mEoWrzrFYWuzZ1tcYsYXQUyeaiwtj+42dX4lTAqhWktNOFJ1iOfdwVwOb0QuW02
 rvMc7y1pWBGoz8KAsgj+d5aZr7oIbx921uDpubAehomkTRNv7A8hEQG3HhwYo26fyVjb
 cX4YPrU7iTMjD4rROtAIMdpCZ8KKKgejTNzI2ChQ7r/Wk658fUMh4c8xi/rfWEH6iheg
 HNg0R4CQLTe2tIX9S0TJwaTEsoKQRGxXQPB7iHQcXJDJEUAc0X73YyrMyfGpto0YRud0
 1+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2HSPaW9LltmAdXDGXQCvFjFoEWEEc0ygbrPpd/I8XLU=;
 b=SaaI0kjqIPUyR7FtshUOjmmpGyZj8xgd1MLK7Ytxn5MRrCEOgoliJJ981DRfvG251P
 0iP8eS9uQqCbiYM9bsGQGwe+C8ecFCJPSyDjQ77Us+wAC5XYzCMhW8Ap8n1YVZcpyXFV
 2dwdUleu+Uix0U6AMhQYpeTKiv2+DKEmnyEm/x/vrTDZQuRUwKZzNvHCj88+iuZxTHC4
 66BNV5JgkSWNoFHrrD9X7JmLcF81RG3vxDpF5mmlJTkKuoVlzVYU6gnz9FK1p62Y9JA+
 Xuxwf1XP25PF6gDFCKO4Fg3gqqw3B6KKkPxcNrkaZN0VWT+ugMOU8pv/IkMhOYmsWgE3
 QoTg==
X-Gm-Message-State: ACrzQf0vYv5ic+eBjY15f0Pt56Ihra40ibPn3RtUpuLbyuieLb8oXzFm
 9dogO9HXnfmMnx5sx0IM4uiAxw==
X-Google-Smtp-Source: AMsMyM4DRUJAkgsQdOXREcKyuIY3nhU8L/Ppakuzk0NBll7Ba3RXVpyv/+C5mJ/Dr+T57RKOtB1KNA==
X-Received: by 2002:a17:902:d58d:b0:176:da94:e6f7 with SMTP id
 k13-20020a170902d58d00b00176da94e6f7mr1159432plh.11.1664419371202; 
 Wed, 28 Sep 2022 19:42:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 i27-20020aa796fb000000b005365aee486bsm4697316pfq.192.2022.09.28.19.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 19:42:50 -0700 (PDT)
Message-ID: <aa5e61d8-0074-9c56-1da3-da120d5ee185@linaro.org>
Date: Wed, 28 Sep 2022 19:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] hw/intc: Fix LoongArch ipi device emulation
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
 <20220927061225.3566554-4-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927061225.3566554-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:12, Xiaojuan Yang wrote:
> In ipi_send function, it should not to set irq before
> writing data to dest cpu iocsr space, as the irq will
> trigger after data writing.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> index 4f3c58f872..aa4bf9eb74 100644
> --- a/hw/intc/loongarch_ipi.c
> +++ b/hw/intc/loongarch_ipi.c
> @@ -88,7 +88,6 @@ static void ipi_send(uint64_t val)
>       cs = qemu_get_cpu(cpuid);
>       cpu = LOONGARCH_CPU(cs);
>       env = &cpu->env;
> -    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
>       address_space_stl(&env->address_space_iocsr, 0x1008,
>                         data, MEMTXATTRS_UNSPECIFIED, NULL);
>   

Did you mean to move the call below the set?
Otherwise, where does the irq get raised?


r~

