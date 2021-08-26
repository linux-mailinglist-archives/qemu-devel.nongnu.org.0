Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8C3F8A33
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:37:13 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGVE-0005zQ-9P
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGSX-0003w5-V4
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:34:25 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGSW-0007NF-IH
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:34:25 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bt14so6785019ejb.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4M2k49sKgs9+BYo+Q62pKMf6eC3jy/hgFeVkcKzM70=;
 b=fUoHR+1ouOlfg5SzRscasy6GZPdUxrHQPpGQH0dkhNJJP+ABgwW5thRy9VjkyYxxXa
 fBcefZUUys/Iz+7bOnm9KGW31pHZkQAQsHDVFidq4xu9caATmsAKILd/LPU4xG6qfnoT
 vTWtbe08QHeFVPAEIOCTEv2Yo7ysGiIBZMHkoMYT0vsfGWRgZkz5RbXSFlqMA4BTMBhG
 Ec2lnftlpiTOOZJx3rV8KBfkcMw4xRMDN/ouNYfwf5SkMEGYKQN2BB/p9J8HZFemas9H
 GRwe3i67IEhvXag3OVq5rdcso2NnXm+ZgkxHLveiqvajGAteWdNX/EEatNWGU7hyoIJK
 +xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4M2k49sKgs9+BYo+Q62pKMf6eC3jy/hgFeVkcKzM70=;
 b=WJHw4E0Ry+UyfPU3AKMD8jJxkyM0byduYI+C863Tm8fVkG0hXYLBA//zHq7TUXKKfM
 Q8t5a9hixCpz77VR09nipojLl5gPaeDE2wrzhZBAvAaaIWaAkpfZlqMKwFGfhy+7o8lG
 W7kDKgLjlH55GIH2Oc5iIST57J2+LdVZHjDg3FnMJ+s8Zau4MkdVcKUVrj3M+r4Mm3Tx
 qh1xM46U9P2CgPyab8tK9yekjGF3ATkJ5lKEX3eivBo+/tE02aCsK/HE9uuC84J+UypM
 eqZjeTWx+rTAaYRZiulSpvlVVqns9SA8pKGBeNyP9FsOfsgdpugqixqjmfCCEWA19Pld
 +dXA==
X-Gm-Message-State: AOAM5333RZjyKiyyf6dlwWcDnptXHcmg1Ti3ZrZd3XfGxljP9G2U5IsB
 kP35/gkZmr1Lv34VxrzdGGySG9UMnbKICAxVB4KtBtWIPVs=
X-Google-Smtp-Source: ABdhPJzYUicDmEasrZRgnJQWPggdUQXgQLNf/iJusUI2yb39F9M6JS0avXw0urKV6yoVXUQUwtLUs4DuiFXf60T9um8=
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr4657342ejb.85.1629988463274; 
 Thu, 26 Aug 2021 07:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210730105947.28215-1-peter.maydell@linaro.org>
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 15:33:35 +0100
Message-ID: <CAFEAcA-kqz9B9r4vA8X1EnU81LVX24W6Rq9B6H7bgHi0yzBW2Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/8] softmmu: Clean up arch_init.c
To: QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 11:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset does some cleanups of arch_init.c.  The bit I started
> out caring about was getting rid of the TARGET_* ifdef ladder (in
> patch 4 we make meson.build define QEMU_ARCH in config-target.h
> instead) -- this kind of ifdef ladder is nasty because it's always
> another place in the code that needs updating when we add or remove a
> target.  I think this was one of the last remaining "every single
> arch touches this" ones.  The rest of the patchset is stuff I noticed
> when I started looking at what else arch_init.c was doing.
>
> The graphic_width/height/depth target-specific defaults that
> arch_init.c does also look like they could use cleanup.  My guess is
> that we should instead have a per-machine default graphics
> width/height/depth.  But that's a separate thing and more work than I
> felt like doing this morning :-)

I'll take this via target-arm.next unless anybody objects.

thanks
-- PMM

