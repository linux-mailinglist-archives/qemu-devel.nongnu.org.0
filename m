Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD04566092E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:59:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDukL-0004ds-Iy; Fri, 06 Jan 2023 16:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDukJ-0004YI-DC
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:59:27 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDukH-0006G6-Nj
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:59:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 141so2085221pgc.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYLGuAFeG3+MXal8PXVV9y3N4GAF57B300dnEpQQjLg=;
 b=YcF6bT85skeVwsG1OCQspGHfCVj0V9XXPe3pmN1TDpPK1W47xwmcXo3ZrXbLMM4qz6
 DKrcqB7CrpA7G8Mffa6KRXlpsx7UlY2qFze1QSMurzBM6JOGGkgeYUhH7yfCj/BHnFj3
 eOylddDGuwMNv/hAlS3h0Q26TN/Qbwih5rJ62Ei/CrAr/TDm5o2w/a+VBmNt0Ys7+eJ3
 TYWlQNZE9lF8aK2vKeLN3tB7wwlyhgR/j7lyfxE1bh1a8CsqflNcjV9cli2SnVHmxpM6
 SSPMl3FMEheGL/GOUSak/n1d5kNzTDMB7f17FKyUQ/l/hg7hJu0bXTt77hVFPNRxipJ7
 gzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYLGuAFeG3+MXal8PXVV9y3N4GAF57B300dnEpQQjLg=;
 b=IX0qk3/ayLOWCegh3rdI4Uq1eif6OtFqzVtBH04VsipUGVPebXk7bbIgsr7CPdv9AA
 hOc93W9BW/dFUbgGKVV/wAt1tN3F/XIS8qLTn/JAcU13Oye2z2vEju9oLm1oLSP/6cAP
 vEwKK11GKl4FkgZyju6zdBPkbuS/966ebkdyyP34OjEfKpgG8RI5qpUYnpcqen2puWAW
 8Vn5nQ4gWHiR2OQpmAUOeOs1fZ3wzCJoQ3GnG2rfuirzmdRh9VDnD5OtrGxl7D5Af4gt
 4Cn1Qp3cKTWjDPdN0jJLTcb3HVGA8PU7k4RI9McpHeruAA4tQIF/lIoaS77Xm4alwRrH
 DPVA==
X-Gm-Message-State: AFqh2kqd9Gp1InA4bGztHiVRwnYoSNwX5l3nva+689FcZFVXSzpilkvu
 tXWY1DzWRk/jZUO5x5Yis7g59A==
X-Google-Smtp-Source: AMrXdXsc+Jwh/8OfVf4PWw/95lzoDJmY3hlVCp/L0uqSmLWIfxFP1J3HKIjfFq0WCm2BxlXz3gr/8w==
X-Received: by 2002:a05:6a00:4c15:b0:581:9313:26a1 with SMTP id
 ea21-20020a056a004c1500b00581931326a1mr35753508pfb.23.1673042364282; 
 Fri, 06 Jan 2023 13:59:24 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa79477000000b00574e84ed847sm1571750pfq.24.2023.01.06.13.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 13:59:23 -0800 (PST)
Message-ID: <2ce60de3-54f3-3e9d-bf8c-fbffd3e2db5c@linaro.org>
Date: Fri, 6 Jan 2023 13:59:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 13/21] gdbstub: specialise handle_query_attached
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/5/23 08:43, Alex Bennée wrote:
> In both user and softmmu cases we are just replying with a constant.
> If the linker is paying attention it may even be able to sort optimise
> the call.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  4 +++-
>   gdbstub/gdbstub.c   | 15 ++-------------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 15 insertions(+), 14 deletions(-)

I'd drop the comment about the linker.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

