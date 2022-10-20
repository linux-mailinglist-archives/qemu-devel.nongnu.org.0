Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00560664C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:53:47 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnW-0001Xu-UT
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:37 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnK-0006Kj-Pr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXYY-0000fm-DB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:34:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXYW-0007vp-9s
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:34:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j7so35184310wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EjYLKK7TCvcST3C+VPjmQMY1f3y8aO03jojLWpMdC/k=;
 b=yuYmQ/QOcA36Gkm1XGZpyjlTGXkc++QQEO+XNusgix2V94O7eFW6A+S+TXyIeK51kM
 1XB+MnC8VrRyrUFATDlMWMR3XWGhQy654qjMB7aD5AqDeTGP7vzMOB9VKYXjnndgFVfN
 71ZNeXKRHophEaarTZpfknFeft8DgjKVAsk3TW1emgEClvnESZ1cTN7KJeBl8V74b5JL
 E4v4pnOssiuTFWmDLsUY/azYSbGMxw12H/A8TZl8ixkRXR7kafG1OnKDwsLCQNifK44r
 gjqXipUfHaB2cRWu8O63Cgueur5WEyn+c1E5YrSVQcyXudGjvMbZkBgfJwXhst5c/C7B
 VLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EjYLKK7TCvcST3C+VPjmQMY1f3y8aO03jojLWpMdC/k=;
 b=uv0VyTHq5+5lJw5j/3whO8Fa80eDemNBpb/7+LE0UZCEFalaR4vmPP6oEaMZKIqtEp
 +Be/hEqKd77ufDQk1qHyKIN3oRAZTljN7Dm4KmyP8y2HgBG9ZMZ+NUknowPvxUTVNxae
 Jr6BCu7QXOqc7iITJXLETizoJA0y1iYexFHtTG86xYC4M991LcPqjkcwJwZ05kWzaRz5
 thekBjld2/Z0WSpsjW0zriEiKcrczul4Xzuga73OskP8VRkJSwVBp9px5aFK2tMsBEzV
 abdRAC4PLjNbhSYHPbGedck4a/MOLx1udV5Celwwob/M3KBu4d2xKB5mEmUKAhEEUcql
 9Y8w==
X-Gm-Message-State: ACrzQf3PwtFipPyeSydy3sJkgKzoAsmenm52FFAWV8GD9VXsXe6Khb4t
 YcaA/6E1pUZvGUdXGx0gS+PIOw==
X-Google-Smtp-Source: AMsMyM4JuuQXwhtYwzm6h9HeRJkjTA8ICocN48FPPor7qUeMbISM6zvcK2X/ejYQy4/Nc5zOB+0S+Q==
X-Received: by 2002:a5d:6d86:0:b0:22e:404f:1101 with SMTP id
 l6-20020a5d6d86000000b0022e404f1101mr8732363wrs.343.1666280038497; 
 Thu, 20 Oct 2022 08:33:58 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfe74f000000b0022cd59331b2sm16118985wrn.95.2022.10.20.08.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:33:57 -0700 (PDT)
Message-ID: <fb7f5cac-0249-d7e3-60e3-1244e588951a@linaro.org>
Date: Thu, 20 Oct 2022 17:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3] hw/core/resettable: fix reset level counting
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Damien Hedde <damien.hedde@sifive.com>
References: <20221020142749.3357951-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020142749.3357951-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 16:27, Peter Maydell wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
> 
> The code for handling the reset level count in the Resettable code
> has two issues:
> 
> The reset count is only decremented for the 1->0 case.  This means
> that if there's ever a nested reset that takes the count to 2 then it
> will never again be decremented.  Eventually the count will exceed
> the '50' limit in resettable_phase_enter() and QEMU will trip over
> the assertion failure.  The repro case in issue 1266 is an example of
> this that happens now the SCSI subsystem uses three-phase reset.
> 
> Secondly, the count is decremented only after the exit phase handler
> is called.  Moving the reset count decrement from "just after" to
> "just before" calling the exit phase handler allows
> resettable_is_in_reset() to return false during the handler
> execution.
> 
> This simplifies reset handling in resettable devices.  Typically, a
> function that updates the device state will just need to read the
> current reset state and not anymore treat the "in a reset-exit
> transition" as a special case.
> 
> Note that the semantics change to the *_is_in_reset() functions
> will have no effect on the current codebase, because only two
> devices (hw/char/cadence_uart.c and hw/misc/zynq_sclr.c) currently
> call those functions, and in neither case do they do it from the
> device's exit phase methed.

Typo "method".

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1266
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1905297
> Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
> [PMM: adjust the docs paragraph changed to get the name of the
>   'enter' phase right and to clarify exactly when the count is
>   adjusted; rewrite the commit message]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/devel/reset.rst | 8 +++++---
>   hw/core/resettable.c | 3 +--
>   2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

