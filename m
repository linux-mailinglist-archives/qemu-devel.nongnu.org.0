Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD24468831B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:53:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbsu-0007XQ-1X; Thu, 02 Feb 2023 10:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNbsr-0007XB-N0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:52:21 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNbsq-0007jl-7K
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:52:21 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so6003723pjq.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KxTkTWiF5Binzvruuvz8LOyyc8mscJo71Dsf01ZyscU=;
 b=nfbs+xUBfToJziq0t52shHVlUXhnwKvJXYaTc3YSxt2Rsr/JXc6pjkCUvYHetbNIVx
 pZQScRCJrjF/VsezpsTott9G2PEnU3DG8gxK2XHX6lwG09WvkvJ5e345QJ/12XGCzlcj
 UxQtbG+v3rPLaJxDIxPBXvtzZCliWxTouyLV7Kie7LCO4S/g1C0g33xtvQhrua7MMR17
 q0XF8hy5QtKCcH3e/FZfySeNwCvYwRZ0dqapNBv48CtcMB+VRDdbSeR4jpexLJZoFQsq
 2C4eK3fKKS1SM3GIRa5X5vm6BuITXdyMC4jzAHcvF9WK+GGUna5lfD80o+u7xC9otcSX
 7jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KxTkTWiF5Binzvruuvz8LOyyc8mscJo71Dsf01ZyscU=;
 b=D2yWIgs+3j7wvuA4B/E79C+gIr28Z+DRWMUDddVTsdlavPt2pWUsVSHk2lgtksKJYe
 ynd0mR8w4mwFDKXyHC+8NwicIm3YxAZe0xJqBfi7ZpASpnOwuvC4/2UXREcgFgv9YGzN
 Df7IT8j/G/EQGeXXx9xm0Y5YC8JLi5z0INxC88uMbpPfYip8avNrek4ALyUy6BO9WiJB
 WMA+Efs5mj/hTXXiSdoicLIgdpizq/hKvwU/KbX4dN+6UonVmfh6a18/zALpa8/76rVm
 a5VrVMPC8/G02ib/g0wcwz624Fx9ofZSXiGok2mCYzehHwLJCUDnh0TrcB2gDXvwJboP
 rs+Q==
X-Gm-Message-State: AO0yUKW//RJgrzKErv+yuAoCOpwFRgjmamMCrWBuV642hKd05JitP5K3
 /4Evwya3PeBsOV85lgZGXIstbw==
X-Google-Smtp-Source: AK7set9E+r45xZNTcC7n9jb1ErZ7UrxCp3YP+B0TllmiGNtnOHckSz7kckUJ6CbJ3quQwBIsFxJ+zQ==
X-Received: by 2002:a17:903:25c4:b0:198:adc4:228d with SMTP id
 jc4-20020a17090325c400b00198adc4228dmr1999514plb.8.1675353138568; 
 Thu, 02 Feb 2023 07:52:18 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170903228b00b0019601fbb963sm13812822plh.172.2023.02.02.07.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 07:52:18 -0800 (PST)
Message-ID: <a3275c10-2461-73f3-eaf4-3a21597c43bc@linaro.org>
Date: Thu, 2 Feb 2023 05:52:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/10] target/tricore: Fix RRPW_DEXTR
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
 <20230202120432.1268-6-kbastian@mail.uni-paderborn.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230202120432.1268-6-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 02:04, Bastian Koppelmann wrote:
> if we used const16 == 0 we would crash qemu with the error:
> ../tcg/tcg-op.c:196: tcg_gen_shri_i32: Assertion `arg2 >= 0 && arg2 < 32' failed
> 
> This whole instruction can be handled by 'tcg_gen_extract2_tl' which
> takes care of this special case as well.
> 
> Signed-off-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> ---
> v1 -> v2:
>     Use tcg_gen_extract2_tl and remove all special cases.
> 
>   target/tricore/translate.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

