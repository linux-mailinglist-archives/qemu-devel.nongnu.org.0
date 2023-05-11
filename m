Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43D6FF06A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:11:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Cn-00055p-95; Thu, 11 May 2023 07:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4Cg-00051A-3x
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4Cd-0007Bj-SO
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3078c092056so3910437f8f.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683803477; x=1686395477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zmlmEW0cFq0BDclgLL2S2mwa+SzeZZ/byr/+xq7cnpE=;
 b=ugcnrx70VzLudxZuIKB8b6sbZ0TyBtM1q4ItUo4/fuVn/gcx5ve3wlEAttkkyxazVi
 u2GvdpJevvAhDF0HcrBJPdAtcoFiZfIK/m+TtgDmBSn7yeUVg9IovDk/bAtrWzwu9HhL
 fPlYMEkQe3FfHMbPYdYffQ9bwk5wOsJQ4quPwGGcu08rdIbl2/0qmwEXYih6Ij2JFuwm
 A6nY8x0HgIPIPaKx7ol8ySp5FJgnpnwjBDeKr3BaBdqGEKLq04Oe4myw0BJlyBG5K7jo
 CBdM37Biuv0e4RYwVl/kyr2A6ak8C/QBf2bpAhBsywaiYsoBz5DTFjVI7XNStvoGAwqB
 dOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683803477; x=1686395477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmlmEW0cFq0BDclgLL2S2mwa+SzeZZ/byr/+xq7cnpE=;
 b=AbL2hZFt8p5KxHKsFC60ZRSjD/3d4rDx+nMZ327U0Mq8VEXDl815GEBozt3D3GJrOB
 ZKZs8RtPmkIPB0D0qF6yCCwZDJOTo3j9QlThmMxk9iAUXT/Be4ABxN3zKzjkCI+ZZeeD
 lm+Amb4VQc4qGhTvHLioRZ0rcJ/CsqXSPvBYO/k9ABj48tXVnrHzQC3u1bNds541w7xG
 H0oUAYTZD4By5on6JFY/UCGBIP07MveKN6DwnsdSnzFRzBv0JSVyz0wtTEhZckfxowE4
 wX+s53GY5B/RVZXSqRh5yIY2+Ln95lvdpEM56XetdL0YUKvI2vZhPs5UIzONLPvgRRxo
 B2sg==
X-Gm-Message-State: AC+VfDz5giZmc7a9UJ85CCn93sOz06DWtUzhKh7MTkX1ZcMH0I/egsc1
 ILZpfxEz+ylyk22aNAAzf4td4w==
X-Google-Smtp-Source: ACHHUZ4uqGYClMvEtUmm9Sg+A0PsxAt8SMbo9wY3P3QcUU8YqWfYFw3pNT4NOH9NGnaV0DiB8O0/sw==
X-Received: by 2002:a5d:4a91:0:b0:306:4613:65e with SMTP id
 o17-20020a5d4a91000000b003064613065emr12533688wrq.45.1683803476941; 
 Thu, 11 May 2023 04:11:16 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm20158406wrx.28.2023.05.11.04.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:11:16 -0700 (PDT)
Message-ID: <858bcc8a-e6bc-c929-d007-723afe2b6562@linaro.org>
Date: Thu, 11 May 2023 12:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] migration: Make dirtyrate.c target independent
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-4-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230511092239.14607-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/11/23 10:22, Juan Quintela wrote:
> After the previous two patches, there is nothing else that is target
> specific.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/dirtyrate.c | 2 --
>   migration/meson.build | 5 ++---
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 76c8b96ab4..f814745bf7 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -14,9 +14,7 @@
>   #include "qemu/error-report.h"
>   #include <zlib.h>
>   #include "qapi/error.h"
> -#include "cpu.h"
>   #include "exec/ramblock.h"
> -#include "exec/ram_addr.h"
>   #include "exec/target_page.h"
>   #include "qemu/rcu_queue.h"
>   #include "qemu/main-loop.h"
> diff --git a/migration/meson.build b/migration/meson.build
> index eb41b77db9..da437b4a27 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -40,8 +40,7 @@ if get_option('live_block_migration').allowed()
>     softmmu_ss.add(files('block.c'))
>   endif
>   softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
> -
> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c'))

This becomes

softmmu_ss.add(files('dirtyrate.c'))

the when: is redundant with 'softmmu_ss'.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

