Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B337F737
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:54:48 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9vT-0007to-5f
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9qU-00014N-RK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:49:38 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9qS-0008Dn-DW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:49:38 -0400
Received: by mail-qt1-x829.google.com with SMTP id h21so15730866qtu.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+6DGYDkTvyD7UrgWoVHsYes11GnK0eDQiH4d7P6LfY=;
 b=o1clH639ln10Je1o9WQiLTBjwU+Z2F5YAAN4Rj+naqIiJDawYGZT+oEmSMzrZ7EmBQ
 gmI1xlHNTaLpxoz1eo7Hz1yktd9BndBCwqmFWGiq6j0vQF7ojGaWeaEZEkAx5VkEA4Va
 8pVUufTfwYDqpwTbmwyHPNABSnDPTvHLSPDBnGBlS3yBzLmwFO05+QKd1YZ40Te6JJDC
 aLHRurOA1eDPICsBHWZyeAGCskm/HduvCQpR8v2RN4dqeqkh4am5yBszbZvWKY5IIk1F
 C6xsZ+3DK71DV/DMKDtbFWnaUmneUl+N67h4bVXiSUPggJqww3t3yGrlereANrxv6JjY
 NLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+6DGYDkTvyD7UrgWoVHsYes11GnK0eDQiH4d7P6LfY=;
 b=Hmpk7eg8qzs00tn0JY1sLkeC+OFr3OL0J0LHYgo9j1tvDzUOQKeS/geCioeswB8mzW
 dJkKHXMlrvLIcC79pMLa58Oq3LoFSxS3IesCZm4ZvhQ/gC1bYfm9923bO9yPo5KO6/HF
 BLTYOjQNA4r+0Ide6t5vT0Jar8cDf2/ShjutoiPitKp0bN9jJq+RuMgLy+bEgCkNPBmj
 jevzSN1piS6Y1H4vyl50yDQgjhnatAScLBZ0dQX2uI24Z4mLKXbmJ8kyGl36qyT5Uq19
 HSU41f8IDmRQ6XFQYLMqWxKUgTRh7j8mDYZIZAEW+LENLbGD5CiF2yJZEioFMZ/8f53q
 e0YQ==
X-Gm-Message-State: AOAM531+nKeSI0VyF0T8VU4yMVPbGfUIm68flu6KSnLLY76H3+04gh+S
 UwBaCaKjY4NirRX+ABQ+RX+B8w==
