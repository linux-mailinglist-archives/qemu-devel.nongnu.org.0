Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71873CD4F4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:41:50 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Saj-0007Q5-Vj
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SZC-0006PH-Eq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:40:15 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SZA-0003ZJ-Gn
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:40:14 -0400
Received: by mail-ej1-x631.google.com with SMTP id oz7so24618073ejc.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2NDRc20ExGVEqn2aNwTWmLcC8dwsxyeBThAA5RF51wM=;
 b=huo6rf7AXZQYou9vVnKMWYuPFYoUWuZJfufmMGm1315vVzhuDgNEJRnzr8327eAn9v
 HwB+EQoXh0kFK54FZFZUeR+8JaSX5kGdqBzDiRxp84XBjWkRPohorRL8xrNpwJrMf5Ef
 srxLsmulujqUK1/DS3lXmtSXh6NUXMmJsGwVi/Q0Ko8iO4hv4dcXdX3TyQfoArbJmOdE
 yFDtk+NJ7hdVt5eC8AA6mrRHXohFcLliDH9DprpjaaiQPe+Fi9pOQW5OxFxVYj8UKBLD
 FUhPjLEywbs28sQxFPQWrp2vNlfP2l64HQCMgk1bJtG7DFg70inT7eLiZOzYhjCoVC8R
 f0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2NDRc20ExGVEqn2aNwTWmLcC8dwsxyeBThAA5RF51wM=;
 b=dQDpeGEG+BYcBjZzXqJPfK/KF7VwLQBTTLlMnt7zV4lxBN8iyUHld6PuFgcTtmQZvN
 CI74f/j4WO5nyNEZnH9aHSaw3UNLFAi/NPDC90/bBdjUP9Ybm4ZEVxwN4m4QO6B8zR4O
 mB8E7VWSmV0Qg3sRw9zINqDYQE2mF6ANAsJZxr9Ll+nFsADxVT9JwHYaxv+QLCmXhkpv
 z7dq9zrrA+DKptn8e4DREVg70io+ZqpHktvolVJuj6/C0+0ZD7uiY3v4sxBcyzoJikNN
 xD1sk+t5XBxQIQ8qk4l/TWvl3GDDcznZEtQdtK0m3KwuxIrWlfgpe1fN6bfwCdmnGQ5G
 l6BQ==
X-Gm-Message-State: AOAM530CnfWyoTB+K/3MayMbLtG8oRMrUI5Vjykqkxxk1yKY81lU11bB
 daYNAfIKhT9etpOVAZ5D2WlidbAsQ8/lYMmk2wnOhw==
X-Google-Smtp-Source: ABdhPJyt08Q0GkeCEeAgfSt+/RDHffy/SdV7uPy2vbvRExXrsYiebP2e5HNqPi+vdqG19PZt51OsS/vuWRfm33JsTcg=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr27266610ejb.482.1626698410986; 
 Mon, 19 Jul 2021 05:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-4-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:39:30 +0100
Message-ID: <CAFEAcA_hqt7R68nmuvaoAKAOqX6OA75dnymoYQ8h1chQjqC2hg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] qemu/atomic: Add aligned_{int64,uint64}_t types
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use it to avoid some clang-12 -Watomic-alignment errors,
> forcing some structures to be aligned and as a pointer when
> we have ensured that the address is aligned.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h |  4 ++--
>  include/qemu/atomic.h       | 14 +++++++++++++-
>  include/qemu/stats64.h      |  2 +-
>  softmmu/timers-state.h      |  2 +-
>  linux-user/hppa/cpu_loop.c  |  2 +-
>  util/qsp.c                  |  4 ++--
>  6 files changed, 20 insertions(+), 8 deletions(-)

> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 3aaaf3337c..82d8183821 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -82,7 +82,7 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
>                  o64 =3D *(uint64_t *)g2h(cs, old);
>                  n64 =3D *(uint64_t *)g2h(cs, new);
>  #ifdef CONFIG_ATOMIC64
> -                r64 =3D qatomic_cmpxchg__nocheck((uint64_t *)g2h(cs, add=
r),
> +                r64 =3D qatomic_cmpxchg__nocheck((aligned_uint64_t *)g2h=
(cs, addr),
>                                                 o64, n64);

This cast is OK, but it took me a while to verify that:
 * we check that 'addr' is 8-aligned further up in this function
 * we check that guest_base is at least page-aligned in
   probe_guest_base(), and there's no way to avoid that function
   getting called if you specify a guest-base value on the command line

Is it worth asserting that the value we get back from g2h() really
is 8-aligned before casting ?

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

