Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26531BF8D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:39:52 +0100 (CET)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgud-0008UE-3u
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgtH-0007yA-Vw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:38:28 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgtG-0002Me-CY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:38:27 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 75so1126468pgf.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GPHqm3YVrL9VkrcMInzslOUDB7Ymwyqx9roo4qagmus=;
 b=r0jNSDquQa6hkv9LeNinXFDG1wNeaad8DlNPspt7pyRZ9vugS9ZOglBzcUglD4B8xa
 Ncqbra8uxek2D0MD6Aa6ncE105Y0hSo/rPXKiStB6nBMk45jN7meu5wnj9DGhnuDC1oZ
 qXtKd57A+2MxLr1LZFyMl8WB0q8YmSwvtRF9obnV6nNKUBnIKMcQziHzONRNYyuALZ4A
 aOqxZx6GxT3P/OhUC4XM0aHv8R05e9b0uTwjG1HO7EAdL6eOfDExHmIO5gr9a/4verNn
 3e5E6Fll4/gjYoS1cRWeP9ovy+5xg7okBwaAF2cIrayaY9CjVsxpNeVSc/qDKcZ/Assh
 yKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GPHqm3YVrL9VkrcMInzslOUDB7Ymwyqx9roo4qagmus=;
 b=WncCooaHmxesgNgF2ySrv2Ofm1fNITh/m7fBbVyHlkrnG/pe3syLgxbTTtZDW+8hbe
 mnfDjFreQICLUKQ9lcuWJeg4qx+8tdgwiDPRrM3cVrp8MiIaqufUYCI5gDGkYIfixb6k
 K3OmTKNW8d9/+HEDxgFEzGHybWgYmoTs1k3PpzL/GN72p97XhR0IBFtTHC2/nBtfNv/U
 FpCi0/+KHBFDQTULdRdyOOZHRCEVZ5q9FzTqfOjvGGWEyVTy7imE86TL3U17bUrzawaK
 m62M4+81SCGmb5VZViV3ZeCpN9WqYyoqSR5bU28816wCShOSe0LMeI22V1UWQBh4ISnh
 P3BA==
X-Gm-Message-State: AOAM532jOHfyKp48d8ok5WuRDBvI2MbO3Z3EfMorqzhyav86i3GFfEKu
 E4DAc+PbN8xzK7rQ3X+3AJcI8av8SAUpPA==
X-Google-Smtp-Source: ABdhPJzxB2Qy7x8D4IbGvICV1dTuXp4FxyqRrjJ3whYodCErDgEPrlNCDo0A+V8+c3fOprK3MVVeUQ==
X-Received: by 2002:a63:1e4b:: with SMTP id p11mr15960524pgm.301.1613407104965; 
 Mon, 15 Feb 2021 08:38:24 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 q188sm19461629pfb.8.2021.02.15.08.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:38:24 -0800 (PST)
Subject: Re: [RFC PATCH 16/42] target/mips/tx79: Introduce PSUB* opcodes
 (Parallel Subtract)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd568d8d-a60f-5644-f8d3-5163ec21173d@linaro.org>
Date: Mon, 15 Feb 2021 08:38:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +/* Parallel Subtract Byte */
> +static bool trans_PSUBB(DisasContext *ctx, arg_rtype *a)
> +{
> +    return trans_parallel_substract(ctx, a, 8);
> +}
> +
> +/* Parallel Subtract Halfword */
> +static bool trans_PSUBH(DisasContext *ctx, arg_rtype *a)
> +{
> +    return trans_parallel_substract(ctx, a, 16);
> +}
> +
> +/* Parallel Subtract Word */
> +static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
> +{
> +    return trans_parallel_substract(ctx, a, 32);
> +}

We already have helpers for these operations.  Use your trans_parallel_logic
with tcg_gen_vec_sub{8,16,32}_i64.


r~

