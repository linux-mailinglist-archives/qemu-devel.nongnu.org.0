Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7384458F5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:51:03 +0100 (CET)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migtC-0005SO-96
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migmx-0007VQ-ED
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:44:37 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migmu-00067q-Ba
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:44:33 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l12so4356483qtx.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j2QcRRATq0tcyK0s0j71zPWREZPE29HP3kOehAn8TOA=;
 b=cYR9k/p3EXOsRfEMYiI6fz1zMuTHuqkaeQs19iZXQQEJCvh32zzksfN8htHxLao89t
 19OrOflZpDR7X0ZB+4f5U3R+c1OLECuoRgFoxJx6M6gfrokqrZHG6DrMWAEvyl4NkfjG
 ZVN80ojJHKBG56dxn/94lVlWvqEUiL1IsdfpXdAoba9GBPtSP9eFoRqBxHgGjy26uTJ1
 olUr3RT7AMyGFJ2zGiHNdx2KVFhfrGIjGzxc0ChsddqddJyw++oLZGWFP16wO08usI+O
 7yZ67ZT1UZiQfi+UZO5NQViFxuIWK0oyfQ/0ealRsLYJvBpgyAK6s+E6b8MOB3DPeLxi
 4pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j2QcRRATq0tcyK0s0j71zPWREZPE29HP3kOehAn8TOA=;
 b=yecfzZcPo7On3tWgjR1bCiruIKV1XTaVZj/pw47+J95WM6hQQA3PUN2wmcaOADt60Z
 +dsSPlTeyUQa0jBLlN33jYPKd6qU6Fvo/2NLvJdye6bcs19+oHzV2Gx/d+4AWMauAsLS
 1SAbQbowOdNhEgo2vA+jss+DuaecWvpAHLYOPVZ/rhOqSWXxKNrZWTSfQKY7duGykJF3
 9r2xUEJMs8PNMw9laJal4KfdbbbNGBxsbkbZBCm/br/O2JoXQCVeGmie/XV8+gGnXAzm
 nZzIt1BO8Kb0wbAGXrdsqXGFf/8gP7LG+tTRI1Fw1h+2FDGDL2nqdYTarigV/6oiR+uN
 IasQ==
X-Gm-Message-State: AOAM533ycnVM/sHK5tpVs4r2x8gVlWsD0GLz6uhjQYUHdZ7KKpaMb8Yk
 fJOU8oQ+I1Y6yKtFirbSNXwmsg==
X-Google-Smtp-Source: ABdhPJzs9HVQ+pVyIkygRFAFquxgw60jhY4MUc3C7lrqJApum/UqoC7Q8XWEl9zf+Kb5cLG/haxvcQ==
X-Received: by 2002:a05:622a:c5:: with SMTP id
 p5mr38712440qtw.96.1636047871487; 
 Thu, 04 Nov 2021 10:44:31 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f802:6e0c:4407:203:e794:8e1f?
 ([2607:fb90:f802:6e0c:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id f1sm3883411qkj.84.2021.11.04.10.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:44:30 -0700 (PDT)
Subject: Re: [PATCH v3 07/29] bsd-user/arm/target_arch_cpu.h: Implement
 trivial EXCP exceptions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211104140536.42573-1-imp@bsdimp.com>
 <20211104140536.42573-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99cdd56c-d161-26ba-03e0-77ae61b8823a@linaro.org>
Date: Thu, 4 Nov 2021 13:44:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104140536.42573-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 10:05 AM, Warner Losh wrote:
> Implement EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
> EXCP_YIELD. The first two generate a signal to the emulated
> binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
> nops.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Mikaël Urankar<mikael.urankar@gmail.com>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

