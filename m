Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41374595FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 17:59:52 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNyys-0007F5-T3
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 11:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNyxm-0005qF-Kh
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 11:58:42 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNyxk-0004NP-S3
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 11:58:42 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 s10-20020a4ab54a000000b00435f410bbacso1869601ooo.9
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NdpHNMiyPLO+unSCNsQSaTioYEwiP99qS8Ect72g+G4=;
 b=QaXe1qA4wN7CxzbtluIWo1HVf9UHubzmE/5wEAOPpxucg40XToGTTiS22KADWzGmKW
 vjCkkBVNNR0TizUG/9SwzjZ0bqujMvxiQLKQ4VH53eFSZE+zQFGmolNCOkzId95dLVrT
 8r+SnhINFBeJPiRUQ36PehvtuxoOJxuHe3VFxXhH7domEI5tCzGHxH9UHyFsP4jeLnNd
 vNO1vqTENa1+OKzQdjvNPt7tyH/72fGNWRyIAfjjZagQMI/JkqrYlQlsVqgSOVuMzbJs
 jRiXP7pInAUItH+fxYm5Lvz2FkWOXHaVagt8MePSrhz0S3o3iQ4tI4lO4Vy2mU+rSxzt
 qDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NdpHNMiyPLO+unSCNsQSaTioYEwiP99qS8Ect72g+G4=;
 b=aPoHjqvYDX8JCIs4STWMSB1mjDbjbarOtiNVqBfOwkOim+vKB/a4R1eRuhM50hNNqz
 /dvFNMEETRNgSNtXGHnWyDenYzeOVCnn5VolrJ0xYQkjVgH8tcWOmMvkyNZ/cu0COAvH
 9p4QvBv/Q9vCHlLkYdpQvVZMiM/OH6uO3PNl6L/V4POtNKFqK297sI/daQoEfaCidIZ2
 Tx72Z6qSx41xXCUObQD9E+6DFY6/t0YTmmGNMPXaSZcBINDbtdMwkoLwLdSQQTvtfZep
 MVzvh4pr1uBh/Km6TyKCvK6AJRKcTODgtOemSUErxPwWtp3EWwmLv3jGUS15yx282Waf
 /ghQ==
X-Gm-Message-State: ACgBeo1GgH9VI410yYgqfSz7F2wdln+YB73T+WBttxtd9DfjjdtoVCbX
 p86C6gibO4oVjzkobpG0RbRLdg==
X-Google-Smtp-Source: AA6agR4qzu4XkgzAIdihbOjJAC9cKhXV/BVjAYtIUmqpzvb0VQO4tyINKqMwGKt56rVkp8lpfT1c/g==
X-Received: by 2002:a4a:a981:0:b0:435:bd5a:7e5f with SMTP id
 w1-20020a4aa981000000b00435bd5a7e5fmr6553907oom.76.1660665519116; 
 Tue, 16 Aug 2022 08:58:39 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f1:2110:3ca8:a5f:a3c4:7229?
 ([2605:ef80:80f1:2110:3ca8:a5f:a3c4:7229])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a4ab6c5000000b00435785e7b49sm2406503ooo.19.2022.08.16.08.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 08:58:38 -0700 (PDT)
Message-ID: <c658258d-d93a-a2a0-13e7-4d1cb618b03d@linaro.org>
Date: Tue, 16 Aug 2022 10:58:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for 7.1 0/3] memory leak and testing tweaks
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220816122621.2066292-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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

On 8/16/22 07:26, Alex Bennée wrote:
> The following changes since commit d102b8162a1e5fe8288d4d5c01801ce6536ac2d1:
> 
>    Merge tag 'pull-la-20220814' of https://gitlab.com/rth7680/qemu into staging (2022-08-14 08:48:11 -0500)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-7.1-fixes-160822-1
> 
> for you to fetch changes up to 65711f9a87874a9ec61108c6009f8baec07c8b0d:
> 
>    tests/avocado: apply a band aid to aspeed-evb login (2022-08-16 09:57:12 +0100)
> 
> ----------------------------------------------------------------
> A few small fixes:
> 
>    - properly un-parent OBJECT(cpu) when closing -user thread
>    - add missing timeout to aspeed tests
>    - reduce raciness of login: prompt handling for aspeed tests

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Alex Bennée (3):
>        linux-user: un-parent OBJECT(cpu) when closing thread
>        tests/avocado: add timeout to the aspeed tests
>        tests/avocado: apply a band aid to aspeed-evb login
> 
>   linux-user/syscall.c            | 13 +++++++------
>   tests/avocado/machine_aspeed.py |  4 ++++
>   2 files changed, 11 insertions(+), 6 deletions(-)
> 
> 


