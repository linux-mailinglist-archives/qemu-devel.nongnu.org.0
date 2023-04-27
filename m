Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623A6F023B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwas-0008Ry-57; Thu, 27 Apr 2023 04:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwaq-0008Ro-8t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:03:08 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwao-0005O2-OR
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:03:08 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-956eacbe651so1498245866b.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682582585; x=1685174585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dGHc89c3UdTLkFNCDbIwqIHNEzyfbm67sQoe8R0nzXQ=;
 b=FjS1t+I5ZkXbOD4M0dwCoeo+Lbj772JNW5KBa6cSE6tmyolqDVnYpEUotSWwusMlJP
 tNbsJ2WYoIhdQ0jy1WV/TCqzczs8YHMj7eubygShosAKPHCgNNm6WCSXBDmrfr7P+bQy
 l620vLAD6Ug8X18Zs6tW1L/9AYGfI1GWukmsVCrkgjJwNcoXKBqS3isMHIFJWBLAkwVk
 U1rverETeIVNVWtZzseYeLZ349meUUc7KbC8UrXKIqelUUOegwwyGiFMHXSoTrrjsPvW
 21EZ1hIf85gZO2DLAK86STu6Nig7Cac2vFBxUfJneU1/CG6WIOU4jU/m1zf98q2wQUcX
 lyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582585; x=1685174585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGHc89c3UdTLkFNCDbIwqIHNEzyfbm67sQoe8R0nzXQ=;
 b=FVCLOoky48n4g323dLFWE5anhp0vX/r9BZfo4MJ8TwZiWOCmWb7m+s0gWnYLy4ouT6
 gOC10YwVgLCo+kU/JAGl6hgEdkCzX67wjeaOnEWmLGMCIio4WPM45gkrOGXsDY6gRth9
 UN9CVExY11M7CfRvSb6J2t9TiPV8bVk8pZGRQKpoGfjl1DQClTmLbyz2PwvNimdGHclz
 6Tlje7QikBKpb6TkJG87Sasdqh4d9SF8IkaWVMKAxGF9aWvQ4SgfxFCRx7a2+oPxb0Qr
 clUZ4tIbOL/ZEUiTppQjZxTVYcss5NBmq4rV3bCbbiMTg4D0knQyBrH4BpIRcyBw6rey
 IEGg==
X-Gm-Message-State: AC+VfDzkAnMM50nyBikWM/X03vpxLqgynzPPCuh6s8j4+uOGMA16is+F
 NHdJyGTqDMVbMGR4Mu47Nqsqew==
X-Google-Smtp-Source: ACHHUZ5Jq7sJcZLYyqri5YWW1RPyAViVkdpFYipxqR8kpdl5tR9tUklwn8PCaOv3AYjdPpuU+YSbXw==
X-Received: by 2002:a17:907:36c4:b0:94f:ab46:77f9 with SMTP id
 bj4-20020a17090736c400b0094fab4677f9mr839700ejc.15.1682582584954; 
 Thu, 27 Apr 2023 01:03:04 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1709062e9300b0094f281bd279sm9215641eji.198.2023.04.27.01.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:03:04 -0700 (PDT)
Message-ID: <05af1a24-879d-2ea1-ac63-48a6b1f2bd1b@linaro.org>
Date: Thu, 27 Apr 2023 09:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 09/21] Hexagon (target/hexagon) Don't overlap dest writes
 with source reads
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004217.1319317-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004217.1319317-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/26/23 01:42, Taylor Simpson wrote:
> When generating TCG, make sure we have read all the operand registers
> before writing to the destination registers.
> 
> This is a prerequesite for short-circuiting where the source and dest
> operands could be the same.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c | 45 ++++++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

