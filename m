Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53A6EB581
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 01:06:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzoz-0002kj-DX; Fri, 21 Apr 2023 19:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzox-0002k2-TE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:05:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzov-0006ef-8e
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 19:05:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so1416826f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682118335; x=1684710335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v4E/TTQoNyryE4+v+kHxboiFONAq4RAlalVf9lU2Xuo=;
 b=zb4yTepiMnvUtKtLSEy0jtg97JDHqezV7lz6JaYUhz9hkn/hRbDIj9q5Z1Ukvip7zd
 xzvvKUzl5LBRUjywqhoYONnqaXBweKu36ghZ3v6sitzR/Ke6Yn2BjicyAbhZ5FG/jlOO
 WweGyQPlCZiIEeiz4JpigRxId0+DispJKjqFNVj4dNRH112Ncm7ngdS3Sl8Sn4Pyc+eo
 N16FHAEaujzlJJDNvaehFMDghd28MkJ4Kx7E6LRdxgv3x5A7E1+L3MK0S3VkombYLNuI
 yize2VSqULDKg1ZtFBPRmnpBHSFhSv8VpF2xd5mUUeQ12mcyxnuSAwrBNlP6sMcLQvY4
 s7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682118335; x=1684710335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4E/TTQoNyryE4+v+kHxboiFONAq4RAlalVf9lU2Xuo=;
 b=P9Fb13PxJTkT2sIcfJOCOfuIE2HRsSl6pZq9A4xqqsZTGrjw/4FYYkYQ/J7WMOtuFr
 sqrkewWC6pBbDT/9OypzaoRKiytMwIBDw6lqNnESToxCg7965DoaXfTahwwRFaoNnOsC
 0/8QktY5OQibAMuruHf+Ovg0O1FDiQtOLcud1a1oXp13IoeBfBTYV1r4c99H9GWxYTA2
 jC75N9yQegGmiYOXj/p8xmgrdnqLTBLdZpamT/sKDkIVAZ19mA6th0OXj9PJVvphRJpZ
 x0ismNjSRf6ncndnKq8c0TrvX3dMZvcU92llGyVuwrQHS6fnwsSSMWBuT8DCB4PSLhiR
 ErRQ==
X-Gm-Message-State: AAQBX9dz2vi53G02409NNe6PQFjtAJh0Zh0AM+mrZYdIoSSQzIjoCqM3
 x0RNiUb2YkS7PHGnpIvijqF1kA==
X-Google-Smtp-Source: AKy350YdkaKecX85PkG48SKQa+Gb6oNmqs2SFZ6vDE69SkZqD/ePGxpRszwErYCCUQVSCbECwzsFQQ==
X-Received: by 2002:a5d:66c2:0:b0:2ef:af46:1278 with SMTP id
 k2-20020a5d66c2000000b002efaf461278mr5584797wrw.10.1682118335637; 
 Fri, 21 Apr 2023 16:05:35 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm5320864wrq.94.2023.04.21.16.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:05:35 -0700 (PDT)
Message-ID: <1c175f9c-180b-5181-1e33-4d9fa13a00ed@linaro.org>
Date: Sat, 22 Apr 2023 01:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 17/54] tcg: Introduce tcg_out_xchg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> We will want a backend interface for register swapping.
> This is only properly defined for x86; all others get a
> stub version that always indicates failure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 2 ++
>   tcg/aarch64/tcg-target.c.inc     | 5 +++++
>   tcg/arm/tcg-target.c.inc         | 5 +++++
>   tcg/i386/tcg-target.c.inc        | 8 ++++++++
>   tcg/loongarch64/tcg-target.c.inc | 5 +++++
>   tcg/mips/tcg-target.c.inc        | 5 +++++
>   tcg/ppc/tcg-target.c.inc         | 5 +++++
>   tcg/riscv/tcg-target.c.inc       | 5 +++++
>   tcg/s390x/tcg-target.c.inc       | 5 +++++
>   tcg/sparc64/tcg-target.c.inc     | 5 +++++
>   tcg/tci/tcg-target.c.inc         | 5 +++++
>   11 files changed, 55 insertions(+)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 328e018a80..fde5ccc57c 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -115,6 +115,8 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
>   static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
> +static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
> +    __attribute__((unused));

Can you document this in docs/devel/tcg-ops.rst?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


