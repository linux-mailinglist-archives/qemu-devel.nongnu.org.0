Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A693ABD2B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:54:06 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lty5V-0005uH-NN
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lty3D-0003PC-4M
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lty39-0004CP-Mg
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623959495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tN5V65uk1xsLZ+jG5bPvUSoPBkAs8qfZpJDVTd6lgo=;
 b=WvrUYjcL60YvmfioT+d3HWpCkIvyrdInbR9G9sX1H4LalcgbHnBiWcLrhSr0igCFSUGymr
 xv0npURCgAulRqF9xmN/unTCiVG+k0mEFhIvKlpFWrTI45x2Ni1G0KyQ6lO858l4iqu6Ic
 nOcRkl6HBtWPcjcbxWzC9l4UOtCH0pE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-9xDwxIBaM9Ku4tAfeViC6Q-1; Thu, 17 Jun 2021 15:51:34 -0400
X-MC-Unique: 9xDwxIBaM9Ku4tAfeViC6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 y23-20020a05600c3657b02901d457f3efb9so1400569wmq.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 12:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3tN5V65uk1xsLZ+jG5bPvUSoPBkAs8qfZpJDVTd6lgo=;
 b=CvL7KrPtS58hXIazmW/Og0V0m2NLPoJnmWW9M/FOoN2ae93p0Pmyuh07MkWAL+yzad
 T3qpxvLOg/W5BnaJLLBN3usAdXIdVA0jowdaPsRI1AguCIzIQYLYUnAaax9bs6r2kDtU
 vVLXO/qXMG4XKtqecKJpDE64N/4uIaxQfEP2eUDW0H/8h5Ocl2EHnVzvBTqGsS8NwEGO
 5CiejNly+p+efNFN+KCvRhtgdzgK8mvb7MtRLfCj9hORuXI/XX9Bwt8ElrZDB1mm/PR4
 BtV5J8v6t8w1fecPTJzps7E//5Z9vkuLsHWdpSpq3fZGSwrBG653yH2Q/PyXqU34wt4M
 w/5g==
X-Gm-Message-State: AOAM5334NHCiG24+8aJe3sxzBiPwy56VWhanbTQaG01yxnHqMhDXcX6d
 j7oIomVDwwPU1ZbR72nCuxg+x+HnNLxeDro9mNnKI1DGgMUV0N+Ml+K5YJuwJgxVWhUsxA5qTMS
 8goF9tDxNHHxcp+c=
X-Received: by 2002:a1c:770b:: with SMTP id t11mr7178524wmi.79.1623959493123; 
 Thu, 17 Jun 2021 12:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKbgI+jMCRLEgfQtYz+/Lx2KHuW9/i+3V2T7m3ft63SI+1YGK8h1uAmbWvBfp+ByW0Mh6B3Q==
X-Received: by 2002:a1c:770b:: with SMTP id t11mr7178491wmi.79.1623959492856; 
 Thu, 17 Jun 2021 12:51:32 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d16.dip0.t-ipconnect.de. [217.87.93.22])
 by smtp.gmail.com with ESMTPSA id m23sm9975336wml.27.2021.06.17.12.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 12:51:32 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] tests/boot-serial-test: Add STM32VLDISCOVERY board
 testcase
To: Alexandre Iooss <erdnaxe@crans.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
References: <20210617165647.2575955-1-erdnaxe@crans.org>
 <20210617165647.2575955-5-erdnaxe@crans.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d410450-6f69-2081-85c6-75ebc23409df@redhat.com>
Date: Thu, 17 Jun 2021 21:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617165647.2575955-5-erdnaxe@crans.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2021 18.56, Alexandre Iooss wrote:
> New mini-kernel test for STM32VLDISCOVERY USART1.
> 
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>   tests/qtest/boot-serial-test.c | 37 ++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index d40adddafa..96849cec91 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -94,6 +94,41 @@ static const uint8_t kernel_nrf51[] = {
>       0x1c, 0x25, 0x00, 0x40                  /* 0x4000251c = UART TXD */
>   };
>   
> +static const uint8_t kernel_stm32vldiscovery[] = {
> +    0x00, 0x00, 0x00, 0x00,                 /* Stack top address */
> +    0x1d, 0x00, 0x00, 0x00,                 /* Reset handler address */
> +    0x00, 0x00, 0x00, 0x00,                 /* NMI */
> +    0x00, 0x00, 0x00, 0x00,                 /* Hard fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Memory management fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Bus fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Usage fault */
> +    0x0b, 0x4b,                             /* ldr  r3, [pc, #44] Get RCC */
> +    0x44, 0xf2, 0x04, 0x02,                 /* movw r2, #16388 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x0a, 0x4b,                             /* ldr  r3, [pc, #40] Get GPIOA */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x22, 0xf0, 0xf0, 0x02,                 /* bic  r2, r2, #240 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x42, 0xf0, 0xb0, 0x02,                 /* orr  r2, r2, #176 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x07, 0x4b,                             /* ldr  r3, [pc, #26] Get BAUD */
> +    0x45, 0x22,                             /* movs r2, #69 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x06, 0x4b,                             /* ldr  r3, [pc, #24] Get ENABLE */
> +    0x42, 0xf2, 0x08, 0x02,                 /* movw r2, #8200 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x05, 0x4b,                             /* ldr  r3, [pc, #20] Get TXD */
> +    0x54, 0x22,                             /* movs r2, 'T' */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0xfe, 0xe7,                             /* b    . */
> +    0x18, 0x10, 0x02, 0x40,                 /* 0x40021018 = RCC */
> +    0x04, 0x08, 0x01, 0x40,                 /* 0x40010804 = GPIOA */
> +    0x08, 0x38, 0x01, 0x40,                 /* 0x40013808 = USART1 BAUD */
> +    0x0c, 0x38, 0x01, 0x40,                 /* 0x4001380c = USART1 ENABLE */
> +    0x04, 0x38, 0x01, 0x40                  /* 0x40013804 = USART1 TXD */
> +};
> +
>   typedef struct testdef {
>       const char *arch;       /* Target architecture */
>       const char *machine;    /* Name of the machine */
> @@ -144,6 +179,8 @@ static testdef_t tests[] = {
>       { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
>         kernel_aarch64 },
>       { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
> +    { "arm", "stm32vldiscovery", "", "T",
> +      sizeof(kernel_stm32vldiscovery), kernel_stm32vldiscovery },
>   
>       { NULL }
>   };
> 

Acked-by: Thomas Huth <thuth@redhat.com>


