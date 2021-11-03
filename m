Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A538A443C0C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:53:20 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7Kx-0007s9-JR
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gt-0002WX-8t
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:49:07 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Gf-0005Nz-Os
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:49:06 -0400
Received: by mail-qk1-x72c.google.com with SMTP id bj20so1078174qkb.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wF1bXfRFfzUCWuqtL9DYiOyUnlIRq7aWtTJB7jzV8K4=;
 b=c5BnCLUcXplB1XxueW7hXy4H72jbb/g6rGLNHe+1xVlq4jAT+zSxuOvu4z58VoKlaL
 7X08El9WJrAE2touuZu/Hse2fWy+HO4YE7xLiB+fDriicoRoxPdBn3hufkyQFf4wzR/g
 96c8tZk240cpZibJzEDNMl5bgURHdjPERosWaG/fH0WiPPhNr1z7TKkRei9YkA7rrRs6
 2x4kynmDI1ZRG/bhXhLov+rxewRwqBhaR/IRMTgZyJ6xVHw+qlOduFL2Fc/nWgo6+5XM
 2Hs4zBSQ69PSP+FR4Es0ErjxLx0SHTy895f9119V2ZmTeQa6gQAtwSqjdJsoPEoXawoD
 y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wF1bXfRFfzUCWuqtL9DYiOyUnlIRq7aWtTJB7jzV8K4=;
 b=3PAF2TCoU0TeywtYnSQ7Je3roH0jH5CBv0Ka0PT1hRYMUplCq4Usoq0WAhi4dqOkHj
 WZKe52+RIRKUr0FDpGOGpP6vOiCvusnPk+o5n1BJjcf7q1PtKcNrxxMvSEEhMGi79tVm
 0Z7Pafjns8K4x1R0wOpoCG51d3CV39VS32M5imaOG0tn2hJ55EgWgRr4Rn1kTrCdOBF6
 q8nLt+5/kx8Ft5RC5g3nuBTlwpF+rjQbwUmWAK/SxX54xFjq7rlcl5bHFWmt+F9SNq/R
 EPp5sJqzNtnl/N367xHRTqSEEG38CQFxF6veC0i9CBc3zP6LhQMyawh8zsnrZY+OWOjn
 INcg==
X-Gm-Message-State: AOAM533vm8Id7VvjHffC/pkFOA9l/gjWzWTo9DldkED+WVb0auZRi/pP
 NMiiAg1uJPWOaMHu74WMpU1I+A==
X-Google-Smtp-Source: ABdhPJwsHV1sPur4zDVaryvH6ErbDzrTtvy0An6CiwWsJED/SV/PVFfcqkV48pekC9YDsJUFDyJS4w==
X-Received: by 2002:a05:620a:424b:: with SMTP id
 w11mr32117241qko.179.1635911332851; 
 Tue, 02 Nov 2021 20:48:52 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id s10sm746562qkp.132.2021.11.02.20.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:48:52 -0700 (PDT)
Subject: Re: [PATCH v2 29/30] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b97a0b54-7716-31c8-af37-852697434dac@linaro.org>
Date: Tue, 2 Nov 2021 23:48:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-30-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_signal.h | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

