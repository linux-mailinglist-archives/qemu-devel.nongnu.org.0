Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5AC693540
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:20:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzA6-0004Db-3y; Sat, 11 Feb 2023 18:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzA1-0004Cc-Kx
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:20:01 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQz9z-0002S6-S7
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:20:01 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so9056671pjw.2
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PRKoCM/oyUq17SQgvm6e7/4bzA7O1WLbtTIQ1jGkRw4=;
 b=bvFyIEZSvYnhlfv5f3ER+WWYKsDAMv9z4eel8sZzLPolUzHQm7MYn99XXkE0eM+/qZ
 nH6EQPFf7BRjqAAuMC6VAPeLUf7Kay1y+f20IPSr45ISfYsp4N/a/4L9VjLg4TTrsWp+
 mqIwvFXl54FepODYp8Scc4/ZEgilKSsZOKXpkjbpzQ/XJxE6tzdgD8qsPUwQ9reLM9q8
 v7gVBouy0pSrJVXljgfHNKurdhch66hn54Bu2/UrayMRDxtzslJXQAsri29Jz/9+tQWl
 DiteOaoupLXeWV1oMbYYPCYSZTpgG7mJhSn412ClAwYjLlNFXnpL2ivGDUaxsMAdw9nw
 A2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PRKoCM/oyUq17SQgvm6e7/4bzA7O1WLbtTIQ1jGkRw4=;
 b=46vS99sz/CC5UIv+exerH8WT2cnvM6lq0Zy7sSY8eDSYb577BlekH8pGl8gCquGav0
 h7Vu9WL9XZaPjpmvjjHcyXqr4Gr58ZCFsWy1BTdaNdCBWKRWYDjGrTOkD8K/XJf5mrC0
 X39SNDH2bBxKvPf0yPXNZ3uqL2b8I1rvJi7ccXGNi0hCNEyK4W97n7UIkq3YHa0nFzuH
 REYpxLwOgVHR/kwizvi+vkcSuJygRaeh+2ciBuZTfsxDZagVhyIiA0vlFxfXMDRCvZxi
 655iJ0f6TZelqC97cFHMyMRGbjAtNsTCNA7q1rCg5UA5mmNuumiuzFYLJupFcYMdpB7X
 mJ1g==
X-Gm-Message-State: AO0yUKVVtAvdetW9TEQ6G2Rqqc+K6N5nCDeh5ACJU4sOJePSSNU74xyR
 i07NnNxF+8J8Mi91O1rN+/ly9w==
X-Google-Smtp-Source: AK7set+nnVSSKnVEdWvtZe3Nf3z7/4tDd/kwrlrPz3VHDQTGYQj2anLdy9PTz9s5ETtvPUv+nmozWw==
X-Received: by 2002:a05:6a21:99a3:b0:bc:e2d1:dc29 with SMTP id
 ve35-20020a056a2199a300b000bce2d1dc29mr24624618pzb.59.1676157598220; 
 Sat, 11 Feb 2023 15:19:58 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 6-20020a17090a0cc600b00229bc852468sm4517507pjt.0.2023.02.11.15.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:19:57 -0800 (PST)
Message-ID: <714e259e-06e0-2f34-ad6e-a6316625d1c2@linaro.org>
Date: Sat, 11 Feb 2023 13:19:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] bsd-user: Add -strict
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> Most of the time, it's useful to make our best effort, but sometimes we
> want to know right away when we don't implement something. First place
> we use it is for unknown syscalls.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 4 ++++
>   bsd-user/main.c               | 5 ++++-
>   bsd-user/qemu.h               | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 179a20c304b..e2b26ecb8dd 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>   
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> +        if (bsd_user_strict) {
> +            printf("Unimplemented system call %d\n", num);
> +            abort();
> +        }

I don't like the raw printf, even if you did write to stderr.
Perhaps just the abort, letting the error message be handled by qemu_log?

> @@ -396,6 +397,8 @@ int main(int argc, char **argv)
>               trace_opt_parse(optarg);
>           } else if (!strcmp(r, "0")) {
>               argv0 = argv[optind++];
> +        } else if (!strcmp(r, "strict")) {
> +            bsd_user_strict = true;

Perhaps force LOG_UNIMP?  Without -D, you'll get the qemu_log above to stderr.


r~

