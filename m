Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CFB6D2664
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 19:05:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piIAv-0007vs-4P; Fri, 31 Mar 2023 13:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIAs-0007vG-Ma
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:04:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIAr-0004E7-3m
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:04:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d8so13815414pgm.3
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680282263;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=73WpggZpPKBN91u13PaflwC4TKPrC0vrOYMOkErfrQ8=;
 b=uCzjj/Fa4JUFL9bfexRbHhpxajmAC02PCPJNxR9WB3xJtQRtNLjFKNsPYPc3YqHU+N
 P36WhhpkIiceihRaWlmywsnVPN/w258EZpoFLwA6PaQeKvEhF+tLbF62BGtMignlMjCo
 rEK0aWVyGR/OlLeZ4RssDdms07h8QJDAVeqcDAJOpV0/dkDtVj1pQOfxWSO7CofmnW8g
 rFc0+NO4MIIYwy8JNmAPIv+kL76C8yB7HUIVt0X0rREqcGm+33d3WTb2iKgOUWPIlq2g
 u8XG2+Gdr1bU+BqoBxP9WcyJo+5W23BeI1pHkoJbH+1wmcvnn1BUtwzeddqYtvlFLZB5
 0yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680282263;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=73WpggZpPKBN91u13PaflwC4TKPrC0vrOYMOkErfrQ8=;
 b=uhoEi0vN6BTTyaNLUAU5vXKPnyJMKBJx5UG60anmVXd0DSYozMj4luZ6dvI8lptqjs
 xibWzFl16VF0WbRWkIM7b0TNiniPZpJnUTQLTRBheHT8IlzjdDwKH9rFRloiCXQFlQbm
 Llou2B4TsQ473zhOWJJYIlCwIY1376uCB+n1MwRp7Ye1ZdvPVFa6FVXELljhaQyjHkld
 W/5/ypy9F0ww3tonF38SyjidMjMTvs4X9F7c7muWmkWjK+qxOj5S4rxnluM8Wb7E67gR
 KIjiVo3Ym47NGfsQKp1dJ6bHW/a6GQo4YBcMgeSo6CzUPnlDoZodls5VX07lkyfYIeAI
 r5iw==
X-Gm-Message-State: AAQBX9e+x2XsTYtajZf02LppmmXNUe/WPxMHQ2J2j1yfRvzbtPGVY1DU
 x3kr0H+6bNlc1sxYDas6Vj3ibw==
X-Google-Smtp-Source: AKy350ZFUZFlwDe7r9QDd6/q1AQnYjyeH/VJdZ/bhivf6IucEtmCKXUmN/NYosbeCqQuVUBq/kqXLQ==
X-Received: by 2002:aa7:954a:0:b0:625:cb74:9e01 with SMTP id
 w10-20020aa7954a000000b00625cb749e01mr27653991pfq.25.1680282263518; 
 Fri, 31 Mar 2023 10:04:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 i17-20020aa787d1000000b005d6999eec90sm2042476pfo.120.2023.03.31.10.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 10:04:23 -0700 (PDT)
Message-ID: <db3fdecc-1438-fb80-0853-6d3482eb8ea3@linaro.org>
Date: Fri, 31 Mar 2023 10:04:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] target/arm: Implement FEAT_PAN3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 07:50, Peter Maydell wrote:
> FEAT_PAN3 adds an EPAN bit to SCTLR_EL1 and SCTLR_EL2, which allows
> the PAN bit to make memory non-privileged-read/write if it is
> user-executable as well as if it is user-read/write.
> 
> Implement this feature and enable it in the AArch64 'max' CPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu.h              |  5 +++++
>   target/arm/cpu64.c            |  2 +-
>   target/arm/ptw.c              | 14 +++++++++++++-
>   4 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

