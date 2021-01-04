Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0232E993A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 16:53:38 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwSAr-0001eJ-GC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 10:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwS9g-0000pq-30
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:52:24 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwS9a-0002vs-HT
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 10:52:23 -0500
Received: by mail-ej1-x630.google.com with SMTP id ce23so37392506ejb.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNmtiEXw0p5LzgHqN+TQ3esT0GI5K9vd80M0gaqPntA=;
 b=OkJS5qdsYWG2OWxi0vrDbxNP9pK57y/x7fKbWugM/eMra1BUEJloBLad2thy80sgQ4
 30/1WcWn8A6ZNqIJfwV4paG1hOgvJMpdDQKT+XoMkxgZDm3R836OQuGW/YPFtT9SmKEV
 MOzfaRQ8IwC0l5HO1tyrihKTjP4A+Ka4B+VYxmaVZAVvtbqhHKrb7LETjADlhxaVxNTD
 6pJu1e43WZN/FwupkK/h7lhRyAtCvXLRRYv+7gmN0r2XAaCmcKkPU28tQLDiFSuwci9I
 Ms1kU7Iz64NCfM0aq80C6xIhekYvNfiOQjr2owkjrCR84LOkTzm2i/VJH8akxirmHZIl
 +lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNmtiEXw0p5LzgHqN+TQ3esT0GI5K9vd80M0gaqPntA=;
 b=BWGge4HnBjXG3m+tYaiCxhDrhoUSsReFPr6ysjvjqhcRuXqar1Gg0XpbNkY257iQRP
 BCHL6ZSA/g/U372tlwGb3Jdo9Puu33Pl68pO2pKsKKmC4bp/XuZ4d9in2s7FML8/A9rF
 7npmb9RtmVxWvtJ4dG+96UT35WMoidaM5VGOKAgTNJ+kxWelO0hSNcRhRhVroMoL4L5c
 I4pE/cQp4y1A+eZroK9dAzpErF/qFJmmv4M3KILHINkJ6LifFNR7MFV0psoOd5St/C9q
 dtLxG0nLdsGLIS3vEkBtVUldOO5VqaROA6lwGCFC9ApMJKs1arPN5pQNYHAe6T+ceuxg
 BeQg==
X-Gm-Message-State: AOAM533ISyDRDm/4Oh3NoVGOyS/JFmRzJL37RglAJgAm9xssKtOgJott
 PfloYOJe9FTDR1tI2pdW36r44iL+hgHJ78XqvTGXJQ==
X-Google-Smtp-Source: ABdhPJwm/7e9/8jVIwAEslGdaybGENbS+2fGZJSAX1J4Ptym8urP4TX8HPlPBAbUc3krJ4gOTatKcsLh7oVO5Zud/K0=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr42067193ejf.85.1609775536880; 
 Mon, 04 Jan 2021 07:52:16 -0800 (PST)
MIME-Version: 1.0
References: <1395127548-32670-1-git-send-email-kraxel@redhat.com>
 <1395127548-32670-2-git-send-email-kraxel@redhat.com>
In-Reply-To: <1395127548-32670-2-git-send-email-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 15:52:05 +0000
Message-ID: <CAFEAcA--LaTy3P+o8DJXzaLj72RGdZQ1rVr1nzw+WpBObEU3gg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 1/1] ui/vnc: fix vmware VGA incompatiblities
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Peter Lieven <pl@kamp.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Mar 2014 at 07:26, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Peter Lieven <pl@kamp.de>
>
> this fixes invalid rectangle updates observed after commit 12b316d
> with the vmware VGA driver. The issues occured because the server
> and client surface update seems to be out of sync at some points
> and the max width of the surface is not dividable by
> VNC_DIRTY_BITS_PER_PIXEL (16).
>
> Reported-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Hi all; I know this is a 6-year-old patch (now commit
2f487a3d40faff1 in git), but I was just looking
through some header file dependencies, and I noticed that
hw/display/vmware_vga.c includes ui/vnc.h, and that struck
me as pretty odd... I'm sending this email in the hope that
people might remember something of the situation beyond what's
described in the commit message.

> ---
>  hw/display/vmware_vga.c |  3 ++-
>  ui/vnc.c                | 10 +++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index bd2c108..6ae3348 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -25,6 +25,7 @@
>  #include "hw/loader.h"
>  #include "trace.h"
>  #include "ui/console.h"
> +#include "ui/vnc.h"
>  #include "hw/pci/pci.h"
>
>  #undef VERBOSE
> @@ -218,7 +219,7 @@ enum {
>
>  /* These values can probably be changed arbitrarily.  */
>  #define SVGA_SCRATCH_SIZE               0x8000
> -#define SVGA_MAX_WIDTH                  2360
> +#define SVGA_MAX_WIDTH                  ROUND_UP(2360, VNC_DIRTY_PIXELS_PER_BIT)
>  #define SVGA_MAX_HEIGHT                 1770
>
>  #ifdef VERBOSE

Here we pull in the VNC header in order to get the definition
of the VNC_DIRTY_PIXELS_PER_BIT constant, but I don't understand
why. The hw/display code should be agnostic of whatever the
UI display front-end is. Why does vmware_vga.c need to care
but not any other device?

Moreover, looking at the vmware_vga.c code, although the
SVGA_MAX_WIDTH value is made to be a multiple of VNC_DIRTY_PIXELS_PER_BIT
(which is 16), there seems to be nothing preventing the guest itself
from programming the device to some other width that isn't
a multiple of 16. So either this device needs to guard against
bad widths generally, or the problem is really in the VNC code.
I can't find anything in the vmware VGA device docs (though they
are pretty meagre) suggesting that there's a requirement for
the surface to be a multiple of 16, so I think that the VNC code
needs to be able to cope. (This should be no different from any other
display device model setting a non-multiple-of-16 width.)

So my feeling is that this vmware_vga.c portion of this commit
should be reverted, and if there's still a problem with non-multiple-of-16
surface widths then it needs to be handled in the common or VNC
specific UI code...

thanks
-- PMM

