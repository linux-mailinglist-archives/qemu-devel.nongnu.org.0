Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F03A07D7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:37:08 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlHP-0004qp-IZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlGO-0003dE-4B
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:36:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlGM-0003JR-Ey
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:36:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id v12so11540557plo.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ekvzbLgNguxYyCu/mbACIGRwEcv6YiD11OHu8VN2gkg=;
 b=eTNFj6jDKyHcXHKx7VqVR/YGdqwSp2cyg181m2bOHbEe12J09pdLH0I2wHA7Gd/ssU
 0/nZ5aAlpI+gRyWyoICFTfp3qP27XB6gQIK5n+HRFfXIe87M+9z810Q3OtgZp50RHz2d
 2KnhjGbQkEiFw2xjO0uWbyzlmQ57kCMtepjYc6VTYHXVWtNBoQoRQ77wJ6WDlr7lCMKM
 kyXXnWXrWocp8M4ACFHMNKXChZGqHRNhsUuU1+Xv5oLaMeXkIiMVIxO287zPQJE2L3r1
 uFz2kNNYWNfLyn3oGkNAVDH8wVghsnigADI+p4g5qESOKDmRwB/ZrBG0HSZwUidA0AIT
 ZmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ekvzbLgNguxYyCu/mbACIGRwEcv6YiD11OHu8VN2gkg=;
 b=ZYRismuccCy9X3B4JmbFndB1vq1BZi6raHlEyyXuZD0fDH6eMrbEsexqauWcrJW/V/
 QR6wz2EwNjzMKl3G3nckfQZXM5xUF2Z53gSxUAKU5bSGU/TP84xKwmtDbOaWpTCoQJSm
 aUT2wSV3fHa7QaIy3zwvaH32RTQmJHmzsfYGpTI76PJLGCkG/WbNgD7FElnOJ14NuFpw
 U70nJkfxbLdG3kxLVMyWx3c95+jqh0lFuznOaQEWEkGuBoRuzgVc7LGLlcAFsRZMrh9D
 lmN/sAkCVE9GRKx2cZCjFcruk+UA7NcMszlJ0o6ET3KeLLBmG7Lq04II23BTJ1QoLIcS
 MjeQ==
X-Gm-Message-State: AOAM530g1DRdTHzwNH1eiUlg28bCjY47WAqkaTSgrJCEZ5O3Oln87/KN
 bOPOSs4ZmR1ONxkwL9Tyqg5q2qAUDPUCcw==
X-Google-Smtp-Source: ABdhPJx9AooC7gRVTln3m+8QR8e3fJcTyxZ9aI35t6k9qcZEZFJ/vb6bOQSLyZPZSaTwm1oIegNrrw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr29259710pjc.20.1623195361049; 
 Tue, 08 Jun 2021 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w10sm11809843pfg.196.2021.06.08.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:36:00 -0700 (PDT)
Subject: Re: [PATCH 25/55] target/arm: Implement MVE VMAX, VMIN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0951ce4e-45d6-c271-511d-0917479c1b4e@linaro.org>
Date: Tue, 8 Jun 2021 16:35:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMAX and VMIN insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 14 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 14 ++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

