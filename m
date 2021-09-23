Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305A4171BD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:24:22 +0200 (CEST)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkFZ-0006rw-BP
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsV-00071U-Lz
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:31 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsU-0003QH-2f
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:31 -0400
Received: by mail-qk1-x733.google.com with SMTP id 72so27544561qkk.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=27cc4nY6+bMm4LISi4ozvA+qHCtxmqdNW5BSub1IyL0=;
 b=vpd4jataENljz/qDR2l86Z0h8Kg3mBqy0/dvfIqhLvh84vClOqQTbM0s24x/3M6bRy
 lAmLmhI0S4KMPIdilzM2lHg/UeQ/h88lhyTWxutpocnPbhc5TSvxZu/6PLPKmclQt+Os
 HEA0qOy6oxzgBKftLRw02on30nmS0oIcaMY5S6kuq127N/zmSiFvh4b/tbhu0o4lhmEs
 oK1XxDLYe38GrX52wCg8iZg5HBeTiQr03GmpjDJ6NUfCLswagrsnUQtqHHfaxw5BLGBq
 lTwyajeaAZi/PMWl25QApo9/jBSmqPxcHQLc9bIJUpP4LxGpMJlZjo9AgxEmcnEi7Vig
 36Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=27cc4nY6+bMm4LISi4ozvA+qHCtxmqdNW5BSub1IyL0=;
 b=w+jUbJtjRVJ6x5UE++IblX5//I6ZNEfWOYYackbMY9A5TUI5I/qFwWdXb8owactAtt
 ZERrvskHrnh7MCGaSfgUrmqCT1vQ8ClMTC+VxNFRlzInKmj7UEYlYUiHQdHamqCsfBeE
 6Nkf2dyRqLzmc4K88hkWTunmN1+BVfw595FirIlSytbNzeNH4huL5oatImULXJv4CW/Z
 KKDXD8da5MJoBmDpLYJ2mQNbwYj/5te4pJnRM0l/So6Wp9nESGQz4QQq2HMu2WxMACO9
 QVkfDJ7iN/ND3/CfCYJiHOB79cthbCxnFm+lenhgCS5ACTR2TJAwwBelxP2G1g5wFea9
 bgoQ==
X-Gm-Message-State: AOAM5334fCpOPz7tdoCKxmbCbhvIDOL03e1kwYwECyUn2NRL3O5vkrF9
 d15YW88YwcV2WCOjefG9UrmcWrLstgFnSw==
X-Google-Smtp-Source: ABdhPJz4vs4yir1K0seKHrC+WgSv5b95GQNYFaLStF7vq1McWtXpKSb+UV/ijZ0VBa/wBMvOFTDNPw==
X-Received: by 2002:a37:993:: with SMTP id 141mr7780486qkj.488.1632484829129; 
 Fri, 24 Sep 2021 05:00:29 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id l195sm6507808qke.98.2021.09.24.05.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:28 -0700 (PDT)
Subject: Re: [PATCH 11/14] bsd-user/sysarch: Move to using
 do_freebsd_arch_sysarch interface
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd9e834c-5b1e-762b-0af8-5afa0a08fea3@linaro.org>
Date: Thu, 23 Sep 2021 11:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Convert the #ifdef'd i386 code to calling the i386 sysarch code we have
> living in i386,x86_64/target_arch_sysarch.h do_freebsd_arch_sysarch
> rather than having a separate copy. This is in preparation to remove it
> entirely.
> 
> Signed-Off-By: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 45 +--------------------------------------------
>   1 file changed, 1 insertion(+), 44 deletions(-)

It wasn't clear to me that this target_arch_sysarch.h file already exists, and is already 
populated with the code being (re)"moved" here.  Perhaps the wording here can be improved?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

