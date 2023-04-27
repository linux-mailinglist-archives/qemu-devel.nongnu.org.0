Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D936F6F04AE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:04:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przOv-0001dX-S0; Thu, 27 Apr 2023 07:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przNS-0001Zl-Vl
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:01:35 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przNO-00063m-CY
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:01:30 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-506bfe81303so14063667a12.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593284; x=1685185284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=StUSISZrjdjJmYrcCie7GWYn3SZJ7LcPM+GnqK3Oogk=;
 b=aYG+8B2mDub13n9XbIqkasM5EUA/5z800S03hp+vm54V2fq0QA4CJO6bE33I7zFwgD
 Xw3hY7Pk5I00zYafJJf/t1hKxfKEa6THTT1Hr2heDev6AVHXxS1pApNr/dMFv9t10SvG
 GetrzObGQntYfmCPzkrkV6lub0swe+sjWE6vHCjNE0cc4SB4rDTPCdeOKLmDqPgoaYRb
 XC2p0uT0ptms9OEr4AZLyV/yUP8fOZLlcIrGRQ8pGvbHb04Xhuf1GYz7+oSTngh7uC2h
 EJrDiJ3cvd049U+X6Me6ssBR+2i7J0ZpdbrDbXRNKoeNxhsyAWV3qFseqeHPeRJUgQc2
 Xmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593284; x=1685185284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=StUSISZrjdjJmYrcCie7GWYn3SZJ7LcPM+GnqK3Oogk=;
 b=gMNbw13l9cPMu/HeM/yhKyke/gKz4TLXaDIR34ks+RkIjb2OjA6CpHUi3eVhbYlHtA
 vNU1RYChulW2NnfxytmqNgSbahKYkkc8q+3r4zMkSIlSt8ffHmrGK9MA1Zxz65MkFoiF
 Vzt7kYE1KOGMs7O/3P+tdhtD3m+ZFKv627MxGtqlucr6pIAA6Yr+tTV58vEW9kofrojo
 YpiH7dZ5rABIqe8GrY1189EdnnvBzY8fb1F37xypC73ThG6TtvC4w5HvcKwAMHAzrIbK
 SZaLm/8nFfRj1nSOlyRVtkSyadxE5eSnHNGspRJPV9hJDXOFOLpi73dNywIxXifKtSOM
 uVow==
X-Gm-Message-State: AC+VfDwQD4bw/INbJmfRVVv7j/ueabc0s/wrD3bnHk5pz3vdszXh2a+s
 KeMfRacArCu13N42avpEAmDp+A==
X-Google-Smtp-Source: ACHHUZ7OC1RPilpYwfQ7JUeCOJAIlk2UOW+8PtLaY6hS2mrWj7ukLYK54F4Ibv5zTLnLqeQFJuGqCg==
X-Received: by 2002:aa7:c245:0:b0:502:9a5b:206e with SMTP id
 y5-20020aa7c245000000b005029a5b206emr981383edo.9.1682593284640; 
 Thu, 27 Apr 2023 04:01:24 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm7676548edv.86.2023.04.27.04.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:01:24 -0700 (PDT)
Message-ID: <b695d0e6-7b8f-e335-bfb0-5475b342410e@linaro.org>
Date: Thu, 27 Apr 2023 12:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/21] Hexagon (target/hexagon) Move new_value to
 DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-8-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
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
> +    for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
> +        ctx->new_value[i] = NULL;
> +    }

Perhaps

   memset(ctx->new_value, 0, sizeof(ctx->new_value));

Though probably the compiler would make that transformation.
Or perhaps

-    DisasContext ctx;
+    DisasContext ctx = { 0 };

in gen_intermediate_code, and eliminate other 0 init in gen_start_packet?

But it's not wrong as-is, so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

