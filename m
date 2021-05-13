Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89537F95B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:07:19 +0200 (CEST)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBzi-0006p7-5P
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhBuz-00022Y-TI
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:02:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhBuw-0002wL-5U
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:02:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id u133so3217178wmg.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8s0t0ZCUmaHiTBBcOhg86m7vSDmnaTD/y3VBkzP5R6E=;
 b=G0KdTBUywkGFEdgUCmTcSfIspfFnV1mRW6b23ztL9J08RAm0xqOT9koYD8dyb0e3Np
 glYlFL/P/Zq00F8rkQkf8gOWC1YtrGisNsc1bSJvOQQRHHLR4HbKZCf8tZYZCKQcT88s
 /9WWMyjU+ukim8eEi1SQ3dDfvOE8d+62MLZ//ahH3gpgjWoZ2ZLBOjApz/nTABsUVwA8
 Ek+C4gBCmcYYFK3ix07+U4W0+axfIcyt+qFQCVQ42ITicHZp1aRVHm/F6KpDCelNxOZ3
 HjoZOFQP2LB9iepMHA2flPcNLXAtw2Hq7RFiROZHQB9Dnhhxmw1YmAKjeVk0NaITn4IK
 qVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8s0t0ZCUmaHiTBBcOhg86m7vSDmnaTD/y3VBkzP5R6E=;
 b=d/ia5Aq0MKlIWC5gHRQ+wNQbZJH0CIGZdJUkKfIYd/f9kqtmMsHcpvO+1/Ak/WF23N
 n5qC9QiEa3ghAe7kENoAkpbL/yi+aJr1U5Nz6+8Oq69H/6MXdf/6C68RjjY032Zpka9e
 8vY+o00alBhcTqmnqIzGuzqhTmZ/K8zwUys7RLP4wyIptR2x8fxwydmWiVJti0ceVRmB
 /kE4ms3VGl/X7bfsoSBe3hgymPsBq517aCpoe41fyILLK58Vu7WZ5OeYO4NFsx9DbGYe
 ERsEa+6bA8UraTCvpWb+GO6fPaJXpXCB+GPqwK1OZzzhQlqCa76orJUqm87cR6w0j5lH
 J2HA==
X-Gm-Message-State: AOAM53121tMNrn6NLv2yE93EVP/ZguqL7ivKCVcIA8iMpS8UTFGhL2qp
 NauOlJGPBM5Xoi6OZgbYmP+AFQ==
X-Google-Smtp-Source: ABdhPJyK35rT6C1ivSVqy/vLvjCEcbI6S3fAA02hTMdXYGm9GQVbWW0tmxb7Rk2CvBU2LGA8WsyXEQ==
X-Received: by 2002:a05:600c:3644:: with SMTP id
 y4mr3981122wmq.132.1620914533617; 
 Thu, 13 May 2021 07:02:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p7sm2865238wrt.24.2021.05.13.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:02:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE91C1FF7E;
 Thu, 13 May 2021 15:02:11 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <878s4jg3hf.fsf@linaro.org>
 <d58df6e7-381d-9dfe-679c-60d5cbf61e73@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Thu, 13 May 2021 14:33:39 +0100
In-reply-to: <d58df6e7-381d-9dfe-679c-60d5cbf61e73@linaro.org>
Message-ID: <87o8delokc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/12/21 2:23 PM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Reorg everything using QEMU_GENERIC and multiple inclusion to
>>> reduce the amount of code duplication between the formats.
>>>
>>> The use of QEMU_GENERIC means that we need to use pointers instead
>>> of structures, which means that even the smaller float formats
>>> need rearranging.
>>>
>>> I've carried it through to completion within fpu/, so that we don't
>>> have (much) of the legacy code remaining.  There is some floatx80
>>> stuff in target/m68k and target/i386 that's still hanging around.
>> OK and here are some quad benchmarks. There is actual change above
>> the
>> noise but I think the biggest hit comes from the parts conversion but we
>> do claw some of it back:
>> * Run Quad Benchmarks
>> #+name: run-quad-float-benchmarks
>> #+begin_src sh :results output table append
>>    commit=3D$(git describe)
>>    add=3D$(./tests/fp/fp-bench add -p quad)
>>    mul=3D$(./tests/fp/fp-bench add -p quad)
>>    muladd=3D$(./tests/fp/fp-bench add -p quad)
>>    desc=3D$(git log --format=3D"format:%s" HEAD^..)
>>    echo "$commit,$add,$mul,$muladd,$desc"
>> #+end_src
>> #+RESULTS: run-quad-float-benchmarks
>> | pull-target-arm-20210510-1-91-g0fe775d52c  | 90.28 MFlops | 90.15 MFlo=
ps | 90.75 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-92-gf7a6dabee2  | 90.80 MFlops | 89.92 MFlo=
ps | 90.66 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-93-gdb71c9fd28  | 88.93 MFlops | 89.10 MFlo=
ps | 87.32 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-93-gdb71c9fd28  | 88.85 MFlops | 88.83 MFlo=
ps | 88.53 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-94-g900ea1f79d  | 87.10 MFlops | 88.02 MFlo=
ps | 88.22 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 88.11 MFlops | 87.10 MFlo=
ps | 87.48 MFlops | softfloat: Tidy a * b + inf return                     =
         |
>> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 87.27 MFlops | 84.86 MFlo=
ps | 87.99 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-95-gdb0bb2966f  | 87.56 MFlops | 88.31 MFlo=
ps | 88.41 MFlops | softfloat: Tidy a * b + inf return                     =
         |
>> | pull-target-arm-20210510-1-96-gec2be8ad0c  | 88.12 MFlops | 88.88 MFlo=
ps | 89.09 MFlops | softfloat: Add float_cmask and constants               =
         |
>> | pull-target-arm-20210510-1-97-g2328f560a1  | 91.18 MFlops | 91.84 MFlo=
ps | 91.30 MFlops | softfloat: Use return_nan in float_to_float            =
         |
>> | pull-target-arm-20210510-1-97-g2328f560a1  | 90.07 MFlops | 91.16 MFlo=
ps | 91.14 MFlops | softfloat: Use return_nan in float_to_float            =
         |
>> | pull-target-arm-20210510-1-98-g89e2096c6f  | 87.54 MFlops | 87.71 MFlo=
ps | 87.90 MFlops | softfloat: fix return_nan vs default_nan_mode          =
         |
>> | pull-target-arm-20210510-1-98-g89e2096c6f  | 87.57 MFlops | 83.80 MFlo=
ps | 85.95 MFlops | softfloat: fix return_nan vs default_nan_mode          =
         |
>> | pull-target-arm-20210510-1-99-g67ceccacea  | 89.29 MFlops | 87.46 MFlo=
ps | 87.40 MFlops | target/mips: Set set_default_nan_mode with set_snan_bit=
_is_one  |
>> | pull-target-arm-20210510-1-99-g67ceccacea  | 88.08 MFlops | 88.54 MFlo=
ps | 88.42 MFlops | target/mips: Set set_default_nan_mode with set_snan_bit=
_is_one  |
>> | pull-target-arm-20210510-1-100-g8064a6d9d9 | 92.41 MFlops | 91.85 MFlo=
ps | 92.37 MFlops | softfloat: Do not produce a default_nan from parts_sile=
nce_nan  |
>> | pull-target-arm-20210510-1-100-g8064a6d9d9 | 92.00 MFlops | 92.80 MFlo=
ps | 93.17 MFlops | softfloat: Do not produce a default_nan from parts_sile=
nce_nan  |
>> | pull-target-arm-20210510-1-101-gc303832ddb | 92.27 MFlops | 91.76 MFlo=
ps | 91.56 MFlops | softfloat: Rename FloatParts to FloatParts64           =
         |
>> | pull-target-arm-20210510-1-101-gc303832ddb | 92.64 MFlops | 92.73 MFlo=
ps | 92.54 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-110-g8c91cc4bfd | 94.34 MFlops | 93.50 MFlo=
ps | 94.00 MFlops | softfloat: Use pointers with parts_silence_nan         =
         |
>> | pull-target-arm-20210510-1-111-g039cab1333 | 94.72 MFlops | 95.36 MFlo=
ps | 94.67 MFlops | softfloat: Rearrange FloatParts64                      =
         |
>> | pull-target-arm-20210510-1-111-g039cab1333 | 94.55 MFlops | 94.99 MFlo=
ps | 95.13 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-111-g039cab1333 | 95.55 MFlops | 94.72 MFlo=
ps | 95.55 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-112-g5de6cec92b | 87.99 MFlops | 87.98 MFlo=
ps | 88.64 MFlops | softfloat: Convert float128_silence_nan to parts       =
         |
>> | pull-target-arm-20210510-1-112-g5de6cec92b | 87.20 MFlops | 88.26 MFlo=
ps | 88.04 MFlops | softfloat: Convert float128_silence_nan to parts       =
         |
