Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE692DA34B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:22:01 +0100 (CET)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowEC-00080L-TU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow8L-0002Cd-Do
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:15:58 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow8J-0004wG-Rc
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:15:57 -0500
Received: by mail-wm1-x343.google.com with SMTP id x22so15154191wmc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YdRomFYNz71mRROI/zWnZ5k5BVhigIVCQ3614qpGgS0=;
 b=MLu5wdJ6dCGpXKiTCuLizGc/yZ/NZLfE+7GPb1pI9lv3nvhMjiExjdap78Rt4GMTy9
 mnFTLDbhl8A9iJfI6X8Q25ADNIsC9UTEt5pDPhqMWWzcFRiyWY0CNc7+O0fzMQDdG2MX
 WKGnreIoT6n9E0EieWAJxQ/JA7R+63VZgkAMoXoQRwC8L5J2/PR8TtQkuDgh5pt3XsXU
 dnmCJi44+YtmHHwOiSalTEQhXK7XKn86h5d7BeXtadR0GhE9js3cTQohIOT/WD+lnlbF
 M1C8EvDfT/T0h7U3YTGhRi+hf1lMWRftOaGmNHu7eVZbwaooDZW0Curo1/eyPr2hGo4g
 j/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YdRomFYNz71mRROI/zWnZ5k5BVhigIVCQ3614qpGgS0=;
 b=gdK/3mpKgfhCHnNcnvZ4GfTWihxoE7DMdD4bynO3hl0Ysos6bfr3Xrt4rN683DfugF
 5r9gVOTilohOAm3yIEz7aylYqTfPm7fQaewyE5gb8n0o7wO/G/hviPeo+FgQa6vZOEAr
 2dUJf8MHH9qn06fiQTvxHTr9Q1QbrtY4sZTnEx9lAdUGFpDHfwcX9/XydhfxfyWIdQb0
 8Y4ImG54RCZejlMduWXEFhviK/Qhi84NFtoepzGriw7mf93qeMU4amyiw17ug8Ent8ct
 g2wdKIX0pR0DJhXQg4otvjuwLKq+7Apq6TB3xC4O503Zmpb+6Ku6aZw3GaYvMuEKkktL
 3wgg==
X-Gm-Message-State: AOAM5314gmn7Rgx6Ky10jFnvdlCwevwX3qk5nRsMeuxHWiIO6Mb5fbx7
 fSXeTZM/fp3fvWHaKA+9KuTvcfKR89g=
X-Google-Smtp-Source: ABdhPJySf+xiKp9lZlnH8n7K9/ho5N9CbbNl5YkCgBLElxkd5qjI/NLQjdkgjyTIlHyqHh2Xv0290A==
X-Received: by 2002:a7b:c088:: with SMTP id r8mr30240608wmh.45.1607984153695; 
 Mon, 14 Dec 2020 14:15:53 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l7sm32651391wme.4.2020.12.14.14.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:15:52 -0800 (PST)
Subject: Re: [PATCH v4 15/43] tcg: Make tb arg to synchronize_from_tb const
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92ed2d7c-32f3-2ef9-15c4-8ea85c2f6da2@amsat.org>
Date: Mon, 14 Dec 2020 23:15:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/14/20 3:02 PM, Richard Henderson wrote:
> There is nothing within the translators that ought to be
> changing the TranslationBlock data, so make it const.
> 
> This does not actually use the read-only copy of the
> data structure that exists within the rx region.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h   | 3 ++-
>  target/arm/cpu.c        | 3 ++-
>  target/avr/cpu.c        | 3 ++-
>  target/hppa/cpu.c       | 3 ++-
>  target/i386/cpu.c       | 3 ++-
>  target/microblaze/cpu.c | 3 ++-
>  target/mips/cpu.c       | 3 ++-
>  target/riscv/cpu.c      | 3 ++-
>  target/rx/cpu.c         | 3 ++-
>  target/sh4/cpu.c        | 3 ++-
>  target/sparc/cpu.c      | 3 ++-
>  target/tricore/cpu.c    | 2 +-
>  12 files changed, 23 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

