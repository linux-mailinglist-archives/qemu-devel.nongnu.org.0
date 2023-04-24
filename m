Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B496F6ED1C1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:52:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqySk-0007m4-LT; Mon, 24 Apr 2023 11:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqySK-0007jB-FX
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:50:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqySA-0004WC-SJ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:50:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so2779950f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682351400; x=1684943400;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWylg7srF1UKsxch+3cLMEWT+Rx0AhsOPYpZH0MrM1s=;
 b=L2sLQtYrgR8kmK0JkBLkdJ7mcZTZTapArGJNo4StN4ewNjHNzC4P4CSTWaIZV1NIBo
 WaeQ7uPdVrNIxd8lCZMLEtnjQCdYuWDnaMcqg17dPv0na85gXQnl+vvt7U1v83KCvV9M
 h6w16t2yIxhNh/c8JRQNf6BYM0badXv3TIn8GcPaQ7Lp58oFNhNDvYKzLWe9YF2QCuUJ
 n/R0qTIOxHuz/mFmktKu/4zCCTCfKijo3itSkGCNU0IiS+yrtHMCd8C2+rbhqNcUcgVz
 ols4Xjom1IrAgAuaNhgjrjqhVfnaOAHamv6JeWjpR+nnVnOOh+0utRiPkzZveNiAaERe
 We1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351400; x=1684943400;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWylg7srF1UKsxch+3cLMEWT+Rx0AhsOPYpZH0MrM1s=;
 b=K0jeosATjsY+V1BeBaDomYm1qjFB8jp7Ocmmh/OJMfzJg/mrEok2oRr15q0phqnRn3
 tu8T0Ito30Bo9skzkRWhG6yo4Dk3nHt78nT0WO1WlhW855uuqrhMTtnkvnQcxnbKWOxS
 zYpIAGG7odrT1rbxk8fWov6dW/V3I85V7SnHQhL5CBc4RMLHpP34cT/MfQe5h+A/GsaR
 /mtfAiQpNj3Hd8BoD3DPmLAwGli8/N5d/heKPeKT7MNljrD2+TAE/d8YitVsFB9CmznW
 8FYccB+xSTqtvgBY3ufqdhimD1wYJyWv7QcZR7r6KY85LC0p5DBeJrcGslT5HtfY/Rkn
 viAg==
X-Gm-Message-State: AAQBX9eC2IpUNQMVmc8V2XMnAxoaQofZU6/Usabkdsx6Eb46GfiWvJ4e
 mC2Kr4tunHuNteTZlPaZ6c1KR5Hh+I6Y8J2mX2ipMg==
X-Google-Smtp-Source: AKy350YXsNIyCYKOU7x/3lp1kuqJ3U7KyptanHkTzK33TnbXGkHF85+f5RGWLqiw14+MkfBM5ZoYJQ==
X-Received: by 2002:adf:eb4d:0:b0:2f4:d4f2:e2dd with SMTP id
 u13-20020adfeb4d000000b002f4d4f2e2ddmr10480256wrn.41.1682351400098; 
 Mon, 24 Apr 2023 08:50:00 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003f1978bbcd6sm10215365wmo.3.2023.04.24.08.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:49:59 -0700 (PDT)
Message-ID: <3bb3ec29-2477-3b49-9562-b0f57746d500@linaro.org>
Date: Mon, 24 Apr 2023 16:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 35/44] target/loongarch: Implement vseq vsle vslt
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-36-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-36-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/20/23 09:07, Song Gao wrote:
> This patch includes:
> - VSEQ[I].{B/H/W/D};
> - VSLE[I].{B/H/W/D}[U];
> - VSLT[I].{B/H/W/D/}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  43 +++++
>   target/loongarch/helper.h                   |  23 +++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 185 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  43 +++++
>   target/loongarch/lsx_helper.c               |  38 ++++
>   5 files changed, 332 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

