Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B479168C77D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7wv-00084j-2y; Mon, 06 Feb 2023 15:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP7wp-000815-MJ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:18:45 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pP7wo-00054I-17
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:18:43 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 k15-20020a4adfaf000000b00517450f9bd7so1227064ook.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x78Jif3QAdalrc8WzGLO8KvwP+8HpbsW1oZCYsmjQbw=;
 b=JQnwhLzs8zJK8x8+OqaS+340ZyUyzCqZXcb0tiq+Nri8vQgdc/8xv/IsHdQdeV1cR2
 a7y1AJPm70ttj4/7EI2n3W3rUGvyg9YN4T60t7PXN4UZfo/CklD4mAPqF3sHr1Y9BPYS
 Mx7Y1/eyV8c0sO1efaUyEsDjkCKe4+PQQqn1ViPzQJehPmEApgsLCl2beRkKgwzaQ4GY
 9tTfLPq8tFnJXZycyTTBTZIP97hN9LRLnqppcIjaK23fcmaZruhCZISbs3vmO/7uo9fi
 dx+tfJSam1UO0MkkvQ3+H5NSTHESNIkZ1zv0lMP89W9eoADstIPbU2P/DxCouDY5REGe
 TPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x78Jif3QAdalrc8WzGLO8KvwP+8HpbsW1oZCYsmjQbw=;
 b=ttfyFSnWdbybLhosD9NrsBmToEpMRL7O48YNkxvFuSXyBRArKwNQmuw8w12hKCVUNR
 ehCgGiimcLVXC6QsGBXEB/IgnZtUKM8McQgeBWnU0gP4EVdqpVXHvK344S1KXp5J8KQ1
 fc4G283r1Bsu4cSUGTivTd8c1Cc4dsKTtLcUABEG/qHk3IwrWhjb9YKjdo4NO49IK5ub
 g89u9DmXQMasf82HKFdL8xfILybwVrlzCwz46SS9+DUoXkPhHEk7yXjEg8lZ6YFbYRgN
 1NILlX6Rfe+634KmfUZfzm6rkWDx6y9texuHZDtHNvnpaeq6c20RKPn2bhlqdt09QNl8
 ljNQ==
X-Gm-Message-State: AO0yUKVbQm5xXL1WF4xwM2/FMQfoag2gyiCeV7s/g2Zmm6Ir3dSZz4tC
 EIPMvt15uxn4RwnpA6MAsv0Fng==
X-Google-Smtp-Source: AK7set8Rht0129IGbcMhXqz3dQyySYEX1SMIvcY3lT4MoO4/KthzPR5E+ITSD0d/+k2GgZ4ZPZbmNw==
X-Received: by 2002:a4a:91c6:0:b0:4fa:325e:ebb0 with SMTP id
 e6-20020a4a91c6000000b004fa325eebb0mr114997ooh.5.1675714719382; 
 Mon, 06 Feb 2023 12:18:39 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a4a2741000000b004f269f9b8f3sm4493974oow.25.2023.02.06.12.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:18:38 -0800 (PST)
Message-ID: <b3105db2-d36b-b12c-fd0b-863cf82f938f@ventanamicro.com>
Date: Mon, 6 Feb 2023 17:18:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-3-dbarboza@ventanamicro.com>
 <21b58cf5-af07-95e3-8253-29d5b12d12e1@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <21b58cf5-af07-95e3-8253-29d5b12d12e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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



On 2/6/23 16:54, Richard Henderson wrote:
> On 2/6/23 04:00, Daniel Henrique Barboza wrote:
>> To not change the behavior of boards that aren't calling
>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>> allow these boards to opt out from initrd loading.
> 
> Surely this is simply a bug for those boards.
> 
> I cannot believe, for instance, that sifive_u should allow initrd and sifive_e must not.
> 
> Backward compatible behaviour is had simply by not providing the command-line argument.

That makes sense but the question here is whether the sifive_e board supports
-initrd if the option is provided. I tend to believe that it does, and the current
code state is mostly an oversight (we forgot to add load_initrd() support for the
board) rather than an intentional design choice, but since I'm not sure about
it I opted for playing it safe.

If someone can guarantee that the sifive_e and the opentitan boards are capable of
-initrd loading I can re-send this patch without the 'load_initrd' flag.


Thanks,

Daniel

> 
> 
> r~

