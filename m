Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44006F2FC8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 11:15:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptPVa-0000Y3-HP; Mon, 01 May 2023 05:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPVV-0000XC-0o
 for qemu-devel@nongnu.org; Mon, 01 May 2023 05:07:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPVT-0006qK-0M
 for qemu-devel@nongnu.org; Mon, 01 May 2023 05:07:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso22087935e9.3
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682932057; x=1685524057;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JdSlTz/C5lzZxMec0/Pu3wWL3nK8/M63//ZxLRycrUU=;
 b=j5DXfBF8FzDiOAtZhf2xOPPIljrHe8sKKmdktHMh4J6lydu3Wuhz2HPtzY/jbS/86X
 caRhaPULE7xmn/L9P+GZSpYyq2IrcFrR+Tjxc6z1OORZd8/f2cXyBgXH5jUTYZsOH3m1
 9wgarTRpG0W+Z03sMMHcl6OJEwr5DMcuYCpO4VIHNCZw+xZNBkwWbVwHL6UvmngYOnr3
 hS4zS/afNVBtgJ5XZHBEWowUS2s1iWpZa2lKDqOYXuaYoDOLO/m3JYHFDyv62sIP86G5
 2pDRWlXut/sSAKWVcCUbEy999c6ki/wEstR+bfVHWPLHE3g+T+dEzALQe40jL9+9NZQa
 +atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682932057; x=1685524057;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JdSlTz/C5lzZxMec0/Pu3wWL3nK8/M63//ZxLRycrUU=;
 b=JRJzgzUg4+o/EJ7FO+rqjl0IRoSgR+18R2OFnZt5XSemnlyyotHggm53+YcpDqtAjd
 HP8ChdA6CLjDRuDmiWYDxZyLHWTaaDmA68B3KJxQ7/SPkjj3iFkWyy/Ln5b1s0m9x1rH
 kZ2v1k37QU4fbI5EOA9bxoRcy80Nw/DYP/eBhgLpOicyjv/Rn1CCVkDQ3ahpQyRw8TwO
 /FFWDzApc/hwG7Bpy0rjS4ndsmIuJy6eUwmOLMajnCZj4xHvTSbpPehfIdvdIEEV3ZUC
 YAMz1RdJgLeb56V//DEX6GauMf0PXKdJyigda9gLO+220gKgKM2rieE07Rnl3g/9iVWi
 DTxg==
X-Gm-Message-State: AC+VfDykkilZgH1rYBlnkcyS0X/bQKroJGJeSlQSHb4uKuD+wXofyXSq
 /YwNrUrIKoA3pSeHAiozCeDvOQ==
X-Google-Smtp-Source: ACHHUZ6TEysinVTFkEgcwsF3Q2FRqZYWWV3qZDSWdc0AeHLeMG9xVTV9BVNfLuH06soOxxYee/2+PA==
X-Received: by 2002:a7b:c856:0:b0:3f3:1fa6:d2c8 with SMTP id
 c22-20020a7bc856000000b003f31fa6d2c8mr8389451wml.26.1682932057101; 
 Mon, 01 May 2023 02:07:37 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6246000000b002feea065cc9sm27673897wrv.111.2023.05.01.02.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 02:07:36 -0700 (PDT)
Message-ID: <30ffdb29-264e-585c-38c2-2a1bb00f23a2@linaro.org>
Date: Mon, 1 May 2023 10:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] call_rcu: stop using mb_set/mb_read
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230430112515.240063-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230430112515.240063-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/30/23 12:25, Paolo Bonzini wrote:
> Use a store-release when enqueuing a new call_rcu, and a load-acquire
> when dequeuing; and read the tail after checking that node->next is
> consistent, which is the standard message passing pattern and it is
> clearer than mb_read/mb_set.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/rcu.c | 38 +++++++++++++++++++++++++++-----------
>   1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/util/rcu.c b/util/rcu.c
> index e5b6e52be6f8..867607cd5a1e 100644
> --- a/util/rcu.c
> +++ b/util/rcu.c
> @@ -189,8 +189,22 @@ static void enqueue(struct rcu_head *node)
>       struct rcu_head **old_tail;
>   
>       node->next = NULL;
> +
> +    /*
> +     * Make this node the tail of the list.  The node will be
> +     * used by further enqueue operations, but it will not
> +     * be dequeued yet...
> +     */
>       old_tail = qatomic_xchg(&tail, &node->next);
> -    qatomic_mb_set(old_tail, node);
> +
> +    /*
> +     * ... until it is pointed to from another item in the list.
> +     * In the meanwhile, try_dequeue() will find a NULL next pointer

Either "In the meantime" or "Meanwhile" (noun vs adverb).
E.g. "Meanwhile, at Try Dequeue's volcano lair..."  :-)


> +    /* If the head node has NULL in its next pointer, the value is
> +     * wrong and we need to wait until its enqueuer finishes the update.
> +     */

/*
  *
  */

I know surrounding code is different, but slowly it will all be edited.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

