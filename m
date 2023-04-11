Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5586DDAD2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:29:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmD81-00061S-Q0; Tue, 11 Apr 2023 08:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmD7z-00061F-R2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:29:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmD7y-000846-65
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:29:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v6so7351126wrv.8
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681216176;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RtvLxdH/07rIT4Al432kq7O64MHMpn04cfJIlO2OX+c=;
 b=BVjOq7lbeMXeuJYxq9DhuS7C2wJZc6VFrCzZvW+dzNv96+BUAlm3Zy+7PtvSE7AHBD
 9M1Nb4BguIrk+9JJpBiD/uBRq8vUgdkdA8HakbKX50ec6CIo90UW5i/4uJUIV+qL9cmn
 PHGCVQUKUE1FkXMDN/1HbNbuX/Nfes/guvXbzqFkVQe07Y+2Efl4cHWVqTIsu3OudXgV
 taRB2KUnGbE0C6sE5xUGUmjRIi1HJ1U4hlwzL2Xsof0lSCqeIIG4UyWPJAY5n+BMw4BL
 DzO10xKWrfrpDQA6lNKAEz+LO18DKt3NhV3cfJfQCEDo/CxgQ5SeWEo0h5edTNeqp5/R
 fRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216176;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RtvLxdH/07rIT4Al432kq7O64MHMpn04cfJIlO2OX+c=;
 b=KeboHn1Qrn8TdSdSzYKRmcKWYED00GemTh5EjsHfAwQ/uWRQt1Eg2l9TrqtGNuegNz
 PaYtCISvdcKjfNLsQgaj5Hv5/ytGNGIDEuBNooa/s7iSeVNaZG7Iz+y3bPOMXNEgJYYu
 nJjZYPnpDsB3F/dxLawxBDszQxIT9mROcbr2Iv0D+MP6edV3zJBWMtTAhdpxI+bVIVh4
 n0aqzcqd/TQX5Mj8XYLgwOBlOpqDJddbcTLLYmpmJj7SamaKcr5gEuey+ES4PfyCeoe5
 Y1OpBFZmyFPgZ34Sa6dH9laCrxIegPmK9jGt1O4ECsI1/mIfnl+A3cU1PGGEzxVJkgeG
 zBKg==
X-Gm-Message-State: AAQBX9ciPHMU2kt8HXRVTZImA2JYncyb0AtKjYxgqaTNvUeMQvaO7egi
 YQCC4CLze+fj1DZ0bRMckoqekZFr/tMlR7MdUAI=
X-Google-Smtp-Source: AKy350ZIOk+yNR8A2JfzzxvxTovR1BnG2Sg8X1wtvfvHzc/dXkbExzq7laE3afG5KFzD7aKzbEGXZQ==
X-Received: by 2002:adf:fa50:0:b0:2d6:8d2d:5a7c with SMTP id
 y16-20020adffa50000000b002d68d2d5a7cmr7012876wrr.57.1681216176674; 
 Tue, 11 Apr 2023 05:29:36 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 g1-20020adfe401000000b002f3e1122c1asm90833wrm.15.2023.04.11.05.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:29:36 -0700 (PDT)
Message-ID: <13bf3cba-cbd1-6aea-72ab-e83c8a16f4d3@linaro.org>
Date: Tue, 11 Apr 2023 14:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 05/12] tcg/mips: Split out tcg_out_movi_one
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
 <20230408030359.3368868-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408030359.3368868-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 8/4/23 05:03, Richard Henderson wrote:
> Emit all constants that can be loaded in exactly one insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


