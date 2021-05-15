Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B238173D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:35:57 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqiC-0003OR-Iz
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqhB-0002gs-Qg
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:34:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqhA-0004gW-Ed
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:34:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v12so1473389wrq.6
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6ACKqBczFvaF0JChRzSagj2RHB9up1PmF8RhVWvXPA=;
 b=c16SFVKovASkP0mvqp9vx+JHf04CB4b87BU/5uZLsLW79OV84Dqdf1BAwOnDoZB99M
 9CqO2IAY74f+/VDiZDBlRvCjN+HDADh61eJ2hZggYY5w2SI5CGZcgF9PDnEJE69Kd6rq
 Ul/rC8H0eK+P2IX7Uto9XhrbATzT84qFAFZUB9mtM/wH6xqRxaH5d5+iX4yR4eaTg2yc
 AP8UunsqMg0Bu7IDEWTP/JAjU2/omCvqVuJKVsnshcaRTjqGt6d9WqouIur25UdTQ80s
 9P9liMwYbBzXgulaKum7Ya5HjmxhxJfdvOVNFhA4GqxX6tu4hdTnsuUtEWJ5P8NNmX/v
 43FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6ACKqBczFvaF0JChRzSagj2RHB9up1PmF8RhVWvXPA=;
 b=Q6pLrHbVsqUZw5cWiPlstDE39a+0NP4xLclEOEjvVOq4NtOsvrgLGe9hn6VbQs4CEh
 L2nxiC20/FV2qBD1Jgr+UG73nVaDanc4S9xyZtoL25dojmRg1Hf4lZ7Cr0IoEOtKviwQ
 ss/x32bSoFIaRy/n8qvICFOBlXv74gPrRcXhQYAqXhC26sw6y8jDNtZqcO5dsiesOi0R
 JTf4nU0O0y6M4FoLYcjy5a4CMxoYHTKUQLTTs/c3+JnclWcu9Ju3K9EM0/SdEgyvaGhA
 M5l5dcP2LaZs6AAbW3lhz+vJPKEGQw6yCx6eHo7eo9HYtDshZGwOMyC/T5iOz8EOAS+8
 eAjw==
X-Gm-Message-State: AOAM5331/WxIA29N5hOWdt3VonO6W0UZy1II5CFlpVFrrfCpklcMDsVj
 tZvAdE2xUwgRWm8uY7H8vmJyahoZpnBjOg==
X-Google-Smtp-Source: ABdhPJxBEzmi6cJTdsKdATgPYO84XKmoYswn6a8IFSUO+qTEWk/XqVM0Xxc2BCb9x2DyXJpmHgqnMA==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr18304472wrq.134.1621071290526; 
 Sat, 15 May 2021 02:34:50 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm8895674wrl.13.2021.05.15.02.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:34:49 -0700 (PDT)
Subject: Re: [PATCH v6 17/26] tcg/tci: Implement movcond
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3dbeda9a-9ea4-9647-8f49-37f147020d90@amsat.org>
Date: Sat, 15 May 2021 11:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 5/3/21 1:57 AM, Richard Henderson wrote:
> When this opcode is not available in the backend, tcg middle-end
> will expand this as a series of 5 opcodes.  So implementing this
> saves bytecode space.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     |  4 ++--
>  tcg/tci.c                | 16 +++++++++++++++-
>  tcg/tci/tcg-target.c.inc | 10 +++++++---
>  3 files changed, 24 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

