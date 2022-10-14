Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA545FF3E4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:59:00 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPta-0000s3-21
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPpL-0003de-NY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:54:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojPpJ-0002Jx-S0
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:54:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c24so5556363pls.9
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LGAVL8wGR2apolVozh1NDzAYO4WmCG5uj+MoirSpL/I=;
 b=g1sUHykqi1JSnOAg4xCMPOqYs+lBAM3yyozFaTrxfsgXSu8+EW0Vo/9tWT2oZCMGSa
 cZT653rTz0W/mvEeQsA4vbycOKaJ097hVW1E88okjIzETcwj+/50InXI3/joLcl3NzuF
 8KCe8UX70kb6UoPi9PpNDu/Q+3+4BofAY9z5+zClolz3TFVevivJw98Fszne+/dV5l47
 nKsG4wpx7TsMgIY6pCRK71d6+qwD+xoYoOigc3Vzx0LxVk749LDDri0Md+nTSdyMDihP
 szkMVRFbwyI0qvv3ucGO45c1vEyU1lWwiwgHw+rJdUddeLxTnMUe3deQvxRCxFRTkcSc
 kqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGAVL8wGR2apolVozh1NDzAYO4WmCG5uj+MoirSpL/I=;
 b=Oi/6fqfVSV95FZvPzDL3qA+jVFbVjrBWjArtXfkEhN+VEEin9v8lqDqXfsPGi1CVda
 XSechywnMjMLtdIrsl+QT/jCo5EB/57dRgDtZiT+K0GcAxLD/s13bUwwf8KDSytK8k5i
 qhXZDjMmhHA+DQeGgHSOArTP0vOjslD0Mk7oNIwVdjFy1QWDw+y5KQ5ZgIf81F4ZMuXJ
 rxLHKUqo8rwlm0yYb39EqUFtA/0V9qbdjWOw3FLp/uTbYdGEXQ6i6NiKEjf/5uQFNOcq
 o49hH8H+azuXfNZltuhmoLg9amdBNB5C5Ssh6Y8tw3WNn4XyLhuS4UuvumZfOLKFIq5k
 r2/g==
X-Gm-Message-State: ACrzQf3wgI4F2y93Xe4zLa4KfYGm615ymyNrGeYWJZCDajTfjrUg0xG5
 D9ZNZvKSoeYZ803ZwsJ6VgbcpQ==
X-Google-Smtp-Source: AMsMyM4vGekMN6TgPv6F6+VYR6vROVbYUjilG5RRGbQgp7bNa432BSUejI4CM9iwnJL8cpqHMTpQiw==
X-Received: by 2002:a17:90b:4b46:b0:20a:e906:426d with SMTP id
 mi6-20020a17090b4b4600b0020ae906426dmr7568312pjb.48.1665773672188; 
 Fri, 14 Oct 2022 11:54:32 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 mv6-20020a17090b198600b001f559e00473sm5233006pjb.43.2022.10.14.11.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 11:54:31 -0700 (PDT)
Message-ID: <b6aac649-a920-1a86-578a-5a5b7ee3626f@linaro.org>
Date: Sat, 15 Oct 2022 05:54:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] disas/mips: Fix branch displacement for BEQZC and BNEZC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Daney <david.daney@fungible.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>
References: <20221014112322.61119-1-philmd@fungible.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221014112322.61119-1-philmd@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/22 22:23, Philippe Mathieu-Daudé wrote:
> From: David Daney<david.daney@fungible.com>
> 
> disas/mips.c got added in commit 6643d27ea0 ("MIPS disas support")
> apparently based on binutils tag 'gdb_6_1-branchpoint' [1].
> Back then, MIPSr6 was not supported (added in binutils commit
> 7361da2c952 during 2014 [2]).
> 
> Binutils codebase diverged so much over the last 18 years, it is
> not possible to simply cherry-pick their changes, so fix it BEQZC /
> BNEZC 21-bit signed branch displacement locally.
> 
> [1]https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=opcodes/mips-dis.c;hb=refs/tags/gdb_6_1-branchpoint
> [2]https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=7361da2c952
> 
> Fixes: 31837be3ee ("target-mips: add compact and CP1 branches")
> Signed-off-by: David Daney<david.daney@fungible.com>
> Reviewed-by: Marcin Nowakowski<marcin.nowakowski@fungible.com>
> [PMD: Added commit description]
> Signed-off-by: Philippe Mathieu-Daudé<philmd@fungible.com>
> ---
> v2: Use sextract32 (rth)
> ---
>   disas/mips.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

