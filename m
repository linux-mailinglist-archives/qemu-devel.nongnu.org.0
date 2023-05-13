Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177917014F1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:29:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjgX-0001TO-QL; Sat, 13 May 2023 03:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjgW-0001RM-Gm
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:28:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjgV-00061B-0e
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:28:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso44362135e9.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962933; x=1686554933;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zncqbf03MVILwfpp/8NJH1jTZZ3YN60ThRbZBWVmNko=;
 b=iI0ZTlyht5IzIc5HojXFK3RSRSH/OKS7+EUh/FS7klhTT2uaD4/cInLLqQ0WaPlrGG
 yA5j8+S2MQf3SLGbmzboy5w0FmsHMRfK4jUgPjNY6V+n+0qzyq57cTvuAmI2UuEe6hwG
 3T+t9NPYUEv/EKN1CrDxm40JdGCqZB+LoBVDSzpB3yku2EoI0AKaqvZVLXrYgH32Ri4i
 9g+uyX1nJlf33Dsr/aobk62lrelqi6qSlPH28CTmIKFwFxDPknQn63syiTvIUX0Um7cS
 uEYInu6JFA/Jnk5HouN0Wlt0IWVSxzjuiqrbDUSmh/3vTA5SCA8AiA/5Q14jAq+8aUlF
 QTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962933; x=1686554933;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zncqbf03MVILwfpp/8NJH1jTZZ3YN60ThRbZBWVmNko=;
 b=QlZTUNDC/vyY9I8Dp0eTm7E3wTfATxe5RuA/j9+SDA8jJRhcEzni+BM2nId9h8VLL9
 eajq8hXGA9+50XUh0qRv4sJYekng3j7xBHt9M3iSuTHyiIGe7LMaBvQVuIn6hpRCcr5e
 dWYodhnBtf0/q045Wa6NJkNFlxzLatJ1/+ejrrmk8naTmha3ovyBN302k8j4uYKrSqVu
 boVnSh61bqRH6vX0T9CrGT9YoNRdB3K4EjT6BIcAKePZJj/IRmAg36WryIh6AnSgyxvX
 7PtgxDTyQCh+FgHTNwaHKeVaZ1maR1twaX1Jbej474de1BbN1Ixq4QDLCebw9KHt/hOt
 t15w==
X-Gm-Message-State: AC+VfDzEzWmSXBvBVKJEybaL6+zGKpduZ9Gn3bucSnK8MT6rPbayK8yd
 0Zgzn3c7XhaK09cJdfL3xDgGhA==
X-Google-Smtp-Source: ACHHUZ4yVHDpX2bucFWpqlcm9Xj2jWBPJmkqQ0KyFk5fXKOd0wrirLOKP969BvqSvPwfLqvZIYy/JQ==
X-Received: by 2002:a05:600c:214f:b0:3f4:23cd:6dcf with SMTP id
 v15-20020a05600c214f00b003f423cd6dcfmr16319413wml.15.1683962933406; 
 Sat, 13 May 2023 00:28:53 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a1c730a000000b003f325f0e020sm30692144wmb.47.2023.05.13.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:28:53 -0700 (PDT)
Message-ID: <82df8b44-3029-baf1-4b2a-f0522bba1c46@linaro.org>
Date: Sat, 13 May 2023 08:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/20] target/arm: Convert conditional branch insns to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the immediate conditional branch insn B.cond to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  2 ++
>   target/arm/tcg/translate-a64.c | 30 ++++++------------------------
>   2 files changed, 8 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

