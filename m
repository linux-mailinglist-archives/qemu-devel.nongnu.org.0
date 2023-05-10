Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9C6FE232
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmRg-0002iS-5K; Wed, 10 May 2023 12:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmRd-0002Zp-Ab
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:13:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmRb-0000mp-Sq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:13:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f423521b10so29336705e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683735214; x=1686327214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=owoFlcBXqkHmvvDOCRfpFBLy1FHR8tbL+nE+RuqqEXs=;
 b=rJ4XhAIyITkBJfmW61tdGm0H+XzGRCbmao0vNue83rp7fHUcYtONIn0i6VMYmz595d
 mX/GpSesvYSv3N7AQELDoIampzTKeQufofZNwCUba1jeIlQcwq0jtl3aoGnU9mcrGhD4
 OCFrOD9CdrYnP8lZgpCq3tFkzNUQf4IjANVxph3MUbmH+UrdF+bHvWaxMTznXwyZuBrx
 rX4FMY4BuT69S0qZpuGLtxfWO7rsQMwtzYgs2FP/TE4MX8L2qKP0nfndPmERpKb8MVut
 YmmbObG99C3WzBXPvRgVUbyOKBT4gRhtotb0uEOTanvA+U5joE2CIUQLLpVedj5Tr9GD
 oDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683735214; x=1686327214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owoFlcBXqkHmvvDOCRfpFBLy1FHR8tbL+nE+RuqqEXs=;
 b=SjoKX/VSxy8q6jSrWW4QRsDb3mLGy/5jx/OO5wYflzHRGwkbZs15Q74lldWEPCvD8N
 tvCalTn6T1iY4H6Rt/9AsWhG5JoBQ73rja1pjVtUzzhnrFdGZfedZBzcvrd/3RvwQHie
 tF2JPvTFXox6CnB9RFOYYP9qkVdepSa0Fdg3TWBNXaeAlLVxJT586nZiCXb2e2q0XmQK
 VSW/qBlFGyXW49g+zqMNMh7+1vssmNn+W94z6GaQZ8gKtjV9hXFcwFs36mSqAXt26i6Y
 Hfiw/WvaDXxqEkLLWOhZx2J/HCSiOLUsaLe6tc9abRVsgZN333fLNfr0519+WXdQvLM6
 7UEw==
X-Gm-Message-State: AC+VfDwi9nfAZtCdcgdNqTfbxzDs+Xy7Rh/za27Y1iwsb+9wPgbL+0/X
 /Pz0ai1xvhxe+mmmgPjH4zzBPQ==
X-Google-Smtp-Source: ACHHUZ7svkWwxUnYEyp3hQGN1v9KKSnqgrDs4RDgl+SspxKvcQBv/xH5WbC3gb+rc7oFw8ZClTaJAw==
X-Received: by 2002:a05:6000:b:b0:306:2fac:377 with SMTP id
 h11-20020a056000000b00b003062fac0377mr11621807wrx.8.1683735214159; 
 Wed, 10 May 2023 09:13:34 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a056000137200b003063176ef09sm17982018wrz.6.2023.05.10.09.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:13:33 -0700 (PDT)
Message-ID: <02b1e71e-8578-6f4a-5b57-9cfbebff4842@linaro.org>
Date: Wed, 10 May 2023 17:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] target/openrisc: Set PC to cpu state on FPU
 exception
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230510153228.264954-1-shorne@gmail.com>
 <20230510153228.264954-3-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510153228.264954-3-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/10/23 16:32, Stafford Horne wrote:
> Store the PC to ensure the correct value can be read in the exception
> handler.
> 
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
> Since v1:
>   - Use function do_fpe (similar to do_range) to raise exception.
> 
>   target/openrisc/fpu_helper.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

