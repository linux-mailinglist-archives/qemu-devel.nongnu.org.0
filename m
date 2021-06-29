Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E854B3B74BF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:55:11 +0200 (CEST)
Received: from localhost ([::1]:54920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyF8o-00083z-H5
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyF7M-0006m6-2E
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:53:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyF7J-0008LJ-Rq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:53:39 -0400
Received: by mail-ej1-x62c.google.com with SMTP id o11so23694534ejd.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8uD2h7i6sSc0Co3UlGNA2qZ3q1sZSH/aQ7KlydqUqqo=;
 b=kpU2ehLF8+FisTl5Dm1+RHWTwT9tEr1KmAe7gETCGUPzI6BEkjtdEONoZGlwjKboJ0
 KM2Bw5EFxvIaNtRlyFk4PeVKvh2m3DGtO0P+K3ElZRtnphcRIM6noefIAIX9A9p0cuiC
 Eq+Q6cOCfs512P+1r8ZadRumoh70W9qA4KVEnkwELGUCjyUIZkSsLV/jm3PiW5pWleXW
 8fx11ScnW4Hd4om9U1pcfl7V6pRiGGeobbj3D/3OH/QQ7nd+KU5Y4uyuag7oRjxyUMJf
 5i9Wtvg9TaXYU8qH7nJEdhJKkvvXHC359RGzkHIwyTBfQ4ZzosxpOAK6NR5Mrwl7/09n
 Z/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8uD2h7i6sSc0Co3UlGNA2qZ3q1sZSH/aQ7KlydqUqqo=;
 b=UUXxfXz2MqX0nRssmicP6Wdc4QNh34Tg5aNLH85A/AMf8ms0RWfAP2h8jKJw0rvHKh
 gjvgueo4XY8137OEedPsqXTMFhfzWXeDFjDlwbJ36vhyIw637FueqwgzylaUdY55d5LA
 AjyXAxKDr5ztS/S3/rglfBE5UyD5sUkN0qX+jbZ8d5m5Vwo6FF4diq4FNCX0y/BaIIrA
 08W487v4uCuKEQVgoJDe+hGuJwgiGnnU1T31zidgqQqxJIi4WNQ5KwqYWS8GEAbPIi02
 qs0Z9UWa11C5/YYOnb4U4J8UEOFr5ckQfKSOucp1b/ZnPW7kQ5ECnptswtawUx/RZ88G
 NkpQ==
X-Gm-Message-State: AOAM53007xV1fUoCbBS3UrykKr3wmjdKg1l0ANJQIBYm8N5rzT59UqKl
 1NXfyIZjaFeqpQrhMYzC/vxc9Wc6DzozgJt0HECc/g==
X-Google-Smtp-Source: ABdhPJwtPADG3bP/DaDqN+squl0T+L15CDtJPfuyekmKx4lrY0DIiZ6FHduQ+oSRKErDLRQ/UXykx6BdLN5VHmWI2CU=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr30981221ejb.56.1624978415566; 
 Tue, 29 Jun 2021 07:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-18-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:52:58 +0100
Message-ID: <CAFEAcA9znbPzn3mgm411ghK2gGYGX9ZqmRbaarJnQ9-D3eO6Tg@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] linux-user/ppc: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the two signal trampolines.
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ppc/target_signal.h |  2 ++
>  linux-user/ppc/signal.c        | 34 ++++++++++++++++++----------------
>  2 files changed, 20 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

encode_trampoline() returns doing nothing if its first argument is zero.
It's not clear to me why it does that (it seems to have been that
way since the ppc signal handling code was added in 2009 in commit
bcd4933a23f1db). Is this because in some configurations there is no
NR_sigreturn syscall, only NR_rt_sigreturn (or vice-versa)? If so,
it would be better to handle that by not setting up the default_sigreturn
pointer, and assert()ing that it's not NULL if we ever try to use it.
(I would vaguely have expected that to result in NR_rt_whatever not
being defined, rather than it being defined to 0, though.)
If there is no way that the first argument to encode_trampoline()
can ever be non-zero, we should delete the unnecessary if().

thanks
-- PMM

