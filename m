Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9C3A1C7D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:06:01 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2aW-00051E-Qj
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2XZ-0000XO-AF
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:02:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2XV-0006M2-4y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:02:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ei4so1872442pjb.3
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zrzMF2PMhbvXaxfsrIsvG46MmIg+NWvkCyLJR0lyAPM=;
 b=XO/m62meWb/x5HLlHycJrHTjVI6/T/uj9x/J+puutaYbFNGgrxkR8lw2DAgcg4Cmzj
 j7FFxFyL9rElPby/1v0CfRqFW2ImueAfwUU+FvDFf5KIAZjlZLCYK0vD+cBRxqpCiSMx
 g4S0/CYeZFZZARHSxu7EPjv4/0WabGkDdFLHFHfm9UmKH2dhG0420ELwV6ED58fqAdXr
 JbNyGswio9AatPx0dvBgGaPN35s5LaSQZEMFnHCX53eny4I8H51nM4xR1N4SJ4zVZNu0
 8Rm7VfXmZOb4XdV9QS/E6qNOYD+JwFLSnNLfy3ZuY8ceTYl0yB4iRi/V0EgBfA8MJkNi
 3tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zrzMF2PMhbvXaxfsrIsvG46MmIg+NWvkCyLJR0lyAPM=;
 b=DBvpk8M/YTON+bOjiqf7EJn+qyXRwzxEX889pWC1bRWkp76Y8PpUWqJ1sVMmuBKZ69
 OnQ5uBNxD9WxNyGuhFYXaDeLXI4L4vhAobPE87Ky4KSA8ns+40O7zX8zTyc1zFYr5KpW
 RwUTbFBQ1Z0VTPnMLkmXir1ulW7lXH2pgdbdCoynFtaLvj4R2e4q2WEvZ8P86xpPrDTn
 DBLj0FK8UxISIAjAOSNNKimO+Pt5fQm2/kKm+5kDaG4MN2A+ZckqtEZmQypx+Zp/rjvt
 BY5W0BX8/lG4wKWbojxtYeR6rvbYVDN6H578ft/fXho6Ib5jzajIKa/QqhHfcm0sWTuz
 GupA==
X-Gm-Message-State: AOAM531Xnka38z+mtcS50tOyjN7huDlH125KTzWtqVt2kjcIYTeLaRhF
 az2zwOUNfHDZGrK8TiUUNtAV2d26wNsKVw==
X-Google-Smtp-Source: ABdhPJx2JS+b0oTF6D5PhMj21+m+ySL9SFA9+yQoweM825/V9/ZHXvvjcEWOtkYuJLpj5r1E7Hs7kg==
X-Received: by 2002:a17:902:f283:b029:10d:e7f3:725 with SMTP id
 k3-20020a170902f283b029010de7f30725mr687172plc.45.1623261771589; 
 Wed, 09 Jun 2021 11:02:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i1sm216475pfc.206.2021.06.09.11.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:02:51 -0700 (PDT)
Subject: Re: [PATCH 35/55] target/arm: Implement MVE VHADD, VHSUB (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58ca2143-aa7b-8155-e16b-bf3267dcc373@linaro.org>
Date: Wed, 9 Jun 2021 11:02:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the scalar variants of the MVE VHADD and VHSUB insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    |  8 ++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

