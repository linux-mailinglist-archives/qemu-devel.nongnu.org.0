Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F846F35DA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYKv-00069U-Np; Mon, 01 May 2023 14:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYKt-000696-Tw
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:33:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYKr-0007mm-Ph
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:33:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so15770125e9.2
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682965995; x=1685557995;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7l/caiHBTDz6ZwUuPszjnlrJQo4miM+EL0l/+FHKXw=;
 b=gonRnyDijaAEwu/cGq42OYhdIA3vBwSlILJBuEm+CAeeWQHvaxK4xoCKTCcsbVOKwQ
 sE3TnWw+kH0neI71zT8i/P2vv21KEkLfSofcwhiJ42myVuz0gI/tOSriJOY8jhsyYHR8
 TeAcgPChKKG4+XDPN/2waYgn8/FUSYui9n1HBsINWL2WAS9N9eVRYYHkj/0Rd1gyZwEo
 Z2W3F5R71e0f80LG9F3zOwpBKIzmq9r1sQwdCIpZyPw1+ZzhGwQ3A9xlxmbFopdfJ2GA
 6p6/bmBa0JctzaaMejELk2zVQqzDr3zSPrtkIXb1SoMBeLoM4omihe/YLEc3OTx4CRFq
 Q0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682965995; x=1685557995;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7l/caiHBTDz6ZwUuPszjnlrJQo4miM+EL0l/+FHKXw=;
 b=asckkQhCW/+qAetJMJgbo+teUf5+l88CYmWufKDOD8Bl0PsmdpnkKKocOhxLO/lwJ5
 uUqkDaRO/kfTSkFrEGXr3ccNjwMld0GRtdG7yExV9sycM/sUPdCtOBy7wC2LyKImT6zC
 soOznTHIfODUEkpoWclCw8+cgtlbcRMlla8gFt5if/m/DwURhumNDS9fdNC5kFtjVKOS
 sadv/43R+MNH+iB9ZtyDiFoRfZu9C0GjRfsXNva7lSpxN/mvc6bFPeNjvag0lSF4yN9z
 UWOm2oZ0Wi75ktDaA7bzz2KSbg25SWtxUDAA4UIcFRxlR/vWVgGtTVthnXUWYISO2KI7
 mpOQ==
X-Gm-Message-State: AC+VfDz/Tb02sIIa1b3ltAE4Wab3Z234qslgPcpz4FpJiuz6v3miteq2
 JtBT/sOk33LGmWH/R3zapkB4Id8Ah1drF1lb8h85ag==
X-Google-Smtp-Source: ACHHUZ53dlnIVxsHr0MUvtwXm8eMIrCXKHArdFcNuXsYL2SAb0aQjslBSSgjo6TKJ9R1IvqEa4giSA==
X-Received: by 2002:a05:600c:ac8:b0:3f1:819d:d050 with SMTP id
 c8-20020a05600c0ac800b003f1819dd050mr9712547wmr.37.1682965995053; 
 Mon, 01 May 2023 11:33:15 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm33222779wmj.5.2023.05.01.11.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:33:14 -0700 (PDT)
Message-ID: <b5961416-8e00-d748-0f4c-e8d1c14cfd13@linaro.org>
Date: Mon, 1 May 2023 19:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 01/44] target/loongarch: Add LSX data type VReg
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

On 4/25/23 08:02, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   linux-user/loongarch64/signal.c |  4 +-
>   target/loongarch/cpu.c          |  2 +-
>   target/loongarch/cpu.h          | 21 ++++++++-
>   target/loongarch/gdbstub.c      |  4 +-
>   target/loongarch/internals.h    | 22 +++++++++
>   target/loongarch/machine.c      | 79 ++++++++++++++++++++++++++++++---
>   6 files changed, 119 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

