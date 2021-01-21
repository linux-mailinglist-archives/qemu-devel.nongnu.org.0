Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC612FF7D0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:17:44 +0100 (CET)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iGt-0005br-J0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iEB-0003vG-Tt; Thu, 21 Jan 2021 17:14:56 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2iE7-0002Df-58; Thu, 21 Jan 2021 17:14:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id f1so4315201edr.12;
 Thu, 21 Jan 2021 14:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhjvOrM3e9WjgJRCDQKUOvjbiN5WhZOEqeBHljKHNSU=;
 b=q/v3ynFARuvpvq1nERpaJvJ2gV9y/Kt5Iz07DZoTAPAyRhVV5DgNAwxRmzX8Ncvqi7
 TQEYPNWNbn6wd+NSASa2TB4KPd1xY6fxirAYoXz+1byYSjhq6TyRff+QvA3z+9gCKrf5
 XqRUVF1e6Mpg4CLF7P/dX5VdyjAihOjJz6NvJ6+YTlYNl1s/O6JuOdp/0g8q1ryqv22h
 4Nj9AhDQhUeUFd7LgaHx98ESCZqB50RFJVOlOOia7bYiJATZfhdPYphzGZiLoesI2cVI
 5T8FnUTm66ELUbl/EMZ0wzkCIMN457avE82bYGX8gjX5yKhnbRSajs19Et1I7mx8pOkD
 ZD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhjvOrM3e9WjgJRCDQKUOvjbiN5WhZOEqeBHljKHNSU=;
 b=V1zL1dwqnzUiatk+XxyzagdXr+f6kN6XxU6agW9miQIe0/1dFYZ7CwXDBW42YxXgMr
 4ER+EF3eMc/z3VfRQFJJihX2T64BDVy7pqBwGSGs5s4h9qWZ0FSm5/1zwU+pLJQ1VJJZ
 JqHu3H0gGFVO+5L6hZVF2J8Ar3a8ULsj3MtloFR5sPPa9ETBQPpUdk2lB3uAbFErfreJ
 ybjUVbUqgNr7hHUWu68oNh/RmVLHTgSc3hJeTcPRbc0VS64ILq7C8UhDB1pHYDzbgWjP
 lh4OABxQH/z+hUhRfTI3X9gtn2FsmqiPCQvWugaTwuTR2PxP/qTv34dVEJrgzLPZN/hA
 VtnQ==
X-Gm-Message-State: AOAM530/IshhzLT2DTUgqVzezS2+HW459E5Fan9s1dwM/LrLfsI9nv+s
 1DAqbuWhFfXzj3XPW+hCvAFYryLGkw8=
X-Google-Smtp-Source: ABdhPJw014kunSy5i4iRsQVc1qQbDDIVHuglpYnMpSS6jeAQIEvvF+FJx2K57ZIOq3nHn62uG5qmRw==
X-Received: by 2002:a05:6402:1819:: with SMTP id
 g25mr971654edy.46.1611267289051; 
 Thu, 21 Jan 2021 14:14:49 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r22sm3596005edp.9.2021.01.21.14.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:14:48 -0800 (PST)
Subject: Re: [PATCH 12/25] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75d9c510-9bba-1eff-c442-bca862c3d7e7@amsat.org>
Date: Thu, 21 Jan 2021 23:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> The old-style convenience function cmsdk_apb_timer_create() for
> creating CMSDK_APB_TIMER objects is used in only two places in
> mps2.c.  Most of the rest of the code in that file uses the new
> "initialize in place" coding style.
> 
> We want to connect up a Clock object which should be done between the
> object creation and realization; rather than adding a Clock* argument
> to the convenience function, convert the timer creation code in
> mps2.c to the same style as is used already for the watchdog,
> dualtimer and other devices, and delete the now-unused convenience
> function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/cmsdk-apb-timer.h | 21 ---------------------
>  hw/arm/mps2.c                      | 18 ++++++++++++++++--
>  2 files changed, 16 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

