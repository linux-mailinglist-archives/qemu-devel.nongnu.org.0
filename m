Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5C5885F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 05:12:36 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ4oF-0005M0-6F
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 23:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ4n7-0003x1-9H
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 23:11:25 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ4n5-0000cY-Fi
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 23:11:24 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q19so5966357pfg.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 20:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=/EZrzYW/hadbKqk0igPBmH+Np2hRkam7y60mXYE81qc=;
 b=wKc9d6DL1KA0IhnLJ9V21RmYxX4bbSM9d8Bni1vvBY6DQRRJyxdm7T1jVJoGxvhrdo
 rDYpZ0+R/GiCBXD9Rabp0cw8ztaz/QPWX4D3LdejwwaqegksLfHVT0rkjjHZO8uVAX3X
 6CCyopYyDKnrq52hazBwabbrXo+RyNLSYRhwftB0UoTmLEU7Sny/dsgagQrD3ybHNf+j
 fgXFN/sywU1R+8bHPLE5Uc/wLEF6l0mzTQ7MmqND/CYfpQiUHRxjvfDRZDOKvKyHB3hH
 WTF2JSze9wsg66Zqatdj/0oblg4vx6OYWp5BWMAZQ14H32FFHYJnd5NfVdYs/Lr9aI4X
 Hsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=/EZrzYW/hadbKqk0igPBmH+Np2hRkam7y60mXYE81qc=;
 b=nW1JYhg26Kvh+AVgduQo1LjqSWU/LkEw4ypzPhuAvvi2u9GS75bA80YmG4o5NTGEDo
 REfgjtMpyMGdWVXF8/VQYKXcWn/PmxwuH/Sabp/5OjXi0btvKHZCbq2MyzASm6ofvPmt
 XDOlL4SCRAxorwDCG62S5+5P5Mhz6jk9/PGDul2erMD4yaUb1tgS14l9vQskb7pREP7X
 roi2AMeyMnxiMWrCkx9tShveMbOLROCzOeLxVyxgVotI8Nkpvp+aEKEqHIZG6vR8m9Hl
 uYp4eCxyUtlkHv8eBugfD9Nii9gbK7P2WcEe5wBkJmj9/JswpXHC2wsE0SRnEeNA0aHd
 UpEQ==
X-Gm-Message-State: AJIora8RLyCVndC4CvrK8YUe+TcIPBdJ4WczXGI2H7X7878tFHNiImuK
 uva3lwNpPrAxAj83OtS8lkz/P0IQUFuWHw==
X-Google-Smtp-Source: AGRyM1u9BUaiA8rh5KVsrNV0b7PckUKnLh0sIDbrz+20Vwb2ilqfJ7AqWhfo8EJc2PBJSOhkSE8Ynw==
X-Received: by 2002:a65:6b94:0:b0:3fb:16f4:3620 with SMTP id
 d20-20020a656b94000000b003fb16f43620mr19532073pgw.464.1659496281217; 
 Tue, 02 Aug 2022 20:11:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:5d51:f79f:db32:93ed?
 ([2602:ae:154e:e201:5d51:f79f:db32:93ed])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a635059000000b0041c35462316sm3601132pgl.26.2022.08.02.20.11.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 20:11:20 -0700 (PDT)
Message-ID: <7698c072-c4a5-a8f3-1fdd-a658ffcd81d0@linaro.org>
Date: Tue, 2 Aug 2022 20:11:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] semihosting patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220803005912.1593116-1-richard.henderson@linaro.org>
In-Reply-To: <20220803005912.1593116-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 8/2/22 17:59, Richard Henderson wrote:
> The following changes since commit 430a388ef4a6e02e762a9c5f86c539f886a6a61a:
> 
>    Merge tag 'pull-migration-20220802c' of https://gitlab.com/dagrh/qemu into staging (2022-08-02 10:03:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-semi-20220802
> 
> for you to fetch changes up to d44971e725c02e0656d2f53d4fb564f92e06aef7:
> 
>    target/mips: Advance pc after semihosting exception (2022-08-02 12:34:00 -0700)
> 
> ----------------------------------------------------------------
> Fix mips semihosting regression.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        target/mips: Advance pc after semihosting exception
> 
>   target/mips/tcg/translate.h               |  4 ++++
>   target/mips/tcg/sysemu/tlb_helper.c       |  1 +
>   target/mips/tcg/translate.c               | 10 +++++-----
>   target/mips/tcg/micromips_translate.c.inc |  6 +++---
>   target/mips/tcg/mips16e_translate.c.inc   |  2 +-
>   target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
>   6 files changed, 16 insertions(+), 11 deletions(-)


