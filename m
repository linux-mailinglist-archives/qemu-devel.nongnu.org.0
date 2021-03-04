Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74F32DABA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:00:23 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHu90-0001bi-3y
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6S-0000Ad-RR
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:57:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6R-0005mI-BI
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:57:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id d11so16764908plo.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Gc80jmjHOVt3Jl87bCK7+mkJZ7Hg3sAmhWHfe7H2xSI=;
 b=TWtGIytKpmFoBS92PmHi+xcsACjQRfPeYzhj7wm2YZ/IACu5weAdhckhOdylbeLbl7
 i3RRTvZzqyWBGJzef30Ihor2cpu/5cyBPF7IQYXMZccOQA2RkO7AhIu2VMQG64RdL23a
 dD1QZgn7xwFIRdvPWJ0nXEMtdFh5iTIRF7quZt0EXtR6ljH9vfWdZbapgjQEojjYLQQt
 j4Mm6l3L0X10jRM9QpsWeEesnST/ip3yUFHugFGcL0Jwo/FRv+1g/D2dxM27d9s9bqek
 VZJ3CfRQTkBWsT4R9pzzL+o1u3Gk55lI+ctYMQIWR75VagqN9PR/Gg+icBgWx88gqCjv
 XZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gc80jmjHOVt3Jl87bCK7+mkJZ7Hg3sAmhWHfe7H2xSI=;
 b=B3dPQJhFI+fivsan5wZxJikkdJ3ewbZ1Sz4ZVefEMWmC/IuDjufB3PCFrb8aXIE5GZ
 k07u2xvjMBpsh2g7heVwhFeEjI8P3QfobxnT1+Y3v/ncOVU+M1RXO8DWYP5iyj9AXyvu
 AIbemjwNX2oInlPzfupbDTZIjuokGpBwstOtK5f+MLH3vqJmjdgwEphqF9KgnybpchFH
 GgXKnB1AGi62mG1UV3keia4uVseZdoMYlzU0Z0Q4A15TpLtvSqAA2yMjTqSiQIneKQVf
 yz4SN4Uk3q6DU+C9xkxpibxZAlklo/L3UD7mwpDVOsvXG/RYU5SlLznEY7TPWBkf4Kmo
 0nUw==
X-Gm-Message-State: AOAM533dsB9TgNXn5uQdxpZyYCvyAbLcc+oUvv9Mw/mtNuF6o7aOTn1i
 gLhEVICJTIKzYRBDrfyo+1RKXdWlcEht9Q==
X-Google-Smtp-Source: ABdhPJzrPhy1WxFE/SKTQv+XGeHSft6DKIfPLp5xeS3cdnSzqUQQ47We58MjYOWlOrbKG37gamgINw==
X-Received: by 2002:a17:902:8690:b029:e3:91f9:eaeb with SMTP id
 g16-20020a1709028690b02900e391f9eaebmr5458205plo.34.1614887858758; 
 Thu, 04 Mar 2021 11:57:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b130sm207896pfb.65.2021.03.04.11.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:57:38 -0800 (PST)
Subject: Re: [PATCH 18/44] hw/misc/iotkit-sysctl: Implement SSE-200 and
 SSE-300 PID register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84b4b72d-b6cd-0d93-e9b5-376b1a01721b@linaro.org>
Date: Thu, 4 Mar 2021 11:57:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-200 and SSE-300 have different PID register values from the
> IoTKit for the sysctl register block.  We incorrectly implemented the
> SSE-200 with the same PID values as IoTKit.  Fix the SSE-200 bug and
> report these register values for SSE-300.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

