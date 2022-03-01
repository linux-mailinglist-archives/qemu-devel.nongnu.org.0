Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9674C92C8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:17:20 +0100 (CET)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP73n-0001Co-Ik
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:17:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP71X-00087n-BB
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:14:59 -0500
Received: from [2607:f8b0:4864:20::436] (port=44704
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP71V-000248-Oa
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:14:59 -0500
Received: by mail-pf1-x436.google.com with SMTP id g21so8680593pfj.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kYwlHxQQr5yWQaYdgvhTzG4Ew6PS/yGiwGcKei0gp0w=;
 b=mXat5zRSgYsIulq1toGIVOoDWyhcGt3EFD6gsVQQ5F1CR2Xjq8fvb51c77wWW3s4jA
 c7tzGGVFns75hApXZMcWIx3oQsXVEt51kRor0AO7+7yRMWDtRU6FRP+x9K50JqGU8XME
 TkJoThfpkvoulyPWXEzJm+V2PL2H9RV2HKgkY+u7gNA1wohIpwEAonsU91LoGigaJsRY
 LBIm4m9twGhxT67TcaClS8XjMFPLy8K0ifqUEZsAXwzD0JhnqZPQhjzBcHpwvtGSt6gr
 Hm0l8p3aEE+gBZXj1ArCAx9vt4XUizF03JoUhA5FOk5W+TuHO4TnlUQ/EdfFliMpgBKg
 SvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kYwlHxQQr5yWQaYdgvhTzG4Ew6PS/yGiwGcKei0gp0w=;
 b=7tGDbWrG8RXPdTuRqT0r6KP3CtKSvwFusu4cvxoRlhqKeV4aQaIkeig+DDL3JbmG3r
 kD/TssRBCGFZ5lJ5ujD8kwrVexwTCDI8an7LoU7xPhIf1HWP41s+v+V7aMwHVTxXr8or
 IlO919MyWrykeYbXUPbDHJLP7TqBGuVaMpIEsAuAIUYjSXvE2Dv4r7zvK787+gYGd0Qr
 o+kwx9lFyNBIEG4xdMfJ0Ge4Edw8tIs2CmwNN2x3nW2oINGKCYQRzo3C9Ze6gxG6n6Zj
 1rf4+ENm6O02IduibkhC5NMKj1kzDWbb8NL3YJWvHE7RXQ1TTk18yZtx5JVCfoZnDsGc
 MiXA==
X-Gm-Message-State: AOAM530o4k4X341FaOgHrCu9vMX6aYjT5MYgJ2+jTo6UDTqYh5LO5Xwn
 6hBIaCsiFMmVkXs/spie6IKA4Q==
X-Google-Smtp-Source: ABdhPJzUZ5CUhiVrFxdWMO38hHxO05LQbO91FN3jeIFGCt697m2gI61DsUx3XwG4K1GgdjX4ubQMvg==
X-Received: by 2002:a05:6a00:1822:b0:4df:56b7:afc7 with SMTP id
 y34-20020a056a00182200b004df56b7afc7mr28791855pfa.58.1646158496388; 
 Tue, 01 Mar 2022 10:14:56 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bd35-20020a056a0027a300b004f63bca32e7sm1100189pfb.208.2022.03.01.10.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:14:55 -0800 (PST)
Message-ID: <986c21ea-f6b7-bf9a-2491-11b5d22b05ac@linaro.org>
Date: Tue, 1 Mar 2022 08:14:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Fix mvc, mvo and pack tests with Clang
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
References: <20220301093911.1450719-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301093911.1450719-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 23:39, Thomas Huth wrote:
> These instructions use addressing with a "base address", meaning
> that if register r0 is used, it is always treated as zero, no matter
> what value is stored in the register. So we have to make sure not
> to use register r0 for these instructions in our tests. There was
> no problem with GCC so far since it seems to always pick other
> registers by default, but Clang likes to chose register r0, too,
> so we have to use the "a" constraint to make sure that it does
> not pick r0 here.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   tests/tcg/s390x/mvc.c  | 4 ++--
>   tests/tcg/s390x/mvo.c  | 4 ++--
>   tests/tcg/s390x/pack.c | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

