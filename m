Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92140CA0F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:29:16 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXmd-0001B2-9w
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQXlM-0000Js-IG
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:27:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQXlK-000290-Ss
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:27:56 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d17so1931224plr.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cqEFLTiQ7uOpILFFfk8O7RRMKBiIowUW0kyLCu/ISMw=;
 b=FOx2ma8NNfgT3mCJtfjcYTicMfhxtZ2dEZHhIWtwEGTtnBOQr0IyZeulhRd+sHBhVo
 f/V/svuCh9RSoBmVanLtkApO6+Eebno/Oz9kTmHriIq5v80Daoumw7/7URs3Dvvt1hn2
 HGSI+nafAib3ubrfZ3yE1oz+XKuS3mK1aQ8ly4+7/b/iWyVaGKM7XgPUOR5fbaBQAS8E
 hIwMe12TxQeUNjQzG226aqPMlzWiaI27C9zVfouR29kk9dLvN+eOf3UWVOQEJ3bHIXq5
 KYBIXsIHgMB5ZrKXMc34MEi9hdMkaIbbl1AOYNyVH8P+Eqv+hn00uu7M/jmGnpmlThW6
 MlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cqEFLTiQ7uOpILFFfk8O7RRMKBiIowUW0kyLCu/ISMw=;
 b=70p95CYtnSBTuslb5SsAzOiRrON6nEu4R86qXFHjDYjbMZtSQy1CSJLA2Hhgebp1ai
 HVQdX6TS6lY8O0B/dRIWAKSYFL0SJHvjpfvUmsDbkkUUk/peykZK+gSaRKJB6Hjb4cB6
 20iksW08g4xe9+Crk1V9JOnpN1UU0X9Dx1kosgauLyYqYeTbKSpZD4Y7eLhn6XE7oFsK
 4m/9cToCfDXtvX4VaJSLb4xDVhHMzkGWi8wm7hRA1unfQCQ4kMcZbeNEeZOFf06Yw0iC
 vEgPQr8/rRZFYILOtlNTi0fe6pQlGr7ngisKz3doXgook1bIiXy3goqiSlyH3MOCZW1s
 cQiw==
X-Gm-Message-State: AOAM532tJ4j6j2tDEI+eGgk4k6rn+rfX4tdXsyDo7OVTaJKDCcYV0mrX
 9Lzf7YRnrxJtQIE6irnHP1DT+w==
X-Google-Smtp-Source: ABdhPJzDCaW2PP9C4ltougdsXXenApw58SmOwWi/RS60B9/dwVPehTfY05nbofK2WFoCawBqVktmOA==
X-Received: by 2002:a17:90b:350d:: with SMTP id
 ls13mr9289200pjb.235.1631723273464; 
 Wed, 15 Sep 2021 09:27:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b16sm416365pfr.138.2021.09.15.09.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 09:27:53 -0700 (PDT)
Subject: Re: [RFC PATCH 6/7] linux-user: Handle SIGSEGV/SIGBUS in
 host_to_target_siginfo_noswap
To: Warner Losh <imp@bsdimp.com>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-7-richard.henderson@linaro.org>
 <CANCZdfqkPHY_peP=NRazH9aa4T6SkWnvH0MG2Lemcj9iVz51zg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d703972b-3dd3-1d12-e02b-698ab4830241@linaro.org>
Date: Wed, 15 Sep 2021 09:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfqkPHY_peP=NRazH9aa4T6SkWnvH0MG2Lemcj9iVz51zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 9:23 AM, Warner Losh wrote:
> 
> 
> On Mon, Sep 13, 2021 at 4:05 PM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     Remap the faulting address from the host address space into
>     the guest address space.
> 
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     ---
>       linux-user/signal.c | 9 +++++++++
>       1 file changed, 9 insertions(+)
> 
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> 
> If I'm understanding this right, the FreeBSD code in the bsd-user fork won't be affected 
> by this change.
> (or conversely, it's so far behind the linux stuff that it will need to be completely
> revamped).

The converse, yes.  I haven't looked at your branch, but I assume that it'll be easier 
with this cleanup than without.  FWIW.


r~

