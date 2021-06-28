Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B13B6693
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:19:20 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtyh-0000Zi-EG
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpr-0001Zi-MW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:10:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpp-0002Fo-A1
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:10:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id g24so10461076pji.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eGEQuXWauKoQEzNunf0F69x6k39r7rxqMHMM1bpJGiQ=;
 b=JmzJaVHHXLWeLE9WkaedO4RAE0yUoacfJssp0msNpQlVQRchuHoWhbL0bsU+AGOhiK
 u2pIIS2hUfucCXFWp0XHwdvvjR6WPJuzDG8hU5nknxdivrdRrT45U/MFCAmTf+4KRAjS
 vtL5DfnVMU+Vko/o0I4m6YXiO20xvHNanSY0/MGTKMT0LcdsD12YpwX7G9UpicbVV48J
 i3FNAYMYYbGKO0/kfQ+d2rw3f60JBWx7RypGhYSW0dCEETj8QJcskkNF9Q8EKenpxSwN
 XMvVvlUdGsASvjKOyiWZesn6NIA2Sz1DtmR8ha+SUmddyDbqM92mgfV34XiS8OJ3VaXj
 w6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eGEQuXWauKoQEzNunf0F69x6k39r7rxqMHMM1bpJGiQ=;
 b=bclx8D9snti8UccqUhzsK28NK5lFibX3X2rJjJZlaPBP+RITCtY/G8smqxapBGEwjX
 cW92+AjNRblu232IGJRU2wdioszMjVBpUaoVyrSHJH9jJsc9YKxK+puRDoFtcNHrItfT
 2kgVoRHC/OOWaBnbk+CydoQz5j9MsMmePieQUOIPsKteWqwtN1Hj+YggxLGBnevbbjhH
 MrvS6yiRd4UN+5jRuoQUx+jZvMPckv/DTxrT4brDG9rT+p8DZEElDvSamYYSYW/u9LDP
 mOSy/KsOO4chrCY6kI72hHjk4yk2U4lFCMX/9JXjPzcSzcl4pDf7EVoMVF5zhCZIToAf
 ghpg==
X-Gm-Message-State: AOAM531mErA/REiqDmUxEELAys+n5CsnNv9DZ8RmoK9DjhOHwSzFniEX
 maRdLzXvCuQ1sncnxUcdOfX9iR7BPS0W9g==
X-Google-Smtp-Source: ABdhPJx31bG1lAc+UFJMgq9aP1OgENvbOGKfjX/2/xQQM1an2nw2mydhvmqwrlN0N0Z1CvZmAe+PvA==
X-Received: by 2002:a17:90a:3983:: with SMTP id
 z3mr13718148pjb.7.1624896607792; 
 Mon, 28 Jun 2021 09:10:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b10sm13741311pfi.122.2021.06.28.09.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:10:07 -0700 (PDT)
Subject: Re: [PATCH 07/18] target/arm: Implement MVE vector shift left by
 immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dee073d-cb7f-b446-53fb-233f1a9349a6@linaro.org>
Date: Mon, 28 Jun 2021 09:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE shift-vector-left-by-immediate insns VSHL, VQSHL
> and VQSHLU.
> 
> The size-and-immediate encoding here is the same as Neon, and we
> handle it the same way neon-dp.decode does.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 +++++++++++
>   target/arm/mve.decode      | 23 +++++++++++++++
>   target/arm/mve_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 51 ++++++++++++++++++++++++++++++++++
>   4 files changed, 147 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

