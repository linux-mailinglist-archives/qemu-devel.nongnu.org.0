Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4BC69EC1E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUdLp-0003Xx-Q4; Tue, 21 Feb 2023 19:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdLl-0003WZ-OV
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:51:13 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUdLj-0005sh-Lb
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:51:13 -0500
Received: by mail-pg1-x52d.google.com with SMTP id bm5so3334401pgb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+2o2184tTedpF1DFxmSV3KIZ4QRLrw6xufGH1xObmqA=;
 b=MCmHr92AiLAuRwCxmo3GdpoH574h2D/mFAZyQbx7UM2Rez5pCtXwXYiX1GnnIHAS/O
 oPVztoBuP4DMO5F4tFQo/9tCqU9FjXTEaAZ/tqehfX9zhjP9WjWqYpS8QIfcrov5xJ1y
 JyVWmNdpi4/wGtgbngLc9W1xcL36yEktaI67goCvUzdwvI/ndsRw8LCqT1y28wMAJCuA
 RCX/h4D0KOf1uB2bCZ6RMA68j+pFn3H40Q0sTSZCSsx8YvzGJVgn4p7RsJIE5gmBzngt
 IzdETSWsQ0cYIACU81JURHreB1S66dDhz2+w6XQWx+b2ZocstffmaT3vd92tWdqy+Fpv
 lJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2o2184tTedpF1DFxmSV3KIZ4QRLrw6xufGH1xObmqA=;
 b=vnuKY0mCk0izFcmd4cDtqbLX0+Gz7N6ZncsgI2YQhNyd3vUS23GEFDOMq2PyfBlKsB
 njrM1iGtzzbBiqyFFuu6PiLXgomj0ZkeEC+9LyMbCAYjnQGrHAJ2rFD83qjFXRGQXUy+
 JalLP2c+gVrJRLi+JZ+jZe0qseB3h3LTzEfeEh2SLrf9lDCyKBz5DQszxHNks0eyIGM5
 iR9oE46BG+AafFhaexHcpVs2qKuGu0OE8mx75T44eHlXcvgrv1udqZ37jVgDB2VP+Q4F
 88FqXbenOcHBfB1CFQUgv+M6jM30pnMBPgUe3pWBn0D8u/+/DyU1qYMhJXs6BjgVhJyw
 RUJQ==
X-Gm-Message-State: AO0yUKV7d9dPUw9LkvybqRkLtuxvRmXBdgTX10CGX5bWpJYZTBsxgdZg
 53w3RbbsA4UmLLJ9+lAmA4FenA==
X-Google-Smtp-Source: AK7set/j/H+fs7BBwA/A5UUyLfrbGsRIN0arT3cUG4gC/jUXdz69meut5xCErgRaa++aSmIa/fIpIA==
X-Received: by 2002:aa7:8437:0:b0:5a8:bfe5:3076 with SMTP id
 q23-20020aa78437000000b005a8bfe53076mr5105570pfn.19.1677027068904; 
 Tue, 21 Feb 2023 16:51:08 -0800 (PST)
Received: from [192.168.6.128] ([173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa78e0d000000b005a84e739d3esm2506356pfr.33.2023.02.21.16.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:51:08 -0800 (PST)
Message-ID: <7f40a55f-7723-537f-ded3-96527481faaf@linaro.org>
Date: Tue, 21 Feb 2023 14:51:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 18/24] gdbstub: don't use target_ulong while handling
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
 <20230221225227.3735319-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221225227.3735319-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:52, Alex Bennée wrote:
> This is a hangover from the original code. addr is misleading as it is
> only really a register id. While len will never exceed
> MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - fix commit message
>    - use unsigned for regid

Don't use unsigned, which you did here:

>   static void handle_write_all_regs(GArray *params, void *user_ctx)
>   {
> -    target_ulong addr, len;
> +    unsigned int reg_id;

but not here

>   static void handle_read_all_regs(GArray *params, void *user_ctx)
>   {
> -    target_ulong addr, len;
> +    int reg_id;

because the comparison,

> +    for (reg_id = 0; reg_id < gdbserver_state.g_cpu->gdb_num_g_regs; reg_id++) {

is against signed:

include/hw/core/cpu.h:377:    int gdb_num_g_regs;


r~

