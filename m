Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B322FC26A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:36:07 +0100 (CET)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yfW-00015u-3q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1ydu-0000Bc-EL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:34:26 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1ydr-0000uQ-DV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 16:34:26 -0500
Received: by mail-ed1-x533.google.com with SMTP id f1so9198236edr.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJRhZ5s8foOYpS5NZsJPtPD14OatqyMPy388lZf04Lw=;
 b=yEluQcnEBvsaqj+6UJkKU4CvIvwNoy/PeskntYP6teA/k6MtbrnrCc2M8D89+/tccQ
 AOHGbDdWMVAkAekY066SF9httg3fTGMgtjTOJEyRa2pno7hRz0l2njH6h9Sl1kCHVUxk
 GAdWL1cumqnqCo81UewFSoS1LRaU9l/nTyOs6mC+/FU5lKhWBaZQcn81N4xMWsdDu1Yt
 4eH6HY9S2XrI3yDNBbS4zKdqXsQ4/ZF9sLvBj8nUV8RZyzS2IF0OnlTFPtxtK5KJCG60
 E0l3PiabFzG28ZLkwAxrpox8c753r4ZOh4vmhZEvHTJp0Hmeiuyc5Ry+SLltKB++ZIfb
 /nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJRhZ5s8foOYpS5NZsJPtPD14OatqyMPy388lZf04Lw=;
 b=uGg/ro4moQ/4AYXW1219a7FxTy9o93Ron+Gpcnws7LDhpafInEr2fb4gFngBIgMumA
 wva3CaI8HizeMknLn2GY36JcLR6Wek+fMLWora9AdnHuqlHJJDALkGYfvasrvFD/P26n
 sa2gxJMPyGctNGwSY8f6IZLfxAQz1C0k/IPrYkgoV72uFzgHtqSksVzHVeIdpZ62gjfR
 bqPKYAkpqZqb7yEYDLM71WEJhYn1LRFNLwD4JEk21KhgROa2ecD9d4GBu1saaI1ATNnd
 0imDkjjp7tpYwe3P65m866+Zpp7PN3ZPJvD0RrQxeq5hcO3+Gr6l1BQQstjtg0MJ2rfW
 DbTA==
X-Gm-Message-State: AOAM533/dpq9fhuJB+jk2g5WIchdIX+TCQDMBDCUy7GyB4GQy0H4fOwF
 1OjBYiuUZudPzEP2pRU14MmSpi1wx72j0OEaQ2+Q7Q==
X-Google-Smtp-Source: ABdhPJwN4PN07/nmJveYtL1c9gR0Gjbkitv4/2b7Qq1TjmkeyEDmc3Ylos0tjGxi0y+RCh8tpZ2MVVV0cupzPSxoct8=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr4846086edu.251.1611092061093; 
 Tue, 19 Jan 2021 13:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-17-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 21:34:10 +0000
Message-ID: <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 18:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
>
> The current default action of pausing a guest after a panic event
> is received leaves the responsibility to resume guest execution to the
> management layer. The reasons for this behavior are discussed here:
> https://lore.kernel.org/qemu-devel/52148F88.5000509@redhat.com/
>
> However, in instances like the case of older guests (Linux and
> Windows) using a pvpanic device but missing support for the
> PVPANIC_CRASHLOADED event, and Windows guests using the hv-crash
> enlightenment, it is desirable to allow the guests to continue
> running after sending a PVPANIC_PANICKED event. This allows such
> guests to proceed to capture a crash dump and automatically reboot
> without intervention of a management layer.
>
> Add an option to avoid stopping a VM after a panic event is received,
> by passing:
>
> -action panic=none
>
> in the command line arguments, or during runtime by using an upcoming
> QMP command.

Hi. This commit message doesn't say it's changing the default
action, but the change does:

> @@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
>      "                   action when guest reboots [default=none]\n"
>      "-action shutdown=poweroff|pause\n"
>      "                   action when guest shuts down [default=poweroff]\n"
> +    "-action panic=poweroff|pause|none\n"
> +    "                   action when guest panics [default=poweroff]\n"
>      "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
>      "                   action when watchdog fires [default=reset]\n",
>      QEMU_ARCH_ALL)

>  RebootAction reboot_action = REBOOT_ACTION_NONE;
>  ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> +PanicAction panic_action = PANIC_ACTION_POWEROFF;

We used to default to 'pause' and now we default to 'poweroff'.

We noticed this because it broke an in-flight test case for
the pvpanic-pci device from Mihai (which was expecting to see
the device in 'pause' state and found it was now in 'poweroff').
Test cases aren't very exciting, but was it really intentional
to change the default behaviour? It's part of the user-facing
surface of QEMU, so if we did intend a default change that ought
really to be more clearly stated (and noted in the Changelog) I think.

thanks
-- PMM

