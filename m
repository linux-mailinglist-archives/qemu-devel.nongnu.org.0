Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115F64EEFB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DVq-00033n-Mu; Fri, 16 Dec 2022 11:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DVm-00032v-Bz
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:24:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DVk-0000Eq-Nl
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:24:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2168907wms.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7MPFwM0yqvpQQ+XAscUrtTg2RXlP9g2lEbUsyv4y5U=;
 b=YgN2P0SWuCnVMmGJOw1WEGlzHspp9/UeAWfmlvilG38aaVR/iQ4Y6R6FWDBfQ37M4K
 yI+J6/IzqoOvcyFW6jLKedf50Dkvw5tu3X7vv/kSSWnaoWZpkzibyhbVCIv63R689I0s
 HKz9cjjZCteD0X3b4E6l3hRdZgKQniYfLxGdTbFw62ejb6Woi0P5jrT4wOIW3ANhMM2T
 ON55s+sU2aZr97h20NmYO1cJFPEhwSS/5QXrnFFMbzPBZF7SScM1LLAR7ApxLexvJg+b
 TGYQvwmRjUNE7JdilsaODoQYRMvsEFdd4gafX84uXuYdPPbz5YgQBwHr9B76AQOVBqR0
 AKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U7MPFwM0yqvpQQ+XAscUrtTg2RXlP9g2lEbUsyv4y5U=;
 b=SiEGSh31xmGVzkY+JfpWlUt2khl1xlnuizoZBYLmGV0cxJwYEBGWfuuiaeQT1yIN/w
 AzdA3tFFytr27qJlA2+rTlMQ/Ae2Ay29NiFmPeMrzUXdouw2GAC7tZdGHhDyx/2ACUH/
 6Lf+cqLhxAQHmSaT70fcV1/hhXN75iqUARgBYmyRX21EtK+eDmj+YAw1S3ZN5dBxOiH6
 DBBI8bJeD/ffNCT+mjaK/hf2rHDpNsN8RVrEl8IrXWeR/WIIFwpia7A0AFK1Omi/n5op
 BS7Ggo6GD64Izpgou0QXEyLqxDc/lBVoqiIsasFnkOKxL2SpH7Ml4icnMEAr19fKcPtU
 v+ng==
X-Gm-Message-State: ANoB5pn5YdGxs2u3Vhf10+x+Os0hb2SEJX10R6shAmWag9UVgQgGIdj+
 nDnMM77GDw6bvzD8zC+zrZiBbg==
X-Google-Smtp-Source: AA0mqf5bJgHIF8EQTr+KFBvCB+oZ3Gi9u19ehCFWHQbhBMd/I3aeYPlrGi8mlh8FgxOenrgYHBZ9Tw==
X-Received: by 2002:a05:600c:1ca1:b0:3d2:bca5:10a2 with SMTP id
 k33-20020a05600c1ca100b003d2bca510a2mr5987954wms.22.1671207875363; 
 Fri, 16 Dec 2022 08:24:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c290300b003b4fdbb6319sm9985291wmd.21.2022.12.16.08.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:24:35 -0800 (PST)
Message-ID: <78236db1-8f9f-a1fa-881e-49d4516d7a68@linaro.org>
Date: Fri, 16 Dec 2022 17:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/6] target/ppc/mmu_common: Fix table layout of "info tlb"
 HMP command
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 16/12/22 15:57, Bernhard Beschow wrote:
> Starting with the URWX columns the columns didn't line up.
> Before:
> 
>    QEMU 7.2.50 monitor - type 'help' for more information
>    (qemu) info tlb
> 
>    TLB0:
>    Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
>    0x0000000000a80000 0x000000000105d000   4K 117   0  SR--UR-- --M-- U----
>    0x0000000000100000 0x000000000114e000   4K 117   0  SR--UR-- --M-- U----
>    <snip
> 
>    TLB1:
>    Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
>    0x00000000c0000000 0x0000000000000000  16M 0     0  SR-XU--- --M-- U----
>    0x00000000c1000000 0x0000000001000000  16M 0     0  SRW-U--- --M-- U----
>    <snip>
>    (qemu)
> 
> After:
> 
>    QEMU 7.2.50 monitor - type 'help' for more information
>    (qemu) info tlb
> 
>    TLB0:
>    Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
>    0x00000000b7a00000 0x000000000fcf5000   4K 18    0  SR-- UR-- --M-- U----
>    0x0000000000800000 0x000000000fd73000   4K 18    0  SR-- UR-X --M-- U----
>    <snip>
> 
>    TLB1:
>    Effective          Physical           Size TID   TS SRWX URWX WIMGE U0123
>    0x00000000c0000000 0x0000000000000000  16M 0     0  SR-X U--- --M-- U----
>    0x00000000c1000000 0x0000000001000000  16M 0     0  SRW- U--- --M-- U----
>    <snip>
>    (qemu)
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   target/ppc/mmu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


