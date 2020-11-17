Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC782B6ED9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:40:00 +0100 (CET)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6pb-0006vy-UW
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6np-0005fS-Rw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:38:09 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6nn-0007fr-7P
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:38:09 -0500
Received: by mail-pj1-x1044.google.com with SMTP id r6so1025928pjd.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KHiyKyerFC8it+Er4E1SheFExMfIvsLI4VKNNqfXiLY=;
 b=Nt8A3HGYwpB2mAtHTLAP/D0US07oaeGrAa2dHYa8PAWBHSyzQYA8B3JSR+Ft7im3+z
 PzVs/q/9yM2tQtBGlQdqXXdrBeG/SHHTwcZtKtqObndx8eq/mkZmZSOP5nrLXhDAmm4i
 fTUHO+Qyz3Z+7A22QolYysWolBWKuXStRoYgCclr8dhaJwJp+K7N05I+5AMGXMyMbjrQ
 2jYI9L7hcNgFsCzEb+wgBbLA/odOUqy+FlJ1qrCIq56Ujjru54KLhf8cHs3RbahnhTsn
 vUwUnPCwm3iOtFO5J7eX/wFfXug3pZ/AVYXVqQX/m1BOTO4VYJcZc/ZNkkUJInPzWvac
 KzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHiyKyerFC8it+Er4E1SheFExMfIvsLI4VKNNqfXiLY=;
 b=uBQf9xiTYXXVf2AdN/nZF9oWLi+ceyvaQSeYm6XnY0jWW2L4L9GHtsDhTD/UAeqVwN
 YR0AEZDN8S10SzJJrMa3wbbOrkwcuzRYqPBEfyo21Mm8lbja0IiC9vR+I8OBIX74pt8w
 K9rbRciXfLRXGfKrA+w2km4DCzeyOTqu/fsDae5QoijUCBnqrLyMC7vzG+XOH0c6IJfz
 eVxB5wKHLxUyLgXZ/8JTdfShW7Dqo5TzVG5+F4A7Qie7QWvVKC7nFKqurdJYt2S5H6kg
 386wRVf+14GozyTfMWs1PtlAR+z53YiMzQg2DILOW5Fk735HRc1PG09wQUTiK+PXUpbC
 ZMTw==
X-Gm-Message-State: AOAM5305Y/OFGs8ErkbzkErvCvI2IG3xT+VZm0KaUvaSKaOo4A75cfTl
 UEGBL5BVHEzCrJFLPhO64KJBcuwiNhw9dw==
X-Google-Smtp-Source: ABdhPJyZIFVw9uZJAI8A75/wxBlOWC3UBz3iILhJVzWkfrGVNHI86zH2bJg92fGUk9eIq1y6OeYBjA==
X-Received: by 2002:a17:90b:e87:: with SMTP id
 fv7mr578769pjb.207.1605641884905; 
 Tue, 17 Nov 2020 11:38:04 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u4sm4044320pjg.55.2020.11.17.11.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:38:04 -0800 (PST)
Subject: Re: [PATCH 05/15] target/arm: Implement CLRM instruction
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <477d7372-6b8e-7480-b54d-061c4ca4a14e@linaro.org>
Date: Tue, 17 Nov 2020 11:38:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In v8.1M the new CLRM instruction allows zeroing an arbitrary set of
> the general-purpose registers and APSR.  Implement this.
> 
> The encoding is a subset of the LDMIA T2 encoding, using what would
> be Rn=0b1111 (which UNDEFs for LDMIA).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/t32.decode  |  6 +++++-
>  target/arm/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

