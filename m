Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D16F972A
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 08:29:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvXs7-0001XC-1Q; Sun, 07 May 2023 02:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvXs5-0001Wl-M6
 for qemu-devel@nongnu.org; Sun, 07 May 2023 02:27:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvXs3-0001Ec-7g
 for qemu-devel@nongnu.org; Sun, 07 May 2023 02:27:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso22060665e9.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683440865; x=1686032865;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxP2U3iurbtu/cw4n+D12RxXkJJKfiaDL/n38G6OOTE=;
 b=CL+WWvc6MpFRZ07QSDmeB3C2S0BwNptEkJKWxk2+c+KsOsDsMc+ZqjwYCRxxe7VMWg
 X67XEZbIis+fEjr0fIM34aAiiYCoRNxpCwQC7h6cjlWo4Li1lNvGkgZJWvS1BG/XF2Ib
 tgd/Ryg3jZ31FSd9AL0NJ2aR6EAnjBHF0NdWgLl4wQ+5j280FFNz70KPU/MfIURHrLzO
 xTIj1ZfBzdXirS0Rme/MyZKqRRMth7gfuqQuCLiB8Qp8e/PZ6mMGK3O+/x+9rpdr+bLQ
 VZ2vuUy8HxMU77oGsvqYDkg9dAvbq9vXy16AZ1UgOu80XoH+gjQZkXrEcjk8CiyaCVRw
 1WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683440865; x=1686032865;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxP2U3iurbtu/cw4n+D12RxXkJJKfiaDL/n38G6OOTE=;
 b=c01Gki30gQzvmtWyT2wXWMsUiELVyc13qktaU2AAI39Z4x5ytzyt78gj/r3J5aNiIv
 3g4JznuHnH0RqIYmBK+WNSAPOseNI6iFSkpNAAp3W6gMWJB6riEe+cxQcn0yY3wA95Ox
 yf6C+yQ4WLTHkP6q1Ym/U1K05/xAq0nxToPk0K2lOqjUUxcgNx7lAVaStrk/L8sBFHHL
 XZ9mTzUPhUaFultKtPhbXQgKayHULz9nR0QYKzvLeBjZ5G8xWW5TF+fn9ypI9nc2LR1W
 GQbh2aNNktWJUitp1SU6FQCR2tcw68MHETe0veFE0FRdktV2FYEn6TgwhfdUjknyp7dI
 Tmjw==
X-Gm-Message-State: AC+VfDzG4apuvOq65Uzg9E9t6AEjK9Ewo3zFCbJTPyJvfREmsGlde28E
 AFaswGaRcn/Gd2h1tFQhd4hODg==
X-Google-Smtp-Source: ACHHUZ6sZBH5055muGnaqmcCh6+xUFfprNJX3ykqhx+1et48V2V5OoIGxobctjcBwFlFG1ftiyNYLQ==
X-Received: by 2002:a7b:cd0b:0:b0:3f3:fe82:ee8e with SMTP id
 f11-20020a7bcd0b000000b003f3fe82ee8emr4073279wmj.40.1683440864998; 
 Sat, 06 May 2023 23:27:44 -0700 (PDT)
Received: from [192.168.20.43] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm12849572wmh.27.2023.05.06.23.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 May 2023 23:27:44 -0700 (PDT)
Message-ID: <db24af2b-86f0-45d2-5dcf-f3fcae1dea4a@linaro.org>
Date: Sun, 7 May 2023 07:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 6/6] Hexagon (linux-user/hexagon): handle breakpoints
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, philmd@linaro.org,
 Laurent Vivier <laurent@vivier.eu>
References: <cover.1683214375.git.quic_mathbern@quicinc.com>
 <c287a129dcbe7d974d8b7608e8672d34a3c91c04.1683214375.git.quic_mathbern@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c287a129dcbe7d974d8b7608e8672d34a3c91c04.1683214375.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/4/23 16:37, Matheus Tavares Bernardino wrote:
> This enables LLDB to work with hexagon linux-user mode through the GDB
> remote protocol.
> 
> Helped-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> ---
>   linux-user/hexagon/cpu_loop.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

