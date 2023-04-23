Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9826EBE2D
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 11:11:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqVju-0003PZ-Ib; Sun, 23 Apr 2023 05:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVjs-0003IS-ES
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqVjq-0000ms-IC
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:10:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f199696149so5927845e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682241029; x=1684833029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ru2X1uEUG3Yx7ztzd+2dp7u8M/6AS9gROjpDfmu6z5A=;
 b=kE5ThpTOfB8PozylEqxC4W1b0vx5wl5xmUiPpiwpEr3jvvL0vJTuQXcRPbq6ZuayF4
 rhzUyu5s6ZD4vSnFU9bFJj+8kSUGBcSsMrLk47JsaCY/fWOQMBcKlDVDK0mz7STy8Vf9
 CGgHMMwhIPm0VtcvO/nZ0gTbKG9w1in+7ZFyhMebkVtXtCur6JKH/7xqQwZIQw0Rp70G
 2+QCko8jdN8vlFu7dJwzjscI/tXbiALjwl0/+bZk6UPsvarC1L9t7b5DV63RBZAh+BcJ
 RB0gfW4dkLkDqbfjR2YpzmlBw9OdRWY9GPe3Z9zglaI2G/9FUfm0NETk2aiy92v1Hpgw
 Qrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682241029; x=1684833029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ru2X1uEUG3Yx7ztzd+2dp7u8M/6AS9gROjpDfmu6z5A=;
 b=DtaJf+bFP0TnIRm9PTKDL6kv7Y/ZwOVQB5GKWunKG7aGtsJZkqQdy9lxqnYVLbHqzN
 Y4Ud9ULRb63v2AYnUlkiH/Yii/jZAKy/XYgHt04e5XDzBINr5S/0hER4ILdIigCjliLu
 /mHcygiaDvBlqXVG7rY3FfoOiklunADVPdcs8F/NDBFdpYhV7LzSNyFC+vLblICVIG76
 /54QsSn/rGKB+QAx/7KZuQuJSmAHd5yW0F5jixlH8Bs++ZwVc5J84+PCHykzVWjUdtCj
 +nIfgmbv1fozKG4ehIIjeIVfH6RHqxC/luz/KUQRMEU+dfMjdP0mpAzCHpLAikZbLTvJ
 VERg==
X-Gm-Message-State: AAQBX9f5aBT0Hs9JfYGeTSjHDnT+fjQFPPIxxtQvnzBesmQTfWFaq6YL
 NXA6SRxHvFHK+zPtp6uOCHqwHA==
X-Google-Smtp-Source: AKy350a30qB2utHG0Dk9RCSV20Ns/Z140MNg4rbQ+8vI0t+3vydKWuSm7dVH7FpJM2LgQcHyvVu8BQ==
X-Received: by 2002:a05:600c:2145:b0:3f1:9879:5015 with SMTP id
 v5-20020a05600c214500b003f198795015mr2999734wml.36.1682241029157; 
 Sun, 23 Apr 2023 02:10:29 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 ip29-20020a05600ca69d00b003f1712b1402sm12533309wmb.30.2023.04.23.02.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 02:10:28 -0700 (PDT)
Message-ID: <9ee3dab0-745f-d46c-b0f2-2a3d6a0e8370@linaro.org>
Date: Sun, 23 Apr 2023 10:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/8] accel/tcg: Replace target_ulong with vaddr in
 *_mmu_lookup()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-4-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/20/23 22:28, Anton Johansson wrote:
> Update atomic_mmu_lookup() and cpu_mmu_lookup() to take the guest
> virtual address as a vaddr instead of a target_ulong.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cputlb.c    | 4 ++--
>   accel/tcg/user-exec.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

