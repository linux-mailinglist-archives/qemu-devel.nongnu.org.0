Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FB69EBB2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 01:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcgu-0003fV-F5; Tue, 21 Feb 2023 19:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcgs-0003ep-UD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:08:58 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcgq-0002sR-3P
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:08:58 -0500
Received: by mail-pl1-x641.google.com with SMTP id s5so6855955plg.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SnXCBPBxBnRXnqxJY0pHFUQMrw3cIbI8vaHJ7VJ51y8=;
 b=ZdXxya3jyoa5baxNl+RmK+VEp2ac9YNocqnjRIx1jXmam7p/rUPMUiIQRtCoHrX9o+
 AfpTixOi7gyaUhIIlp3nod3K1WQ1D1VmS4Gfafdxa57/RtjORG4Jqm6ve1nXvC537ziY
 Zel3qisH5+01fIXy2mUfOZiOlq9wHKjvWjQ4ZL/XvCmVPLIbUk6FXh+To3cscprU9G7F
 D54NTwnHo/mdKHoiKQXlEtTFzFWscDS0lT0++CPBDYGaMp3uSIM3bkid3HY3/FMATABc
 QG3/dS3Tf7Rvu9indGxHewdQfrToGAdul/sEaYyETm/PygskGvepFOa8zckiB4NBvfpe
 HhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SnXCBPBxBnRXnqxJY0pHFUQMrw3cIbI8vaHJ7VJ51y8=;
 b=MbvcgLEV5/skfrvVXw8kLKKGL1bf3g7Oap/OfMRO0rnpAM+Rmzs3MCsTdf606MOM7S
 K2hQL3Oe5oP66SZPZkMS/MLanu4Fd6GHCUcknQOmZo2TTjm70KQUZy/g8c9ykkm1GhWF
 dmRPCZA8s1RumpjNiLB8pCMw+HcAXQ3rBZw/f9Ik1mwrk9at4tzwmxnWgELWI+ZF29xk
 TLGP8jmq1Iep+eqHLlHABl0YADv3N0E+qOnvK7No/8WY2o9ssWTT/IVv7sphy2dtwwgq
 7swUJ37wS36VVod4EbcBiFSQ/taT8MONEyIwH+nAfJFZ5zGsW5OWxAxYKvnZs+4X+uzt
 RHQg==
X-Gm-Message-State: AO0yUKVhWwaxsTTtSqNj68IzUHkbha8JOeM0NenQcZSnhYuZEQYoXAO6
 be96FOmbQL770YgHOY53C24L2A==
X-Google-Smtp-Source: AK7set9se4cE9rLxvyLo1+JPSq5ugW0afL3lIfAbDV0V/u0whnv0Njs4jOz3mRnQTYPgI2z6642OWg==
X-Received: by 2002:a17:90b:4c50:b0:229:2427:532f with SMTP id
 np16-20020a17090b4c5000b002292427532fmr6672053pjb.40.1677024534432; 
 Tue, 21 Feb 2023 16:08:54 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a498e00b00233790759cesm2406084pjh.47.2023.02.21.16.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:08:53 -0800 (PST)
Message-ID: <e90bda0d-3c06-c378-c496-3b14107b9c9a@linaro.org>
Date: Tue, 21 Feb 2023 14:08:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221232520.14480-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/21/23 13:25, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
> in supported builds") we can not build QEMU with NDEBUG (or
> G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.
> 
> However some static analyzers / compilers doesn't notice NDEBUG
> can't be defined and emit warnings if code is used after an
> 'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized").
> 
> Apparently such compiler isn't as clever with G_DISABLE_ASSERT,
> so we can silent these warnings by using g_assert_not_reached()
> which is easier to read anyway.
> 
> In order to avoid these annoying warnings, add a checkpatch rule
> to prohibit 'assert(0)'. Suggest using g_assert_not_reached()
> instead. For example when reverting the previous patch we get:
> 
>    ERROR: use g_assert_not_reached() instead of assert(0)
>    #21: FILE: target/ppc/dfp_helper.c:124:
>    +            assert(0); /* cannot get here */
> 
>    ERROR: use g_assert_not_reached() instead of assert(0)
>    #30: FILE: target/ppc/dfp_helper.c:141:
>    +            assert(0); /* cannot get here */
> 
>    total: 2 errors, 0 warnings, 16 lines checked
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   scripts/checkpatch.pl | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

