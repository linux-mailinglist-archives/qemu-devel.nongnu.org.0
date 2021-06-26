Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584F3B4BCC
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 03:21:35 +0200 (CEST)
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwx0n-0005Zv-W8
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 21:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwwzC-0004k5-7T
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 21:19:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwwzA-0006A3-Pg
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 21:19:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6541055pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 18:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bfyx0/4gwhaYN1i8ELC4unM5BIWU8dI+bPxqAlBdkUY=;
 b=iRqKyZe9kEXkzPjMui0W8dL1G9ZXlVUHBFKbIAHYsR3O1TOO1gJC5AJvwyhrBrJ1dQ
 K2oHDAaUjLDj41SQRikLHfCUaRbgMtBKXrx18J4x4Df9/rpABNuEwp4KexIFU8QRUEDO
 0WldCHnS9ENuLh3Y2CUTcEpwuIqHIcLvQMUyEwAiOeY1bs6PvAm5VIyDSDDn8CyfK06x
 mHXVpU7G0k/QuuejMHXxyzcF9iGurB5DiBPLeXKjTxYeQF84I3pg6IltH1eAKBmO8ZsZ
 PgHFXupdziOqp/yTCA74sfSZMFq526KpIxwML+unUV1xIXvt3f/irfHHQ5y5YTGOIgXU
 tOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bfyx0/4gwhaYN1i8ELC4unM5BIWU8dI+bPxqAlBdkUY=;
 b=prwGkM9yCnXx9mcHRbIsdd4bqi29dKxPHFR7xjYXuyZ7BjmrzGyyYw2xeRP44yxfcK
 tlM+8bFH0DkS9DIU7QQlY8tc57gvigDMDU/NwNi+qWALC300RL3bs8bEzbXwQTTz6ByS
 74njaluP7cFQJAelPkK4Hx9GOiuPdK82pII7ulL6uI22vR11gQVCEZbsRTi3TmhIGVOk
 2O8ES2v8w6kqkosOtS0xAPV05RugVCPE4Y7/vDVrLDTW9cHoEDBRtIdma9fsXhpdbpna
 nnBG2wIzHLIfFiaR7dz0ngtIEkKvpUNFTLfEq8igDvEU5f+XLjpQlckq/vQgeB5humgp
 6CJQ==
X-Gm-Message-State: AOAM533TGJIOw74B/zZKLJDCP22OFLEZgNytH1lAwzz1fTOEL+OxiGGE
 X/Q5zcBzPmLuXAnOp/HwROXlUjxH5wp2Yw==
X-Google-Smtp-Source: ABdhPJzggif2vsvor4mgnCtG+SAlbn1HXHIiug70hw8VFY2pMc9Ym2lOCr4Qnu9ty3jlLu+bARUPNQ==
X-Received: by 2002:a17:90b:1295:: with SMTP id
 fw21mr13977969pjb.147.1624670390331; 
 Fri, 25 Jun 2021 18:19:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm6559026pgs.24.2021.06.25.18.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 18:19:49 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <ulrich.weigand@de.ibm.com>, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20210623145020.GA30585@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b24537e5-07f9-8a43-5820-ecc82ee84bdb@linaro.org>
Date: Fri, 25 Jun 2021 18:19:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623145020.GA30585@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/23/21 7:50 AM, Ulrich Weigand wrote:
> @@ -506,6 +534,7 @@ uint64_t HELPER(cgeb)(CPUS390XState *env, uint64_t v2, uint32_t m34)
>   {
>       int old_mode = s390_swap_bfp_rounding_mode(env, round_from_m34(m34));
>       int64_t ret = float32_to_int64(v2, &env->fpu_status);
> +    env->cc_op = set_cc_conv_f32(v2, &env->fpu_status);
...

> @@ -1875,7 +1860,7 @@ static DisasJumpType op_cgeb(DisasContext *s, DisasOps *o)
>      }
>      gen_helper_cgeb(o->out, cpu_env, o->in2, m34);
>      tcg_temp_free_i32(m34);
> -    gen_set_cc_nz_f32(s, o->in2);
> +    set_cc_static(s);
>      return DISAS_NEXT;

...

> helper.h:DEF_HELPER_FLAGS_3(clgdb, TCG_CALL_NO_WG, i64, env, i64, i32)

This won't work reliably.  You're writing to a tcg global inside of a function that says 
that it won't.

It's probably time to take care of

>     /*
>      * FIXME:
>      * 1. Right now, all inexact conditions are inidicated as
>      *    "truncated" (0) and never as "incremented" (1) in the DXC.
>      * 2. Only traps due to invalid/divbyzero are suppressing. Other traps
>      *    are completing, meaning the target register has to be written!
>      *    This, however will mean that we have to write the register before
>      *    triggering the trap - impossible right now.
>      */

point 2, by splitting the fpu helpers.  In the first part, take care of the optimization 
and suppressed traps, and return the register value.  In the second part, take care of FPC 
write-back, completing traps, and return any cc value.  Which you can then assign, 
properly, to the cc_op tcg global.

BTW, we can now improve fpu performance by keeping masked exceptions in the float_status. 
  Or at least inexact.  Once that's set, we allow softfloat.c to use host floating-point 
insns under certain conditions.  I'm sure this code pre-dates that, so it made sense to 
clear it all out at the time.


r~

