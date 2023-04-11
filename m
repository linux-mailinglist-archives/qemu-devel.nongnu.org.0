Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486296DCF71
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:38:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2xF-0004P6-Qv; Mon, 10 Apr 2023 21:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2xC-0004Ll-JZ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:37:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2wx-0000ng-5o
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:37:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a649d03360so1624445ad.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681177053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hXlhVyKzy7aP4X88NRwglP/xQwa0ZyBpmeIJddIXq+g=;
 b=eRqy/Zv/6Kr0/1cf3qfixTq4jKFDXQjqraU8j+BCco0+zKBmV1IycM0Qm8gnHe9H7z
 i3FSdEmTCxLHlG8wKYU4LnatpHRCNQSAKmPS/n5G6tCh5Qn9INEHzjD4ubUB7mRweTIX
 jZYcZXW3faMQunC4pLcgv0eJI26yAt3hwzkJEFte0D5qvJkJy7q4Q+MLZfcAPKpl3UVP
 qscDdp6tTSoFOBujQfO8m1KqzM3AX/RCvlRLcINjfkPU5DBq0UBZLUeCmEM6PquMiZ2X
 eUMIp8IXnDQss5wHyMeFz2qYqydKjTFEAtL0So5b/WVxmZ7UhHANAmi24D4ETT8QGGPI
 R9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hXlhVyKzy7aP4X88NRwglP/xQwa0ZyBpmeIJddIXq+g=;
 b=OK9rTUxoIdug37b6nypgrIGsKnu0MMCGoMWUEfuqaibpiLIoyTz50mcm+950sQw2fk
 wdkXrIw7BYbddKymFbSm0oJTF7igS6UGJWKPEq8QPyTAoUJoYmGDfBF1qy1DJEfAPiB1
 vEyne26cbseUWCjG1ISmrT4upu9BJP7iBcw09LiUuJ4QIqYqggVAty7hs2EdbVf+VAuc
 wQx1+3vyme4s4T80gOP+9LYG9I5unUqdg7QcXBssQAcGwIGWBF3uRLL2OgTuNbkL+SZf
 DvMRqrr3ah8XBv5An4k5lv+LBUf1b/SdG7cWmFn6TUfuC3f6VIaHpH2XnKfyxNadanDz
 lY5w==
X-Gm-Message-State: AAQBX9ewZjHbH8uDm/ryAO49H+XPEQFtbVcvqKLRP86+FxJFCyZ/OUqJ
 YrdpKE+tfH0Zo8ZjohYgqDrSng==
X-Google-Smtp-Source: AKy350Z/C8u2/DNJWFq3EEETsBB1fSELeghhYeBSsCCeoQzOUne0d6aGgh882nav2dSY2Rab8VUPXw==
X-Received: by 2002:aa7:9f44:0:b0:63a:f016:9de2 with SMTP id
 h4-20020aa79f44000000b0063af0169de2mr814479pfr.22.1681177053599; 
 Mon, 10 Apr 2023 18:37:33 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 c20-20020a62e814000000b005cdbd9c8825sm8439013pfi.195.2023.04.10.18.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:37:33 -0700 (PDT)
Message-ID: <29131a8f-f7e1-ece1-4dbb-f07d07b4f8c3@linaro.org>
Date: Mon, 10 Apr 2023 18:37:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 18/19] bsd-user: Update system call list
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 reinoud@netbsd.org
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410182056.320-19-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 4/10/23 11:20, Warner Losh wrote:
> Update the system call list. We have one hokey thing in here for swapoff
> that depends on the version number (so this is not completely generated
> at the moment). For this, we need to include sys/param.h. The method of
> generation has changed, so this diff looks way bigger than it needs to
> be to add the few lines of code for the new system calls.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.h |    2 +
>   bsd-user/freebsd/syscall_nr.h | 1035 +++++++++++++++++----------------
>   2 files changed, 529 insertions(+), 508 deletions(-)

What is the method of generation?

If it's complicated, it should be in scripts/.
If it's trivial, e.g.

     sed 's/xxx/yyy/' < in.h > out.h

it is worth including the command in the commit message.

Anyway,
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

