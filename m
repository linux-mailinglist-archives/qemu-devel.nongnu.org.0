Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E1362739
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:52:10 +0200 (CEST)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSdV-00024H-Q7
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS6P-0002rn-MX
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXS6N-0005M5-UP
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:17:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g35so19598942pgg.9
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HmlUOqzgoHkBRDqPBSlJMgzGNej3BKZr+6eoPqmAejw=;
 b=Ba3d+lw8kMtBogTrHvifvTtvfa7J7gZ3Vpz38jI4ME+r1BSrxr5fnhvjZ47rD9Tdwh
 gJ4HEwruNHZl8SvJYfDxbnhtHSkvly3KF+KxG6SzAaVoSyXMdMbaSLqU81Wa8hBlxFHI
 2elixY63lUSL6zsDXsOTFirB1EHu+7zF276GB8uVTFIeQO9F0TKFJqpoEhaHS1mOAdq6
 87UAuo1FjYTOo9sfhZ7ruqvoxkCDQ8coDPX3SXF9Pt0WshcdZIJhVbSff0X5yROTSaYT
 KDz3zwZrqdwtiS8qXRY3P7cLWA2krNFR9i23o6EOoj4RrPyDnRuAZY3GWQGk75iD40lH
 siXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HmlUOqzgoHkBRDqPBSlJMgzGNej3BKZr+6eoPqmAejw=;
 b=THYLaPSQe5Kf5hOuiFj8SuLXR0+1Dg0QK7hPGQbBo4Dn09SICHB3GS2Z+8QLfXO7Bp
 RZSkvAvcoAfrH39u571uUHuIAA9ibl1eXcoo1Z5CBZUMZ2+LFq5JkVzbMGFhUm/3SrsT
 BFd2CUB8C9sopoZsK9bqIi7IPASkev9E4Lm/t6ylm8eFM0f9/aBsd6rLnnFjBxlxL+ng
 8o8j33pXE8kk2JFhcw3o36hIAccCoogMSs5OZBdsW/ihqKjd26z4zTuCwJLa2/EQRM/h
 ubD7DcPb2U+owMVeU5D1XB/sgNbJ0nCjn9vRgr7KKkG/2xnHzdQnciGxkhxa5tMckk1E
 fXYA==
X-Gm-Message-State: AOAM530+q8TDpGoML0uQMFoH+4yBW+Uv1IozwPEIneXR5ueY9JynznV+
 gOm6uMcVjPndHFOiznZIjbCF5w==
X-Google-Smtp-Source: ABdhPJzAHwS50zYmSQ4mgTDgJRX87OwPYXxwnHUVH4N+5Q2cBELrMrNa1LdcsZ++4KfpTIm9yqxZOA==
X-Received: by 2002:a63:6c06:: with SMTP id h6mr126209pgc.95.1618593471155;
 Fri, 16 Apr 2021 10:17:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a24sm5534278pfk.95.2021.04.16.10.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:17:50 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 4/6] osdep: Make os-win32.h and os-posix.h handle
 'extern "C"' themselves
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29c41275-93c0-8801-047a-1d8ce1801a25@linaro.org>
Date: Fri, 16 Apr 2021 10:17:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 6:55 AM, Peter Maydell wrote:
> Both os-win32.h and os-posix.h include system header files. Instead
> of having osdep.h include them inside its 'extern "C"' block, make
> these headers handle that themselves, so that we don't include the
> system headers inside 'extern "C"'.
> 
> This doesn't fix any current problems, but it's conceptually the
> right way to handle system headers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/osdep.h      | 8 ++++----
>   include/sysemu/os-posix.h | 8 ++++++++
>   include/sysemu/os-win32.h | 8 ++++++++
>   3 files changed, 20 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

