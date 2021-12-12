Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C89471E44
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:35:48 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXRa-000784-QQ
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:35:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXQh-0006Ri-Me
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:34:51 -0500
Received: from [2607:f8b0:4864:20::536] (port=46619
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXQg-0006fJ-86
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:34:51 -0500
Received: by mail-pg1-x536.google.com with SMTP id r138so12914882pgr.13
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=acbSfOOzsY5FfjDLZFw5/SNVgCTblqKPK45SZYefde8=;
 b=G0kNTrhVcmgsUXoJfYNnPggJGGSRRd/zcBXxyso5LVOu/tWXNO0BfTh/Vo0vLMr/ic
 b/sH+7jkCLVfzYRW0fNqbHlVuTDLpamqdl66RDD+stLJtvZPEA7wQ63z2lE1IjuvGR9b
 4rOc42xlTsGsHw5nNEA7p3ex/fwbzwb7xLMmSf1zOIQzQ3nJRo4jEavHl6CquY1oiVFA
 PsLdDABhBaxrBOYouSx+WkCfvck2f7SbDjhCDEzJn8ZJBSYSd7N6pGmOt/fKQwReI281
 h6S95II4yNS3NPmIv+BljnABKxwImUHxdjbR+WAlivro7SjeixBK9bA7HVAGYiwzx8qv
 LC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=acbSfOOzsY5FfjDLZFw5/SNVgCTblqKPK45SZYefde8=;
 b=U4dVkZd2O1Fi93uHn4OQcpbKCyrB0w9c8y8E4EN+xP/GoJOthKJ6Yh6nT9M+qH5in2
 7Osczhm33GsN0GU94scS5l3vXlp50fV8HEazcG45NxJ75xrI4vrUWjuhA+itfHdMGylR
 LGTIVxaKGaK2rwM6rYQGU5pgts1eJs2+DnI8xj1rQMDpqmgK7xJ1xtSwV9V1CHOZIU1t
 WXba0KrVfn5sITwYlXxCy8CV2Bm2C0y1ZVYLOJDLp1ADPSF86ro2RtefqFo6i4NisWtb
 FY4BqeSeLBlw8blQFz+4W6AJEqqLKYnBGkqVaBFPmYoPFpdQuNZqW23ujlYnqvGAUFHn
 gysg==
X-Gm-Message-State: AOAM5325WdpyeAWLs2xBGMBd2U7/JxW31Vw69WVz7LjaO2w+EIxKd1sX
 yBd3r1KR7rDF3KwFmTm4zQkFKQ==
X-Google-Smtp-Source: ABdhPJzP1EcPW4DmZAiVnlzJ9I3txUIPTPBC5tJxTGdEsCT6q5ZykmCcNY3+/2qrMA+lyPbjDMq4ig==
X-Received: by 2002:a63:1158:: with SMTP id 24mr48672450pgr.193.1639348488648; 
 Sun, 12 Dec 2021 14:34:48 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id j20sm4266874pjl.3.2021.12.12.14.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:34:48 -0800 (PST)
Subject: Re: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd()
 to reduce nesting
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <567178b7-3ad4-f6f2-e569-4b6b1892f646@linaro.org>
Date: Sun, 12 Dec 2021 14:34:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Refactor process_its_cmd() so that it consistently uses
> the structure
>    do thing;
>    if (error condition) {
>        return early;
>    }
>    do next thing;
> 
> rather than doing some of the work nested inside if (not error)
> code blocks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
>   1 file changed, 50 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

