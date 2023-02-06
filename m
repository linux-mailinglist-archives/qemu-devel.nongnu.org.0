Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A190868C716
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7ZR-00036u-ON; Mon, 06 Feb 2023 14:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7ZM-00036Y-Oo
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:54:28 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP7ZK-0000HV-MH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:54:27 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 f15-20020a17090ac28f00b00230a32f0c9eso4959823pjt.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NV38CU3hEYCJgKe3Y1sJyLz9TyPHCnjRcy4RMqB+Vbc=;
 b=y8LcpvpouaAoqudKnoF67uhyuAOxWdwypWodlbZEtbueaUcW0yxga5e1JhoJH96drP
 cJwG9sC5mJgy3H33jlYiklvPkZ+/W1v3kzftcnfub2hcxQUsSPWZguMY8Hx0NtXSic1B
 OmI9K0ZhP5FIYBxUngW1CZ518bsvme/C8KDignP/HSjOFZQXk+ytpLVJdFZNmCBxMmcA
 Ii7YXO0mIA3t0OpQBQrZIktUNl+lCfo3Nfco3yFDYEfV6IPmuu9ur/Yyd2Tj8WvOp6+J
 rfTzdDCNX4X27RSUSnO+vzKBE+Xzq/d+atPeaWGuylDpu+fdpplbR8rTHPDH68JuS0UV
 5NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NV38CU3hEYCJgKe3Y1sJyLz9TyPHCnjRcy4RMqB+Vbc=;
 b=MBhIutpHVcFUksx0/h2oD2+8AHeSuwO3JZMZDKyyR50s3ouLCTzmFMVoHfL+/5TcYq
 F4VZqwAvVoJS8CfYgmH0fY3e/Ds8AZ1DQgoLdW05ib0ja0HZ4jR/VeMLcAabqDO+9T/N
 XeaDGpf9hta09Wo7/hdVuavnq7DfkG+/0jXK4kdRbwbW692Ba+IgFN+DS/iaA/9gdYo1
 Ft4CMmXFPfiu0C/DK5CJNtrry/2M2equ2h8vNe4uhw71spjun3wZz7p48Ec/E/9+8SLr
 vtPTpBq3KiqSKCGCCj2rfqFprPR+J41i7+bHFCBMvBOQktDCJIOLrQBJRInVdBEjAion
 aIbA==
X-Gm-Message-State: AO0yUKWJ7Xp/l22+v4Wy5/ZHedXN+xLhnxOdiNBnb0hWMh35/wnf1o06
 RzUpO8T54uG0EnjBs6F/WGplWg==
X-Google-Smtp-Source: AK7set9VRqF/Ve6tfoWaO6yd6/FXhbUiLuOHV41Ks8pbCReHajBwl4KeANGmKQyC0ZAyweHsweSS1g==
X-Received: by 2002:a05:6a21:6d9f:b0:bc:bf86:660 with SMTP id
 wl31-20020a056a216d9f00b000bcbf860660mr399935pzb.45.1675713265187; 
 Mon, 06 Feb 2023 11:54:25 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 b125-20020a621b83000000b0058e24050648sm7810215pfb.12.2023.02.06.11.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:54:24 -0800 (PST)
Message-ID: <21b58cf5-af07-95e3-8253-29d5b12d12e1@linaro.org>
Date: Mon, 6 Feb 2023 09:54:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206140022.2748401-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 2/6/23 04:00, Daniel Henrique Barboza wrote:
> To not change the behavior of boards that aren't calling
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> allow these boards to opt out from initrd loading.

Surely this is simply a bug for those boards.

I cannot believe, for instance, that sifive_u should allow initrd and sifive_e must not.

Backward compatible behaviour is had simply by not providing the command-line argument.


r~

