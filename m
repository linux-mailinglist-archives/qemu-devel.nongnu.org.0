Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A793623F6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:30:56 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQQp-0006Za-QF
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQOz-0005gl-VT
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:29:02 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQOy-0007QD-6U
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:29:01 -0400
Received: by mail-yb1-xb35.google.com with SMTP id x8so25396442ybx.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vo608acMwIoukPVjYtwQNghbjDddtmcym6Os8ZMP/gM=;
 b=CcsEmNNl0dEinhAraIkeHiTuOwouMQ06yJ+dF+kg98bF+NVk8ywTmmEoBmU6PZLlOE
 I75pojL6gGXY5QW2/n0q2LHQc6Gn/5YeeD9yfUdEU+9fDkoJ3w1PIH4rzFplxDWcbSzo
 advsQL61w6wfMF4CqMfyHmcXQ9zpgFhkh3JW0smM2Dbe7KUgztMR4lof4fOFelcod0Wm
 wW/1Gmljt6iGUyKa/wmwHelrciNNzKTI/22rv9a15YyQyI5zpJKIZTk/vgB5aBdczOMc
 T5aQDMOdJQ1rYiKjiYHsUePgOuOWqHknJDPJfkxInQ+tSUW0ymQ00H6XxHhwlO2uQvzl
 fBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vo608acMwIoukPVjYtwQNghbjDddtmcym6Os8ZMP/gM=;
 b=CISLFlLHFkgTJ5XEmaSP4+uuN/lEvVM+8AYZGva6dsvb9LrF3SmATYsuBX/thfNX5I
 CUxAS+ZhTWLCJS4wLVSaOCWvzgP0WU+1udlWaNDjTdWO8k+axi06aiLw35NL07EnaY3u
 YYWHuT26mIZtrCfG+XQFvFNjPX6vZ71b24y1747kq1T95++gm4sNfEqqf0/B3R2y/qaC
 tQMWM6+kmc5e6FR/4c8LF96CCoys339TKgM5rR/f/DOJZ34fI8W9phGKYMnv6FC8iqwC
 Eyk+diOKmH/OKShLkLokKDIm1JX/jY7p6UuXxo2sJttdK6d5kqho0qpgZSU7RL6YF0pz
 sGLg==
X-Gm-Message-State: AOAM530QRXJDNCQVevlyBZt7mcXLsQSP9nWNlIj9q61hi4OGW8dEAYLE
 9bvMaF/KwABHLKnciTR6Uq1NxQ9INfRw1TPNavbr7gU3UPx9lg==
X-Google-Smtp-Source: ABdhPJy+1YcvKYdScS8bO38Mxe+l7AnAmXy/YzmQLUND32KbcgFRb9uUC7QYbPX6bFR5bNhiTKFRE7M+C3hO52W8x08=
X-Received: by 2002:a25:8b08:: with SMTP id i8mr11767330ybl.370.1618586939006; 
 Fri, 16 Apr 2021 08:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210416152429.91832-1-ziqiaokong@gmail.com>
In-Reply-To: <20210416152429.91832-1-ziqiaokong@gmail.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Fri, 16 Apr 2021 23:28:48 +0800
Message-ID: <CAM0BWNA87STu36XpjSrgvrPXBipXyC6WRe9+B=OOxVofkh4Nsg@mail.gmail.com>
Subject: Re: [PATCH] Set the correct env->fpip for x86 float instructions
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sry, the second link is duplicated. It should be
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg00307.html,
which is my previous email.

Ziqiao

On Fri, Apr 16, 2021 at 11:25 PM Ziqiao Kong <ziqiaokong@gmail.com> wrote:
>
> Hello, everyone!
>
> This patch follows https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html and https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html
>
> It's my first time to submit a patch to qemu. Any advice is highly welcome!
>
> Ziqiao
> ---
>  target/i386/tcg/fpu_helper.c | 4 ++--
>  target/i386/tcg/translate.c  | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index 60ed93520a..e8cbde4e1a 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -2395,7 +2395,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
>          cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
>          cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
> -        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
> +        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
>          cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
>          cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
>          cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
> @@ -2404,7 +2404,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
>          cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
>          cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
>          cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
> -        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
> +        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
>          cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
>          cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
>          cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 880bc45561..cc4398f03b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto unknown_op;
>              }
>          }
> +        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
> +        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));
>          break;
> +
>          /************************/
>          /* string ops */
>
> --
> 2.25.1
>

