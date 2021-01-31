Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4808D309F51
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 00:02:59 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Lk9-0005f1-Qa
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 18:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l6Lit-0005Cw-TZ
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 18:01:39 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l6Lir-0002It-7j
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 18:01:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id g3so8953273plp.2
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zD1Hq5ytfdhxRrB45gBVm3J7jB2oS2KNPSSHD/U9XlE=;
 b=W+3/wes7RkFRH9wO/jDftNL5dSWy5xsTbqG1FmnxDi7u1IN6HT6QIj/eh1joTHDmLS
 orhqPNOlZA3t0W1mUzwVwvUb/yTOsFIr6ilXHmXPvned79hrYuA1XCxRkFyPVXQxNsgM
 lIlP5Unoa5oz/OqlqqnNuvzDVf2N72a7PmSc6Pst28QGzeEcK6uuhb8nGlJUv1nTDdul
 MirY8MIShUij/d75JaZn/FyKf+TuGXJuvxqMVtNxXBfmZMRcVCcmpftb6P+uDTiWfSwF
 F/h27f5IR8OS/YxjkZrnepWqLL/n+JQomXSoPe8e+2Lq/W4IzzJMvTQGRe7Yo/gpIylp
 NiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zD1Hq5ytfdhxRrB45gBVm3J7jB2oS2KNPSSHD/U9XlE=;
 b=ZHg7ismDufTIx+u3Ff5l5BQyB63s7nu6N8ksjWEIxSE4HqcCHMI5QkH8RwwodVr795
 +5mB3JqrvqAKmrxRpEBYpW1L8UxIVzyB2HBBuLXA8ux7W4f3KG9dulab1wynBOQM+IoD
 2EuY3gGR61CI8A/i3pmjOxQ0KVLO7iLh5Q8iGgHVKW5SoD+VXLFXyd3+5BaTDVn6TOIP
 pmEqJczbSlFStfbBL4wiW8RVqIsLi9SzJd21R12NNft+vrhv0f+UFVMzkF+TGfImsZDs
 Hg1L6CZUP3OTmPa/aUztBew1BeRBXQ1uPGmEQxE65eR6qn8iQT+kf50iCv9ADI0tgDY6
 lBMQ==
X-Gm-Message-State: AOAM533+ti1p1MhCm+qpe8xtISKihmeRr5sZRFBhAgkryiBLThKiESbg
 rLPD8gN27si83vtQrFphlzy7vw==
X-Google-Smtp-Source: ABdhPJxs3BdhacNLzOMGvIUoUT81vaZD3rRDkWrjtsLyDLbLbAQKrL+fPZzyxZW/kvp20Nuh9iFQ0Q==
X-Received: by 2002:a17:90b:3805:: with SMTP id
 mq5mr14506299pjb.93.1612134094649; 
 Sun, 31 Jan 2021 15:01:34 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 130sm15761771pfb.92.2021.01.31.15.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 15:01:33 -0800 (PST)
Subject: Re: [QUESTION] tcg: Is concurrent storing and code translation of the
 same code page considered as racing in MTTCG?
To: Liren Wei <lrwei@bupt.edu.cn>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <60169742.1c69fb81.90ae8.cdc6SMTPIN_ADDED_BROKEN@mx.google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cebad06c-48f2-6dbd-6d7f-3a3cf5aebbe3@linaro.org>
Date: Sun, 31 Jan 2021 13:01:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60169742.1c69fb81.90ae8.cdc6SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.079,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 1:38 AM, Liren Wei wrote:
> However, similar to the situation described in:
> https://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg02529.html
> 
> When we have 2 vCPUs with one of them writing to the code page while
> the other just translated some code within that same page, the following
> situation might happen:
> 
>    vCPU thread 1 - writing      vCPU thread 2 - translating
>    -----------------------      -----------------------
>    TLB check -> slow path
>      notdirty_write()
>        set dirty flag
>      write to RAM
>                                 tb_gen_code()
>                                   tb_page_add()
>                                     tlb_protect_code()
> 
>    TLB check -> fast path
>                                       set TLB_NOTDIRTY
>      write to RAM
> executing unmodified code for this time
>                                 and maybe also for the next time, never
>                                 re-translate modified TBs.
> 
> 
> My question is:
>   Should the situation described above be considered as a bug or,
>   an intended behavior for QEMU (, so it's the programmer's fault
>   for not flushing the icache after modifying shared code page)?

Yes, this is a bug, because we are trying to support e.g. x86 which does not
require an icache flush.

I think the page lock, the TLB_NOTDIRTY setting, and a possible sync on the
setting, needs to happen before the bytes are read during translation.
Otherwise we don't catch the case above, nor do we catch

	CPU1			CPU2
	------------------	--------------------------
	TLB check -> fast
				tb_gen_code() -> all of it
	  write to ram

Also because of x86 (and other architectures in which a single instruction can
span a page boundary), I think this lock+set+sync sequence needs to happen on
demand in something called from the function set defined in
include/exec/translator.h

That also means that any target/cpu/ which has not been converted to use that
interface remains broken, and should be converted or deprecated.

Are you planning to work on this?


r~

