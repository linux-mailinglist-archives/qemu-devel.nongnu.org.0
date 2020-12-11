Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B072D7FBB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:59:51 +0100 (CET)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoZw-0003wz-Qf
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knoSE-0000C1-AT
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:51:51 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knoS8-0004N9-VS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:51:49 -0500
Received: by mail-oi1-x230.google.com with SMTP id s75so11162009oih.1
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H+i3t5puj6+ptQxR9CEYaxa9EBma49UqJfXN64ql4zU=;
 b=ByxJFyBRidh+Du+cyQ+2AxjrULY0lQqPTxiGs4yV0zsg7EsJ3d20s8RC/i9K0I3xJw
 CBqCQikZBpJGscGNjCqD6XOuDXxwrQdHBktIUMzTznXsKvCr7+IxabapfihLj+0O7F9P
 7khJiS64nw+DwbHghRK7sEpFb7OHT5fv+MX6zVZPC+7ru/LkeKWUS2UrNLpGh46ROLUF
 nuBuUHHWZZV2wJJbNn6TLVs8daBzk4isuwYqnfZBKe9XPwRcNhaNI/hZSprzymYaTPRg
 uto/tuRteRItQru6PUY0Otr6yExVzYv0t92hYErm2Pgu2ulqqf5KoGbj7SZCJtVJnBFF
 jmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H+i3t5puj6+ptQxR9CEYaxa9EBma49UqJfXN64ql4zU=;
 b=i18Ws5co9FSRRgRh+OjN75wJCUHvZU6RTeSIxstcrknUo+97rSONQaOgNIcCdLC1nc
 I3hzcrSvVI1SAVQWNqjwzJYRcF8jcs2XkGSzvdloo6HCFLGdh9vhyXWKUKUy2xUOldA0
 EyItNy1cTuuXAPj6m3R+O8WoaarkJpGcwJIIl3Ka29dFqNZ9Ue0y8lloOkt4J8FyFFjE
 IRdkWgOqKzdG5XE205suyAYUVocz3xyODElNISAgT0G5Zp9SfjU7EVWLZHD8EsUcge4Y
 xNul9NLbSrq9WU5My4zvoLXkfw/WgP7wvbtlyAbKqtShvjvOpJsTdDwlFxazivp+Fb04
 1Qqg==
X-Gm-Message-State: AOAM5338mzT8OX90XtZNFsR0Hep4t4YcfrtH3IPy0ZZwLBXWQhjAE4fs
 2AB9GigOwbuG448Q0ic2I32l2A==
X-Google-Smtp-Source: ABdhPJwntCsX5C1qdAmwmAKYndiJBEm4Z4FLDkFxu8QJzqFIfwW1ByzgldUYnWBJPtXQy5fILmVG8w==
X-Received: by 2002:aca:3b57:: with SMTP id i84mr10309259oia.17.1607716302933; 
 Fri, 11 Dec 2020 11:51:42 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 6sm2055335otc.19.2020.12.11.11.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 11:51:42 -0800 (PST)
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
 <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
 <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46d7b991-d305-bd2f-91f9-cdc2ee1e73ce@linaro.org>
Date: Fri, 11 Dec 2020 13:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 1:33 PM, Rebecca Cran wrote:
> Is the comment in target/arm/op_helper.c:397 still relevant?
> 
> uint32_t HELPER(cpsr_read)(CPUARMState *env)
> {
>     /*
>      * We store the ARMv8 PSTATE.SS bit in env->uncached_cpsr.
>      * This is convenient for populating SPSR_ELx, but must be
>      * hidden from aarch32 mode, where it is not visible.
>      *
>      * TODO: ARMv8.4-DIT -- need to move SS somewhere else.
>      */
>     return cpsr_read(env) & ~(CPSR_EXEC | PSTATE_SS);
> }

I forgot about this.  So we can't "just" store DIT in uncached_cpsr.

I'll let Peter weigh in, but I think it makes sense to move the SS bit
somewhere else (e.g. env->pstate) and merge it into SPSR_ELx upon interrupt.
While what we're doing here is convenient, it's not architectural, and it would
be better to follow GetPSRFromPSTATE pseudocode.


r~

