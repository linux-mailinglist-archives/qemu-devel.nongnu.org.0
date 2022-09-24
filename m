Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4405E8FC2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:04:53 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCKS-0005L5-AQ
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCIH-0003Pb-Tx
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:02:37 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCIG-0007b7-Bt
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:02:37 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i3so2099840qkl.3
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=kBueCumzOf2fLU9AyGNA0BmXn2vaYCmlNPQulRznmfg=;
 b=Q+c5KqvIholeh3AYraIh1ApJ1CXlSJS0VxXr+9+rOgMig4BExjGFJ/MENTX36MytXv
 3jjhWzU2NN7/tCVs2v2dXV991kKOJQQQHYK8rUXLYsgP5v7VNF2xJsPzRbj9QUW5fXu3
 p05aQFvWnUn1wI5RcYV/n1KnE4VOHQU8p3iZ5YsWB+trrv1fhzu3Gno7GLDHp13IZ9hv
 oXZSKW5cK9OGgHdtH8azskroyLQhhwnwBbfXU6kEPC1JTjxnVEMB2wxflbMScwlmgbCg
 UCz20G5UYLJZd8uqg7ySDf30nx8VljKFyzyAG2ggXqp0Ro7uNbWqL3qYdt0BRAoI6d4f
 WghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kBueCumzOf2fLU9AyGNA0BmXn2vaYCmlNPQulRznmfg=;
 b=EVFBWEDdhEu8yC+EbSVjCCKn2yn2QMPcRUPFJBnG0CfZSHFgQkA68PAhzdjFy2ug80
 lMMgPIjec5ni6ePl6LNrVdGex78GsFmuu2dG0f+w9lPEzZYZawNXPQPwkF0529XBSZmE
 ViMLclLxGy4V2zSdKru3e1uIHaycyXYo5tCC4va9MptL9DpyfxJbrGwBqk957mWgj6bB
 MAgg0Gde/P5K+aLWSNipuiYJdOa5z6ZTS0xDz4P8QrbzTTQRRx1nVApzJii2MiVBLT62
 CE77qTFSvUwUxNPa2HZJ+sYTdvHBnYclPElSaTsFIzflJqFyXMg3ME8Aiw8RzItU6AKz
 1cMg==
X-Gm-Message-State: ACrzQf0T1U/JFtUkKeZIg59Nfy44tM6FMzVx+Svn0JyUPbX4w73JCAPB
 z2FR5cjRqjI8PNLNi38HDRswLw==
X-Google-Smtp-Source: AMsMyM6O+3lvsBbNJPuSsTCuECtNliER99OZ924UVJVt0uJGDp1IJGOkf6pX6+lpOcxkZgo9tSjTWw==
X-Received: by 2002:a05:620a:4306:b0:6cf:6c17:a93f with SMTP id
 u6-20020a05620a430600b006cf6c17a93fmr8553980qko.88.1664053355357; 
 Sat, 24 Sep 2022 14:02:35 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a05622a004200b0035a79e18410sm8888714qtw.48.2022.09.24.14.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:02:34 -0700 (PDT)
Message-ID: <805d6b73-aae1-7df1-2567-6efed592a76d@linaro.org>
Date: Sat, 24 Sep 2022 21:02:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 26/37] target/i386: reimplement 0x0f 0x3a, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-27-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-27-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> The more complicated operations here are insertions and extractions.
> Otherwise, there are just more entries than usual because the PS/PD/SS/SD
> variations are encoded in the opcode rater than in the prefixes.
> 
> These three-byte opcodes also include AVX new instructions, whose
> implementation in the helpers was originally done by Paul Brook
> <paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h            |  95 ++++++++++
>   target/i386/ops_sse_header.h     |  10 +
>   target/i386/tcg/decode-new.c.inc |  75 ++++++++
>   target/i386/tcg/emit.c.inc       | 309 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |   3 +-
>   5 files changed, 491 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

