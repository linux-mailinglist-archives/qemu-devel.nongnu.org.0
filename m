Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4943A3429
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:35:38 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQSn-0007hZ-RG
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQRv-0006ql-QI
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:34:43 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrQRt-0005xh-EA
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:34:43 -0400
Received: by mail-pf1-x433.google.com with SMTP id s14so2455820pfd.9
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PLV1lJxIrd/zU5Hs3B5njuLGEOX1odPFK5GQb7+WSXo=;
 b=oV5VMlqIBsPDFrMD0zwjG3yVrgux5LtOMzc2b0WdjteOjmR4TIR/dvi3a1S7cIrS4G
 UsLwaeoRmd8zGBJuMhf5XC5asQvEhIHrtQi/jcLWpzwP2yJNjoMFUjhmF8UaDGb/qZl8
 nDU9Q65sL///r4AAJtCKcM28Pi+h585L9bDWVee+fmL20onPhdHQhiU0JRIK0BJDJrWY
 jEd12rz3VO8PDd8diJnBRm1BtiVx1RsQ8E2w9KV1yTfRk+5KYji0t/WZmxNrjfMt5n+V
 UJMyBDQUA291FBIr96xcYXQ7dSP9yX1mb9nfsc4o96cNNojeVG6tQFMLQpI/QfA3mVgu
 yKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLV1lJxIrd/zU5Hs3B5njuLGEOX1odPFK5GQb7+WSXo=;
 b=OOYVoi5KsdJ8EYqM1q8yWdPVprKj1BaPSY6AgoLF33F5pzLpoGHk76lkuSnYBWC/dv
 IvGXg7W7lL+cft0CBW37Qz08P173sWMSj1qtxi3DLnk0WPLzDW+A/CpTHrH9ZE/nLeEF
 Okpk4njCye3HK8pPWZIPZ1Okhiqo84OwJRuDf4pYKPupdi0tK1adl95c1lZ979henqnN
 ed1qR55lN/k5qoirs9rEDls6noZzhxlQ2rRWScQErkuJslN9QbeMcgSfCDxwo5pBhxDn
 HkLyy13VuVG/R2e5Et9qAfHqzflyPS/59/tZt7z084wajKMPTuqrDEBhDEeKs0xdzDFr
 h6Aw==
X-Gm-Message-State: AOAM5316BVHqUCcbLpHlRLuQbGXJwR9J1VKxTTMmqpHyl43HzRBwDyF3
 D5wlfjTMjmea98sXxofGv2A6HpbMQ9xnZA==
X-Google-Smtp-Source: ABdhPJx8RKa097UYv+KW6G61DLXc57+Lfo7Y0Ve5o6uZ9qko9a6L7XSONH90RblRbh7XuQ/mJRO6xA==
X-Received: by 2002:aa7:8bca:0:b029:2e9:e0e5:f9f2 with SMTP id
 s10-20020aa78bca0000b02902e9e0e5f9f2mr4442257pfd.33.1623353679563; 
 Thu, 10 Jun 2021 12:34:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u14sm3056453pjx.14.2021.06.10.12.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 12:34:39 -0700 (PDT)
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
 <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
 <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d14a954-6301-c341-fa45-e07684b6f5ce@linaro.org>
Date: Thu, 10 Jun 2021 12:34:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 12:08 PM, Peter Maydell wrote:
> On Wed, 9 Jun 2021 at 21:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/7/21 9:58 AM, Peter Maydell wrote:
>>> +++ b/target/arm/mve.decode
>>> @@ -39,6 +39,8 @@
>>>    @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
>>>    @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
>>>    @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
>>> +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
>>> +     size=%size_28
>>
>> Move this back to VQDMULL[BT]_scalar, I think.
> 
> Why? VQDMULL[BT]_scalar uses an entirely different format
> (as a scalar it uses the &2scalar arg struct with an rm field
> for the gp register).

Oops, mis-read the @2op vs @2scalar.  Sorry.

r~


