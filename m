Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCE3AF678
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:51:48 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPxT-0002ZF-7M
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvPwc-0001kT-Ky
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:50:54 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvPw4-0007Uq-RS
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:50:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id t8so4240642pfe.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OJhciaH5QFUXAM2r67HOFKTOycZ8xlmYFwtF8L+ghcw=;
 b=FYFBLWMmKE1tls0l4m4rvNY60ooeh5G70sIlRAq7dAaTbftNHNT6+6BBXW1cEHqAUQ
 5w0v0d/dA/nD+qAdULIAITn4BbzGHmN5QVdtu/PFJrv0o1twFTMS6AuiCadVizE8aB2Z
 wlHRgjIN/arXutRG2JLt6Xff7BhMOztA7OCtnqKtq17LUFkeWquptPQKgnJJOgA7+ZFR
 xB0wzDWDG4Qh09Mte7zQ6JUDGab5grnxzqahJKF/TjqGxs7+cmXg30r6QRx3YlpZRWYL
 WTz3KAtC1e0gEIwyd7F78yaojUOb9jt5yEN1K+4Ak20diP1Hk2zEWmtOHLtNGxJk5ILG
 rd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJhciaH5QFUXAM2r67HOFKTOycZ8xlmYFwtF8L+ghcw=;
 b=Jc5C0uRfmxPcTZ3eGYJhxu+pTu8R+5vXBvid3YIPHoMS4gx8OnaF8RyyzdWSDqJyQS
 nqh0MHtdypqAPbsFt75AhgznuzN3RSINVs1u23VJaOiEe3nf96mxJcI3pbfsbnswV/Po
 Pxg7WxQM47Pe/Mjket30/zaqHOFtcnz/VpuZ734wlJ5pwQ/G1xHH8fhVGrthF5onpabH
 WpB1VqUP1FNSk9vI5H1Sy/ntoB0lG/I8XCeEIqdGmIgW5UGfjQ0vcx7e5KIqm+vuj/TF
 st/P9HG3aLcukhBQxW90DLGnI9T3o9AnaPzJJpmhoDVKgZuLai1jgbXDPimq7+EU6FqV
 97dA==
X-Gm-Message-State: AOAM530e7FiPTkea+r58rFYI6W3GogKA9MW81X2Nn8GLa+bsKO+0ndgO
 TzrmVc+YGaJJABit909kOlA6Dw5DvcSJjg==
X-Google-Smtp-Source: ABdhPJwq9l8Zb2/vzT+mHzLDSUDNR4xzEVZJ9ek3REvKNa7gHAAMHq23LbaTi1w7InJcMu4vfjWZvQ==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr162802pgb.127.1624305019060;
 Mon, 21 Jun 2021 12:50:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x7sm26853pjf.56.2021.06.21.12.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 12:50:18 -0700 (PDT)
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
 <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
 <5a03a209-567a-df86-1b47-9cc39d82eb7b@linaro.org>
 <CAFEAcA--+n5aJVM9nv53v5cUCGxjPB7GPCNxxGCy02Dm6a77yA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48f4da88-7b3e-5ebb-7e10-c8d6528ac880@linaro.org>
Date: Mon, 21 Jun 2021 12:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--+n5aJVM9nv53v5cUCGxjPB7GPCNxxGCy02Dm6a77yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 12:40 PM, Peter Maydell wrote:
> On Mon, 21 Jun 2021 at 19:12, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/21/21 7:01 AM, Peter Maydell wrote:
>>> Side note: it's rather confusing that tcg_out_rev32() doesn't
>>> emit a REV32 insn (it emits REV with sf==0).
>>
>> Which is REV with SF=0 also has OPC=10, which is REV32.
> 
> No, REV32 has SF=1. The two operations are different:
> 
>   REV <Wd>, <Wn> -- swaps byte order of the bottom 32 bits
>                     (zeroes the top half of Xd, as usual for Wn ops)
>   REV32 <Xd>, <Xn> -- swaps byte order of bottom 32 bits and
>                       also swaps byte order of top 32 bits
>                       (ie it is a 64-bit to 64-bit operation
>                        which does does two bswap32()s)

Ignore the assembler mnemonic and look at the opcode:

REV   Wd,Wn   = SF=0, OPC=10
REV32 Xd,Xn   = SF=1, OPC=10
REV   Xd,Xn   = SF=1, OPC=11

REV(Wd,Wd) = (uint32_t)REV32(Xd,Xd)
i.e. the usual interpretation of sf=0.


r~

