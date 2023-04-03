Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932346D3E1E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:30:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEeG-0007BI-1J; Mon, 03 Apr 2023 03:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEeD-00079h-32
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:30:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEeB-0004Cl-H4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:30:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso6538451wmo.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680507034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TQMp6afOGkY+Fq5ip8Oo/dswmgZ5Qx/hTULVm5W0gLw=;
 b=aNEWTDuq2yPXEnk57QE5pZn9LlhWsesOUZmvNLPJwbMaPzbI0TigbTFpNoeiWjzjy8
 1FyQH/JTnGLkTa3Z0IgfywjJP1LWz17Qq2rg5C7GyWhvlYt7ceUUJONvBn+tjV9/s0Bo
 jWpZTx5fmypgr+sa/XNctk3CAOXqTo77483/ZG188dMv9BN021T8/bXCaHdWym3YyeoS
 kn5viyyDgU3Ls6WO9iF4rzw9ErifnYVDdfGmPunS/ImaWT7xN8cLrfmh4h3YCJTzVPPG
 KtaHGzDtlh6deeL6t/JdwvPKj8ss4I7QuR2W0yf7GJHLNYABn73oN0kyChxZs/YiVPyQ
 nrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TQMp6afOGkY+Fq5ip8Oo/dswmgZ5Qx/hTULVm5W0gLw=;
 b=yA5pV/NdwXf/baMJBjiHNx1Suj0H1JoEgwkEPzagQan6nL9VY9X65Z0/xiqomSQ/JC
 Q/cJoL+Pk7Nw7gpJbxUkxcQ8wCy6B9ZfaIcpMy2jxIxkuCFtTMnQoDJZ9tcLpIRkR05F
 HHmIvbnL5R6CN6M1Mep3LTA1ArnijUosl7/YErpV88w+7JLWVcys1OnNxbu2Dca75cco
 qTHnLAs3S9k4gtUAH5D7MNWbz13lauko6xjV9ZztPbpJveJx9Hdh8oskgi1YTgpMbTLI
 MeS/iTsuFn8GthRUmqnjnNbkJj/MT/YVYvCuZrjkpjFKBBtEHGzl3mHLcrAOY0J23tfY
 erIw==
X-Gm-Message-State: AO0yUKVGRTxEoTA85MIDviq/mcjPnzr7f/BAPaktxb9CLwsa5sASMANv
 4pc0Jjdn+huCzvu6ttPPCL4N3oG8ybIl4Ayux2KKpw==
X-Google-Smtp-Source: AK7set9Yf4UyJHmrF7XlrPwOqkzJT1s6NsF5SGTWBkw8Yvnf5cPCd+BPxEFQcWzOcO+kRCRlMTGTYA==
X-Received: by 2002:a1c:7303:0:b0:3ed:e715:1784 with SMTP id
 d3-20020a1c7303000000b003ede7151784mr27195407wmb.15.1680507034049; 
 Mon, 03 Apr 2023 00:30:34 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c22c100b003eeb1d6a470sm11130173wmg.13.2023.04.03.00.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:30:33 -0700 (PDT)
Message-ID: <25334b05-02fd-bc25-fb9f-11ea45eb6acd@linaro.org>
Date: Mon, 3 Apr 2023 09:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 12/14] ram.c: Remove unused include after moving out code
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <b79093582686e7f495c8dba6346d50efd6f07a98.1680457764.git.lukasstraub2@web.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b79093582686e7f495c8dba6346d50efd6f07a98.1680457764.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 2/4/23 19:56, Lukas Straub wrote:
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   migration/ram.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7a8f540737..9072d70f7c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -32,7 +32,6 @@
>   #include "qemu/bitmap.h"
>   #include "qemu/madvise.h"
>   #include "qemu/main-loop.h"
> -#include "io/channel-null.h"

To squash with patch #8 "ram.c: Move core compression code into its own 
file".

