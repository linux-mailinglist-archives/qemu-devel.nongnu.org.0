Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE486EFC4C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmVj-0001zY-EK; Wed, 26 Apr 2023 17:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmVb-0001zB-Uw
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:17:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prmVa-0000yO-Bs
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:17:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so1318875e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682543820; x=1685135820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RRjazz7D6ADVFBDfBoq3Kwn49vVKwWYwyQH9GuTX/4I=;
 b=TpKaLVB7I8fzY2TLWEy7ziW8ptShpEp+MTSalLahymCUuBUbZCLFxIFsOlmA+a/vel
 GO6AOJr3btep35o1Q2tZki5Wkbg5GiuhffK1iJVS+r0ZT3ZQRHAxQ4418SEBtnt07QsJ
 jX+P0peoY8vso3Ve69CvQLSBGaA+D5v9A8BAR3TJ8rOPYY8RcvKwa2Zf9JvFtx/IhzH2
 /tBj/BbGp/DLpqnk9cW1w42aS39Ejalz7suzmnXxpljOKU5mHPV222rHymqzdELlmYcX
 sR9Arh0i76VJGz5tWD/gdIlTpUFMmHswUYKEZtjG83Mg6omCePbQEpwPax1roG1/Ovc5
 Wqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682543820; x=1685135820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RRjazz7D6ADVFBDfBoq3Kwn49vVKwWYwyQH9GuTX/4I=;
 b=g7/cyNrKPwCDP+q1vJm77DbLopU2iWYNZp9lZ8aP0y2xfzLNN5TaPm+qbyTXnTM+rb
 +rBHJ1xLMkAxeCkjuFJbyeyhfUvwtmFy9ZkNkzlNq7Cz7UDYeVPWEOHyI6dpAIGvLdl2
 dZGrEa8lzeIHM5cCJ2ITyqhu+bKvSTunfN8nr9hxVCuZrLeNCCukIOBsl9BeyYpSC4dJ
 frnryE4bwBTJF/mCsj0FgiH4N/Qe7gY52fCjFNnVHqE3lGEN73ZF7b4Fl9QtnH8z+2wd
 Z5Rb/8lnHxOPgm/kTy3GIpJzhp8rUCwYu1GmVrcCOt25muLvjMKzc7MW6SxuVQ1/XfI2
 +SrA==
X-Gm-Message-State: AC+VfDye6c8mPQ3Jp1iI12qgB6eCyhGLhvUOkBcqCf7hZsmDGZxcfLCp
 +D2gC8tKAw4S8FnPanmEXiP6kQ==
X-Google-Smtp-Source: ACHHUZ6n0Hw3AqiGB6VHeErXXsKwRmgseLpan3LDPBYRvmxRGCGbjIU/6LMw7/K1sVr7ui2tm6bTFg==
X-Received: by 2002:a1c:7714:0:b0:3f1:7364:9308 with SMTP id
 t20-20020a1c7714000000b003f173649308mr2701333wmi.2.1682543820616; 
 Wed, 26 Apr 2023 14:17:00 -0700 (PDT)
Received: from [192.168.5.111]
 (cpc148070-lewi21-2-0-cust450.2-4.cable.virginm.net. [82.15.53.195])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfe84f000000b002fb60c7995esm16901721wrn.8.2023.04.26.14.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 14:17:00 -0700 (PDT)
Message-ID: <93606335-aa06-4633-879e-2f0cd8d6e2ae@linaro.org>
Date: Wed, 26 Apr 2023 22:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] Hexagon (target/hexagon) Remove log_reg_write from
 op_helper.[ch]
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004145.1319112-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004145.1319112-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

On 4/26/23 01:41, Taylor Simpson wrote:
> With the overrides added in prior commits, this function is not used
> Remove references in macros.h
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h    | 14 --------------
>   target/hexagon/op_helper.h |  4 ----
>   target/hexagon/op_helper.c | 17 -----------------
>   3 files changed, 35 deletions(-)

Yay!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

