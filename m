Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B623A6A7C46
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXe25-0006py-7c; Thu, 02 Mar 2023 03:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXe1l-0006Yx-Ki
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:11:02 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXe1j-0000cS-0b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:11:00 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q15so12884343oiw.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677744657;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vHtPkjOiXO9mXS8KZr+d+YJteZl1d4QhDAU/YQ3XLY8=;
 b=HHiBZE3Uqybgd+8O390DVqvWQYaKEMk6gmsMBwLYzvVoDza99ZUOVej0wFJtB56Ac3
 8E2W2wyY7uqHuXglT6gpGRxgcEIE50Utkn+u//7hWM2APStKQV+Wpn08V1CdvlHH/Qc8
 Q0Tusacmo68vQSoCgtRirXJAqrWf0JrefeRFw/1YWx8ETM2/E0pMkGwU9kwzmmzbeu+j
 Kr8DK+k4V/KFqRbfZMWQjuf+eLijuDoCdY9zbChz/HdafRpU5hsLs5zXp/svXsXhR+oe
 KC6uUh3n5bQW+QOeIOtfANK6OdT81mhu4HbzjGK8bGGys6ZUqmTrrtMg9Kyx1FgvToCO
 G4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677744657;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vHtPkjOiXO9mXS8KZr+d+YJteZl1d4QhDAU/YQ3XLY8=;
 b=09nc90j+Usbxlf9s7Brki/Naw58fKS+edhqpRQRIbPf7ydYfFXl7Yw3xXGBkUkYhut
 AwEsqqDIPCqDSbDPB6iUCqFjDy/1i+7c+JBHVluHcHSemoNgZr62TMORG2nCPDqoKb9M
 o+zGe7mYezuFoeygzJ5YapvUDEiPRJT3d6+qNQ3YgYDXb6EslyNbcry8RcnEFQ5IuFg4
 kbuVHl2BeTE1YzT3VgUK0edE05woEW5abxYpTrTnYmH3rRhaxNI4p5CfmGSVC6MW/y7V
 zMKG6oyfb3wxxcMSkpO21RKO2vQdi7IPpRJ3/7B5v3+sWabPXIs8qVnHYPn8MvHj4GBx
 sgXQ==
X-Gm-Message-State: AO0yUKU5krHZBCxMaJDyCqjLCrgHcvUq6Qwf3JatAUOrrq7YElQ41Lzn
 9bUutsz6zkusbXIseRjF90iPKA==
X-Google-Smtp-Source: AK7set9fQgrLLxt1HXfL/4ZHW6f96yFZ0gbAXHBCsklRYySo1H51Obtp77L2Y1EnZzamlyCpXNgpdQ==
X-Received: by 2002:a54:4783:0:b0:384:c13:d13c with SMTP id
 o3-20020a544783000000b003840c13d13cmr4431548oic.7.1677744656755; 
 Thu, 02 Mar 2023 00:10:56 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a9d7082000000b006863ccbf067sm5711203otj.74.2023.03.02.00.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 00:10:56 -0800 (PST)
Message-ID: <6ed93c3a-edc3-7e5a-c683-43391f450064@ventanamicro.com>
Date: Thu, 2 Mar 2023 05:10:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
 <mhng-c59a4d9c-9a01-44ea-b5a9-b416390b6570@palmer-ri-x1c9a>
 <CAEUhbmUtXVTC3-DFVTAaOaa3_OeP-d8sB-=PSQy4zcFXmC+xfg@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmUtXVTC3-DFVTAaOaa3_OeP-d8sB-=PSQy4zcFXmC+xfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 3/1/23 23:24, Bin Meng wrote:
> Hi Palmer,
> 
> On Thu, Mar 2, 2023 at 10:08 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> On Fri, 24 Feb 2023 09:45:16 PST (-0800), dbarboza@ventanamicro.com wrote:
>>> Hi,
>>>
>>> These cleanups were suggested by LIU Zhiwei during the review of the
>>> RISCV_FEATURE_* cleanups, currently on version 7 [1].
>>>
>>> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
>>> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.
>>>
>>>
>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html
>>>
>>> Daniel Henrique Barboza (4):
>>>    target/riscv/csr.c: use env_archcpu() in ctr()
>>>    target/riscv/csr.c: simplify mctr()
>>>    target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
>>>    target/riscv/csr.c: avoid env_archcpu() usages when reading
>>>      RISCVCPUConfig
>>>
>>>   target/riscv/csr.c | 90 +++++++++++++---------------------------------
>>>   1 file changed, 24 insertions(+), 66 deletions(-)
>>
>> I just based these on that patch, which landed as d4ea711704
>> ("target/riscv: introduce riscv_cpu_cfg()").  That resulted in a handful
>> of merge conflicts, but everything looked pretty mechanical.  So it's
>> queued up.
>>
> 
> As Weiwei pointed out in
> https://lore.kernel.org/qemu-devel/e40e75ff-37e0-94d3-e9e2-c159b0e2da68@iscas.ac.cn/,
> patch#1 should be dropped.

Yeah, that's my bad. I should've send a v2 owithout patch 1 to avoid confusion.


Daniel

> 
> But I see it was landed up in your tree @
> https://github.com/palmer-dabbelt/qemu/commit/3c7d54f945f1b5b474ea35c0815a1618927c9384,
> while my changes are already in tree @
> https://github.com/palmer-dabbelt/qemu/commit/94e297071bc0a5965cc32c497a886f2cf9d32710.
> 
> Not sure why git doesn't figure that out ...
> 
> Regards,
> Bin

