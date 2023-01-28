Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80267F3A0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 02:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZmw-0005WD-Mv; Fri, 27 Jan 2023 20:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZms-0005Vu-I0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:13:46 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZmq-0008Kz-TW
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 20:13:46 -0500
Received: by mail-pl1-x629.google.com with SMTP id p24so6624033plw.11
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 17:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sb1hIBNVIe3rR0re9Y21qriETaRXzVhWU8UoYxIBuUc=;
 b=WNSMuSCkD2nh3c9pLsLRHmkVbL4YaEd57Zy8TLYT6tyBUTNyrsUw8NLj3oG3eSQQFY
 vNOZHCXjNmqAREDyqF2O9qWRpxdexSRjjHYSgpqige5QcnWDSpPEPPSDOQgEIZ2lFNKf
 R25sHytjDq3RHdR/w2Ewi7fBfLYRQvu9M4PYXiv+C+zjkNq5ig+sEdEfr+Fi4IC6ouDE
 Ri0pa/3tDwdr9ZLfevT5qCM1W4y+Tvt138FfV6rqaOud+EbBoVeUqqc5o7zUavLdGQpy
 hlLTfxiNvHQor4W9G6IsxyMSddA4TEF+KMah49EvUQKKTwX82zgLY42l2tUli8fU5kJM
 8wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sb1hIBNVIe3rR0re9Y21qriETaRXzVhWU8UoYxIBuUc=;
 b=K+r2+j21rkSbzHizKuxibGtYVa6C4Rc4/NbQwH2GBd+YRhQd+SSozsAAyTmQalOUWl
 elugveYN01vqTFAqYYuneLoRwW3P7x02QFDUFKT61St1fzBSYBXZuQpB6/6pfaf3sS61
 BuUpdUV0qgDEfYUO/dGaSEgDK2idZ/yph6YO2A9OLnJ8FJJv2SsH+O6ELqxpxeCekQWE
 22wxL/p+2YD1V/MwxhP3wrTmIGicVV4fs5JikwqqGAiMnAa4bnp+J5lcXJr5/AKVuSf/
 JSGsquwXKnSV8I0TO/RLGwmmw0FnEee77fbbPIvmLoY4ko+itmz0B+KNk4aAKnnQVP9K
 NasQ==
X-Gm-Message-State: AO0yUKXn4l2DuCrZ3uS9p4gkeu/puzWRDdTokVFiaI4AMQxq1XqbqtcC
 hVhhffuuK/PB1Lz5TkujrZ1wwA==
X-Google-Smtp-Source: AK7set8ctjdPJ/5wnxkEeBP8ukfeTDnjko72opTb0ZxcO8SsUSfPp/2wlxxp7cnCz5pG0Tj74As5Uw==
X-Received: by 2002:a05:6a20:144d:b0:b8:65b8:a37 with SMTP id
 a13-20020a056a20144d00b000b865b80a37mr883794pzi.53.1674868423460; 
 Fri, 27 Jan 2023 17:13:43 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l71-20020a63884a000000b004e28be19d1csm377471pgd.32.2023.01.27.17.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:13:42 -0800 (PST)
Message-ID: <b093f644-9ebf-75e2-081e-b5887f95ed5d@linaro.org>
Date: Fri, 27 Jan 2023 15:13:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/23] target/arm: Move do_coproc_insn() syndrome
 calculation earlier
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Rearrange the code in do_coproc_insn() so that we calculate the
> syndrome value for a potential trap early; we're about to add a
> second check that wants this value earlier than where it is currently
> determined.
> 
> (Specifically, a trap to EL2 because of HSTR_EL2 should take
> priority over an UNDEF to EL1, even when the UNDEF is because
> the register does not exist at all or because its ri->access
> bits non-configurably fail the access. So the check we put in
> for HSTR_EL2 trapping at EL1 (which needs the syndrome) is
> going to have to be done before the check "is the ARMCPRegInfo
> pointer NULL".)
> 
> This commit is just code motion; the change to HSTR_EL2
> handling that will use the 'syndrome' variable is in a
> subsequent commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 83 +++++++++++++++++++++---------------------
>   1 file changed, 41 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

