Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0964201DE
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:03:57 +0200 (CEST)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX25s-0006pS-2W
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX225-0005ME-Sz
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:00:01 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX224-0001TE-AC
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:00:01 -0400
Received: by mail-qk1-x72b.google.com with SMTP id m7so13937440qke.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1B/JeqDp4KezkxVwQoVPC1F9zEeGw82H2NXfFbHBMJY=;
 b=w8UE+zwC6y0rt1FEEDqy0h4LoCkZG2+hasgduYHgxX23TzihSEYjReqFncP4fYYSpe
 FVroM4VkjgMwqtBf3AYMM51as3kU3QYyhZOiWlejSApQ9m9C9ZAxDgHfRMB22pRUCD08
 qIHDZbdzLZ3ytsLsa/SiiWX4mu+VC4B/XeIsBbKHUdZnjZeFhgiyYb9pWcx3EPMQui7I
 o+gLU90m5vXvHInpT8CkhHvFDbgcgPUa15mf2R9dUSph8LaKYTZvC3C8EJFuoATe0fmj
 5ywDwO73IqM6mlmxzfK/J4R9WOUEzek9G4lITKf+g13YlzjW9FWANTWN0zS/hVSPm9MR
 M3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1B/JeqDp4KezkxVwQoVPC1F9zEeGw82H2NXfFbHBMJY=;
 b=pTkpvREVVgv6kafgCczR/7Y+7hmPpKLAxEPCCJVzOMEkKN059XjsU7LuKB0CekRAhT
 L4sK+JY/kC1BdcbSZ3RnHjFmACgV//aUrMWunOLLNPE9EAifu9zpO39cxQ94D4ReE1m9
 hIUbhD6Wr7asrLXm4/Bhqd3UgrI7RMzoF8msugT5z+b5EjCxjfu0wN7mw5bZ3rKl5im/
 EUB8UzUOHN8Tn+ow3dQ2gbYjdvWUPiu3aaluwWBfEOlyyYR0D9jVZN0rPJ6casAZCGAG
 BsAmaZXslvwAjULgFYgl2jZhkRS6E7G35hJjh1njF76e9/DUqg9NDqYOx6tSIM5zkUan
 TLrg==
X-Gm-Message-State: AOAM530BFZZ6EuAbXSs9JM33sf6LPt+MyCa2RkpthqTKDGg6qd6L8h2G
 wbs1bDwBTiL2mkvUQgC+GjhmEg==
X-Google-Smtp-Source: ABdhPJzYwT2RYDSw+xhupWJpl3/JKbwX/8dJbnuOTuwxWV1DoLlp+bVh2RGoMOHWmIx8QxlaJGQ+Xg==
X-Received: by 2002:a37:4050:: with SMTP id n77mr5970841qka.267.1633269598995; 
 Sun, 03 Oct 2021 06:59:58 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l19sm6031832qkk.12.2021.10.03.06.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:59:58 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/hexagon: Use tcg_constant_*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003004750.3608983-1-f4bug@amsat.org>
 <20211003004750.3608983-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8400fee-57f7-3195-7cdf-61aec501a9bd@linaro.org>
Date: Sun, 3 Oct 2021 09:59:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003004750.3608983-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 8:47 PM, Philippe Mathieu-Daudé wrote:
> Replace uses of tcg_const_* with the allocate and free close together.
> 
> Inspired-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/gen_tcg.h        |  6 ++---
>   target/hexagon/macros.h         |  3 +--
>   target/hexagon/genptr.c         | 39 +++++++++++----------------------
>   target/hexagon/translate.c      | 26 +++++++---------------
>   target/hexagon/gen_tcg_funcs.py |  4 +---
>   5 files changed, 25 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

