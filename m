Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657904001F1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:21:26 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMB0P-0006op-Ew
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMAuG-0005bm-7Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:15:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMAuC-0007fn-QX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:15:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4009410wmc.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HAxg8r9lLgPDGj5LAMgAQU9YS3InbbswD60+0+aY/Fo=;
 b=PkwQi4uch0nS6r2jmWvHF7dsb9B9pkAGYUDlJ0kk73u6pgTAD8EWx7GA6KJ9FkvPuq
 BMZddtaTD4eMBGVqzgUnVkXhhn0kpp7SXLYL/FDBsRVdmCLFpxmUPj5YrG/Tr/1HUtd3
 B46Mn75hxPGKBs7nQLjf482INoPDccnOEY3xKBPn0VobJbhKqdD0SnXh+QUswRRBsTMB
 ILQDL0Z+arb7i9+rnlxJBXZwqTzu9ozdGX1JFU1FWZd5ht35EHoGeZRM/436cLI5tSo2
 fD86ASMR1J2Y7INpihJArJCuQTNSS2UeNAYes9Oxf3/VaF/uAcfRwJij46b1zviUFQoP
 /dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAxg8r9lLgPDGj5LAMgAQU9YS3InbbswD60+0+aY/Fo=;
 b=AKsSLSD+4SIx0uv9nOL/4TOP/PqoebG2vl3bTO2My+FSe4MgB3LWohmKOuXBuGHlEa
 f4qpDQp9cVLq0IyqJ59MLQW2+ujecqh4tZtOwUFokEAqWiGDx2puvop+pxGlfdZc/vJM
 PEo5eJ9sp22Fqd9bFFhjy2mzqCJGsI5I6a8YAedzVs8Iow7OxW0b0O0HDxW5vq9kHkMg
 EQfbs/885WCCgyk5Kh1ifcEeoeNzzcU8xhdBfvM7QNMBOlkvZKLn7g6z4D84YVpc5tus
 n6zcc5l0zN0xz9JgPn8/iGvMHhJ2cMuLfUQiK4z3pKO35OLKw+nViiUuPUNWCKkqKzsq
 AOrw==
X-Gm-Message-State: AOAM532iAQyZSdsTOBH6Cqy/FHWjCrxWyd84kKNBfEtEQim5npZ3bX6T
 9IH5wjdC3Tgijt73n/VIN56b0kLOVgBiJ+81cy0=
X-Google-Smtp-Source: ABdhPJxKU2EUl6c4729GPX0XxfF16zcjfQAF+EReXV3nkRoROA7uklART9JJs2fVXrqEW2aMvAlnvg==
X-Received: by 2002:a05:600c:b4e:: with SMTP id
 k14mr8868900wmr.139.1630682099362; 
 Fri, 03 Sep 2021 08:14:59 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id f5sm4545465wmb.47.2021.09.03.08.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:14:58 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
Date: Fri, 3 Sep 2021 17:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Richard: if you have time to scan through the MVE insns
> and suggest which ones would benefit from a vectorized
> version that would be very helpful...

VDUP
VMOVL (into shifts or and)
VMVN (which seems to have gotten separated from the rest of the do_1op)
VSHL
VSHR
VSLI
VSRI

I think that's about all.


r~

