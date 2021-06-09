Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3B3A1E12
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:26:14 +0200 (CEST)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4mD-0003wa-GJ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4l0-0002gW-CT
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:24:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4ky-0006oJ-N8
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 16:24:58 -0400
Received: by mail-pl1-x635.google.com with SMTP id e1so1878071plh.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lvDJJdAhGiWcxyEpCa3rUVynuY3VH5QLUcH3SmNbRsQ=;
 b=deAwi04oF8SZJVkq1v/PeKl6Q+0CZBmrsLOrCXTGQFCt+1JygrWbAEUbjTdAxPHcWv
 8i65P/9AhYXUzpIkR6Lfr+OOuhAciO6h0dVNZt+pC1hK/fZ+B3W4y8V9+8J/hnN+/lAC
 Sf8ksDW504AW+6bzoNR/9TaFw8Y7JD62ac9k4JLLIlmO8/iBdSa99i3xftfIIg6wNzxw
 BIXOXX3ygpH55Yqq0/U2WOmLe7KdHroQYE778fdV0bTnI/UEFeO+4NEg7kIVYHpo71Rd
 5cj3YdmpKPQLrv1DA9oD96zgDI/af46eMuemHAKA18yWNbI4ZvUZQ52LPfnmo/ADiJK1
 lVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lvDJJdAhGiWcxyEpCa3rUVynuY3VH5QLUcH3SmNbRsQ=;
 b=rbhV+4j4SjV2b85tEJyOPdrErrz5f4Fvp9LRURXPx3RcOCJLU1RPYee3Qn5oKxHRqz
 VOMnb6mgs5LqxnQ+yATD70/ZT89eN+rJx0YEBe+LQMUZWFb/qrN+lY2KrYCckhFOqRev
 uy7uSztjdC72Bx3rR4EQOQV4ft+INiwLq74YE5JypiTQzCnKnom7dAoERwLQvd6v/Vdl
 08FEWwrlkBr8JRR89aJXqdYj6OICd/ZzXQmSIMGbyaUTZ6X4Yq3nxYRSiEu0M/tNNyqK
 cK+vZWqCBRdWtZQdBinXrlxqw3uPvwJ+JRAaSevYmbEg0rVOJvAM24VzIOrdrOIMNOPH
 6aiA==
X-Gm-Message-State: AOAM532JJF686/RD4lY/JkollmJc1ovEfw6NRPzNEjrbyg1e3wHTkOHr
 igTV0ZnELY01eFZHpmDYIs+MZ9isheLSSw==
X-Google-Smtp-Source: ABdhPJzIaVV5UG4o9Qknc2o2R5xyFcohXAZ22jOxIfEh1faChlVHH7lxWvs6e2r0sTpMqY7RXLqbcg==
X-Received: by 2002:a17:90a:1441:: with SMTP id
 j59mr12184479pja.152.1623270295401; 
 Wed, 09 Jun 2021 13:24:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w2sm365446pfc.126.2021.06.09.13.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:24:55 -0700 (PDT)
Subject: Re: [PATCH 50/55] target/arm: Implement MVE VRHADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-51-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0a3d6a9-590d-a687-1e4a-c760d8e7060b@linaro.org>
Date: Wed, 9 Jun 2021 13:24:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-51-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VRHADD insn, which performs a rounded halving
> addition.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 6 ++++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

