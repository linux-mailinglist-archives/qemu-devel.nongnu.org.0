Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0824619C0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:38:31 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhna-0004oS-LD
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:38:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhlb-0002lj-6b
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:36:27 -0500
Received: from [2a00:1450:4864:20::42b] (port=33623
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrhlZ-00030o-IL
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:36:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d24so37349235wra.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EUjteWaRt+660nLNRWb1PXN4QvuniZGA9/uUgDpVpYY=;
 b=Urlp9bkYePN2sDceLuVbvHk7LDHg/RfUmYElUwxkvIad/LiQY2DdhXZgeNWl0oZ7fh
 9v91xZm6XdN35RNpfm7QsszP/zsu19nMS8BzhTzHRjupmZR/O7FjJTK8MznyIK6jA6PF
 vrcwjNxWmqQ7bBhel2pW4uvTZfKZSXDDRGA54yctQU4hA+P7FPoODH7Rl8TPPqMWVOri
 ElWFzzCHBnq89YGNPjMUTUhLe+sn8JauzYwZk6qPrmbIb25Ege97vxS+VqpU0QFRPPdr
 zqPcUIzlJ7pZdZ1AwJntVX3N0I08v0KojRGTKp2go41PCPvVG/zVzOgKsIM6+7iU3FVP
 Q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EUjteWaRt+660nLNRWb1PXN4QvuniZGA9/uUgDpVpYY=;
 b=Y23lR7MYpZjrIm+56QPjzATMsL20xHRXZ/YtpnJGeInt30cWbR1kuQd5zHss47aT1y
 G1yV8v8OIkq8lXHBQT8TJ4NFoZBRoP5vbWYNlcwyu+2AZbu1tINdz2rAyeP7Ie3m9xiJ
 l0NIXJBiT2aHBV8nFG3ciGH1mjW+98Vusm8q6ifDqXN+6N82sZuHhs0NCEJAP5L7eBcb
 upO3NdwVzvKIS4u366Z0L9Mqw9vK6prDCr/rh5mYhq+1n2uawUvpD0lyCLdCwzA/AqLs
 K2AR2+VMy4Tu6XU8Ldz4sg8Hv0g4DyJ8U2egcdrGaeDR+Sq21zjwejYk0wefQdaP3K+Q
 A7wA==
X-Gm-Message-State: AOAM531Aoi04zOxAJ4GyJpROSCvBj8Xh4y0iannWPClTMaktYil0vY5l
 VgjSiQalRZ8J1UNxL7W2kS3poA==
X-Google-Smtp-Source: ABdhPJyPjbRSzxZfZEh6aBfVUv4EeRTGfjTb5N6UmG+I69YR6v7WaRgfuYy70RedrKNloO6brf+RcQ==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr35603118wrr.189.1638196583824; 
 Mon, 29 Nov 2021 06:36:23 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id h13sm14315755wrx.82.2021.11.29.06.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 06:36:23 -0800 (PST)
Subject: Re: [PATCH v3 8/8] tests/plugin/syscall.c: fix compiler warnings
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
 <20211129140932.4115115-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36804b12-93de-df48-ab0f-d49d3edcc2f3@linaro.org>
Date: Mon, 29 Nov 2021 15:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129140932.4115115-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Juro Bystricky <juro.bystricky@intel.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 3:09 PM, Alex Bennée wrote:
> From: Juro Bystricky <juro.bystricky@intel.com>
> 
> Fix compiler warnings. The warnings can result in a broken build.
> This patch fixes warnings such as:
> 
> In file included from /usr/include/glib-2.0/glib.h:111,
>                   from ../tests/plugin/syscall.c:13:
> ../tests/plugin/syscall.c: In function ‘print_entry’:
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
>         used uninitialized in this function [-Werror=maybe-uninitialized]
>     g_free (*pp);
>     ^~~~~~~~~~~~
> ../tests/plugin/syscall.c:82:23: note: ‘out’ was declared here
>       g_autofree gchar *out;
>                         ^~~
> In file included from /usr/include/glib-2.0/glib.h:111,
>                   from ../tests/plugin/syscall.c:13:
> ../tests/plugin/syscall.c: In function ‘vcpu_syscall_ret’:
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
>          used uninitialized in this function [-Werror=maybe-uninitialized]
>     g_free (*pp);
>     ^~~~~~~~~~~~
> ../tests/plugin/syscall.c:73:27: note: ‘out’ was declared here
>           g_autofree gchar *out;
>                             ^~~
> cc1: all warnings being treated as errors
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211128011551.2115468-1-juro.bystricky@intel.com>
> ---
>   tests/plugin/syscall.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


> 
> diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
> index 484b48de49..96040c578f 100644
> --- a/tests/plugin/syscall.c
> +++ b/tests/plugin/syscall.c
> @@ -70,19 +70,17 @@ static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
>           }
>           g_mutex_unlock(&lock);
>       } else {
> -        g_autofree gchar *out;
> -        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
> -                num, ret);
> +        g_autofree gchar *out = g_strdup_printf(
> +             "syscall #%" PRIi64 " returned -> %" PRIi64 "\n", num, ret);
>           qemu_plugin_outs(out);
>       }
>   }
>   
>   static void print_entry(gpointer val, gpointer user_data)
>   {
> -    g_autofree gchar *out;
>       SyscallStats *entry = (SyscallStats *) val;
>       int64_t syscall_num = entry->num;
> -    out = g_strdup_printf(
> +    g_autofree gchar *out = g_strdup_printf(
>           "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
>           syscall_num, entry->calls, entry->errors);
>       qemu_plugin_outs(out);
> 


