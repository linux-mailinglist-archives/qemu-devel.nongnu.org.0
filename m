Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C763CBADC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 19:00:37 +0200 (CEST)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4RCW-0006SW-Hq
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 13:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAh-0004kM-Sd
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:58:45 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAg-0007dx-Dq
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:58:43 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o201so9412386pfd.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=85w98ZHdXri9LNUBYklPMhrggvGL2og7RnDkOwo6Goc=;
 b=i83cZoA62PhL/LhJS1mtzmjvpBqKTVuw+bb99p/7vZeUnUcRS9kjoRxTZUUiT9XnBw
 2lv2s8OSCQ+2gLgFapuwgDH6oRdLLvLy+lm5DklkgtjxpKTI7UxfGi4gMS8h7tSVIqdm
 3ND+gW1MY/lBCbfT78NINPru25+SkB5+xbQmsgQosFKOCq7lxoTuR3n5skyFxGb+uT3Z
 eRIEqVmOq+fxFOnir7bIlwnnvFRvii5dW46h1NOQdq2vm6Lcv62yyeXDt+23cUaipHPq
 /E6J4aw3OPhKAV+3CJaXO6YPHITdms8aVb5KWeYB3qxgvfcGQFdJ/gqr/ATHJBgps7LS
 Vcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85w98ZHdXri9LNUBYklPMhrggvGL2og7RnDkOwo6Goc=;
 b=fnVISBaXiQxyHn1myRd9ReoRMpxs4soWCJg8cmRDj/wC7vGf/bMA8G32P+aq7Wj1ca
 sARts6LzWJTdtYbS40TQZizp2Y756jlLSvZjjazJyWzZWoXTHJ3dLRAMEcvG9OY9NnsW
 SekNEvrxQAUj0FEorwbpIhu7uIqC23WdmnwLg31QBHcV16JoVvvVzN3gaMCQv/j/1tEs
 kzGQlTnyg8PxQXPEVaw52E/ZJkg6b5nLWYlcE0Xf8QVhvf+PvO7OsKwFxDzXpjN7q51O
 +jKM6UaCrSNJ5Nn+tF6sFDZn60Blegd+136ChxtVB29qhPDxvCiYn4w75T481Ti+ueP6
 MYHw==
X-Gm-Message-State: AOAM532zyXJV739eV00ZnspkS88lk2xG49gXqJefdhKEODVlzrocMORB
 AHddg1zTJBPlXONX1LUJw79eAIYA9FhW0w==
X-Google-Smtp-Source: ABdhPJzvgv/RR8R1b7sKwgGX0ljgidrOXnFMh8diK0QbhzJEqsgyUSv2cHtxuRled3A16MmmzFcNMg==
X-Received: by 2002:a63:9d46:: with SMTP id i67mr11005231pgd.225.1626454721249; 
 Fri, 16 Jul 2021 09:58:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e13sm11130985pfd.11.2021.07.16.09.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:58:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/34] target/arm: Fix VLDRB/H/W for predicated
 elements
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ede02f9-e42d-d4b0-9137-c1ac1e4cec49@linaro.org>
Date: Fri, 16 Jul 2021 09:58:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> For vector loads, predicated elements are zeroed, instead of
> retaining their previous values (as happens for most data
> processing operations). This means we need to distinguish
> "beat not executed due to ECI" (don't touch destination
> element) from "beat executed but predicated out" (zero
> destination element).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

