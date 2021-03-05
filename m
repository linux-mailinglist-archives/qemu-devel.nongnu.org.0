Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576832DEC1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:03:42 +0100 (CET)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHysX-0001hp-9n
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyql-00013G-Ui
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:01:51 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyqj-0007Mo-9g
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:01:51 -0500
Received: by mail-pl1-x634.google.com with SMTP id d11so483198plo.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 17:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=26ZkORpArUY3+nB0gzlG6aUCNu19Oj9RSQzSwutzoCY=;
 b=h+zC/k3EllOplqdq0wyykUBdxmviXXuQxHgUxsBZgWnklyBOKYXbK+t/eH6Q+xWrSu
 wCsTf5+eX09DRlKNq3IWBGUHPS/P3D/aipu1L8NKrnb/mJMqDh0+OexZhBh8OIiGszqT
 OnmmSgSFIOJShXrapRPqHU/b8qI0scbXUvbl3onIfrHFq1TFiSfXXUVhU4KV0OQAoyRa
 aqoXFb5nMv64VUCKgNOQ4f7fLNZKaK5eW2+KlXl4dilaNFCpAtPD0gSn/LjI1yAxJmtT
 geoKHCVg2B3BsNJ/xpLcbH7ybd3ejs7XtjTRqf8qYEVbSoweiXrGEI1ZrlpvCCmArCdE
 w3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26ZkORpArUY3+nB0gzlG6aUCNu19Oj9RSQzSwutzoCY=;
 b=AmJGKvybesrSRP9nkwcrMICp8Xa9+YVgxBlC9b/GOUyU4thl7QeWPHGjeBwiTgOfxd
 c0iB2vLvLtPl3v2McvMpW3Y2965BDa2OCU5tulf4TJfRT+Wxn7eN7Z7xgymBQuNE6cfI
 s0OaJyAsE1DndWNudQ7VW2gGnyYv8E82+3RZWcafEzkv/a4Q53s97FwYzgzj7r+y3Q+a
 1YicLdAhgrQg5uwUQjHRBMUU0aKFaAHqiTr4LF3It4IoZO6yQvIgXMfk+ew7O3CfGUHp
 Jme1ioENdtnfqyWSF1fHW+hOYyKbTqSXpxvvR0uU6kpXMmHzmRXXvL4yQmCrowKad546
 ruUg==
X-Gm-Message-State: AOAM530uOoJqt1qI7H2axyJuC8dkAnl9b3azGf8AhhgvXmDE/JdCZyu3
 QDCjbA+FL0gZE8VSmN/oc9qT4Sxh1g0V0A==
X-Google-Smtp-Source: ABdhPJzlgZJFVXplC9EzOZJQRU1rstJVjsCOA2n+4DFl06UNPnOjjBUVwWDJ1x9yYA977kBcsC6L5Q==
X-Received: by 2002:a17:90a:8901:: with SMTP id
 u1mr7188604pjn.21.1614906105962; 
 Thu, 04 Mar 2021 17:01:45 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x9sm399533pjp.3.2021.03.04.17.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:01:45 -0800 (PST)
Subject: Re: [PATCH 40/44] hw/arm/mps2-tz: Support running APB peripherals on
 different clock
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a38e3500-7c3f-4646-dcff-e97e496a4ba1@linaro.org>
Date: Thu, 4 Mar 2021 17:01:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The AN547 runs the APB peripherals outside the SSE-300 on a different
> and slightly slower clock than it runs the SSE-300 with.  Support
> making the APB peripheral clock frequency board-specific.  (For our
> implementation only the UARTs actually take a clock.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

