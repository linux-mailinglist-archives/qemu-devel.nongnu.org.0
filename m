Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01745449A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:05:04 +0100 (CET)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHoN-0007cC-D8
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:05:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnHnT-0006wi-9q
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:04:07 -0500
Received: from [2a00:1450:4864:20::336] (port=52834
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnHnR-000701-Ol
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:04:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id o29so1643889wms.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 02:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z/DbdtSq961AQDF1nET4UQL/Wssjq9jqTI48FFHBdQg=;
 b=m2seQZw9Je5floF6/PJb9NQk0NMIsFbfOZw7AXRPg1oi7XweGB2iF/c3PFqj+EMS7X
 jHlkEs8guNr5I63QAPPoqwrStOb7jKKVVCcg+ljdCZw4j088oY7QpEg2KYp46eG7by13
 NFgoPuIXM61BzF2qQS7kHhg9XRPdWUYr1GoVJ6MgpzT3Gz0gtLTM3oP9IVDYtXfObWeW
 9MLxe2AjIFgm+TfDKXSYzC/CsAF9IMOosi4dsdYS3vYW8Ie0Ibx7Fb6snA3mpftI5iC1
 c8z698eciQHSZ2UzkrQ5+dq9KVpbJ8l+fBPijOgcMetSq3HzDFPgGMvPaSfGH4gGkjYe
 i8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z/DbdtSq961AQDF1nET4UQL/Wssjq9jqTI48FFHBdQg=;
 b=kxLR/FP1dC9SjSUz1rYdU4mVmz9sm1KbCC2w+LoShL/3dLH85dT0GqokpZIz6tvbjQ
 ZJl6RLcNz6/bJrgTHMVKWDW4Y9E7t+XuHFyirMn+9K7Ct1fKyPetJ7XtUpg2jeAg/XKR
 NlhOdn6T0xd+ymB6aTMbVJJh8QoLfWrs6zqO+U8GQ03vnqwszb8md4NpAZiBusuWdkV6
 P0VP6J2YWRcKz66Gb922HXcBAyD68HDN278JbO7p+hC5doUoN6soumVllN+be3JDAHVB
 v3yc4PwkKKDi/Z6Y9GEe5IkVPjBD3z+XDZBY8UcMNMX3ZSbi20M1P5UVjJ6qLG3rO01P
 4RzQ==
X-Gm-Message-State: AOAM533OELqTKLcW1jM/8IijsWV/7JhBKSKGd3CbQeo2rpxl2JgBHEuS
 33Xz8nqruVJr+3edfitiI/phFw==
X-Google-Smtp-Source: ABdhPJx/jeKlnUxPPp1Ca/K36qqrNoGZ3VxguytyILEQ5l4sFJ69e6DFjWtAXVM5b40bL38nAeGgig==
X-Received: by 2002:a1c:2047:: with SMTP id g68mr80790869wmg.181.1637143443971; 
 Wed, 17 Nov 2021 02:04:03 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id n7sm19732383wro.68.2021.11.17.02.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 02:04:02 -0800 (PST)
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about to
 execute
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87h7cbw1tx.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <207105cf-bb82-55c5-ff30-e29517c970f5@linaro.org>
Date: Wed, 17 Nov 2021 11:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87h7cbw1tx.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 10:47 AM, Alex Bennée wrote:
> -    gen_set_label(tcg_ctx->exitreq_label);
> +    if (tcg_ctx->exitreq_label) {
> +        gen_set_label(tcg_ctx->exitreq_label);
> +    }
>       tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);

The exit_tb is also not reachable, and should go in with the label.

>   }
>   
> modified   accel/tcg/cpu-exec.c
> @@ -954,11 +954,16 @@ int cpu_exec(CPUState *cpu)
>                * after-access watchpoints.  Since this request should never
>                * have CF_INVALID set, -1 is a convenient invalid value that
>                * does not require tcg headers for cpu_common_reset.
> +             *
> +             * As we don't want this special TB being interrupted by
> +             * some sort of asynchronous event we apply CF_NOIRQ to
> +             * disable the usual event checking.
>                */
>               cflags = cpu->cflags_next_tb;
>               if (cflags == -1) {
>                   cflags = curr_cflags(cpu);
>               } else {
> +                cflags |= CF_NOIRQ;
>                   cpu->cflags_next_tb = -1;
>               }

Still missing something to avoid cpu_handle_interrupt firing?


r~

