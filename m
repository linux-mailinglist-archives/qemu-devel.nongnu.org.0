Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EB26B20A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCwD-00073w-8R; Thu, 09 Mar 2023 04:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCw8-0006zj-SO
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:51:49 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCw6-0002tN-6r
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:51:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so826629wmq.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3xGj+n3o0EUp54MxUO9IgtAqXMbYVJ1HmLR4xNA0Qqg=;
 b=TpA/QOu5YwtGruFGppo0y2Mn6Swp/sNXV6CDyMKxs0dLUWb6Xg4JjoIMqTQjdmYS/j
 u4nD+6n0cZEKNBvvpOpuiLMPj5SRDFtgWLZiwHBVKLYnM3gN1yfcwPOIpd1GAm2B6Czj
 WPZMHt4RtAFM9Z3T7EkiNOlAz8UsEeweAWyUq5tZyZy/6iSxJK9JT7IN7gfL/47YH57l
 xdfHEGuS4mxgK/Nxb9QIfGxKZnxe5CbgXHYq++NVQ9ck/C81uY0K/1dPe22e6G1UdhiY
 Hgbf+WrvdxjPkeRvfa0YOr3PKU4DujuWYIck1wQph1IaNJ5FV+45dezj8tC2+w5cQ148
 WkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3xGj+n3o0EUp54MxUO9IgtAqXMbYVJ1HmLR4xNA0Qqg=;
 b=7xmoMXED0/dHH8gz+dK+yOnC14oAnN/j//UvwhWBEXPbaWFLt0Y12dfFRAqEZOqPw5
 9Pk22wytpmlG0Vcu/h8DgWYJXd9p1N2Q4BVml3UvdMPH2ys9Y1u5T8m52bq3dtrMv7ec
 uMM/eAKFfzZA6eeeoXFvrG0ixWTnzdIA+1rk3bhZhJwOSCWcnT6vTWOAOU8mPL/VVyCM
 65Kp2SS9unpN8ZzRWInRSqpfqGt9qga6r6QpMH0OY0PbU/eNuZr4Ii1ZcVYMEr9YljgZ
 YPofu7k/Fo2MbTubtJdkAahxaYsjO3lzUtyYc3mfNCRISCfOUUf0pcUiNpSoVwi4BHN5
 kg3w==
X-Gm-Message-State: AO0yUKVDUXCjFPs0Q45M94UHTFPNkyeoHNqyNcVx3kj/w3iOxH1P/aOL
 YCqg0ccLBjFuiE1po+p+tpw5ZQ==
X-Google-Smtp-Source: AK7set9NlEDvy3tw9OjN58sK7LfTTp5gf/euZ8zXZO8AF8mnfbRZeiJvJaofIJ/h7Q7ncgv72QYR3w==
X-Received: by 2002:a05:600c:3d8f:b0:3eb:3986:9bfc with SMTP id
 bi15-20020a05600c3d8f00b003eb39869bfcmr18257325wmb.37.1678355504727; 
 Thu, 09 Mar 2023 01:51:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c4f0500b003e00c453447sm2150990wmq.48.2023.03.09.01.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:51:43 -0800 (PST)
Message-ID: <42d6c6a5-4bd6-b9a5-5c57-dda1a592438a@linaro.org>
Date: Thu, 9 Mar 2023 10:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 16/25] target/ppc: Avoid tcg_const_* in xxeval
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 7/3/23 19:34, Richard Henderson wrote:
> Initialize a new temp instead of tcg_const_*.
> Fix a pasto in a comment.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/vsx-impl.c.inc | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


