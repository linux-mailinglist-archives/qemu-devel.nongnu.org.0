Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48AD375A0F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:16:52 +0200 (CEST)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiYN-00018P-Kd
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leiI3-0003v1-Rg
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:00:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1leiHs-000159-W9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:59:55 -0400
Received: by mail-pg1-x530.google.com with SMTP id c21so5279370pgg.3
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zzbPPsyM/RQ3RC66pVK4RBs2EmO/wnOK6LpHmB53KM8=;
 b=jPMKoVg6V95CXmkQws/RLfUby4JlUrxAuVGCPn8msakYvWzyp05EGWDnswz3p0JM/D
 8w+wxs3dAiNAKxhOvwpvqHaQUjHfEsiTa4hpKJCYo0VOktEXXudDicBmWYb62cJpmXRR
 FJs/+84UMcImNleLpB5F2Ydn0B+yhNGqRZ6EnHv2Woq9Leo/DDCOh8/ipyZoPstqeLTZ
 ZZrqKLUCY5fl1OpOEROQZs9Pgou/HTPPRUtMgrpGa40v/ov/B3s7eH/Z/hrbj1QFBDZa
 wvQRWaYTbdJY5Tq/y1zY+27GLyskz1J7xQXUQxu+Bjh84xrbGBsg1mK5FEEdBATLhKKB
 6uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzbPPsyM/RQ3RC66pVK4RBs2EmO/wnOK6LpHmB53KM8=;
 b=e6jIEa3c2vnueM1Y51SlsucEtO8CfAAZuKTUQIVhq0PENiQNj4E3zn/zqGH7/Z2p/S
 /YKRCd933PsZUAuyPIUXfQoH9SP17xLtGaRh/CC1lfKXwHXt5tPQddxccmxzOswpic+M
 nd7WumRGc60e35e8Ux4fQozj8cA6765lFWL6UueUSQ9AEHRT2szBEUC99sOiTkMp/UJR
 vCzyzQ6A9kQ5Ua+RxtPU3AnYLpOXzRdNT+t9dyZnrE9A3yF12Ij4UOXd1siSHkm8mNKO
 Ifa62gIKPXwJhb5YDY7LVOnxyrmh8H8cJqnG/qzmlpsPlyvNgkILwGujnanbtB4WigEY
 iKSA==
X-Gm-Message-State: AOAM533Cw8CI9V+rlvJlvW40KockTu9nw4Prb+m9aECzteiA1/8frwqI
 LpGKW0b/HHw9AUbRIrNaTExOxg==
X-Google-Smtp-Source: ABdhPJy0K8iXTQqWv0U55B1RJZ6TFdiUVTRLclmuPwLRPAlpDLo84Lh1p2wV1VPMTSVVFxieEKmG1Q==
X-Received: by 2002:a63:e60a:: with SMTP id g10mr5490405pgh.21.1620323985511; 
 Thu, 06 May 2021 10:59:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t11sm2428448pji.54.2021.05.06.10.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 10:59:45 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix potential integer overflow (CID 1452921)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210505215119.1517465-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24ee41cc-4d2d-c7f2-0beb-956943733b3c@linaro.org>
Date: Thu, 6 May 2021 10:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505215119.1517465-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:51 PM, Philippe Mathieu-Daudé wrote:
> Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
> This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):
> 
>    CID 1452921:  Integer handling issues:
> 
>      Potentially overflowing expression "1 << w" with type "int"
>      (32 bits, signed) is evaluated using 32-bit arithmetic, and
>      then used in a context that expects an expression of type
>      "uint64_t" (64 bits, unsigned).
> 
> Fixes: 074cfcb4dae ("target/mips: Implement hardware page table walker")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/sysemu/tlb_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

