Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A755663F66
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFD2Z-0004ss-5V; Tue, 10 Jan 2023 06:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFD2X-0004sI-Sl
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:43:37 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFD2W-00040E-52
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:43:37 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so6795289otu.7
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 03:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jPYn0BgthB1rBM30u9n6ldnvwVWtUmfYKDvMZZfODWY=;
 b=XvZ8R31Q6AxCW7Djs+l66CnHSuJPlSIw9dwuCkcHcqxOO7BcbQntNEuViGithK+0np
 Tt6FVxOnF+8Gt6p3NYziFz313e4su3dinXE9+gTBxAWh4Mffh9vUYkwttrHZxDRgtxqd
 RrjXnzo+PDCXM7ZuI710H2aWeDRb1y8fDxTX9NssKPFFmeaPeOtjZb5bWQr28yYOtKlI
 ERiSPyQegnpZ5l9lFT4dWWGzxM6+MDD957rDT8Id7aG7R5LaHZod0xHBlsmh1mViEXWU
 VsIAoABiwoRQsohBgGzYvp3wjCKMLtpAmVj4TB1S63CMLaaZIab038xLKJCayaLQiksC
 4Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jPYn0BgthB1rBM30u9n6ldnvwVWtUmfYKDvMZZfODWY=;
 b=GZu/jI9lNz1R/gXC55iVVGtlK3O3bhMicdOQSDcdEg6cCjnmxkeyXw/H2jXFVKAvbL
 RY50Ccwxf+Ikr7IIgduM79A1hD7SMNZQLWUXScomXcKHYtpdqgqQSEHyYc90RaifofXh
 QJiJya7UNK+bs2Z1oaid37xljHm/B+fKPaNf8UAANSHuO8aewCOq52Nxtyei5GBD6c7g
 u+zg86K3Yzqf8rjBZvLxrVYrCzPo2R5lDNLJOZiMsUcRrL63QSFw6MD97gFNOXCTM0JH
 +BGF/IIGA/19dEa5qu7qqw3lc4juuXv96EmjvPKilSDn8Hg6FGf96wvaL+likh/PzNs3
 YJDw==
X-Gm-Message-State: AFqh2krKOtz+UJ1rcO1/ufQWveHNwoj5YNsqrp8FlqthdJ/uhdnwrdfL
 aqCGWsnhoKNb740jkN42qMFhiQ==
X-Google-Smtp-Source: AMrXdXs4j8KBktuzi5NTEJoT9VHwVRLAYGwhbLyodCQzHoRuIjhUGGfTETJu8+wk/AT8/kruz4+yQg==
X-Received: by 2002:a9d:12e:0:b0:684:9ce5:9b15 with SMTP id
 43-20020a9d012e000000b006849ce59b15mr1487440otu.29.1673351013978; 
 Tue, 10 Jan 2023 03:43:33 -0800 (PST)
Received: from [192.168.68.107] ([152.250.93.24])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056830271400b00684152e9ff2sm1630410otu.0.2023.01.10.03.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 03:43:33 -0800 (PST)
Message-ID: <1adba771-6632-4f68-d72f-4389f9ce7012@ventanamicro.com>
Date: Tue, 10 Jan 2023 08:43:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAEUhbmUfWbssTO1w8q_VdrWDHE4JLdJvZGkkt_w+KChsR5P32g@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmUfWbssTO1w8q_VdrWDHE4JLdJvZGkkt_w+KChsR5P32g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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



On 1/8/23 00:33, Bin Meng wrote:
> On Mon, Jan 2, 2023 at 7:55 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. To not change the behavior of boards that aren't calling
>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> typo: should be riscv_load_initrd()
>
>> allow these boards to opt out from initrd loading.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>   hw/riscv/opentitan.c       |  2 +-
>>   hw/riscv/sifive_e.c        |  3 ++-
>>   hw/riscv/sifive_u.c        | 12 ++----------
>>   hw/riscv/spike.c           | 11 +----------
>>   hw/riscv/virt.c            | 12 ++----------
>>   include/hw/riscv/boot.h    |  1 +
>>   8 files changed, 30 insertions(+), 45 deletions(-)
>>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Alistair, let me know if you want me to send another version with the commit
message typo fixed. I might as well take the change to rebase it with
riscv-to-apply.next.


Daniel


