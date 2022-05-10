Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1F5227FD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 01:58:47 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZkc-0004k5-Kj
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 19:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZiw-0003Ki-6W
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:57:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZit-00086Q-EG
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:57:01 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d17so314987plg.0
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=j/tPHhMK7W/q4LNaxkL8PRgWfiWiRvM4sJQKjsweVJ4=;
 b=VgwqhVRp53fmJjkmE1p0ucGc37oZloLzVjlNpL5oObpKMRJXH9qrJ6PvWu7Cv2cRlQ
 s5Rw8yWNLhGYFPGvW4v1WJK+hhBUv+XI2xoaU62a9iqc65V/zTJewTLbUIcpNsVbLa0c
 558OSM8UMxG1X9Zlps9fNQZo+s+Yfj6iNBTFREep2uy+tShR7K2db2bA7TyTUu6fKZ4f
 0DCTpAd9YKn2pKF4vtmT+7gcHrDO+3yFsnZry4r6cMGnFGm43XsIv6aHLGvjPJ8Igj7+
 5oqe3tPfHzcPgEHvNB6Bz8d1hNH3Tz4nRbRseJKlXa51Lf3LYEtH8S4ybvqFPEup50xX
 4vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j/tPHhMK7W/q4LNaxkL8PRgWfiWiRvM4sJQKjsweVJ4=;
 b=CEO1saUuQuH5GY2AoE3JZ0H4p+Y4PfYoiQkjhn3bo8dvtfJF5gbyvDLkGpCRsxeX6Y
 TFLri2f7Xjo5c5EVXNHqsgwRQGMk7ZL/niUbpef4npeqluLlILmbWLKUysQhCkVG2kQk
 2dv8CoH9d5Pi41d1LInNWnDgn0/q5QKvl7iEXUsJXuKy8aQCBW96RM6MQjLPKTqUlEhr
 1NHj/cPhk89J623ia4Wb8cA1N0UykUBHD9EsZCB0WYQ4EfAGlnJXNn9GOpwvB3fqRywC
 UprpC8n/NJ++f4Q9yHiY0EVOUoLHgyaF5H5xi+1kFTLfea5dO0X7mq6CfWI6Y1PT2KAi
 XNaQ==
X-Gm-Message-State: AOAM530hf3R7/Aqyr2pF9l0UwEUflWciWkMFB4SgW2uBDEzbkU/bhrAc
 t2dVIJ0q6Anr9vqV3f1nNb7frA==
X-Google-Smtp-Source: ABdhPJyfDRcEa4FXcPyn2GTuD4nnQpmI8VfDd4rmcwSE15JWPV6p33LK6nc+1gqpjmcZL3NEzoZE1w==
X-Received: by 2002:a17:90a:1f4f:b0:1d8:23d9:de1e with SMTP id
 y15-20020a17090a1f4f00b001d823d9de1emr2366437pjy.42.1652227016883; 
 Tue, 10 May 2022 16:56:56 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:923e:f0df:3e3a:c73f:64e4?
 ([2607:fb90:806a:923e:f0df:3e3a:c73f:64e4])
 by smtp.gmail.com with ESMTPSA id
 12-20020a63010c000000b003c14af50624sm284337pgb.60.2022.05.10.16.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 16:56:56 -0700 (PDT)
Message-ID: <ed0ec116-9973-24a7-9cac-7d288a3521fa@linaro.org>
Date: Tue, 10 May 2022 16:56:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/3] target/ppc: Fix FPSCR.FI bit being cleared when it
 shouldn't
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220510204610.100867-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/10/22 13:46, Víctor Colombo wrote:
> The FI bit in FPSCR is said to be a non-sticky bit on Power ISA.
> One could think this means that, if an instruction is said to modify
> the FPSCR register, the bit FI should be cleared. This is what QEMU
> does today.
> 
> However, the following inconsistency was found when comparing results
> from the hardware (tested on both a Power 9 processor and in
> Power 10 Mambo):
> 
> (FI bit is set before the execution of the instruction)
> Hardware: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> SET
> QEMU: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> CLEARED
> 
> This is happening to multiple instructions in the vsx
> implementations. As the FI bit is non-sticky, one could think that
> xscmpeqdp, a instruction the ISA states doesn't change FI bit, should
> result in a cleared FI. However, this is not happening on hardware.
> 
> An investigation resulted in the following conclusion:
> If the ISA does not list the FI bit as altered for a particular
> instruction, then it should be kept as it was before the instruction.
> 
> QEMU is not following this behavior. Affected instructions include:
> - xv* (all vsx-vector instructions);
> - xscmp*, xsmax*, xsmin*;
> - xstdivdp and similars;
> (to identify the affected instructions, just search in the ISA for
>   the instructions that does not list FI in "Special Registers Altered")
> 
> Most instructions use the function do_float_check_status() to commit
> changes in the inexact flag. So the fix is to add a parameter to it
> that will control if the bit FI should be changed or not.
> All users of do_float_check_status() are then modified to provide this
> argument, controlling if that specific instruction changes bit FI or
> not.
> Some macro helpers are responsible for both instructions that change
> and instructions that aren't suposed to change FI. This seems to always
> overlap with the sfprf flag. So, reuse this flag for this purpose when
> applicable.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2:
> - move the FI change from float_inexact_excp to do_float_check_status
> - sfprf will be renamed to sfifprf in another patch, as suggested by
>    Richard
> ---
>   target/ppc/cpu.h        |   2 +
>   target/ppc/fpu_helper.c | 122 +++++++++++++++++++++-------------------
>   2 files changed, 66 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

