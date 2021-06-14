Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B63A6FC3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:02:02 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssmX-0003Jo-Dc
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssl5-0002Lh-EJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:00:32 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssl3-0005u1-IH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:00:31 -0400
Received: by mail-pl1-x632.google.com with SMTP id e1so7185048plh.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=91gmc55nyUh241BOE+IqKVqKo7V1obEe0tdTmtw7HAQ=;
 b=kM31f1jBazg95oaVtqi2NcfYDfeMeLJJzSig/tzrMwlfb8fAygC/mTSZzrkPHFXJaA
 SMVo4BbOc2jzqROBlyi/9w1shs/jGjghvvaXXdAUh+L3R7TQH2Y5UzPdVd7ZzrhLkON2
 NIsPR+Od10uqqPoERQALqtVyZsNJLdJ9NOjuWBLzyejqy6LX0sAB3wbQSYVCjBgAqy9Z
 ARfptxOlOfTzN4leBExPKRR0E8YCRjuFnLT0vsiPVyDltTyZNwKW43mo50TjQmKZkZIt
 Z2okzrwcdWiTy/17Xjj/bmcRrLzKfJoRaH98MiHeUTlGC3+FDydO29GDl7rrovoCzcEM
 wj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=91gmc55nyUh241BOE+IqKVqKo7V1obEe0tdTmtw7HAQ=;
 b=RFBHykHFj2gURQZ6UVHdtOCYcEwUFtIfcVaJVIsnyfzWgWcZNnX4ea3SS35VhXltug
 +AYnJ0yqIN4takzyC6hwWSUPjhr8oXaDa99hIcFvSRe7CUYE0ISzRqWgTWhxx0Tv0dld
 U/BMCeFZd8V+TIINPrb82ZVzadOFRbL66+VqRxt5n719GQlNfLi3Nkn0gGZv0C8ATC8P
 vhvulYG1gZRPpu48N3Et0XHlI4WkVF6+2NDLCS/blDiamYNMmxDSOrgGPU+osMKsM32x
 BBeu6xgn6jsOFToxoI//K5irfyLP5AvExktKId+dADk3k3LIt1vP00Xgqi9ZZYkQWkK5
 267w==
X-Gm-Message-State: AOAM532BQ0ksx0GBBiVf34EVFIyVxgAe46PL8DX9LUHnjA7AX8MZ+LEG
 NBKpgn0mZVoBSyQ6es/8h+vI/WV5nYqa8g==
X-Google-Smtp-Source: ABdhPJygVPyJ5ssshIJB7+HwCM1LLmoTSbzXZAqHNCJeOg9sIdWwOX7LOkdvtCaEkr55TIzd8Tih/Q==
X-Received: by 2002:a17:90a:398f:: with SMTP id
 z15mr20846769pjb.183.1623700827609; 
 Mon, 14 Jun 2021 13:00:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g16sm14137468pgl.22.2021.06.14.13.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:00:27 -0700 (PDT)
Subject: Re: [PATCH v2 14/57] target/arm: Implement MVE VCLZ
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91fbf139-d4d1-c985-6d78-891f82b3da6c@linaro.org>
Date: Mon, 14 Jun 2021 13:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
> 
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++
>   target/arm/mve.decode      |  8 ++++
>   target/arm/mve_helper.c    | 97 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 38 +++++++++++++++
>   4 files changed, 147 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

