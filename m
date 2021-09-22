Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E878F414C98
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:59:25 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3iW-0000qV-DR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3hA-0008TJ-7d
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:58:00 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3h8-0005ml-KW
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:58:00 -0400
Received: by mail-pf1-x430.google.com with SMTP id y4so2952510pfe.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ckXyJLLJsYW7AvpuxVkCW/TY5JT/QdaM6zCPn4Mfu8c=;
 b=bd0DKBA2Ky5Mrrr1d1TkPse0wsQPQqX/QUuRlExwMa+g6tReqQqsFQZ7Pu3xGrqgqE
 YGu5NIrYv4YYGJCE4tW4U0uOXOcDTNG6PfL8602nYS2ghJMAtgCg/H9idE6fUXOM9Ihm
 /PDs8TVhvEZVGNgts0H25PHagGMu7bwZAnUZITOmtaiQPJcQpODZYCWV1eBeGcAdAL0/
 oAu4/jawiIzUvClUPlwCg3hZJaWNtgBQvJrw8b9m3Ph2+1xEiA78M1mb0WEkhJdnToLc
 ZZTQe1zGviQU1ob/AOh/fD4MuUoYOgsITjV+FSpVLfO4QE4QWZbhZPwBei6igIDKpj4Y
 gbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ckXyJLLJsYW7AvpuxVkCW/TY5JT/QdaM6zCPn4Mfu8c=;
 b=nlluMwGGFlUJyZja93XMQNcm1PsinTHkUit40ubY8oTb6WJ4Jo68B8YcLI8VaUT5bx
 /InQOwXDrtLgi/M+u1249126EjJL400dQOQBumKQIqpmZqCJNTClp3YC1eT7jA8z60Pc
 mXsz3/zJRuo3x0arq6JdFLigykVfFmwRae0h440IHj2MVvcmcXxxy7xLATHrgH6Ud/Af
 lZBbI6pO66wKDnihseLSUrr3+eA5Iy0eglHtpqGm5asxOQ3uDRk8rUNNLrb9aT6rsb0D
 YacHuPwJE5E8f3Tv2VsCKK9ajjSkP6Ymh0x9ZlzUnU5OKP5ITwQoxLxgXAHm2cQLkMu7
 3c9g==
X-Gm-Message-State: AOAM5305AchInOzMjGpC6520EghOc3obQpPBCTVNCGEmyLZ4yeiuY4i2
 9JaNCaJTAOzfL7TcM3FaEJlO++B4ihsiHQ==
X-Google-Smtp-Source: ABdhPJyCnMf3SkweBTC26cZH/w7jtJnbYmOkpMJHNYD/qU2pDAT28trbA3ucYppQkb92qPvqZnH9Gg==
X-Received: by 2002:a65:6487:: with SMTP id e7mr63228pgv.27.1632322675917;
 Wed, 22 Sep 2021 07:57:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e21sm1528798pgt.13.2021.09.22.07.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:57:55 -0700 (PDT)
Subject: Re: [PATCH v2 15/30] tcg/loongarch64: Implement clz/ctz ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-16-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87872069-38de-cac4-33b4-e558a5b08b42@linaro.org>
Date: Wed, 22 Sep 2021 07:57:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-16-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 42 ++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

