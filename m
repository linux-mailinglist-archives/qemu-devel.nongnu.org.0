Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729B69EBB0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcga-0003Xq-BH; Tue, 21 Feb 2023 19:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcgY-0003XU-5d
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:08:38 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcgW-0002p9-Ci
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:08:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u14so3006758ple.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bOJ0ThLM2V0+isDPQ2kfX+/6tJjjoELSw+/N+MVGKIU=;
 b=QSyrZCqivLDCeQuBkeoaFnzqwfoOsr0e05uxy8nn7pPyW/4rNk5ndHJe6H8tpvVhx8
 Ws+orTGzSoGisOO2u1dDG2+h0ocu5q+M3Ay2UGb4aEvtSU3BS6EbOrgPTLWKiQ95r/Cn
 rXez31DDOC+opjU1vW07eEp2gAGilHBHYbBSZ0tcNan+sEFOAPevLztOf2AcarXghX1y
 oj8XKr+sJykAF1GRbzxngzx+PAijCgwg1U1Y2+mhpurGaWZciroenfvQGGyroJJuXEzG
 +ED7nMfZSizxqIyTmcVS6CWAoxgE6tEjr6g2uzFZY8xWa0gcV18LNXQV2JUt9B2TCFtC
 U2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bOJ0ThLM2V0+isDPQ2kfX+/6tJjjoELSw+/N+MVGKIU=;
 b=5HLD+ljH+WrAEPbIDMk1RO2DHRqu1bl0FoTtSJOy9s6dZTYSN5HMRDovN/yGYGLuVz
 oVY21qRZUDxQvZvlx5g/MrOSXZWlxoKdE9McisAMiVzo5JjiZ4UMNcYxVK7Vr+jqmQrt
 sfR95WaaZ1NhpaI7Yb2dl+8D0RI88f8sAumcSqCGnwcM/G+wmAlWHZsDVn/iJ5lIpbwl
 7bhM+DndOEGTj2uv5Vogkbs1eEOJ1xV365fwXqnancV6bitKP4AMoQeRaF0Pca538kJ1
 aZ9AqBhiY+wRRw9bevnR9UhXRvLXY2XLYLbfGwt8cOF0YNW6EH8dqB2ZcCa3NcUUYZzq
 lLPA==
X-Gm-Message-State: AO0yUKUJjglu/lNl3HmqYN636R6FcOrW69zY1ytXCpxH0myQO7Icd3Og
 ssAoSGBg9WQCYne2uDWvCB+5mA==
X-Google-Smtp-Source: AK7set8i51asPc9IAixJzgQn2OhI1em4NAQZvzYuQUT1vrCNuREHU6RTpHVMM+1YftDYtZNdwUxJNQ==
X-Received: by 2002:a17:902:ab59:b0:19a:a9f0:a019 with SMTP id
 ij25-20020a170902ab5900b0019aa9f0a019mr7911007plb.21.1677024514762; 
 Tue, 21 Feb 2023 16:08:34 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c15100b0019a7f493151sm5671029plj.212.2023.02.21.16.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:08:34 -0800 (PST)
Message-ID: <5f783b8c-a9db-876a-9955-8388bc68e4cd@linaro.org>
Date: Tue, 21 Feb 2023 14:08:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221232520.14480-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 13:25, Philippe Mathieu-Daudé wrote:
> In order to avoid warnings such commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized"),
> replace all assert(0) and g_assert(0) by g_assert_not_reached().
> 
> Remove any code following g_assert_not_reached().
> 
> See previous commit for rationale.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/spin/aio_notify_accept.promela |   6 +-
>   docs/spin/aio_notify_bug.promela    |   6 +-

C only.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

