Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD33276B9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:42:19 +0100 (CET)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaNu-0006Nj-EZ
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaMz-0005nE-Cd
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:41:21 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaMw-0006Q2-QX
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:41:21 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o6so10872644pjf.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e7JhDheMZfHdo69q8lTpaPiSuT3hdmt8cxbr+xvSuiw=;
 b=YWjaNoE8FVeQmwn79zvnXkaorQ8e3S3HVJgdjwDEIGIXSw9LU8hdUBRqxlBTCCbwfn
 A91oN9w9d3W24uBQ0IQJe4s4+ux1mdvAHJlWBL7+G2ui0tYcB5lumi7SUU3UMbJ421t+
 VQpbcQd3kE3+qcxBjxFMnRJ/uGPiwuRHNEgzFC30NhRK6qS59RUzEgdox1OVOZXC4AAc
 NEEb0J9ZwG33jGybXCRQjnl7dPRFIa8xzzcCXo6+pcrcajN9JO7gzkINF9THJSlTKfV0
 B654mChqE2VKGYSpsUIi1X57+S4AGsu43aJBGiZMIiLEFExnxhaCUorrDGc5508Mj1ZH
 Fdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7JhDheMZfHdo69q8lTpaPiSuT3hdmt8cxbr+xvSuiw=;
 b=AOF+aznpV8NEQOFxc0IGUrCrfByt0Jye69E7c1lOrxMuqgDukLm1Wl7n0KG+3i2VSG
 /WxXNeEtUC9JIAJTQrF8aL8ALqhz6+tJKhZZxob/75qg95znSZb52E28SKjep9yZ8VCk
 GAGN53GalM0BWArVeYYQO3ekTk66vvCGN0rSALveKlXWJGjVlPVTaG3gIK+ea0aUpa8J
 noVGCRA89Woy2NXvpXM6xLRDUrDi1P4bbGyuCxuo6R/TaaaVRP7XEiA/wX7VtDapIeKv
 a1MAm1bDueUVSwpMCjyGucERqx6og0A6pmCv9NyGwbmgnfAMqK+Bd8ojj+a7/C5m3bf/
 b1zQ==
X-Gm-Message-State: AOAM530GheIwbpK3cjA6hbs2yLXXFppByPaUpNk6pgT8xZJ91MYXb1xo
 D5CDWM/YZt00m/2fC+NC/NOYrQ==
X-Google-Smtp-Source: ABdhPJwFQivmmTsd53+qpsSfJFc0YiQotTSegjhD7FO5stVQ6eZ+lkgWUOyMvEPG7fCdqSzbSRQySg==
X-Received: by 2002:a17:90a:4092:: with SMTP id
 l18mr15636895pjg.39.1614573677333; 
 Sun, 28 Feb 2021 20:41:17 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q95sm5991012pjq.20.2021.02.28.20.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:41:16 -0800 (PST)
Subject: Re: [PATCH v2 16/24] hw/arm/mps2-tz: Make RAM arrangement
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0042c3a4-8778-753e-7a4e-67bf1f394821@linaro.org>
Date: Sun, 28 Feb 2021 20:41:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN505 and AN521 have the same layout of RAM; the AN524 does not.
> Replace the current hard-coding of where the RAM is and which parts
> of it are behind which MPCs with a data-driven approach.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 175 +++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 138 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


