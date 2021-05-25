Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9B390294
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:33:13 +0200 (CEST)
Received: from localhost ([::1]:40432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXBI-0007DB-KA
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llX9Q-0006Lm-RO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:31:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llX9O-0005Eu-0F
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:31:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso13152833pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=svSLcQ6Tu/UYoQl7ky2gJDxyk5wA3Ab3XdMbPWUREos=;
 b=yBo/wHhEpdnM7r2eVvUz3g4tL/GB1VHC7QE6bZjzovbbqe8VcO3EcbCDE7BVhqurRa
 JA3ursEb3kkUmHJklVEnFf8jkoFClJ/g/r+6NbzqvDcBc5E3AoOsEIRbu+O+7fPcxcQD
 Us4iEyt/mHJJgFN7S+UP8RqH9QT87gQO7+2fGOrgB7b4BHrdXdFZsN+qsvk7XhAdvnFv
 0SAEDbFqiMQjMuDrGUEhq2oasE/akbNc4z9SxSlHuSXsIkcr/Ymk9GoT4O3Wzmyre9qB
 tA7tlK4nc4rXdqsYGZm7iAPbIEimU+nD3aIDOb+PWS5VUZc+cQZBR6QmRBOHCNPgWbmC
 nYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svSLcQ6Tu/UYoQl7ky2gJDxyk5wA3Ab3XdMbPWUREos=;
 b=E69ByVismSyuGyKnY3kcfKeT85QeP4qi9+Nnr0ZCLcU2LTqmLaLRBjy99DQ/Yw753C
 OwWgJd07oU2SA9fSB/KtSeY8G+eH6ygSNPq852D0GzUXsZ8tR183oWK/ZEvzdZvOkyop
 xuSLdGDWpDpYe6jIarS7yCTCG5pHuNPpEni3Re+/FFJWGnYmgH8jWW+Z77D3YLF1O+cO
 q4DWKSAZdcbvo6uH7d1FRqA1LXN5p47kCSweJzitjtGZ9gaNQWsEcldmpxydVAuwkJiw
 gL1/nTBfI3eMvyAHWB0uk2G77tjRVRqpx7QP3CgYsxZGAUzmVb9bp1H47V0e+KwLJMMK
 Q62Q==
X-Gm-Message-State: AOAM530ATjZn4bd5VxXWpzr/flyh7dk7uBvlTtbHhVSmSCVzNOOxBjWu
 lf/vsHdoTn0Hlx/+FFvLofSHKw==
X-Google-Smtp-Source: ABdhPJzRAZDNVul5JnxG8E4ohovZolR+/I9czGCTfxaUSTj/aVwCaezzQYvFfIHEyKUFH2UInZmVlQ==
X-Received: by 2002:a17:90a:6d43:: with SMTP id
 z61mr4781282pjj.147.1621949470406; 
 Tue, 25 May 2021 06:31:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a65sm12480990pfb.177.2021.05.25.06.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:31:10 -0700 (PDT)
Subject: Re: [PATCH 1/9] accel/tcg: Replace g_new() + memcpy() by g_memdup()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <318b400c-2c2c-e30d-5088-d2f758246888@linaro.org>
Date: Tue, 25 May 2021 06:31:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> Message-Id:<20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cputlb.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)

Using g_memdup is a bit more compact than g_new + memcpy.


r~