X-Google-Smtp-Source: ABdhPJydeJsmklGpglvEnoO6h9a3zAGWiHWtTJOVKnodAWTjwdJ6t9aFl3pHfYUs3vhx4EnJOV6zsw==
X-Received: by 2002:ac8:5fd5:: with SMTP id k21mr34574095qta.231.1620906575326; 
 Thu, 13 May 2021 04:49:35 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id i10sm2205782qko.68.2021.05.13.04.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:49:35 -0700 (PDT)
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <878s4jg3hf.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d58df6e7-381d-9dfe-679c-60d5cbf61e73@linaro.org>
Date: Thu, 13 May 2021 06:49:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <878s4jg3hf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 2:23 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Reorg everything using QEMU_GENERIC and multiple inclusion to
>> reduce the amount of code duplication between the formats.
>>
>> The use of QEMU_GENERIC means that we need to use pointers instead
>> of structures, which means that even the smaller float formats
>> need rearranging.
>>
>> I've carried it through to completion within fpu/, so that we don't
>> have (much) of the legacy code remaining.  There is some floatx80
>> stuff in target/m68k and target/i386 that's still hanging around.
> 
> OK and here are some quad benchmarks. There is actual change above the
> noise but I think the biggest hit comes from the parts conversion but we
> do claw some of it back:
> 
> * Run Quad Benchmarks
> 
> #+name: run-quad-float-benchmarks
> #+begin_src sh :results output table append
>    commit=$(git describe)
>    add=$(./tests/fp/fp-bench add -p quad)
>    mul=$(./tests/fp/fp-bench add -p quad)
>    muladd=$(./tests/fp/fp-bench add -p quad)
>    desc=$(git log --format="format:%s" HEAD^..)
>    echo "$commit,$add,$mul,$muladd,$desc"
> #+end_src
> 
> #+RESULTS: run-quad-float-benchmarks
> | pull-target-arm-20210510-1-91-g0fe775d52c  | 90.28 MFlops | 90.15 MFlops | 90.75 MFlops |                                                                 |
> | pull-target-arm-20210510-1-92-gf7a6dabee2  | 90.80 MFlops | 89.92 MFlops | 90.66 MFlops |                                                                 |
> | pull-target-arm-20210510-1-93-gdb71c9fd28  | 88.93 MFlops | 89.10 MFlops | 87.32 MFlops |                                                                 |
> | pull-target-arm-20210510-1-93-gdb71c9fd28  | 88.85 MFlops | 88.83 MFlops | 88.53 MFlops |                                                                 |
> | pull-target-arm-20210510-1-94-g900ea1f79d  | 87.10 MFlops | 88.02 MFlops | 88.22 MFlops |                                                                 |
> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 88.11 MFlops | 87.10 MFlops | 87.48 MFlops | softfloat: Tidy a * b + inf return                              |
> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 87.27 MFlops | 84.86 MFlops | 87.99 MFlops |                                                                 |
> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 87.56 MFlops | 88.31 MFlops | 88.41 MFlops | softfloat: Tidy a * b + inf return                              |
> | pull-target-arm-20210510-1-96-gec2be8ad0c  | 88.12 MFlops | 88.88 MFlops | 89.09 MFlops | softfloat: Add float_cmask and constants                        |
> | pull-target-arm-20210510-1-97-g2328f560a1  | 91.18 MFlops | 91.84 MFlops | 91.30 MFlops | softfloat: Use return_nan in float_to_float                     |
> | pull-target-arm-20210510-1-97-g2328f560a1  | 90.07 MFlops | 91.16 MFlops | 91.14 MFlops | softfloat: Use return_nan in float_to_float                     |
> | pull-target-arm-20210510-1-98-g89e2096c6f  | 87.54 MFlops | 87.71 MFlops | 87.90 MFlops | softfloat: fix return_nan vs default_nan_mode                   |
> | pull-target-arm-20210510-1-98-g89e2096c6f  | 87.57 MFlops | 83.80 MFlops | 85.95 MFlops | softfloat: fix return_nan vs default_nan_mode                   |
> | pull-target-arm-20210510-1-99-g67ceccacea  | 89.29 MFlops | 87.46 MFlops | 87.40 MFlops | target/mips: Set set_default_nan_mode with set_snan_bit_is_one  |
> | pull-target-arm-20210510-1-99-g67ceccacea  | 88.08 MFlops | 88.54 MFlops | 88.42 MFlops | target/mips: Set set_default_nan_mode with set_snan_bit_is_one  |
> | pull-target-arm-20210510-1-100-g8064a6d9d9 | 92.41 MFlops | 91.85 MFlops | 92.37 MFlops | softfloat: Do not produce a default_nan from parts_silence_nan  |
> | pull-target-arm-20210510-1-100-g8064a6d9d9 | 92.00 MFlops | 92.80 MFlops | 93.17 MFlops | softfloat: Do not produce a default_nan from parts_silence_nan  |
> | pull-target-arm-20210510-1-101-gc303832ddb | 92.27 MFlops | 91.76 MFlops | 91.56 MFlops | softfloat: Rename FloatParts to FloatParts64                    |
> | pull-target-arm-20210510-1-101-gc303832ddb | 92.64 MFlops | 92.73 MFlops | 92.54 MFlops |                                                                 |
> | pull-target-arm-20210510-1-110-g8c91cc4bfd | 94.34 MFlops | 93.50 MFlops | 94.00 MFlops | softfloat: Use pointers with parts_silence_nan                  |
> | pull-target-arm-20210510-1-111-g039cab1333 | 94.72 MFlops | 95.36 MFlops | 94.67 MFlops | softfloat: Rearrange FloatParts64                               |
> | pull-target-arm-20210510-1-111-g039cab1333 | 94.55 MFlops | 94.99 MFlops | 95.13 MFlops |                                                                 |
> | pull-target-arm-20210510-1-111-g039cab1333 | 95.55 MFlops | 94.72 MFlops | 95.55 MFlops |                                                                 |
> | pull-target-arm-20210510-1-112-g5de6cec92b | 87.99 MFlops | 87.98 MFlops | 88.64 MFlops | softfloat: Convert float128_silence_nan to parts                |
> | pull-target-arm-20210510-1-112-g5de6cec92b | 87.20 MFlops | 88.26 MFlops | 88.04 MFlops | softfloat: Convert float128_silence_nan to parts                |
> | pull-target-arm-20210510-1-113-g6eb5e07c28 | 88.01 MFlops | 87.70 MFlops | 87.69 MFlops | softfloat: Convert float128_default_nan to parts                |
> | pull-target-arm-20210510-1-113-g6eb5e07c28 | 87.88 MFlops | 87.76 MFlops | 87.20 MFlops | softfloat: Convert float128_default_nan to parts                |
> | pull-target-arm-20210510-1-114-g7a4f7331e4 | 84.38 MFlops | 84.55 MFlops | 86.92 MFlops | softfloat: Move return_nan to softfloat-parts.c.inc             |
> | pull-target-arm-20210510-1-115-g08f1f1f3ed | 90.40 MFlops | 89.79 MFlops | 90.74 MFlops | softfloat: Move pick_nan to softfloat-parts.c.inc               |
> | pull-target-arm-20210510-1-115-g08f1f1f3ed | 90.74 MFlops | 90.11 MFlops | 90.59 MFlops | softfloat: Move pick_nan to softfloat-parts.c.inc               |
> | pull-target-arm-20210510-1-116-g474eb5be10 | 87.84 MFlops | 87.04 MFlops | 88.25 MFlops | softfloat: Move pick_nan_muladd to softfloat-parts.c.inc        |
> | pull-target-arm-20210510-1-116-g474eb5be10 | 88.22 MFlops | 87.79 MFlops | 88.10 MFlops | softfloat: Move pick_nan_muladd to softfloat-parts.c.inc        |
> | pull-target-arm-20210510-1-117-g096a466c23 | 86.37 MFlops | 85.32 MFlops | 86.22 MFlops | softfloat: Move sf_canonicalize to softfloat-parts.c.inc        |
> | pull-target-arm-20210510-1-118-g973977719f | 85.41 MFlops | 84.75 MFlops | 83.47 MFlops | softfloat: Move round_canonical to softfloat-parts.c.inc        |
> | pull-target-arm-20210510-1-119-g89c1fd4763 | 85.29 MFlops | 86.27 MFlops | 85.33 MFlops | softfloat: Use uadd64_carry/usub64_borrow in softfloat-macros.h |
> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.61 MFlops | 86.24 MFlops | 86.60 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc          |
> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.86 MFlops | 86.43 MFlops | 86.38 MFlops |                                                                 |
> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.57 MFlops | 86.57 MFlops | 86.25 MFlops |                                                                 |
> | pull-target-arm-20210510-1-121-g15cf4c773a | 74.07 MFlops | 73.24 MFlops | 73.53 MFlops |                                                                 |

