Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1D6EB4B6
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:29:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzFB-0001yQ-BI; Fri, 21 Apr 2023 18:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEz-0001rd-SO
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:28:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzEw-0006AN-T8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:28:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so23849905e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=JXknaJ2VkdiVb57XrTk8D4Mph6RkJ6Ls6CrhYELgAAvqrd2oQwD12JVAEolszMSZue
 abK0pGTzH3px9oUqQ34vHpOq8UIdfnB5OaqrDA6+YNpr2xEgsyR1gkoCukSUpXoR9dUx
 6RWNQDdtq8JUoetwMzW5HOiGpnZGs8VJxXHgCVOKuSX22VeD7jVjQOjgyEcqPGeZLjQb
 GZ5xq8aQEKsAzQQCCF+uySRTYGHeM9WScMn5VVUz9CCJJXtGZ7Y5KN2nGs/BEmPB6+rM
 00i5nemBC0UY9vGVMeP2xeuUJ2oj3BYCxV8JHU5lroDVMNMGGjYGhwSK/tZxUf27AsLQ
 b4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116104; x=1684708104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93ElVCSWliPNbtf+IQS6C4pqPFXfm7DyQZafVbfLyoA=;
 b=I5dHjd43RE1CElCh7GTD5dyQm+QDNyvK3yVPi0I+DGRyjZsr13sLUp+xTZivtb3jeW
 GE/bVsonSW20Hzy1CQyTN2XSbnWYND33DkGXvkchnpWbY2fcFMwfLoJDJb1FFwk/l50P
 J3+rRF4ZLSTz3HBwE/aUodedrGajzArYzd/eMNnrs/Gw6knEApETrg4Zzru5YUSSq1VT
 M1rvhg6NelzD9PFCTR/LkyRQl7YNd5gubgiWdduE2Wt5cwfKM/ZCAQCMibRW+FyAG8P1
 SVa11Q6mhIzA4OHrndiqHak1n8GkbFTFpZuhF8VyhnmJHtxLv5Q25nihaKo1541xxuZL
 LqPw==
X-Gm-Message-State: AAQBX9fzj/lfS1Uh5WoBOwsTwpOK1AWtq6VYCHRp6Jf4C4CJNDBxBMot
 oCQrwCDEIXVTLWv1VWyBRi0lWg==
X-Google-Smtp-Source: AKy350aUi+ue/VRcsHS5ABOpBu6u235arnDIqfVTFUmmMjThgea0qTK57pA102ZMsy7bS/x1O/bfqA==
X-Received: by 2002:a05:600c:34cf:b0:3f1:7510:62e8 with SMTP id
 d15-20020a05600c34cf00b003f1751062e8mr2844785wmq.3.1682116103850; 
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm5812268wml.44.2023.04.21.15.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:28:23 -0700 (PDT)
Message-ID: <9f7c229b-4490-d7dc-93c4-058003de6737@linaro.org>
Date: Sat, 22 Apr 2023 00:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 30/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


