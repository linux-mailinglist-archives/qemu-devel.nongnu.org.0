Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B457A65E185
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 01:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDE60-0001OS-9r; Wed, 04 Jan 2023 19:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDE5x-0001O5-U7
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 19:26:57 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDE5w-0002iz-4Q
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 19:26:57 -0500
Received: by mail-pf1-x432.google.com with SMTP id z7so18495885pfq.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pF/m30tAitVZyDPKO65mkYL1HYp15aPSoS1hvUnFSjs=;
 b=U5tztxSogNFMAoU/TxkaN+vC+iMr9B4lPnUsFXjx5FsSXY21xPtAna5rC8OZ7KMXo+
 i1hUjGBIjN9Kt6FsmaxE3zrblLrguFf4CS4lwoTJ/MP7kZttXriWXxECaYdTnOqbOtiQ
 lCePylETags37tP3QDKsS+rL6iFIEZyRY9oT4E9/9RLr9hr0W8GrMoH54HHld4k011IW
 bJdW6rNqHU4vm6Dn3f5C7WiENV3SZSvKkjUDe0l11zFYXrYbId1h3G4EP0+/FlFaLYIG
 gFfJBPd3mtxXNFFw2OY+IVSNJOsLxBUTwkkqmOg0fhu8Z4JM4mpFEjU/zRo5YyYB01Jr
 Go6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pF/m30tAitVZyDPKO65mkYL1HYp15aPSoS1hvUnFSjs=;
 b=xcXCkfk5znaxF42wElRZQ0Y2k05te93XDkg18lNmGMfOEcGO80H/Rrt2YJFLKWDERU
 YkHZ3ghUDNhCDa+fPXEUzw4Nc8tnp+d2wXCAq08IrnsH+M7Yt6mOazdB0MaRzgCpBkdH
 2ZXAqxAz8r5rZGeJsd0wxQTZ8jkVnUpW7MlCuXz1lALsqAOszERrSmLAbgk2yWgScVmQ
 1Jdso8ifGNl0vBMzPJt0m+lKbltbMX2JbaolLtVbcrPCObBkC6XfYkTVI3N0AqzgNmcq
 fhImGwkzkk8RNJ8ErxM5tHIJVq39lhUoyYewXeBsu6nuLuSQLOWGCWyZqUG/Y0eC4CSa
 DQlw==
X-Gm-Message-State: AFqh2krDZTi0USDWDLTMuCC6eysflNesNHbXO+Uv4XvUxXZCw5jzuGb+
 7ATsnw8LNsL90AgHU643kOcCTF1tRvtjjKVK
X-Google-Smtp-Source: AMrXdXv5O5QtmYXTlgD0s97hDJp8fXbwBD3NlM15OCb7dFUaphr6ZDn2pN/j2/sokJIvhF+s2FanVA==
X-Received: by 2002:aa7:90d1:0:b0:572:6d6b:2297 with SMTP id
 k17-20020aa790d1000000b005726d6b2297mr44044233pfk.21.1672878414341; 
 Wed, 04 Jan 2023 16:26:54 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 w207-20020a627bd8000000b005809d382016sm18771213pfc.74.2023.01.04.16.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 16:26:53 -0800 (PST)
Message-ID: <3a43a0d5-acc3-cdec-4328-57fde042cfb0@linaro.org>
Date: Wed, 4 Jan 2023 16:26:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 47/47] tests/tcg/multiarch: add vma-pthread.c
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
 <20221230000221.2764875-48-richard.henderson@linaro.org>
In-Reply-To: <20221230000221.2764875-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 12/29/22 16:02, Richard Henderson wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Add a test that locklessly changes and exercises page protection bits
> from various threads. This helps catch race conditions in the VMA
> handling.
> 
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/multiarch/nop_func.h       |  25 ++++
>   tests/tcg/multiarch/munmap-pthread.c |  16 +--
>   tests/tcg/multiarch/vma-pthread.c    | 207 +++++++++++++++++++++++++++
>   tests/tcg/multiarch/Makefile.target  |   3 +
>   4 files changed, 236 insertions(+), 15 deletions(-)
>   create mode 100644 tests/tcg/multiarch/nop_func.h
>   create mode 100644 tests/tcg/multiarch/vma-pthread.c

Hi Peter,

 From the failures I see on the gitlab merge job, I think I need to resubmit with this new 
test adjusted to loop less,

> +    for (i = 0; i < 50000; i++) {

here.

The failing jobs are --enable-debug, and take about 115 seconds to run manually on our 
aarch64 test host, exceeding the 90 second timeout.

I'll cut this down to 10000 loops and double-check times before resubmitting.


r~

