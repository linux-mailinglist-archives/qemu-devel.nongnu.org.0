Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658942022B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:23:17 +0200 (CEST)
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3Ke-0006zh-0H
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3JD-00065c-DW
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:21:47 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3JB-00040V-Bg
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:21:47 -0400
Received: by mail-qv1-xf35.google.com with SMTP id j12so226397qvk.12
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iBfPJ9zUuYNkg1cASEvGomtVpKFDEJACYpR6uOK4kyM=;
 b=V8PxZpPtTmpoqqgEsa0xsbQxSPqm+PYPpi345TradMRl2Ryua6Q2GAKXhBAOuK4Sio
 /WPiDFVrVZF9SlF41RYq15gtdye+B93koEyh2cz+BIMRheqnfJf9Ji64xQMhYFha3s7/
 byoWqMquk56H1YZWLYbkHRgfOQQ+IR0yk0aq++KRrhA1Rkwp5J2+xFPRh9YPZr4CfYlb
 WNVeelZxQtODKz1IRhLQMtTjyfor3QKZQ65tuDMkci30SecSeSio3fcU6Q0C0c/IpFlQ
 oshvlxbLfMCHNGJgJdoPIqQdWX24uPGQSoq3ZqZRuM7pocAyqzsN87jbRkLQCmiyp6EK
 likw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iBfPJ9zUuYNkg1cASEvGomtVpKFDEJACYpR6uOK4kyM=;
 b=FVOqH3QuvWZgqkdp9zFMJLG2Ou4Ezl+LQx4JoVDL3QwF95HV4Xk1875HwQhOvmbnjA
 ShEGhJGbHd5yuZq0FW6WTMUIh8HOb19f5SJ2s9KfY+rKhVoDxJ1qKQf7BrnOqHhUFsou
 p5++ipvQm5ZjGtPuNgr8kJU065RoRU6E6Vx47vz2CaQ9wGRYoDMg7NdmwQRAQdDGSkzI
 PZRDEGBAFlyxRXSYoV3qu89sMXCz5Yp7G5ZU9h/YL7416qFi31YzY4LlNT1bLRXyQqfx
 0oAPgdsHIsE3OBl1+pu2+nGielNV1tsmjseicGBoLJ6j99bb7JFjOQeRTkK2ID0KtSNe
 emxA==
X-Gm-Message-State: AOAM532SKW4vPxLikap3/4kXSmFB+9T9o5m68Hw0AmE1nq7FEwShlRKs
 KVrAa0CtXWWLALoctnwXIu+UMg==
X-Google-Smtp-Source: ABdhPJyFKUn3IUPpBs971Jh3eptap3L7m6bVfCfmNWPqkJxw7BufnZ9S8BduhDjgLVrdfLLlzIiTSQ==
X-Received: by 2002:a0c:f450:: with SMTP id h16mr18374934qvm.28.1633274503983; 
 Sun, 03 Oct 2021 08:21:43 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x10sm7694143qta.75.2021.10.03.08.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:21:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/ppc: Use tcg_constant_i32() in gen_setb()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003141711.3673181-1-f4bug@amsat.org>
 <20211003141711.3673181-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c23dfb9b-651b-f479-a248-1004b5b82e4f@linaro.org>
Date: Sun, 3 Oct 2021 11:21:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003141711.3673181-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:17 AM, Philippe Mathieu-Daudé wrote:
> Avoid using TCG temporaries for the -1 and 8 constant values.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

