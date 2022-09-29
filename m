Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABC5EECAF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 06:14:22 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odkwH-0003h7-4v
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 00:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odkuN-00012i-Rl
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 00:12:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odkuM-0001R0-6W
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 00:12:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso4500078pjq.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=q8ufOPAZnisVmrV1s321IxOLVLLadkosiVYYJQRsKfQ=;
 b=YzUc1iooosG0yYkCCeIDgdzUrsh2wlFL5yk8N152HICwClioJttzMHvlIoPhssTMew
 d8TPysBgiCXXTH1WitFzoa4yto7mdYTDJ76cJVkU8BdIEdpqM1BLZxU66+4v1BdPo6br
 hRHoKkbhk64FYtf/OXhrpgJckKKIJkAISW+Y9/lj2QRuThIvMSRIbndxpJsWOChcRjkU
 xp9SxttG2cqRWTCDSGE+4+uTpGnJA2o96EqZtH4OYQQuk/kxctH78UMxRqztanzQafMS
 o6n20QMuu3zGgDE1ehcW3MVzgrSD6ILvVOdGlCpFxtVaqzDtOJjTrXmFnQMDci2X7RR/
 WoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q8ufOPAZnisVmrV1s321IxOLVLLadkosiVYYJQRsKfQ=;
 b=XHTN+J6Aq4SXodNwlu06vodtCtZWTtFIaf3EDoSMURdgreJ3kJoq6umsHGJnzGEHCm
 Nm3Te4V1x5EA0xoV8S1qQMAiE8y8WtJJdilL8Jof7rBDcPkh9dyhuoIzaoL/UtQ92WYb
 CRZqhNO0bjQmaX8JlU4RIFEOX6Y4rL7eGXf6f2Ma2CCSD1Lb1AtVdLLqt0RIiYi684Ej
 Ch4aNue1q4A48pbv4lcNzMzvGEpO8iiYNz+mhw2+ndFEQv8rTLVUVxOA90puKx0ldT4r
 wWLO2b3pPws3NdNVJCkKeYlxPo4/y6EMNP9V4MmUX4Djk2Fqvi+VjSOGdUTOOMv2RgSS
 WQkg==
X-Gm-Message-State: ACrzQf1qxsWxSYsdonWWSh6qOd3/rFDonYfpFZZ27StHpJLbas7Aed3O
 gOblPy5Me8RhpFArmlYu1/Cx0w==
X-Google-Smtp-Source: AMsMyM5VkpFfo6GzXq2KjRbIj/MsAV2eUrRTvTZWN0VxHM/othfd1DVpQ38cdj530Yck9e04z4nI7A==
X-Received: by 2002:a17:902:b70a:b0:179:f94b:568d with SMTP id
 d10-20020a170902b70a00b00179f94b568dmr1470778pls.173.1664424739847; 
 Wed, 28 Sep 2022 21:12:19 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a622942000000b0054223a0185asm4765108pfp.161.2022.09.28.21.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 21:12:19 -0700 (PDT)
Message-ID: <5db38749-bb80-6b51-1959-b6e6216376c2@linaro.org>
Date: Wed, 28 Sep 2022 21:12:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] hw/intc: Fix LoongArch ipi device emulation
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
 <20220927061225.3566554-4-yangxiaojuan@loongson.cn>
 <aa5e61d8-0074-9c56-1da3-da120d5ee185@linaro.org>
 <d792e3f7-ea97-47b7-e556-8ebf1576d501@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d792e3f7-ea97-47b7-e556-8ebf1576d501@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 9/28/22 20:23, yangxiaojuan wrote:
> 
> 在 2022/9/29 上午10:42, Richard Henderson 写道:
>> On 9/26/22 23:12, Xiaojuan Yang wrote:
>>> In ipi_send function, it should not to set irq before
>>> writing data to dest cpu iocsr space, as the irq will
>>> trigger after data writing.
>>>
>>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>> ---
>>>   hw/intc/loongarch_ipi.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
>>> index 4f3c58f872..aa4bf9eb74 100644
>>> --- a/hw/intc/loongarch_ipi.c
>>> +++ b/hw/intc/loongarch_ipi.c
>>> @@ -88,7 +88,6 @@ static void ipi_send(uint64_t val)
>>>       cs = qemu_get_cpu(cpuid);
>>>       cpu = LOONGARCH_CPU(cs);
>>>       env = &cpu->env;
>>> -    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
>>>       address_space_stl(&env->address_space_iocsr, 0x1008,
>>>                         data, MEMTXATTRS_UNSPECIFIED, NULL);
>>
>> Did you mean to move the call below the set?
>> Otherwise, where does the irq get raised?
>>
> When call this function 'address_space_stl(&env->address_space_iocsr, 0x1008, ... ...)',  
> it will trigger  loongarch_ipi_writel(), the addr arg is 0x1008 ('CORE_SET_OFFSET'), and 
> qemu_irq_raise will be called in this case.

Ah, I see now, connected to

         qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

