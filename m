Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613FA3B7657
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:15:26 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGOT-0007LW-FF
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyGN2-0006Ii-FH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:13:56 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyGN0-000272-EK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:13:56 -0400
Received: by mail-pg1-x532.google.com with SMTP id u14so12486118pga.11
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPDvw+z29ztEXmZfUWOYQYPgFCQlGvxV53orMN1ZdYU=;
 b=CR5klW0ty1xUubx5jPfmMI/iJTbn0i3hY1TmCOy4KYlomSxKi0ddgqAfQuR5t+Xjku
 jEIAUW2UdLWMMw1fCQpCIN2Vx8+bVp13c58pRE/cqc2VCRNpWhk/LCW/5jZbQ9a1KflC
 U24ijw2gU2XCq6qb3ezo979dbT+Rvi4exv4V6Z/4nsLNB3MnSxZ17IwaVGothIKMAi5C
 XKEaCfM96TAOLli+COVH2hQZMU/MT1qRRg0GSArQJcFPtEhYGF11Cvah95/WSNyQ6XBL
 t56F3tzGalDpmKabj6hrwEObVGJ6gzQ8FcPz8eSoWr/jxV6yppfQ83odWWqZxnUFVmRk
 qk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPDvw+z29ztEXmZfUWOYQYPgFCQlGvxV53orMN1ZdYU=;
 b=oJa9ywPgRJawsBrHi0IuTTaFemYll1kVju3PrVtDR9nY8y5B62aDKEcv6d8MAUj7yM
 zB0Ct8ijj/9ZDNoTemrZDypMRzdVxDDDRHGLqfEAiUmoBzotp8NHOIPcPF1PJlGreyMc
 TC+ZdoWWVp79e36dRw6Dlbh71GG6nGEBAVMQQUpbe152qxxBP2sNojYwz1Wr/rMDRxTQ
 DGvsGLrmB5rr/gBsLsj0HSYh4L/MZKY7usv8wEfIzKG4SEal96TIibPgLZdjyeGAd9BR
 H8AJdWYpozlG6Lah4wQ6uxHlmRWGhFBLr06Q8edigft2t4BJZXTWclmE2DiQOpF8iB9d
 H5gw==
X-Gm-Message-State: AOAM533chB+rku/4PrvO2AQsiQ1xC2dxubb5X7899G1cMUq7jQXIkiVI
 b2tyeMBVhp/igErHsqIn65ntDdsUrZK6lQ==
X-Google-Smtp-Source: ABdhPJxZgCklzwyEAp2HygpMNkENl7YIRQnGuhUscQyyKhVGPpmOf7yY7Omp4TNuC2enrR+6upnjpw==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr31550556pfz.1.1624983232424; 
 Tue, 29 Jun 2021 09:13:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 27sm14915047pgr.31.2021.06.29.09.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:13:52 -0700 (PDT)
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
 <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
 <42d6f71c-6d91-1ae2-bc13-39cb5a70b1cc@linaro.org>
 <CAFEAcA_9Ss6LffwquHbssZ=XUSWAsL6KkKCPs1N3q44aG5m3Hw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67309c83-0118-fc7e-e06a-da95194bd5ff@linaro.org>
Date: Tue, 29 Jun 2021 09:13:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9Ss6LffwquHbssZ=XUSWAsL6KkKCPs1N3q44aG5m3Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 8:56 AM, Peter Maydell wrote:
> I added the groupings, and the final result is:
> 
> {
>    # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
>    # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
>    # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
>    # they explicitly call unallocated_encoding() for cases that must UNDEF
>    # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
>    # the rest fall through (where ORR_rrri and MOV_rxri will end up
>    # handling them as r13 and r15 accesses with the same semantics as A32).
>    [
>      {
>        UQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 00 1111  @mve_sh_ri
>        LSLL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
>        UQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
>      }
> 
>      {
>        URSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 01 1111  @mve_sh_ri
>        LSRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
>        URSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
>      }
> 
>      {
>        SRSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 10 1111  @mve_sh_ri
>        ASRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
>        SRSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
>      }
> 
>      {
>        SQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 11 1111  @mve_sh_ri
>        SQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
>      }
> 
>      {
>        UQRSHL_rr    1110101 0010 1 ....  ....  1111 0000 1101  @mve_sh_rr
>        LSLL_rr      1110101 0010 1 ... 0 .... ... 1 0000 1101  @mve_shl_rr
>        UQRSHLL64_rr 1110101 0010 1 ... 1 .... ... 1 0000 1101  @mve_shl_rr
>      }
> 
>      {
>        SQRSHR_rr    1110101 0010 1 ....  ....  1111 0010 1101  @mve_sh_rr
>        ASRL_rr      1110101 0010 1 ... 0 .... ... 1 0010 1101  @mve_shl_rr
>        SQRSHRL64_rr 1110101 0010 1 ... 1 .... ... 1 0010 1101  @mve_shl_rr
>      }
> 
>      UQRSHLL48_rr 1110101 0010 1 ... 1 ....  ... 1  1000 1101  @mve_shl_rr
>      SQRSHRL48_rr 1110101 0010 1 ... 1 ....  ... 1  1010 1101  @mve_shl_rr
>    ]
> 
>    MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
>    ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi
> 
>    # v8.1M CSEL and friends
>    CSEL           1110101 0010 1 rn:4 10 op:2 rd:4 fcond:4 rm:4
> }
> 
> 
> Unless you would prefer otherwise, I plan to put the adjusted patches
> into a pullreq later this week, without resending a v2.

This looks pretty clean, thanks.


r~

