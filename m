Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1341036C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 06:21:38 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRRr7-0002hc-69
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 00:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mRRp8-0001l8-0g; Sat, 18 Sep 2021 00:19:34 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mRRp2-0002VO-ME; Sat, 18 Sep 2021 00:19:33 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso15592240otv.12; 
 Fri, 17 Sep 2021 21:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+2tKechx+ZhlpM/E2TOJyj4EGX8JY1a++laKGyyB928=;
 b=M/SlhcW9v1h0ukggcu96RxQWBj4FmW50VbCb4H63uHjkg7ITk4Ad3FhucRGtRWQwuD
 rLxt78l9Vp594HQdrbqdN4XFr57USaJ9L+A1DFgchabhwRC12yZ1jWtnueqoW/KSz2F0
 ulereToJUSnvAzobONLoC0oLrgc7Nq2h3AfpY94s+x/2jjjia5RbqTNnGEXmG0PRJcS5
 yFuVb8rlhFdWDy8F9HQsVOn853d2zW7w/m/Ml/5huWKKWb/4gGcyw7pUMAhz8sfBqeK1
 Yu3I6BrK6M1bNC7/eoCQPX6KZ7Es+ZVrdN9eMzEgzadUmOBDf8TJ9bR2kifcWDichkqg
 trcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+2tKechx+ZhlpM/E2TOJyj4EGX8JY1a++laKGyyB928=;
 b=lgql9dEg16uD4t4g87YquDic3cSuGJTB6zcRHhlFCjfvIuJF9t4e9HlKgrMsyxJGok
 0S7sGN+lyz2LK2suwlCQpmQmPdYXKEBKMEcS6bU2uGfF5BmopZwqyIKubPtW/N1QBwAo
 JkXIyq/chZPj+CSv+ShZgvEPEsjnhQEoGZoL5cST9eprsy3sIVto3uuYSV1Zii0/tZlK
 1r1y8h7VMMSZyCMBSUy5jLQ/K+nJlQHF2svUeO3GWdTbjfxFSWKBRkBm98c3YII9qiIu
 YzxNcY4SBxY8LKV4mFBg/KSQ/gBPDkpj6/mi8dVvuTFeSfGAk8ieGA8lP2dxvTPVeaix
 RH5w==
X-Gm-Message-State: AOAM531nxp6MVvW6i5Cue409fbe3tNXxlBev2GKVrMSEnHFGu2dQ4er3
 xyf5Fkk4ZqHjPpG1/RNcMwk=
X-Google-Smtp-Source: ABdhPJyPfpbTwVhn+7VpFM5AzFElClZnTwjwViTQ7esjjDGEqF/GkSVKC5II8dLq4/hJ/6J2YG9rbA==
X-Received: by 2002:a9d:7019:: with SMTP id k25mr12654218otj.350.1631938766677; 
 Fri, 17 Sep 2021 21:19:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g2sm1815211otp.7.2021.09.17.21.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 21:19:25 -0700 (PDT)
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
References: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
 <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <20210916142140.GA252836@roeck-us.net>
 <PH0PR11MB52058E0462672E61797758B997DE9@PH0PR11MB5205.namprd11.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <2cd83a88-952c-6f86-74b2-8c0da3ce4394@roeck-us.net>
Date: Fri, 17 Sep 2021 21:19:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB52058E0462672E61797758B997DE9@PH0PR11MB5205.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 8:09 PM, Cheng, Xuzhou wrote:
>>> I got some free time in the past days to investigate this issue. Guenter is right, the Linux imx-spi driver does not work on QEMU.
>>>
>>> The reason is that the state of m25p80 machine loops in STATE_READING_DATA state after receiving RDSR command, the new command is ignored. Before sending a new command, the CS line should be pulled to high, this make the state of m25p80 back to IDLE.
>>>
>>> I have same point with Guenter, it's that set CS to 1 when burst is zero. But i don't think it is necessary to set CS to 0 in imx_spi_flush_txfifo(). I will send a new patch to fix this issue.
>>>
>>
>> Thanks a lot for looking into this. If you have a better solution than mine, by all means, please go for it. As I mentioned in my patch, I didn't really like it, but I was unable to find a better solution.
> I am doing some experiment to verify that the new patch is reasonable, so the new patch will be delayed few days.
> 

No problem. Note that I'll be traveling for the next 2-3 weeks, and I won't be able
to test any patches during that time.

Guenter

