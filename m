Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFB43E8FB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:27:31 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgB3h-0001HA-SI
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgB2f-0008LS-Vy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:26:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgB2d-0006en-Ty
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:26:25 -0400
Received: by mail-pf1-x432.google.com with SMTP id x7so1914343pfh.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gL8sFzbzQ5u5e7hChjqNmwp9RwsRTxLbWS0R+s3WXtg=;
 b=TVe9nj7+za0IwgZqNDcZGEEPXgCQbBZSnXfx3P2TtEZjfEhVVZMNSkAgQRJAEzKXAP
 AD4ceAZi3gLfZudKp03vL/ZHnbzRU8wmXLh2GMoQBVucsRrTQzbGW943vbJJgmVfywVx
 YEt+K5QtC6EdqyRAj7z9GUe5YBJ9s5dyFt8kSnj8IPVybbtl7D+4d4JZPcsJfmT3pKbG
 +Xs6wEh1+l0gH4H0pA7OH5/r3sTTc5MNzzspYZ6wy6enJe/DqMqEEC3kb2ervUq1g2Nf
 aOSVs3+JNRgUG6CmH9Ybf8VH/nhZurmvWbgFGAHlloI4phT6UWKRkzGFMc0vFHykv2kc
 Ywvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gL8sFzbzQ5u5e7hChjqNmwp9RwsRTxLbWS0R+s3WXtg=;
 b=6Wi3cohw0gwl7LEOmoN0tVTHiIQgAkzUnsBcJku6J4Fd9PJ8y5Kvafp6A9eyzg7iwn
 x4AJRJt48Eq9Gd4UVV9um2FlIdOhY3DUdv+N/qI4SM0Yzp05juiaffvceVCAw2PtoHnI
 gkmYjp3rVPEb6izK38YTSKwjcED0yk7wAVS/r/SN26SN8lIlgkUwkF15b6pimSsOeM+X
 2EqIGNv+n5ywn9cB6c1s3fE2FLjvc96qQAvgqjB1S8FhW+xxaQUIglCUCM+3EgwO5Al8
 1PKANPypSfhD5Sut0Bw0/vLJ8SwcER3qFYJvR7Yyuhxho3d3A9vSAuWfI1d5N/t08ksD
 itYg==
X-Gm-Message-State: AOAM530KQZioiJdLGs/7tW1nDM5cEpeQr3Tl525HPoqqKDg2Qhjv6mc4
 /wexQKrUAAdt1uIp1V1fcdqckQ==
X-Google-Smtp-Source: ABdhPJzIy2kha4ZfAh0QpUyNOrU0EhHbKJKUClAlJpSSJOU15iQOOspcpyvVgXWD2lDH/HjlvJDKFw==
X-Received: by 2002:a63:84c6:: with SMTP id k189mr4512050pgd.245.1635449182288; 
 Thu, 28 Oct 2021 12:26:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s2sm4018606pfe.215.2021.10.28.12.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:26:21 -0700 (PDT)
Subject: Re: [PATCH 4/4] icount: preserve cflags when custom tb is about to
 execute
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
 <163542170287.2127597.18369415404458239885.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6e2ae69-e838-5475-035e-b19a510b18b0@linaro.org>
Date: Thu, 28 Oct 2021 12:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163542170287.2127597.18369415404458239885.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:48 AM, Pavel Dovgalyuk wrote:
> +        if (cpu->cflags_next_tb == -1
> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
> +                || cpu_neg(cpu)->icount_decr.u16.low >= tb->icount)) {
> +            /*
> +             * icount is disabled or there are enough instructions
> +             * in the budget, do not retranslate this block with
> +             * different parameters.
> +             */
> +            cpu->cflags_next_tb = tb->cflags;
> +        }

I can't see that this will work.

We've been asked to exit to the main loop; probably for an interrupt.  The next thing 
that's likely to happen is that cpu_cc->do_interrupt will adjust cpu state to continue in 
the guest interrupt handler.  The cflags_next_tb flag that you're setting up is not 
relevant to that context.

This seems related to Phil's reported problem

   https://gitlab.com/qemu-project/qemu/-/issues/245

in which an interrupt arrives before we finish processing the watchpoint.

I *think* we need to make cflags_next_tb != -1 be treated like any other interrupt disable 
bit, and delay delivery of the interrupt.  Which also means that we should not check for 
exit_tb at the beginning of any TB we generate for the watchpoint step.

I simply haven't taken the time to investigate this properly.


r~

