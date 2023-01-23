Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711CD677920
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJu0h-0007VQ-G4; Mon, 23 Jan 2023 05:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJu0e-0007V6-8Z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:25:04 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJu0c-0000kS-FZ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:25:03 -0500
Received: by mail-oi1-x244.google.com with SMTP id n8so9980076oih.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rgdj8fTeRua4k7SIhwr99XATVMtPD7r3q1liZ2lLMpw=;
 b=UFtwbk3jOsQy6erve0jY7+gOcu119i0eXbDW14ABYjNhnkiqfqwpRRNuV683WgFjL7
 KLBjhuT0uSyQukUXNejdTGsehIygKETKeaKBJ7ki8cYZfXP1lgdC4wYkVAzFx1KacjHI
 uH2o8WDWCIXyKQzb8UmI0NbiLXe+cWj0ZrjjQ4ep/A/JjWQJrxsUJc9yffqLXm4S2CjT
 kLcvD3c7J8g9kA2jOSvKS2QIxgGX3WWvcDYbjfoQVCtfIzjWEs27oSjaVoKcFr/ee0br
 BdHE6MTxmp1XPAZTSben6y4D5gLVsk/Hv4IfO55w4gw+z7pMZk4rZllNWW0TFtn7OrVI
 WcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rgdj8fTeRua4k7SIhwr99XATVMtPD7r3q1liZ2lLMpw=;
 b=DdMtzBu6gr0DTunhflxe2ZnPeZqer6KAE6p6z8TKcS42HeLGDWnVfX+8v53fG4Bvlm
 8aCXpJcUodT1uVyplMMQx493rhIMg797ShsH37R8JpMOQCihSnDyUjBemNZ+N2c/8/yy
 veRVj740p+Kn/cHLOEKOksFc3THsKZw2N2BmOyfZnrmea2eUyAyCngJrQyp1iNkqlgle
 ylrEPDRLYJ3LcLzziVKGc0B0PWQ0NhTgyMyTkYfDo7xdsAK16NpEd9MAg9R+8gx6JzzA
 L5dMBY/bNMBeJnmIxg+PBb+pfs9H1jZNMaPzoWHS4W/uGvaC5SOFTedD329QAkSH00PZ
 SydQ==
X-Gm-Message-State: AFqh2kowgk1SWp/N2XhIOOA7xgEZKF1RWmvAW8qUap89giG7uWjv0Yay
 haDvUtdy1+33gJvkGdy7YMc0fQ==
X-Google-Smtp-Source: AMrXdXvzKXZ4WzRNWRgXIqW4fNhGqGR84SmcOhi6fcukUoiw/xx6IVwh1nN4H2Pwl0bCmwm75vpqwg==
X-Received: by 2002:aca:5b02:0:b0:35a:54df:638b with SMTP id
 p2-20020aca5b02000000b0035a54df638bmr9904897oib.4.1674469501028; 
 Mon, 23 Jan 2023 02:25:01 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 du23-20020a056808629700b0036acbbf9fbasm8206437oib.46.2023.01.23.02.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 02:25:00 -0800 (PST)
Message-ID: <084f9a13-c74f-fa5e-19a7-e6b437f34cce@ventanamicro.com>
Date: Mon, 23 Jan 2023 07:24:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com, bmeng.cn@gmail.com
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/23/23 00:57, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> If the CSRs and CSR instructions are disabled because the Zicsr
> extension isn't enabled then we want to make sure we don't run any CSR
> instructions in the boot ROM.
> 
> This patches removes the CSR instructions from the reset-vec if the
> extension isn't enabled. We replace the instruction with a NOP instead.
> 
> Note that we don't do this for the SiFive U machine, as we are modelling
> the hardware in that case.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Shouldn't we also handle the sifive_u/sifive_e boards? Their reset vectors
aren't being covered by riscv_set_rom_reset_vec() (it's on my TODO, didn't
send it yet because sifive uses an extra MSEL pin at the start of the vector).



Daniel



>   hw/riscv/boot.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..cb27798a25 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>           reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>       }
>   
> +    if (!harts->harts[0].cfg.ext_icsr) {
> +        /*
> +         * The Zicsr extension has been disabled, so let's ensure we don't
> +         * run the CSR instruction. Let's fill the address with a non
> +         * compressed nop.
> +         */
> +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> +    }
> +
>       /* copy in the reset vector in little_endian byte order */
>       for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>           reset_vec[i] = cpu_to_le32(reset_vec[i]);

