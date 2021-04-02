Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE8352E2C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:20:50 +0200 (CEST)
Received: from localhost ([::1]:48094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNTV-00055Q-Gu
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNRs-0003og-4X
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:19:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNRn-0005zL-0e
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:19:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id v8so2772143plz.10
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a7X/JuysazCUdbLBNeqbvw1zbQswYaIoxcHcFQ6jC3Y=;
 b=Epc+SSr4daiw265r1Aj+SQGdcgWXdDqvBxE7FtcfMlEqbPS1wxCeb3DNLYnMggBJyT
 lsiJxGHuZl6h+QnLN80pohkCHU6pNqUyxWnA0dupe5Dh8h17MDCuowB7VGygoP54w1A3
 gP8wiDmO+M7rgq4X0OPtHKRQFBViokWl857tSNPsmLKCTHlJcgl9BMwSx28mooj68dI2
 V1U5jc/5FugsgMFpsDL8wOaWvN+uKnru5m0vu1qkikdsnotgurexC24Qa1ge0IFnd5RK
 HG5oz5Hnrh+iA9LjxkKoDsbsyLsd3mSWKg2coP8u2LMOj8pAw3xLBpjFvZulTQ47Ky6I
 43hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a7X/JuysazCUdbLBNeqbvw1zbQswYaIoxcHcFQ6jC3Y=;
 b=CqxVWcPiTm1b9kFfGO4ujKyBjLiAYufgdgSu89MgdOWwhOXXhT7c4/JpsQYAa03xYz
 YNdy2xi4gnVpbCaAE0edC/ZeE585EFeHDZt3AY6aaW7LiTRq/C/tQPpi1PaIu1uXOrbL
 4N+ZmdRNAd/Tv2qC3Qt8zF6mtxqavDARwTpntAqVLqtwzwB6ytnTWcPkCaIfwU6z1FM9
 UYLnF+1ewvn/Xp586HmvOLcSGgmpfI4hUg0cA3GiV32Zj40XFYAcaNvMZNapISv+Y6J6
 ZZqrRDvQ4df48QPkrklau6AZMOQIChIpCM4a7N1oHLNLw2hhOx6fVq8hxQNg9rs+5OGY
 Cetw==
X-Gm-Message-State: AOAM530IFB76HSF+5yB55/aGGdFVf2shBOGdAEswtF0j8SLbtQqh8Z02
 cz4+/bJUjHEjx1agluaArciEzg==
X-Google-Smtp-Source: ABdhPJxF2wt8dyQ+lWER6xeSrO1ly1b52gKymh6vkTaGYB/Ko8yB38Gg1TDhJadxSzajHHxu8cGgUw==
X-Received: by 2002:a17:90a:4005:: with SMTP id
 u5mr14783532pjc.6.1617383941433; 
 Fri, 02 Apr 2021 10:19:01 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id v23sm8501724pfn.71.2021.04.02.10.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:19:00 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] target/riscv: Use RISCVException enum for CSR
 access
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3beab695-3414-1c61-91d1-f52a2e53f4c5@linaro.org>
Date: Fri, 2 Apr 2021 10:18:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 8:18 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h       | 11 +++++++----
>   target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
>   target/riscv/gdbstub.c   |  8 ++++----
>   target/riscv/op_helper.c | 18 +++++++++---------
>   4 files changed, 38 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

