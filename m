Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CB6FF068
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:11:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4Cm-00055A-0S; Thu, 11 May 2023 07:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4Cf-000519-Dh
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4CX-00079Q-D3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:11:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so280170065e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683803471; x=1686395471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JUTaOSFm9/IPCg7jBkRpFOBMiKcAno6R0tzI25o0P/o=;
 b=DgTZoOJLRjx4Uo65jxB/Qn8eS7lHhD087bht6ZuXaXsvvh4Xf+K1Rf/EWmDM53gW/a
 EmzrZxi5yajKRwTAKxfBJHXcXdfriH4ef4ojiWM89tJNV84FAUXdBZTc0gVp9pv9v6dr
 cuyFMMltel+jUkwpbA1+0hDh0/7ijm2ZU+L3KtslJ/DKVba0BK4Zz+ZW6hCQOnYXQpYe
 e5pvCt0sVZHYf1yKt1lEAGXU0hzMu8n3g+lHFSDHXpB4TsnL0l50xS+XbgqmYL3PNXke
 swiAj41GyDwFjg1HVSVVChAX/pXlOSE5TdX5jQ/878KwMwBlEvfw9S33LoD5x9CSa59V
 e2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683803471; x=1686395471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUTaOSFm9/IPCg7jBkRpFOBMiKcAno6R0tzI25o0P/o=;
 b=bpl5GIbTzM4A9v+8i2iEAE/rfV7TmllXOMfRD9f4t/V6QnhCPLJQRGPQSebepwuMrT
 N2U9yCPTVCuSO6fdnGE9Or3QBk6kP7ygaF412ZKRKBHtm6y5wsrGHIWqmDmtu4fphSIP
 L+HNSg4PPTUVYuW2V5KP3uO9E8j/aEX3serPutp8rIQ7P0Iob6TNe13qw2sxNg2OdMod
 unUG7SN3kXa3YO0pxyDPkuVUi4+C91sk911m4wRyxWQ57aF1g9S5/vtZzoOL58Kgun9t
 UwTrua8kbUtxFRnPKnP48k49SXQT3n5QvFfjdKjmlmmovKLmVDDKgydDbR4pzG/7NIGv
 hY6g==
X-Gm-Message-State: AC+VfDyqypnIQaY9GW4/cC8pRdxjn4uq+kZFU1FUJ/pv8rMaz2yASB3R
 BcnKsCh8P3eQfZdf9x2UNlQrPA==
X-Google-Smtp-Source: ACHHUZ4l7OarXAjrW6bAXzXiamzA0U2qGvPxuHcKb8vaY3zQ/f2qwkDzh+Cw3p/QdJmQCEBUrZ6EGw==
X-Received: by 2002:a05:600c:46d3:b0:3f4:1848:4dff with SMTP id
 q19-20020a05600c46d300b003f418484dffmr13602132wmo.7.1683803471550; 
 Thu, 11 May 2023 04:11:11 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d4e81000000b003062765bf1dsm20155285wru.33.2023.05.11.04.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:11:11 -0700 (PDT)
Message-ID: <80a9bfb8-c99c-7b78-fac0-867f68779f21@linaro.org>
Date: Thu, 11 May 2023 12:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] migration: Teach dirtyrate about
 qemu_target_page_size()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-2-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230511092239.14607-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/dirtyrate.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 180ba38c7a..9aa092738c 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -17,6 +17,7 @@
>   #include "cpu.h"
>   #include "exec/ramblock.h"
>   #include "exec/ram_addr.h"
> +#include "exec/target_page.h"
>   #include "qemu/rcu_queue.h"
>   #include "qemu/main-loop.h"
>   #include "qapi/qapi-commands-migration.h"
> @@ -78,7 +79,7 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
>       uint64_t increased_dirty_pages =
>           dirty_pages.end_pages - dirty_pages.start_pages;
>   
> -    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +    memory_size_MB = (increased_dirty_pages * qemu_target_page_size()) >> 20;

See the recent cleanups for dirtylimit_dirty_ring_full_time, folding multiply+shift into 
subtract+shift.

>   
>       return memory_size_MB * 1000 / calc_time_ms;
>   }
> @@ -291,8 +292,8 @@ static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
>       DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
>       DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
>       /* size of total pages in MB */
> -    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
> -                                                   TARGET_PAGE_SIZE) >> 20;
> +    DirtyStat.page_sampling.total_block_mem_MB +=
> +        (info->ramblock_pages * qemu_target_page_size()) >> 20;

And a third copy?
Can we abstract this somewhere?


r~