>> | pull-target-arm-20210510-1-113-g6eb5e07c28 | 88.01 MFlops | 87.70 MFlo=
ps | 87.69 MFlops | softfloat: Convert float128_default_nan to parts       =
         |
>> | pull-target-arm-20210510-1-113-g6eb5e07c28 | 87.88 MFlops | 87.76 MFlo=
ps | 87.20 MFlops | softfloat: Convert float128_default_nan to parts       =
         |
>> | pull-target-arm-20210510-1-114-g7a4f7331e4 | 84.38 MFlops | 84.55 MFlo=
ps | 86.92 MFlops | softfloat: Move return_nan to softfloat-parts.c.inc    =
         |
>> | pull-target-arm-20210510-1-115-g08f1f1f3ed | 90.40 MFlops | 89.79 MFlo=
ps | 90.74 MFlops | softfloat: Move pick_nan to softfloat-parts.c.inc      =
         |
>> | pull-target-arm-20210510-1-115-g08f1f1f3ed | 90.74 MFlops | 90.11 MFlo=
ps | 90.59 MFlops | softfloat: Move pick_nan to softfloat-parts.c.inc      =
         |
>> | pull-target-arm-20210510-1-116-g474eb5be10 | 87.84 MFlops | 87.04 MFlo=
ps | 88.25 MFlops | softfloat: Move pick_nan_muladd to softfloat-parts.c.in=
c        |
>> | pull-target-arm-20210510-1-116-g474eb5be10 | 88.22 MFlops | 87.79 MFlo=
ps | 88.10 MFlops | softfloat: Move pick_nan_muladd to softfloat-parts.c.in=
c        |
>> | pull-target-arm-20210510-1-117-g096a466c23 | 86.37 MFlops | 85.32 MFlo=
ps | 86.22 MFlops | softfloat: Move sf_canonicalize to softfloat-parts.c.in=
c        |
>> | pull-target-arm-20210510-1-118-g973977719f | 85.41 MFlops | 84.75 MFlo=
ps | 83.47 MFlops | softfloat: Move round_canonical to softfloat-parts.c.in=
c        |
>> | pull-target-arm-20210510-1-119-g89c1fd4763 | 85.29 MFlops | 86.27 MFlo=
ps | 85.33 MFlops | softfloat: Use uadd64_carry/usub64_borrow in softfloat-=
macros.h |
>> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.61 MFlops | 86.24 MFlo=
ps | 86.60 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc =
         |
>> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.86 MFlops | 86.43 MFlo=
ps | 86.38 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-120-gfa24239a88 | 86.57 MFlops | 86.57 MFlo=
ps | 86.25 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-121-g15cf4c773a | 74.07 MFlops | 73.24 MFlo=
ps | 73.53 MFlops |                                                        =
         |
>
> If I'm reading your output properly, there should have been no change
> in the benchmarking through to this point, because all we have done so
> far is modify float64 and below.
>
> Thus there seems to be a *lot* of noise in your numbers.

