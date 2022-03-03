Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532844CC859
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:47:47 +0100 (CET)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtIY-000767-E9
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:47:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtEq-0002RU-Fe
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:43:57 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42842
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtEp-0004g8-1Y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:43:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p17so5950152plo.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=plTQPe/r5g7+hlio+uDC7OmDMm62E8MLK0Py9bFYnwA=;
 b=UtO2A7/1dbe1yn49+sVUYwHcEre2zZ5sKA6BRd8yy4LssQIgy9TYkchNW3iiyKOloV
 J4syd7GgQF8yBjsw2PGKO9lKIDXJ+XgJIYOCUtL5JoOjmAmO9pND9mOJ33AX66ZLo462
 Um2imo3RfOr7IInsgZiTCB40NLftWAu5Q5jSw2ybUh0DnALwln5iNlKjJmYfUBsAyEOZ
 RpWaPrhLlAGkK5P3KUey8rwxjhl23DyzefJR+xSBvSmRfFPASaFHC9IYDZccL7QkmUk6
 Gh1kCu2Kn/1mdNtfsAnHdR/wvQwXKJ/d3BZuP+A5dvfNkWoi3Zt2cYmrEJ5URVF5A868
 Z8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=plTQPe/r5g7+hlio+uDC7OmDMm62E8MLK0Py9bFYnwA=;
 b=roUdRsn7SVmT7gKekrZSyaAFG9ZNzmtfmwVD5TVnUwrAwyeJ8RWGHbrWXKQgSdIb/W
 UxcI3exBDlZqGukMpG1Q3W9fwqUCqOPPUoKzarMf2mCmjzm4IPxO+/+kpRMGgMvue7zt
 Q+CZ+M3fGUlGeNuSJjHQau72uK+KDHlU7CDZx7P+M3URHf+eQAMmvieaoVxxK3KioeFB
 nx3rEn8du0fqJoMAXQNX0dqcAuQ4Rma5zrHCPSerb76I21RKK/vlWf2iRrlJL/0i9lG6
 T5Pv0h1VqbHIPR+AEbP21mJnDyrjCEgnx+sMhk7wspKmTU2/khz+69EV40hRRVqRe54p
 k6yA==
X-Gm-Message-State: AOAM530oCBAJSdbAXVce1TAHXjLLbAlKnadRRm62XJhPum3FQsSNYVXJ
 XKSpfUnk/u3+1BdS7hx/egSu9YBWXKWyRw==
X-Google-Smtp-Source: ABdhPJy4L2SvrdJAf0cgG2csPnsAZO2KVTjSCKzS5aWlkl6n+WF5mNI8LCC/8wbFsbDH5YdUjnbcjA==
X-Received: by 2002:a17:903:11d1:b0:151:9fb2:9858 with SMTP id
 q17-20020a17090311d100b001519fb29858mr8258769plh.136.1646343833740; 
 Thu, 03 Mar 2022 13:43:53 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm3611280pfh.143.2022.03.03.13.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:43:52 -0800 (PST)
Message-ID: <c6921e8c-6e92-8fe1-56c0-3af872983364@linaro.org>
Date: Thu, 3 Mar 2022 11:43:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] hw/intc/arm_gicv3: Fix missing spaces in error log
 messages
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:23, Peter Maydell wrote:
> We forgot a space in some log messages, so the output ended
> up looking like
> gicv3_dist_write: invalid guest write at offset 0000000000008000size 8
> 
> with a missing space before "size". Add the missing spaces.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_dist.c | 4 ++--
>   hw/intc/arm_gicv3_its.c  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

