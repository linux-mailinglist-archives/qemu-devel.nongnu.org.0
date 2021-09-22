Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D8413FE4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:06:30 +0200 (CEST)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSsab-0000vA-Ae
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsYj-0008JB-CL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:04:33 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsYc-0002WD-KT
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:04:33 -0400
Received: by mail-pf1-x430.google.com with SMTP id e16so1455093pfc.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RrXmvYVWwjZWWFTWqfAImmx/l9eEEMuwuSGE48QpwI=;
 b=xbQDp+R8DEkfZAyS2BNeblzscUAeXRqgRM1KEIcLwQoNPSmBQdkuH6nLpHfesIeuGl
 gHdqgyw484gKvonrkE9fitnhYfCjHT0FSasYPQO5l3zHq16D6eguQFN1hW+UuBS6NyIN
 mYcF59+/qmbyycX4JD/olvHUkXxNhMQm5tm5PZKByyW3LNnJ3JUVlBooMII0UMAOxOxM
 aliL62fB/ZPqB6phLeDkjtSNeZWHuLSuRujODDsQUalUlE6bwbXt3/lYFQAhARDKJ+H2
 3AEC5JzRu8hJy2gNgmo2iUSHvRojcu9PJ8xW5lp/z3Z0GD7BHVbQV1DKqzyfj1G5g4jG
 XzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RrXmvYVWwjZWWFTWqfAImmx/l9eEEMuwuSGE48QpwI=;
 b=gW3HTRcXTWOVAwUMZWRkGHhU6pKvfUmnMvIyITFLePHl+meF8HezbKB38CsprMMOP6
 JXoOZsCf6XVoOlgwQI58BFhVR75vSOS+hEqirUvnxjHps1DixMlByhOKkfpaeBFWRDDo
 87kHha5uFAgouH1sNfRRCVtx3gtymPdvXioaeGIs8H90C4fk3VxuUQIlwIEyJp7GcUWy
 E+5GR02BFKK3TPD/LMCkw+ST1XEepsTkcdnikMYRkT0oRc+nSwkb5wfHS08GKMQ5njZW
 V4AfvbwvOpqK5gTyf1aTSYTVJoGK9LdLsUotfmfuCB2yphc8EED8BzLAYsMiZdrxhRgx
 LL7w==
X-Gm-Message-State: AOAM532aDNZ0heVFuSxnihyR5ANwwq57GpfNxlOevAZ782hmBP0ie14D
 UXEyRf0zYgTZK3eX5JciBtcfBA==
X-Google-Smtp-Source: ABdhPJzmW1k9nyX32PGaTR9j4arfGajIyBDBlUVvumod80JooCIhihionHWxXhnJsSLnj52zMKPJxQ==
X-Received: by 2002:a62:ce0d:0:b0:438:71f1:4442 with SMTP id
 y13-20020a62ce0d000000b0043871f14442mr34059616pfg.21.1632279863719; 
 Tue, 21 Sep 2021 20:04:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w8sm471249pfc.93.2021.09.21.20.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:04:23 -0700 (PDT)
Subject: Re: [PATCH 1/5] configs: Don't include 32-bit-only GDB XML in aarch64
 linux configs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a70b4d62-8493-479b-f0db-f39b112096c3@linaro.org>
Date: Tue, 21 Sep 2021 20:04:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-2-peter.maydell@linaro.org>
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:28 AM, Peter Maydell wrote:
> The aarch64-linux QEMU usermode binaries can never run 32-bit
> code, so they do not need to include the GDB XML for it.
> (arm_cpu_register_gdb_regs_for_features() will not use these
> XML files if the CPU has ARM_FEATURE_AARCH64, so we will not
> advertise to gdb that we have them.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   configs/targets/aarch64-linux-user.mak    | 2 +-
>   configs/targets/aarch64_be-linux-user.mak | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