That's why some of the passes were run multiple times. Although the
results are sorted in commit order I did 3 separate passes through the
code when I was gathering the numbers. However you are right to say they
are indicative rather than strict benchmarking conditions - I've just
re-run on 3 commits:

  #+RESULTS: run-quad-float-benchmarks
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 80.97 MFlops | 84.22 MFlops=
 | 81.71 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 82.51 MFlops | 79.53 MFlops=
 | 84.27 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 84.36 MFlops | 85.77 MFlops=
 | 81.84 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 85.28 MFlops | 84.05 MFlops=
 | 87.40 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 85.27 MFlops | 87.66 MFlops=
 | 85.53 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 85.23 MFlops | 87.64 MFlops=
 | 87.05 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 86.19 MFlops | 85.73 MFlops=
 | 85.61 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 85.04 MFlops | 85.36 MFlops=
 | 86.28 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 86.00 MFlops | 86.65 MFlops=
 | 88.30 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 86.94 MFlops | 88.36 MFlops=
 | 86.94 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 86.62 MFlops | 88.44 MFlops=
 | 87.74 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 87.42 MFlops | 87.89 MFlops=
 | 87.85 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 86.87 MFlops | 88.31 MFlops=
 | 87.30 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 88.00 MFlops | 88.12 MFlops=
 | 88.63 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 88.16 MFlops | 87.84 MFlops=
 | 86.42 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 88.35 MFlops | 86.78 MFlops=
 | 88.01 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 87.76 MFlops | 88.01 MFlops=
 | 88.02 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-95-gdb0bb2966f | 88.46 MFlops | 88.10 MFlops=
 | 87.95 MFlops | softfloat: Tidy a * b + inf return          |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 83.80 MFlops | 88.45 MFlops=
 | 87.70 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 88.30 MFlops | 88.55 MFlops=
 | 88.42 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 87.96 MFlops | 86.73 MFlops=
 | 88.58 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 87.23 MFlops | 87.42 MFlops=
 | 88.14 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 87.41 MFlops | 87.75 MFlops=
 | 88.26 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 88.28 MFlops | 88.39 MFlops=
 | 87.51 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 86.68 MFlops | 88.43 MFlops=
 | 88.23 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 86.87 MFlops | 88.04 MFlops=
 | 87.93 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 86.60 MFlops | 88.19 MFlops=
 | 87.46 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 88.58 MFlops | 88.18 MFlops=
 | 88.27 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 86.85 MFlops | 88.73 MFlops=
 | 88.37 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-96-gec2be8ad0c | 87.25 MFlops | 88.70 MFlops=
 | 88.04 MFlops | softfloat: Add float_cmask and constants    |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 89.23 MFlops | 90.74 MFlops=
 | 91.03 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 90.40 MFlops | 90.79 MFlops=
 | 91.23 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 91.19 MFlops | 91.13 MFlops=
 | 90.99 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 91.06 MFlops | 91.38 MFlops=
 | 90.86 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 89.91 MFlops | 89.57 MFlops=
 | 91.09 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 91.30 MFlops | 91.65 MFlops=
 | 91.64 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 90.62 MFlops | 91.00 MFlops=
 | 91.35 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 91.38 MFlops | 91.55 MFlops=
 | 90.80 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 90.64 MFlops | 91.50 MFlops=
 | 88.21 MFlops | softfloat: Use return_nan in float_to_float |
  | pull-target-arm-20210510-1-97-g2328f560a1 | 90.13 MFlops | 91.20 MFlops=
 | 91.16 MFlops | softfloat: Use return_nan in float_to_float |

So while the first commit showed a nearly 10% variation over multiple
runs (cache effects?) I think the step between float_cmask and
return_nan is more real.

I wonder if it would be worth tweaking the fp-bench program to make the
numbers a bit more stable? For total execution time runs I use hyperfine
which does at least try and measure the deviation between runs and trend
to a stable number but these numbers are reported directly by the
fp-bench tool.

>
>> | pull-target-arm-20210510-1-121-g15cf4c773a | 73.44 MFlops | 73.52 MFlo=
ps | 73.86 MFlops | softfloat: Implement float128_add/sub via parts        =
         |
>
> This is where I would have expected a hit to the first column, and no
> change to the other two.

The effect looks very real:

  #+RESULTS: run-quad-float-benchmarks
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.32 MFlops | 82.89 MFlop=
s | 85.81 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.31 MFlops | 85.83 MFlop=
s | 85.26 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.89 MFlops | 86.99 MFlop=
s | 86.57 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 83.82 MFlops | 85.01 MFlop=
s | 85.83 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.51 MFlops | 84.93 MFlop=
s | 86.27 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.90 MFlops | 85.15 MFlop=
s | 85.42 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 83.39 MFlops | 85.73 MFlop=
s | 85.28 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.03 MFlops | 85.73 MFlop=
s | 84.60 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.38 MFlops | 85.18 MFlop=
s | 86.69 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 84.01 MFlops | 84.48 MFlop=
s | 85.49 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.56 MFlops | 84.50 MFlop=
s | 85.12 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.27 MFlops | 85.39 MFlop=
s | 85.23 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.14 MFlops | 71.95 MFlop=
s | 72.78 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.70 MFlops | 71.64 MFlop=
s | 73.36 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.26 MFlops | 73.44 MFlop=
s | 72.86 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.95 MFlops | 72.24 MFlop=
s | 72.26 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.00 MFlops | 72.78 MFlop=
s | 72.92 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.10 MFlops | 73.36 MFlop=
s | 72.71 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.23 MFlops | 72.76 MFlop=
s | 73.48 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 71.91 MFlops | 71.54 MFlop=
s | 73.01 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.08 MFlops | 73.75 MFlop=
s | 72.17 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.21 MFlops | 73.69 MFlop=
s | 72.65 MFlops | softfloat: Implement float128_add/sub via parts        |

I wonder if it is an effect of greater code re-organisation affecting
cache lines or some other residency if the other functions?=20

