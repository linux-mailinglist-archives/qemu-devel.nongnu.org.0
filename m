Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA82EFF32
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 12:43:22 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyCeP-00088c-2X
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 06:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyCdf-0007iY-EO
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 06:42:35 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyCdc-0002mc-Lj
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 06:42:35 -0500
Received: by mail-ed1-x52a.google.com with SMTP id dk8so13947319edb.1
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 03:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DuLlZSMnxcDOx5RLu530nC1WDuGWSgiQy48iaLLFXbU=;
 b=V1vNbK6yw8+GPIa75JvFQgOAKACSEb4ouIfMf9LACfRPZ+/lqgJKnHHkSgQYre3z7r
 EYx7Du5JzuuxLOmxMy7uqu/R3yUzFOYe4x/EykruUMKvqSogz8B4IrszXFUr7IhQHMoS
 jLgOWuIuCBF3Y9jn8KZje2vEfZc65VV2HbtPHUWgGX9iakfw4gxElignh9pGOW0Dhk5/
 1l19TSbVQEShp3b+XP5cohGqcfrUpzM8o+ix89TCQIBmeAdXlfoOGXmESYV6bZb77kTW
 qsncBo4GQrpRTocFKLsVjNUbYIRewYtBbe/c9LQG3V4fGtK+nl7/IZidbdmGuowVMbIL
 fs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DuLlZSMnxcDOx5RLu530nC1WDuGWSgiQy48iaLLFXbU=;
 b=qTZ/E9Rvm8CrOWAjOW5322ACy1szpWRWAnclMGZzgWmLoCRQpFbjJnk8NyphOcusi9
 2VIxRW8r2IcaZhYL63KaQtLc7EsSWT136ZH5s4/ae3l3fY6Ie2BH8dKgUH1raZIXzYZD
 5Gg5PvTs9VRJcvPZ3bRQHNKnmPLChSVaO/rgghW5TOQIdaB45hqHGLgK3MEK4AeodfAK
 sFh0p7PNWlFFafrvqfWebLP1JJg7QMg0zfd3zShlQn5Fwpo7N0XEWjGRWKeZHRqheLwS
 a2MoZftcLjx2TiHFIcb6abL/VYoCAO1h8jDur5eee40FWiAIMeXGxarccdZk/RDjMenR
 9iXw==
X-Gm-Message-State: AOAM533Pc4z+1YedyL59rWFqzCSCB0gUUwPGmCOwrdpLTuvJXApXvsKy
 34JEefgbInsZYpQFLHEeWM7XEVR3oWfqnBUtQwlVsw==
X-Google-Smtp-Source: ABdhPJxjUdXOKaj7UO6uieju8aIYnlzW5jfKWS4kdGa9naU7fGP7Dn4KHCkoMQlBWErakf3K6c9GDr8zJdA0RYZ+bZY=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr8011199edv.100.1610192549865; 
 Sat, 09 Jan 2021 03:42:29 -0800 (PST)
MIME-Version: 1.0
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
In-Reply-To: <X/lDozXFWfR4AZAU@SPB-NB-133.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Jan 2021 11:42:18 +0000
Message-ID: <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
Subject: Re: [PATCH] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Hill Ma <maahiuzeon@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Jan 2021 at 05:49, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> On Fri, Dec 18, 2020 at 06:13:47PM -0800, Hill Ma wrote:
> > This prevents illegal instruction on cpus do not support xgetbv.
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> > Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> > ---
> >  target/i386/hvf/x86_cpuid.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
>
> Hi Hill,
>
> I'm sorry for delay with the review.

So, hvf added a third use of inline asm execution of "xgetbv" to
the two we had already. Now we have:
 * this in hvf
 * a use in tcg_target_init() in tcg/i386/tcg-target.c.inc
 * a use in init_cpuid_cache() in util/bufferiszero.c

Is it possible to abstract this out so we have one version
of this, not three ? I note that the other two got the "avoid
executing an illegal insn" tests right...

thanks
-- PMM

