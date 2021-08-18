Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A23EFFDB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 11:04:00 +0200 (CEST)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHUM-0002GZ-NX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 05:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHSP-0001Wy-CV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:01:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHSI-0005Kw-Sp
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:01:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id u1so1163746wmm.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wemKHuxJehp7H3Q+ne0HF7UiqSMXcdsad78Ol718BYo=;
 b=QFoafkygnjJSKBS6NV0QZ9nhRAkY5UaRruWXfAstL3B+ndGFZfR3Tqe19OCPBvIb81
 Qg85mSrOeSVK1+AYcT/etE6VFn4R2J3vGrCxyFtXdFG2GRbR/YkblaF77NlKWRGjKMLY
 LeKckgDrtMDgCOoeHGzUG+yhsyROLOIxJOmE1FOkU+CV9BVJOU3wod2zzCMlf+PT7Jxa
 SSSUZSLzIvKIRH8yNZ5ajJFkGJZJ1n9cXSKk4FNUebW0mmVeCUjBBrPUzwqd+7nfbOzH
 WFt6hO1mBlfh+V1iKGu0GkiBxVzwJ62AJA2wCoHd1YuE+42PFXv+uND4fCC7NzzMUODh
 XoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wemKHuxJehp7H3Q+ne0HF7UiqSMXcdsad78Ol718BYo=;
 b=qsZEbbMSKnQvHlmMR1ML4+zTG6byQtLIjhJsIFLqLh23JSdK3iL09RS56uXq6A4W6s
 24S51IlgdU2SgMHXdraVRLWv+0I8VsPXMq30bLk4IcbRlpQH1BKBnlIWZMO+LrfDCpVe
 3QsXMGTIuIC2B64EMCN2kAmeIz3tvt9GLzBQkdW9GF0L8WfWYKaIHNJc5UY3tES2lOU/
 oVGcWTsUUDNjD63qoUiBGFRAhuDJV1xUydwBqlXRlA8GaFMy/2L9lwrU+oqyFbkOHXkr
 Tu7YhqbqXA4AqkwTEd9ENl0HetuXQT81Oiw6fWI2XRVmSypa9/60GKjwA2DedoEY0xs0
 fptA==
X-Gm-Message-State: AOAM533EkP2Yhz4aNemjs4v2b+LKvFH39mp4g3nB2U09gb/XZNwxvL0e
 /SwWGrwQO2YQf8SRl/S4yp8=
X-Google-Smtp-Source: ABdhPJznrOgpAOlxCrFdTehwX6izYhCxjGjUKGtiIZGnWZ7L4dJmr/92YnaUkyvDlqYlZ1JFJakOfg==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr7453553wmh.91.1629277309483;
 Wed, 18 Aug 2021 02:01:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d4sm5219931wrp.57.2021.08.18.02.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 02:01:48 -0700 (PDT)
Subject: Re: [PATCH v2 34/55] accel/tcg: Add cpu_{ld,st}*_mmu interfaces
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8feb6f2d-1c20-8f2f-d387-5e1d77be007e@amsat.org>
Date: Wed, 18 Aug 2021 11:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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

On 8/3/21 6:14 AM, Richard Henderson wrote:
> These functions are much closer to the softmmu helper
> functions, in that they take the complete MemOpIdx,
> and from that they may enforce required alignment.
> 
> The previous cpu_ldst.h functions did not have alignment info,
> and so did not enforce it.  Retain this by adding MO_UNALN to
> the MemOp that we create in calling the new functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/devel/loads-stores.rst |  52 ++++-
>  include/exec/cpu_ldst.h     | 245 ++++++++--------------
>  accel/tcg/cputlb.c          | 392 ++++++++++++------------------------
>  accel/tcg/user-exec.c       | 390 +++++++++++++++--------------------
>  accel/tcg/ldst_common.c.inc | 307 ++++++++++++++++++++++++++++
>  5 files changed, 722 insertions(+), 664 deletions(-)
>  create mode 100644 accel/tcg/ldst_common.c.inc

>  Function names follow the pattern:
>  
> +load: ``cpu_ld{size}{end}_mmu(env, ptr, oi, retaddr)``
> +
> +store: ``cpu_st{size}{end}_mmu(env, ptr, val, oi, retaddr)``
> +
> +``size``
> + - ``b`` : 8 bits
> + - ``w`` : 16 bits
> + - ``l`` : 32 bits
> + - ``q`` : 64 bits

kinda unrelated to this patch, but what would be the pattern
for 128 bits? ``o`` for octoword?

> +
> +``end``
> + - (empty) : for target endian, or 8 bit sizes
> + - ``_be`` : big endian
> + - ``_le`` : little endian
> +
> +Regexes for git grep:
> + - ``\<cpu_ld[bwlq](_[bl]e)\?_mmu\>``
> + - ``\<cpu_st[bwlq](_[bl]e)\?_mmu\>``

