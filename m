Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBAC3B64B4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:13:21 +0200 (CEST)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxswq-0007g7-0j
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsw0-0006ja-9s
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:12:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsvx-0007G2-5z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:12:28 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso215131pjb.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LtJRZ4wpkdVLI7QRibc2PisZCVthWrAxqQz/GBZdZtY=;
 b=P/lDI4Y15Eh+SVIXyM5bHovttZmkIhmbqsFR6++lq1lwfuVM35SDsm0xgaVmJbsC/n
 Pf8GoVXGAfuIGr7h8b3m1cEp4pXashMcW+KbsrGue/ucKxTrJMGpwKw1iW59l59RzWUx
 ElJz0QE1tsr4ybgnjrmkQCpAU8393xwUFkkM0jiknUsySJBgy9KqSiN9Ljx95zDFOw4X
 Y+jYqZ7rpjNuw78NREKCRJLUVTQalh+KiE+sEMjtoQ7FmKRMozZj6SBGtVVDZinLN+CZ
 B+bDYDkrR+hYgsNyOn21FEP5RrYRiZmuifsdziu3FbX2Iz8zVj5AbKboXhAjiVJc5Sra
 VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LtJRZ4wpkdVLI7QRibc2PisZCVthWrAxqQz/GBZdZtY=;
 b=WRYwG/Dz2WjARuq15MAfCCowcHhHKS6yy2pYaTenGIPNIyJKULJtwzpw/HfbQsE6bn
 ZfExWLbQk6VKofSvk1vG93Tx62xhjE8bLp8+X2FS+U8HrX55dFK2uIC2H8asXsSgj1IX
 +abDTRdpioQ6eJD0XEpyhfcRlkdhlM/lgiC9rA5OMx4zcPOMdI6FpucRjtIx5vy6BXTK
 tSsOMpPDSHpgIoNBQCCSSgBt0aJE4DBjYqaVdlct+m2x4Kw5FA4v6+hbmy4Q+8aJXHe9
 9LbgSsHQ7i/yoPHux9CnsUnFPKogEA/KF8LvW9EPtMhUCiCgdTxP4yWIRYKIwkmxEHym
 f2kw==
X-Gm-Message-State: AOAM532emyxvrh5M716QxjCiQyL0twB4GWnjnBCiAvJzkyTJewqDzlQC
 Rn+/rRp5ELxeHd89NQlFpeP1sokLZ25B4A==
X-Google-Smtp-Source: ABdhPJw09/+JRcqxE277CjrqvrQYKHHVzPasgkMlDuadG7vmicHvozFFpEARRU5QqrQMOOwBzycdPQ==
X-Received: by 2002:a17:90a:588b:: with SMTP id
 j11mr15884673pji.114.1624893143705; 
 Mon, 28 Jun 2021 08:12:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm15836888pgq.54.2021.06.28.08.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:12:23 -0700 (PDT)
Subject: Re: [PATCH 01/18] target/arm: Fix MVE widening/narrowing VLDR/VSTR
 offset calculation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <551ff542-dde0-7561-f08f-e85a8ef126aa@linaro.org>
Date: Mon, 28 Jun 2021 08:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> In do_ldst(), the calculation of the offset needs to be based on the
> size of the memory access, not the size of the elements in the
> vector.  This meant we were getting it wrong for the widening and
> narrowing variants of the various VLDR and VSTR insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