>
>> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.38 MFlops | 73.01 MFlo=
ps | 72.94 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    =
         |
>> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.41 MFlops | 72.32 MFlo=
ps | 73.64 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.88 MFlops | 73.51 MFlo=
ps | 73.36 MFlops |                                                        =
         |
>> | pull-target-arm-20210510-1-123-g88e1635abf | 69.04 MFlops | 69.33 MFlo=
ps | 69.51 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc =
         |
>
> Now add and mul columns are going down when the only change is to
> muladd?  Is this just more noise?

Running again more times I think it is a real effect:

  #+RESULTS: run-quad-float-benchmarks
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.99 MFlops | 84.44 MFlop=
s | 85.98 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 86.77 MFlops | 85.99 MFlop=
s | 85.02 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 87.07 MFlops | 86.22 MFlop=
s | 85.65 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 84.49 MFlops | 85.94 MFlop=
s | 85.49 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.75 MFlops | 85.05 MFlop=
s | 85.65 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.51 MFlops | 86.55 MFlop=
s | 84.26 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-120-gfa24239a88 | 85.68 MFlops | 86.39 MFlop=
s | 85.05 MFlops | softfloat: Move addsub_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 71.73 MFlops | 72.85 MFlop=
s | 73.68 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.32 MFlops | 72.05 MFlop=
s | 72.44 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.03 MFlops | 73.92 MFlop=
s | 72.03 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 71.59 MFlops | 73.25 MFlop=
s | 72.97 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.23 MFlops | 73.55 MFlop=
s | 73.47 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.59 MFlops | 73.03 MFlop=
s | 72.76 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.60 MFlops | 71.20 MFlop=
s | 73.73 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.91 MFlops | 73.22 MFlop=
s | 72.98 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.27 MFlops | 70.69 MFlop=
s | 72.62 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.04 MFlops | 73.35 MFlop=
s | 73.13 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.74 MFlops | 71.59 MFlop=
s | 72.33 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.20 MFlops | 73.35 MFlop=
s | 72.61 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.72 MFlops | 72.79 MFlop=
s | 73.29 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.97 MFlops | 73.58 MFlop=
s | 72.72 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.73 MFlops | 73.20 MFlop=
s | 72.74 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.42 MFlops | 73.61 MFlop=
s | 73.37 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.88 MFlops | 73.36 MFlop=
s | 73.55 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.06 MFlops | 72.64 MFlop=
s | 72.75 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 73.78 MFlops | 73.31 MFlop=
s | 73.97 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.78 MFlops | 73.68 MFlop=
s | 73.65 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.58 MFlops | 73.01 MFlop=
s | 72.94 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-121-g15cf4c773a | 72.48 MFlops | 71.77 MFlop=
s | 73.38 MFlops | softfloat: Implement float128_add/sub via parts        |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 72.23 MFlops | 73.22 MFlop=
s | 73.23 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 72.84 MFlops | 72.80 MFlop=
s | 73.42 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.24 MFlops | 72.20 MFlop=
s | 73.68 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 71.59 MFlops | 72.49 MFlop=
s | 73.79 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.66 MFlops | 72.63 MFlop=
s | 73.41 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.40 MFlops | 73.51 MFlop=
s | 73.38 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.47 MFlops | 73.80 MFlop=
s | 73.07 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 73.41 MFlops | 73.78 MFlop=
s | 73.10 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-122-gc07a5fec10 | 72.38 MFlops | 72.54 MFlop=
s | 72.09 MFlops | softfloat: Move mul_floats to softfloat-parts.c.inc    |
  | pull-target-arm-20210510-1-123-g88e1635abf | 68.45 MFlops | 67.83 MFlop=
s | 66.24 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.52 MFlops | 68.83 MFlop=
s | 69.40 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.39 MFlops | 68.94 MFlop=
s | 69.41 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 68.71 MFlops | 69.38 MFlop=
s | 69.78 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.51 MFlops | 69.38 MFlop=
s | 68.44 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.77 MFlops | 69.53 MFlop=
s | 69.12 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.42 MFlops | 69.54 MFlop=
s | 69.72 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 68.03 MFlops | 69.33 MFlop=
s | 68.57 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |
  | pull-target-arm-20210510-1-123-g88e1635abf | 69.48 MFlops | 69.07 MFlop=
s | 69.68 MFlops | softfloat: Move muladd_floats to softfloat-parts.c.inc |

--=20
Alex Benn=C3=A9e

