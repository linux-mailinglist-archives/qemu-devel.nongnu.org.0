Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8173CC25F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:06:44 +0200 (CEST)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hDW-00027I-NU
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hBv-0000nW-Ku
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:05:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hBu-00045B-3X
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:05:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id t5so14947237wrw.12
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+uLcYxY80GobXpUuQxn3asc6fLIWT3ETUXYodqQpYA0=;
 b=VHnYnai/5hmhcl7SfemzP5R+eElVymRRweicK20nGD/0DGdaO6LHh826kBnEFBCWDx
 SlZGXuYw98nnjrSf834kpXxT6BZAdYMJ/wiWvU2v7J9uLmFYAZ70zG0bR0V3g6FJIopq
 69gGkq0gzeBKKIFStEKfdD89Gq+1gO8RAmenaFTYQtMykXEfaZ7BvT8IYuFAVnWx7JV0
 BX2WuJJ0uBowKclq+Tfe/ONOhhtcJHp1BzSr7CWhcBJdgEytdED5NHP7YBcUEVCZH5/w
 4L0znMs/MBILj1gZGI+MvmZI4HIj6y184WNQy+uTmRauGgYxXzu1HaI8rDVDEwqiU7In
 4qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+uLcYxY80GobXpUuQxn3asc6fLIWT3ETUXYodqQpYA0=;
 b=IOgVwsp/0DnzLluujXYFvgfZunPL4JlZ3r/kr8hxO7dl5CvO+mSWrdAwXRmOd6JPbv
 d5MRNvZjen0E2NYhJvL9y7ippMhBl1kVgd/jSgcm8CuDnFThTpNfChHRg0JF1bGaWKza
 i4UwaxT0cjX+wWOyEeG/CJd2KGI9eSV8mo+Wy0WFtNKZzh2EJPMOJYFCbprUzTWhqVOU
 lrtBgtRwaVqOKV4ALybRFRXWK7FQBzUJu0/bH5tL+KwAVeqapuVlBEb/Eu1Qu+fc7RBj
 LzY09pFC9ifCq2yHyIGuIxOmDGAjXyyul1uqdyaicrVbjU5rk+MBZaaeN3OgyLbi9FEM
 3ycQ==
X-Gm-Message-State: AOAM530Tr8Ngt5nqvdn35YqNJqZANdAIf9da16l/pAgnXNQatq/9D1/e
 a94pdWRm3OxvCbaPTCX1oXw=
X-Google-Smtp-Source: ABdhPJyYiat2L5eqmfRo8Ml9QVs11gLXbB1xDgNL/uBj/CRdSztm+T9Ix6c2uksCnBYEXUyqKaZJvA==
X-Received: by 2002:adf:c409:: with SMTP id v9mr18290166wrf.102.1626516299847; 
 Sat, 17 Jul 2021 03:04:59 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id b8sm13676235wmb.20.2021.07.17.03.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 03:04:59 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] qemu/atomic: Use macros for CONFIG_ATOMIC64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
 <20210717014121.1784956-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a45100ff-7a5e-efe4-f01d-b5f4e0e90019@amsat.org>
Date: Sat, 17 Jul 2021 12:04:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717014121.1784956-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:41 AM, Richard Henderson wrote:
> Clang warnings about questionable atomic usage get localized
> to the inline function in atomic.h.  By using a macro, we get
> the full traceback to the original use that caused the warning.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/atomic.h | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

