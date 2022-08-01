Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AB586C3B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:48:52 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVmt-0006NE-AJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIVTk-0007EW-44
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:29:04 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIVTe-0001h8-Uu
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:29:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso11996864pjd.3
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FNgzdx8HHLJ3eTxILQhs93Eos9HeLEZHI8S+aRN3TE0=;
 b=aoy8LinULlCGiXcTrf5XxEQclDRXqS9eeXBWASQkkGVtzbPdRcYsbWEPD5HipqzwDL
 fCW+y9AHAyJrrCoV4q7ZozEkm/SwCIOgKGiejr4WDyiXmnmySy6VCO4RBb0Pa/hslns7
 aiyiHdgAJNFcuN2/TLCEqlpHvV2JRPCTFsj3t7lcxUMwi6EiYJctaLnGn1gdTAiPqF9G
 cXv3XjmFa9PVkcal2varCnYx+7jC0FE2UcS9jG1EKJD5Iki//PEUVFS8l0kbVbMkS+Sk
 eZHZO//gQe8DB95jYuV/KcfFs/yHRX/LrlTiy4RMHxkiqAUMjzb550oITqvgH055OLb0
 YY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FNgzdx8HHLJ3eTxILQhs93Eos9HeLEZHI8S+aRN3TE0=;
 b=vVb7xlxohuH/o51YabmF/z9efF9FVqqFuyW2bFrrGq8W6oV7+3FPC9Dh5D3ne7yuxZ
 y+Zq4Fd3nYab/ZRASQoEkP1zFaREXLJCHkl98PUpNKTFD+wJpNqo/hcQMm4nS7tRfhWU
 RHt4UaT6FowtdA06MtN/pgCc2IhOyuhPJhyC+BNnLbXZiC4cLEIyyyOlO5XXoNNOTecB
 2S25d8IdkRsYqpVxGVSaWnH5+taDT/6B95kLtBQPE4Ub8QOtdK8OUaBlQEbHcWD4LQDD
 RV7TIzhvQURNRoc4lhSAxqSZ9c1LdkpdJBT5XYzhIIhfw1xRlrWNeUQY1DH4/XUWjJI7
 QaKw==
X-Gm-Message-State: ACgBeo3aZtV9KEcBOuqcRpzfj9p7XDd6z4e6HCo4umEMk0YSo8UB5lVg
 pTOdrgtME1umqESTnlVVS+lylw==
X-Google-Smtp-Source: AA6agR4GYyyRlRbkVHnEHR4Pib4Tym3at3UOOuigsPGyUh9EGhnO0q4NQ1ikV8mnw+L5PfVJ+SdoXA==
X-Received: by 2002:a17:90b:1bc7:b0:1f3:366d:5006 with SMTP id
 oa7-20020a17090b1bc700b001f3366d5006mr18023186pjb.116.1659360537323; 
 Mon, 01 Aug 2022 06:28:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 f34-20020a17090a702500b001f254ec83aesm11397828pjk.38.2022.08.01.06.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 06:28:56 -0700 (PDT)
Message-ID: <5617e764-7e27-ff78-a712-3fd002409c82@linaro.org>
Date: Mon, 1 Aug 2022 06:28:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] Hexagon bug fixes and test improvements
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, peter.maydell@linaro.org
References: <20220731233232.2473-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220731233232.2473-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/31/22 16:32, Taylor Simpson wrote:
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/quic/qemu tags/pull-hex-20220731
> 
> for you to fetch changes up to 7eabb050ea77e529f549ea1ddaaa18e91ae01e34:
> 
>    Hexagon (tests/tcg/hexagon) reference file for float_convd (2022-07-31 16:22:09 -0700)
> 
> ----------------------------------------------------------------
> Hexagon bug fixes and test improvements
> 
> 1) Fixes a bug in qemu-hexagon
> 2) Fixes a bug in a test case
> 3) Adds reference file for float_convd test case

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Taylor Simpson (3):
>        Hexagon (target/hexagon) make VyV operands use a unique temp
>        Hexagon (tests/tcg/hexagon) Fix alignment in load_unpack.c
>        Hexagon (tests/tcg/hexagon) reference file for float_convd
> 
>   tests/tcg/hexagon/hvx_misc.c      |  45 ++
>   tests/tcg/hexagon/load_unpack.c   |  14 +-
>   target/hexagon/gen_tcg_funcs.py   |   9 +-
>   tests/tcg/hexagon/float_convd.ref | 988 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 1044 insertions(+), 12 deletions(-)
>   create mode 100644 tests/tcg/hexagon/float_convd.ref


