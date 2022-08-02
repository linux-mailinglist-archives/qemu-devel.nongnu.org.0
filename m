Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7172587568
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 04:07:44 +0200 (CEST)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIhJw-0007EC-2B
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 22:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIhH9-0004IN-PD
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 22:04:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIhH7-0005I1-0k
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 22:04:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id w7so12089854ply.12
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 19:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wQ0nu79kXZuZtfNWKFiQAUN093a9q9fkJa0SFWz6DUM=;
 b=IGAoKQmEDK1jmCBDlcrwGWWTJ+ppvkGPWnjZDrSdlm1jsnYInJw0aOCmQdZJB+WNVC
 p6R0s8oJFHEdYfxjvG0MVHuD273qpIUeeOSj/U3cI1TcEHaUyYvDkIQXlYeqriw2wgvW
 D1v2t1uPfgqMQvzzxowki62C+sGelcc2O2dHLVrNpOly04dZ9hrmh4EFB+D5jG6PDMU7
 wpCjgG+TJ25JT+X8wTRRSIH/T2YIBJer5UsLrap+HoBxFTYhAQUE2pd9OdS0wj5u++qf
 4y+phHV/S3b93K+1WA0dC6etliTATck4hsaHfn0kn3eBrSE9ZLDyFCO1sOeTY88lh0jX
 vwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQ0nu79kXZuZtfNWKFiQAUN093a9q9fkJa0SFWz6DUM=;
 b=BEmhKCs30OddmRUXHOofLa62OaGP0Y6gI7kM/YLy0tkGngQCyP+sZfuolvfBcjUaDZ
 X0ljc9BKl/B47ItWmtye4yHtJ0xbbgKgHFUbXImqDK7lblaqvIsnfXQ0PuL0GoJudSBK
 QdjkGtYQJwIOTyid3hYlgBC5OGZX1CXIG0pbSxeSXoOAP5N6ciNXMdPO0ICcFYvQJjFL
 84TupQD9hwctfsdlq7RoUJ9en1qQjAjvvqKvtLQ4UcIZxWPlIIePc/+s5B1joQ35aKW0
 myWUoOOkDLER4KQkbY75Bpp8T4tESBPCWAam/gacJJ9MqLlFr/ULCIHyPqZ93mxeL46n
 Ttpg==
X-Gm-Message-State: ACgBeo0A9rRIIN6p6Sq7yXj3daTbMXhLlnmUJvqGDIcJgUSRttXY/EG4
 dbPEUFuVmUKdguM/DOirEqjVsg==
X-Google-Smtp-Source: AA6agR7yov1ytTHWROYLJDt2Igvg1E50fD//KDUDEKfaZmhqr0hyy27cIC3Ls0ycjaUAlrWtuST3yw==
X-Received: by 2002:a17:90a:5207:b0:1ee:dfa1:afa9 with SMTP id
 v7-20020a17090a520700b001eedfa1afa9mr21474652pjh.246.1659405887341; 
 Mon, 01 Aug 2022 19:04:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:7e91:a3d1:2af1:8c18?
 ([2602:ae:1549:801:7e91:a3d1:2af1:8c18])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a1709029a9000b0016dd562430fsm8164159plp.120.2022.08.01.19.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 19:04:46 -0700 (PDT)
Message-ID: <e90020f3-b41b-2025-f56d-b440ef1cb56a@linaro.org>
Date: Mon, 1 Aug 2022 19:04:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220801162948.1920497-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801162948.1920497-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/22 09:29, Cédric Le Goater wrote:
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220801
> 
> for you to fetch changes up to 398c01da9c8c8af5db0b2b4b4888c2bd27218230:
> 
>    aspeed/fby35: Fix owner of the BMC RAM memory region (2022-08-01 15:24:15 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fix ownership of RAM regions on the fby35 machine

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Cédric Le Goater (2):
>        aspeed: Remove unused fields from AspeedMachineState
>        aspeed/fby35: Fix owner of the BMC RAM memory region
> 
>   hw/arm/aspeed.c |  2 --
>   hw/arm/fby35.c  | 14 +++++++++-----
>   2 files changed, 9 insertions(+), 7 deletions(-)


