Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AF402AA5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:21:47 +0200 (CEST)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbys-0006x0-5G
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbxZ-0006Ao-Vu
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:20:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbxX-0003MF-UU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:20:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b6so14727844wrh.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5awURAAZH5g0GPlyykoCEVRi1+Xy4vcaN3YkptpV/Ag=;
 b=n+VBelUNSM6Jb43j0Kxlqw/z6/iNCnM0Ps74NXJbjUPFlS1PZUQddSi02UZ2J7i9+L
 Y6yJ6suTrFmQQyMBDv3O+q0T6pcFm4M1t7zDLUEehOIOEDxVELxHIcfyL2N2gD9FnoF7
 IOUYq91E42Tw7RxpfoWN95ohCl8GbOQu5Vsbpv1BuqqBE1Z8E0vtkcYKUdB+YCnS2KIW
 S/JtqetS8rMXwL94+fuYTLK6WK/pC/1IyMQ4WNGrhdAd42tLpMcYDjnb0zcd9DvmDpsz
 LPvARQMrPrIW5ZpDk6C2gnBcjVvPpI8F2K4OFDGQgE/VZIpBNqB/D1nsDg+HUjRtLO51
 86lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5awURAAZH5g0GPlyykoCEVRi1+Xy4vcaN3YkptpV/Ag=;
 b=UvJjqk05dsuYZklcye/OtosJRE78D90rpZWd485ukfT5mg0e1qawktkY8rqr2cTKLs
 c6jj55J1MVeSMgmbi39G5nsU9D/I14GeSfLLCvfkcM2kHCCkM7VlXIunEdwhzkvFNXVA
 QZ7kFl8DmvNHE+bXPF77JVdURCDJYngruhBQIBKa3arqFeOTs2ExqLkCuBqVRNlS7sxL
 0WmmT/OcgQXt3OtEurwO/tD4aNkByUH4MoBMqMy2lqxCPkLwx8ksgQ9PwR7sw/G2vWrV
 r8cGDqNvVC0cp3IoNDaxCmUTCcHCNL7Ra++r4ad4ytd13Vln00g+bQKmdcrDjqoWt9Kw
 XsRQ==
X-Gm-Message-State: AOAM53051WBdDU37b8E9IFIiXRf2cezcR15ISnvcR08w0fg0Oix0GVe3
 NGb2FBnkZGi/SR2YmRtrftTcdJr4gm6Xq9zq
X-Google-Smtp-Source: ABdhPJz2K//fE6d7WJJL46An3E9lg8UazABDog3CH2cjJKBkrw+xqrdLaLcRBpAk5Io0MVC52PNhpg==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr19642111wrn.60.1631024422118; 
 Tue, 07 Sep 2021 07:20:22 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id q10sm2524314wmq.12.2021.09.07.07.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:20:21 -0700 (PDT)
Subject: Re: [PATCH] qemu-thread: avoid false positive in pthread_cleanup_push
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210907125120.145068-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <477f7de5-7977-4dd5-38e8-8130149e3570@linaro.org>
Date: Tue, 7 Sep 2021 16:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907125120.145068-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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

On 9/7/21 2:51 PM, Paolo Bonzini wrote:
> The following error occurs with GCC gcc (Debian 11-20210327-1) 11.0.1 20210327
> on Debian Bullseye:
> 
> ../util/qemu-thread-posix.c: In function ‘qemu_thread_start’:
> ../util/qemu-thread-posix.c:520:5: error: ‘__sigsetjmp’ accessing 200 bytes in a region of size 72 [-Werror=stringop-overflow=]
>    520 |     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/qemu-thread-posix.c:520:5: note: referencing argument 1 of type ‘struct __jmp_buf_tag *’
> /usr/include/pthread.h:719:12: note: in a call to function ‘__sigsetjmp’
>    719 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
>        |            ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Disable the warning just like it was done in glibc.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/400
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-thread-posix.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index fd9d714038..4cf47b3414 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -537,7 +537,16 @@ static void *qemu_thread_start(void *args)
>       QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
>       g_free(qemu_thread_args->name);
>       g_free(qemu_thread_args);
> +
> +    /*
> +     * Work around GCC 11 false positives.  Ideally glibc would use
> +     * _Pragma itself, for now do it.  See
> +     * https://sourceware.org/bugzilla/show_bug.cgi?id=26647
> +     */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>       pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
> +#pragma GCC diagnostic pop

I had a patch for this that didn't quite get applied for 6.1.
You can't leave the pragma unprotected for clang, unfortunately.

https://patchew.org/QEMU/20210803211907.150525-1-richard.henderson@linaro.org/

r~