If I'm reading your output properly, there should have been no change in the 
benchmarking through to this point, because all we have done so far is modify 
float64 and below.

Thus there seems to be a *lot* of noise in your numbers.

> | pull-target-arm-20210510-1-121-g15cf4c773a | 73.44 MFlops | 73.52 MFlops | 73.86 MFlops | softfloat: Implement float128_add/sub via parts                 |

This is where I would have expected a hit to the first column, and no change to 
the other two.

> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.38 MFlops | 73.01 MFlops | 72.94 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc             |
> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.41 MFlops | 72.32 MFlops | 73.64 MFlops |                                                                 |
> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.88 MFlops | 73.51 MFlops | 73.36 MFlops |                                                                 |
> | pull-target-arm-20210510-1-123-g88e1635abf | 69.04 MFlops | 69.33 MFlops | 69.51 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc          |

Now add and mul columns are going down when the only change is to muladd?  Is 
this just more noise?

> | pull-target-arm-20210510-1-123-g88e1635abf | 69.84 MFlops | 70.15 MFlops | 69.46 MFlops |                                                                 |
> | pull-target-arm-20210510-1-123-g88e1635abf | 69.66 MFlops | 69.67 MFlops | 69.05 MFlops |                                                                 |
> | pull-target-arm-20210510-1-124-g449de2f64c | 69.26 MFlops | 67.87 MFlops | 68.56 MFlops | softfloat: Use mulu64 for mul64To128                            |
> | pull-target-arm-20210510-1-125-gd87617480b | 68.43 MFlops | 69.05 MFlops | 69.27 MFlops | softfloat: Use add192 in mul128To256                            |
> | pull-target-arm-20210510-1-126-gd030713711 | 69.08 MFlops | 68.88 MFlops | 69.32 MFlops | softfloat: Tidy mul128By64To192                                 |
> | pull-target-arm-20210510-1-127-gcb1a047f33 | 75.77 MFlops | 75.26 MFlops | 75.56 MFlops | softfloat: Introduce sh[lr]_double primitives                   |
> | pull-target-arm-20210510-1-140-g0bd7f06cb0 | 72.07 MFlops | 71.54 MFlops | 71.55 MFlops | softfloat: Split out parts_uncanon_normal                       |
> | pull-target-arm-20210510-1-141-g4ccbd2edf1 | 72.45 MFlops | 71.55 MFlops | 71.79 MFlops | softfloat: Reduce FloatFmt                                      |
> | pull-target-arm-20210510-1-159-g97028a57bb | 74.87 MFlops | 75.75 MFlops | 75.69 MFlops |                                                                 |
> | pull-target-arm-20210510-1-159-g97028a57bb | 73.34 MFlops | 73.42 MFlops | 72.93 MFlops | tests/fp: enable more tests                                     |
> | pull-target-arm-20210510-1-159-g97028a57bb | 75.61 MFlops | 75.72 MFlops | 75.30 MFlops |                                                                 |
> 
> 

r~

