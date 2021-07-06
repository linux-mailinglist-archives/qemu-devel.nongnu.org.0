Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A13BC5D4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:55:19 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0d78-0007dq-Or
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0cuu-00044a-Uq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:42:40 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0cur-0006Us-TL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:42:40 -0400
Received: by mail-pg1-x531.google.com with SMTP id f5so10927012pgv.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hMpnLRpsoyGNatujH4EZ7bM8Cew4CtyBDhlLMRWsfhI=;
 b=sZ0DRUP23Sb/9HnJPOq0bCu9iOP2eK06s34bOv/bF6IYiVADFPPod2NabOl3d1t27L
 QqFsR55G1qkcel0osMDmXIHX6GejMFfGa0uxlJoGd+jc/Q5GBymEJomNDM6cjD8CqAEM
 a3TPU/ULcXZkE2TVdbh2cFehFrhooFu2rXLzOfIJGPqwPeA8iV3O6qn5mI//2sL3pyIQ
 nwIVZ0eHI9iMobyGsKteQOYha9IxuNqlu7sT5oevRUlIYjZDvweLJbTkWEd/XJzX+r84
 s1U6CYWTfRKJ2AuOhuT2VpdEcZQfBk4KMWrGoWmBq0r9kiznMEMdCVWGk+E0307Eukce
 nEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMpnLRpsoyGNatujH4EZ7bM8Cew4CtyBDhlLMRWsfhI=;
 b=PfbA99Wgy8i9q/mFqIG86gGQ6KBHwgTdJ13Y4YQ/RFINILom7Nzhnqx10jyKU2/pII
 eG9ixoG36GEVpv065Bg2ypImyYcaU1tWzxpb+T5BvRvKz4C5zhez88XQTjsuMJm/QDUT
 3dP1J114lGzGJ3UUDLAhF0jnN9tqVofpAJtt1YInSJPRL9rgv213L2L2ckmtmkOVJAhE
 hXw0CY+79VRjH6jLX1hTB1rpifBBhmhUFQoyhuwXjtzqRmmn0rrP42ZDunldUb89FoOE
 3D+zu/qG8Z8KSXL9l9VhTn5VbXxNWiV+yElOGJlaK6Ns9ZBbMKMsvSznqdHvyCJRKtoG
 prJA==
X-Gm-Message-State: AOAM533GzT0ropTRYP5cTfgk3lwbwpiJej/NcPwW55U8MrU1Dzjt8UIb
 C1+LDVjqrlMKk3ZVwYSbWQSTpA==
X-Google-Smtp-Source: ABdhPJzhrnuv4G6sWxoq9Zyn/9Y0/wDfeHZgnIh4b/JuddjkFdvk9O6QUXAUrP7yOC9NFVaRgle9iw==
X-Received: by 2002:a63:1c53:: with SMTP id c19mr18842685pgm.332.1625546556250; 
 Mon, 05 Jul 2021 21:42:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j15sm1113764pjn.28.2021.07.05.21.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 21:42:36 -0700 (PDT)
Subject: Re: [PATCH v3] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210706035015.122899-1-kito.cheng@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00873491-d7f4-1d46-8a9f-b05f11c1a0c2@linaro.org>
Date: Mon, 5 Jul 2021 21:42:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706035015.122899-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 8:50 PM, Kito Cheng wrote:
> Set I, M, A, F, D and C bit for hwcap if misa is set.
> 
> V3 Changes:
> - Simplify logic of getting hwcap.
> 
> V2 Changes:
> - Only set imafdc bits, sync with upstream linux kernel.
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> ---
>   linux-user/elfload.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

