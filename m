Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F5965CA9A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 01:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCrDq-0001DM-1h; Tue, 03 Jan 2023 19:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCrDm-0001D3-JF
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 19:01:30 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pCrDk-0007uU-Sz
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 19:01:30 -0500
Received: by mail-pg1-x52a.google.com with SMTP id v3so21186907pgh.4
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 16:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=joMbw4jQreiAs3mPNm3iK3glnalUuAUZH2fv17y3QT0=;
 b=zYc7S1jsa08J2sV2JOe/MpjCE5hx/mMB+hrsUKvlBWv4PB8EkuMD8dlSjC9IRtnQm9
 y+dIwVZNWn8m27pUf3zYwYFJK+/1Q/fKZOoOUk/CVQXgUyCp6virAgsDQTiMGW4DA6/Z
 jUfziwlD6MB9xMLje07E0R1EhQis0hD+0Gmrsdt2TLE7sxN4rYM0u6YpHdnh4K/o2Uw8
 2A2EteGwBuBcQn9DKSvBWjjR3vvd+n5BeN5vGNLIOYcsuoru7pyOmExvt39hEHNwhSff
 uA6RxHSNCgMoXHcSCIKIwhnnJ8Jz4MPrxiK/Tdd75aY85StGKZHbaqwdoCLrMg1C9MYt
 yxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=joMbw4jQreiAs3mPNm3iK3glnalUuAUZH2fv17y3QT0=;
 b=WJgD4l2ObW2td1ouXjjQErHHab+TnplIzcuR11EM0cIjIt4TeIeJU6ki/O1a6B6+1r
 IYSs97mb/EeblXFrrcq4/4XTSapBuwH8m+heXDjEZrGx+zhj6j6JLalnSPQRTVCiKJqS
 OMIC3e+lk2+LlbWqu6guyDymlO6O6t2fkdrXVP1imyjb/IKWY3WLVSSDdbHf0To5lL/+
 PN3TS4TTITvawbrDjfY7W5TNsCMzpkFEQSYo/fuVsFkroQwWCqXHYqnZA2r7u99Tv1dh
 /w4CZDh6Gwc/mpRgaMqrXWPMDE4rEQcTkLzy1tV5ojTm34tJ9ogU5PDTOGcyGWjt6sKi
 B1/A==
X-Gm-Message-State: AFqh2kpL5exwwodPcW9K880g1Zb5KcaFPd63ysjkQi1bZ4kUpeofQYwJ
 krtNuaCztGZyadLuLQPaTht4UnTXW9DCp56O
X-Google-Smtp-Source: AMrXdXvkr6mHBxEWLR/PPhytwpbAj65Yhfa0U4FxFyM9dwbMFbHdrQ1L8oBCxY737PrngQQACmzhcQ==
X-Received: by 2002:aa7:97a1:0:b0:582:a686:34f with SMTP id
 d1-20020aa797a1000000b00582a686034fmr6084069pfq.30.1672790484996; 
 Tue, 03 Jan 2023 16:01:24 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:461b:36aa:aec9:d28a?
 ([2602:47:d48c:8101:461b:36aa:aec9:d28a])
 by smtp.gmail.com with ESMTPSA id
 p187-20020a6229c4000000b005764a143be3sm5293924pfp.103.2023.01.03.16.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 16:01:24 -0800 (PST)
Message-ID: <fdfcc4b7-1dcb-2344-7afe-f59d33e89690@linaro.org>
Date: Tue, 3 Jan 2023 16:01:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/3/23 10:16, Richard Henderson wrote:
> Richard Henderson (40):
>    target/arm: Remove aarch64_cpu_finalizefn
>    target/arm: Create arm_cpu_register_parent
>    target/arm: Remove AArch64CPUClass
>    target/arm: Create TYPE_ARM_V7M_CPU
...
>    target/arm: Utilize arm-cpu instance_post_init hook
...
>    hw/arm/bcm2836: Set mp-affinity property in realize
>    target/arm: Rename arm_cpu_mp_affinity
>    target/arm: Create arm_cpu_mp_affinity
>    target/arm: Represent the entire MPIDR_EL1

I meant to say: Peter, at least this handfull of patches ought to be useful cleanup 
regardless of the rest of the series.


r~


