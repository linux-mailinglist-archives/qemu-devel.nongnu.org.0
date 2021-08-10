Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32A3E81CF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:05:00 +0200 (CEST)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW7X-00040W-K5
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW6b-0003JJ-Ap
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:04:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW6Z-000490-FJ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:04:01 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j1so34261565pjv.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kO0lxPA2RvXeAr8q/gg9yj8qYm+Ijt4RgqvqZDLChls=;
 b=FUNpkjs/UZ2NQygoDem9o85PBc1Vi5lxbX9YuQL7HvX39wvYdHxEjDxqwvMF1iFowU
 MSsMz6uXHzf6lj4C08XQfme//IaKADA194Ck1g6BUtnMa+hVDkq29kUAiXSkdqs0VN6c
 BNyHFj/ScBI96B5FZxMNCmSggPFzQ+WcHXddGWkktOdOLzPy/6Ze7F2nSFIzeB6IVTvR
 RHGRunmPPHDjkFY+0VRtzSfLfAF+Y3QdpEnsjwTrPcoFD0WxORdw2LctxV3XWJ5eWjhV
 Aarmb/IsMs2jLBaxgrTvyM2jILyfoMdG3kA5c9h/x4xU1Hc6BfnpCQ60kRWhfCrfaKVr
 F0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kO0lxPA2RvXeAr8q/gg9yj8qYm+Ijt4RgqvqZDLChls=;
 b=rnFJqFIpdNPv0ApVolVex+YYdDxKJkROXiDmzMzMKLFIVILYylJOO0UVOUVWmTwFwP
 VdW8C73+9PtAqA6ZfQWH0ludwnBwCUbUWjPOkk1d3hDE57jZ1oW0CBiEBO8VPUg5sZKt
 JB4YCU0bHNoNj9JOiKr0Deq7NU0RZKgN/cXg1kZ+Dl9c2NGyhs7wTxhbv7JcDCQnBMLR
 gCNHwiTFum5K3EG9cq/YOMFSpsBUXmTzVZlGhgI/Ao90ySsRTSSKmpMv9KFIwEm+3HDD
 QdfWC5jyDMgYtsSmEocBzHANd3Enl2GYdPaUaORbrpr5XKfbiElZzJ+uT5WBTwxn+Ao4
 hypw==
X-Gm-Message-State: AOAM530uJ8e8nuD3G6MLbZwGswG0S7pGIsKvyWvIzOh20PhWPpE4vih4
 wEMAgOylukN7mAr/vnGJFPms8Y2B/hKMig==
X-Google-Smtp-Source: ABdhPJxVtGrYLQLWrmcCsueBqMdjvdaicMcV6nCYy8tMnc1iYagcYLWnalM7U4REx8BIQJgWaS4dLw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr33276118pjc.20.1628618637617; 
 Tue, 10 Aug 2021 11:03:57 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id e12sm24464132pfc.214.2021.08.10.11.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 11:03:56 -0700 (PDT)
Subject: Re: [PATCH for 6.2 47/49] bsd-user: Implement interlock for atomic
 operations
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-48-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ada6ec77-3146-bda8-d7f2-d59bcea1ad07@linaro.org>
Date: Tue, 10 Aug 2021 08:03:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-48-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Implement the internlock in fork_start() and fork_end() to properly cope
> with atomic operations and to safely keep state for parent and child
> processes.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

