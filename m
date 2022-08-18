Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4365987E7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:54:05 +0200 (CEST)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhqO-00080q-72
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhVN-00082a-Fh
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:32:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOhVL-0003Mu-OJ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:32:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id pm17so2028050pjb.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=W7oKLKNyrPvDtidNjm7ieVLPB9ZDTnlBy4IRUV3bIgY=;
 b=PkMexf+y0TODPv+LssS7aQqmW88rmWnzFG5yixr+7aV/tpGupHNLet9AxDD0GV+Arh
 y3nZNv0oabQhIEYSUG9Nog4lvcFq+Z5U6R1DOge4VbuSFRDYjsqr1QJkYTwTGpHdn4tr
 46C2kzkq1ah/aWjCceRO1KR1Yt+lJaCBZEA7vSNjHoE3Oo+R1q4DkSxkTPKKsvzdyO87
 zeW3CuNJQbNpSZhfHcFHpYBsVQXTRt9YAAyZS0hTmhB0pFgO7gT/T3QDXxVB3HBh+fVD
 xAtvRTpOHTi87oWc4qS559VE82tD3s7HqjjmX+7L+cW7KUTUkHY2m8sl250SEyLd4Ita
 a1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=W7oKLKNyrPvDtidNjm7ieVLPB9ZDTnlBy4IRUV3bIgY=;
 b=vFOj0UMtyBAKGzVEqN9sdIxQYaR0EnYwy27MMLhAQU9q5WjpKIg4HO+pzHnDaMPGuP
 /ctvs35CVDYrX/3+3Q9mPc9Hz8sUzzDnQd5z34EO11MVIcDC3hApj36RcNgEum3EOSsE
 yZn6r8FgWNIteVlqu1aKMCsQyeEZIv0dF95sPCiCBIN5DiXZw3zoYWP782htCmOgteeF
 BNn1bTin2sOCWeTZWWQKaYVRHk+tNvf2yspcqqJ4w/Jt2ibPAqm+Y+0FkR7xmwzxoH3o
 rq0LekToPQ21yfyybtusSJcaUQn5yPomw6xMqaCWCrLhE1HwCQsc+RSiBOiNZDioZKkK
 9fPQ==
X-Gm-Message-State: ACgBeo0jntRFuuIopthnv5OxyRULn6bVrZSs1y0iItkwhOSHO5GDxrs1
 ISlPlzdws1U+ei2Ipcjn08Nbtw==
X-Google-Smtp-Source: AA6agR7+fTxziLr202ikyEPUuLOxDgD4v+CpCHk41lUieY0KH2AGh82Q2F+ISwP5dhiU0MyVRIf0fA==
X-Received: by 2002:a17:903:11d2:b0:172:6ea1:b6e6 with SMTP id
 q18-20020a17090311d200b001726ea1b6e6mr3055925plh.72.1660836738118; 
 Thu, 18 Aug 2022 08:32:18 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a170902e88700b001725d542190sm1539997plg.181.2022.08.18.08.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:32:17 -0700 (PDT)
Message-ID: <b219c68d-76e2-dd95-7855-99a58b5e5e95@linaro.org>
Date: Thu, 18 Aug 2022 08:32:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] tests/tcg/ppc64le: Added an overflow with OE=1 test
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com
References: <20220817165704.165291-1-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220817165704.165291-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/17/22 09:57, Lucas Mateus Castro(alqotel) wrote:
> +void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
> +{
> +    uint64_t t;
> +    uint64_t ch = 0x5fcfffe4965a17e0ull;
> +    asm (
> +        "stfd 2, %0\n\t"
> +        : "=m"(t)
> +        :
> +        : "memory", "fr2"
> +    );

No, you need to fetch f2 from ucontext.  There's no guarantee of any specific values being 
present in the signal handler otherwise.

> +    return -1;

exit(-1), which return from main equates to, helpful over EXIT_FAILURE.
But here I'd tend to abort(), since it really shouldn't be reachable.


r~

