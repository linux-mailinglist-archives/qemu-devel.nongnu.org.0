Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32307352F66
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:47:04 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSOox-0004Tq-8j
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOn2-0003cr-Lg
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:45:04 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOn0-0007xE-K2
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:45:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so2927168pjg.5
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzqCIvOq8GrMORdKvB10npTgKYbTdzFUJvcQ1yK8B1E=;
 b=K//U607XYx7Esi6PknfYhmTYpqD4Qii4EQKvfayrTKLh2OhBRAnTs0gt0xqlOg+l/u
 B2H4Sa+t0mJIAp9o9mgt7V4hYeLzupeF1/y9F4wZQv0M3IgEPvp4HlU8YRPz321cWWc1
 kKT0HYYAxenf1FC6kkJWJrL17jmPNUXCjtsO2BGIqgSPW3p+vuxsYpmoME+diseEHpVh
 phOfeDy1mF256wIF4muL8zZmbpXD8JTXWd8soFrfPhkyyVzJCqGFlNH/0AO+lbWfDpo6
 SWjuNiaHW12gNDIzGf1SKKJ9jZCEAC9Jd6LMyS+3styR92wYF1yg64me5aWMAdaO1r5F
 /YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzqCIvOq8GrMORdKvB10npTgKYbTdzFUJvcQ1yK8B1E=;
 b=fYUWs+D/sZ6DxBDEaO1Sbm+Lj/LkHvrrNiG3jZHAy/ZcKA6ex2ldGbVsDcEJrxp38b
 QigqsKDRyNXgsBqZTIKVnylRZ0puJh+l+6uHoSAWdd7rHuvdPY9bEoS9eMjULF/cofoV
 8wGWWj2njLYE3b8JrhJM0rbMfWvWEUM8CmK/unDzQG2XwPMvxoVUlSxZat39yDvkj45X
 Za/w895OoL5P+PR5qbIs2WrD7mlWKb9ilEkiVpXb54fdse8quIIRaZ48qVHik0OMs4Hk
 daZNMR/mTiqhhmkgyN5kZv4CUBlm9TfaBD5N548BVkKURtaLSxJxfyDmuAAOpNEi2izy
 g+Lg==
X-Gm-Message-State: AOAM532OheyrGAI/y+vA6bMLwMFobnDOtThnslTOceAeg6wfuD97Mzo8
 cVyVCKfsRhM5dcrsB7qPukkuUw==
X-Google-Smtp-Source: ABdhPJzLlf1OQ7tZOz0ljCvgmVTbcid11EFVTFuqSliB6lQFQXrupNpEVGsloudkaPfGpplcySO2Pg==
X-Received: by 2002:a17:90a:1696:: with SMTP id
 o22mr14653000pja.0.1617389100819; 
 Fri, 02 Apr 2021 11:45:00 -0700 (PDT)
Received: from [192.168.51.152]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id s76sm8982779pfc.110.2021.04.02.11.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 11:45:00 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Fix unaligned mte checks
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210402053728.265173-1-richard.henderson@linaro.org>
 <20210402053728.265173-3-richard.henderson@linaro.org>
 <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09b35fc8-89c3-0440-40ea-6f58561b1dce@linaro.org>
Date: Fri, 2 Apr 2021 11:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 11:35 AM, Peter Maydell wrote:
> On Fri, 2 Apr 2021 at 06:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We were incorrectly assuming that only the first byte of an MTE access
>> is checked against the tags.  But per the ARM, unaligned accesses are
>> pre-decomposed into single-byte accesses.  So by the time we reach the
>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>
>> Therefore, drop mte_check1, since we cannot know a priori that an
>> access is aligned.  Rename mte_checkN to mte_check, which now handles
>> all accesses.  Rename mte_probe1 to mte_probe, and use a common helper.
>>
>> Drop the computation of the faulting nth element, since all accesses
>> can be considered to devolve to bytes, and simply compute the faulting
>> address.
>>
>> Buglink: https://bugs.launchpad.net/bugs/1921948
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This is a pretty chunky patch for this point in the release cycle.
> I don't suppose there's a way to make it more digestible for review?

Hmm.  I guess I could split it into more pieces...

I had thought one of the intermediary steps was larger than the result, simply 
because one of the interfaces was adjusted instead of simply being removed.

I'll see what I can come up with.


r~

