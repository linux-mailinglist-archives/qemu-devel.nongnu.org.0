Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152B3BE09B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:35:23 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wTC-00077E-MD
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wRv-0006CQ-Gq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:34:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wRr-0006Fw-Q3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:34:03 -0400
Received: by mail-pg1-x529.google.com with SMTP id d12so576803pgd.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GfnO4w7zfONq/KjtjkwO2tXT1byxVRFhpgIOQqCHeBM=;
 b=RaLkM3yL/0pR9lSYi1peHOzXj6rYZZQ8lvUtZkyykLWeCUluydcEfWiU+1NJh9g+kj
 LMKdoZvHCh+lfPzSeBgCzzp9TLKWwgBBJBB8ZZ3xSbc59k2i+QDm3yzqHtjeoqgCwxMu
 NhlsBcyi0xIQlTuUnQAyFV5/7M9ncf5uf5iOWuMAAqPwiW6K6egwVhLTQj7zRaPj1Oml
 K50YPDYJjXxEOb3vOYncUS1EqmgcQpk4VupSH/6n6kwK/hSdv5W9HZThebHe5BXI5pPb
 buU2xc+eB+hgY5V3FJ+tjmP4bbNR/Nxosfy3aI7iGfKuDj3Csz+iOkWSnuWFfn3kyTdb
 nUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfnO4w7zfONq/KjtjkwO2tXT1byxVRFhpgIOQqCHeBM=;
 b=ftA33l97VxTWDi7kH+mXeEynet3DfzKE9weFcIqyE5sMZgOxpXh+vbbHw9n53hs0kq
 FI3nbhalrFQ3oylKpVnBOmnZcEEZLoYVsjPbp93CgMKWuA10kN9QJZQURtM5jmTxz2zS
 n31gcjr1muwSLugWMRoLteqi8WdNHeLWn0eeBebT37m64oDGRuVXQI95XN1eTUQCICD+
 Gj1dnxuuwvvgm4wGKY4W59eKqHAh4lMirbkPHhzCwU0Orwjnd0H0YXwDUcfK3q7Bonul
 Ea2RRBxbe9FBvqfy6nqpYy601ld8OKgIARObN8/iv61l3QUElYfsn9ULSlUhx2QFhMJ5
 3UOw==
X-Gm-Message-State: AOAM531C0E2rm3BX/nA7HS1zk6nKMYCONAORiK4+h7yvAFIv0H+EhzWi
 SJCjk1ZDMz/fvKUdeasWXkdHVA==
X-Google-Smtp-Source: ABdhPJz3gM+l3NMIlen7IHSfYvav6EdVazHDigBvNre3KI29XxTuiqc91YqxGu6ERBksZ+BxHm3+rg==
X-Received: by 2002:a62:758c:0:b029:31b:908f:4507 with SMTP id
 q134-20020a62758c0000b029031b908f4507mr18578145pfc.42.1625621638538; 
 Tue, 06 Jul 2021 18:33:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s126sm18038749pfb.164.2021.07.06.18.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:33:58 -0700 (PDT)
Subject: Re: [PATCH 09/11] hw/gpio/pl061: Convert to 3-phase reset and assert
 GPIO lines correctly on reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31d9f554-8094-01ff-a7f4-a2645016d1eb@linaro.org>
Date: Tue, 6 Jul 2021 18:33:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> The PL061 comes out of reset with all its lines configured as input,
> which means they might need to be pulled to 0 or 1 depending on the
> 'pullups' and 'pulldowns' properties.  Currently we do not assert
> these lines on reset; they will only be set whenever the guest first
> touches a register that triggers a call to pl061_update().
> 
> Convert the device to three-phase reset so we have a place where we
> can safely call qemu_set_irq() to set the floating lines to their
> correct values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
>   hw/gpio/trace-events |  1 +
>   2 files changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

