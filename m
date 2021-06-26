Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E93B4CEE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:07:47 +0200 (CEST)
Received: from localhost ([::1]:60796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1Tm-0002Ph-GZ
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1Sd-0001k4-6L
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:06:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1Sb-00007S-Hb
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:06:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6798212pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k8scLo1oKCNezeKdMPk42P/oBUATEB4k/wv2KyNb1+c=;
 b=Qtynp0eYp0+wZSHjWAr9L/uyO3YWDBsjpPYWYg4LjnEBMxFRwqi7D5J+vSvg44FBmj
 Op2o64MOJs2mFuUToSbiVOZt6rbhsxkZzFm17q1uZc9R1yTXFqa/zo10aJv1ROMNumhc
 K9QGX9kGCwR8rqP3emGxCTlrAO6SLkmiYapq9jrDT1zF1DYm9Fkv4W0RaBfwGU8f0QU8
 N86FAnpbfzwebIEVzy+DnIVIO97ZlSmc+b/9G2s8xf4z+BcNSCPYtswQkxtz8fJ6CRP8
 fFB7YvNH0Sy6P+S4GE71XgmTjGvHtcRH7Vm7NKCQZgePbFwM9cfSDIDENaeKL5N2CrXj
 5nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k8scLo1oKCNezeKdMPk42P/oBUATEB4k/wv2KyNb1+c=;
 b=gKiKuvXe+J/JsIjsGT0uPeTqFX5nZH0Dq53/iDNPavHONrlY8vMQzDmHgk61SZnWNK
 Nax4P/gVa3YeaXZo46i/jM/K8oUhpHMna0R7y/V1Tw4zt/U1W5ymmVvhnt0Z6tHkvlsL
 BSGGqnuBU0kMo/ZVGuflFp+7bYN2IiRsW+dEnjz3FpC0HMiTpx5gf1GGtCKWhsOUpWdP
 kTxIlwnZH8ELbEQyUPf89TIvCgqEvVSMM84Cv5v5uON22I9IbHuc/OnR13m0A/bpvVET
 5iz+gGiELaQfJmgWqqpe2NANRYySz/jMtN1KLEsU4MBa2PvFWjEIMTGuYXwpffEDq5/d
 YJBw==
X-Gm-Message-State: AOAM532BP9WiqmyXERwR6qS3gtv2kRbazz0rweDcmegkWtR/+9pCWx+G
 9l3qyFjQx3Ngk1IuHjvoiUg1ag==
X-Google-Smtp-Source: ABdhPJwfnHh1cBvZqnRJAkQKFbZyHsmDJlRtromcNcKtFyVKiQM3CIrvcIQfoJg5mOy9tdljoyr+lQ==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr25309959pjl.73.1624687591902; 
 Fri, 25 Jun 2021 23:06:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 71sm7948241pfw.13.2021.06.25.23.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 23:06:31 -0700 (PDT)
Subject: Re: [PATCH 0/5] tcg: Issue memory barriers for guest memory model
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
Message-ID: <90884d4e-f057-5035-b21c-653ce6203a81@linaro.org>
Date: Fri, 25 Jun 2021 23:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.  A local rebase seems to apply clean.

r~

On 3/16/21 3:07 PM, Richard Henderson wrote:
> This is intending to fix the current aarch64 host failure
> for s390x guest cdrom-test.  This is caused by the io thread
> issuing memory barriers that are supposed to be matched by
> the vcpu, but are elided by tcg in rr mode as "unnecessary".
> 
> I know Peter would like a smaller patch to sync the io thread
> with the vcpu thread.  I've made a couple of attempts at this,
> but havn't managed to get something reliable (although now
> irritatingly infrequent -- about 1 in 500).
> 
> I have further patches to further optimize barriers, and to
> generate load-acquire/store-release instructions in tcg.
> But it's late in the release cycle, etc etc.
> 
> I've done nothing to measure the performance impact of this.
> I quit the cdtom-test cycle after 4000 passes.
> 
> 
> r~
> 
> 
> Richard Henderson (5):
>    tcg: Decode the operand to INDEX_op_mb in dumps
>    tcg: Do not elide memory barriers for CF_PARALLEL
>    tcg: Elide memory barriers implied by the host memory model
>    tcg: Create tcg_req_mo
>    tcg: Add host memory barriers to cpu_ldst.h interfaces
> 
>   include/exec/cpu_ldst.h |  7 ++++
>   include/tcg/tcg.h       | 20 +++++++++++
>   accel/tcg/cputlb.c      |  2 ++
>   accel/tcg/tcg-all.c     |  6 +---
>   accel/tcg/user-exec.c   | 17 +++++++++
>   tcg/tcg-op.c            | 19 +++++-----
>   tcg/tcg.c               | 79 +++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 137 insertions(+), 13 deletions(-)
> 


