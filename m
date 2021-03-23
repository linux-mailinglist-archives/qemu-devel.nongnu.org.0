Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC24345C5A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:56:55 +0100 (CET)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeiU-0000tk-MC
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOegp-00005F-2x
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:55:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOegm-00043z-Dh
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:55:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id a7so26313920ejs.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlQ1M49uwiBqU7zJK9Oe0O7XmS+lsIGXoNikxB4ENiE=;
 b=aIzl71VE0wJsfa+7IuYWxc3qG5K+RR/zuQtqlNsj6r3oOIghAvES3UbEa+DbS8EM69
 RsGyJyJYvKaLVMJYq2zc5s2srIiSN5qa0K0F3zO85ffwIRu+lzirAg9ind8SjxDI1XcZ
 SUOlGAYyEbo783OT04DkDPpBPMSukd3otDdwxc7HVfiBfmabVss3GK/k8uHjFoYGy2ye
 YOrpceSmaQM0lCHxC5bQU/a/9HoR3ODpAYl2Jb6epGO/Mxt+yRBQcCoZAFFWHAJ5doG0
 Jo6igH7KDg5XgppNkL059srfWaEoTUNv0uQ2oiLC1NtS+RpOIM59W0toOmRnkX7s8ZW9
 E7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlQ1M49uwiBqU7zJK9Oe0O7XmS+lsIGXoNikxB4ENiE=;
 b=Bp9Uq/UaFnDLq4EUnocs7dJ+9sqEwhUnVodYGLzOOn2fQNXYQG4BSVTulo+EIt7Kyx
 jBsWqNbfJN/7bncUI0NMT+2ZS6iS4MvOOba6FI/5ewXmJypC41OCHWecgfQzJnWS1yTv
 4CWrX1Sh9oh6OtGfZOqSaQ9OrU0tWWlZlNKWZz94h7YKNXx04vtzfaEvkKOvl6OQOjo9
 A4a73t/liB0uOGvxwWRmxNVgTiSl8ICO/95WuBeEw67K/9Cpyzoh/AnFj1yYFhHdJYPc
 B/0YzGef/8y+rgl9nr+XX9iI9X61klQL4lCvGQjar5FHX8w5pl1ueLE28LRkeIa1Xc3H
 +NiA==
X-Gm-Message-State: AOAM531y4O2XDg+0hQ0Gu9aJtxlriq28c1qwa9O1RpgQteJ+BzPz3WPM
 TUTuFk0/bqjtsUudcK8mSBKnVjJo58yB+zXK8K69rw==
X-Google-Smtp-Source: ABdhPJzfkm3O4hzhHDjsKHmuryVdkqchVMihpbDpZ3GAYUxsNwrApyd9oIjL+7XB0oLw3KdRUJ21XiqAgEw8NLKd9p8=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr4205769ejz.382.1616496906251; 
 Tue, 23 Mar 2021 03:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210322201336.9539-1-peter.maydell@linaro.org>
 <20210322183320-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210322183320-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 10:54:37 +0000
Message-ID: <CAFEAcA9zUxUQN5CnJMx+P2gKOPwLwend17XWotKMZPSrhrBYbw@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Arnd Bergmann <arnd@arndb.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 22:35, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Mar 22, 2021 at 08:13:36PM +0000, Peter Maydell wrote:
> > Currently the gpex PCI controller implements no special behaviour for
> > guest accesses to areas of the PIO and MMIO where it has not mapped
> > any PCI devices, which means that for Arm you end up with a CPU
> > exception due to a data abort.
> >
> > Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> > like this return -1 for reads and ignore writes.  In the interests of
> > not being surprising, make host CPU accesses to these windows behave
> > as -1/discard where there's no mapped PCI device.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> BTW it looks like launchpad butchered the lore.kernel.org
> link so one can't find out what was the guest issue this is
> fixing. Want to include a bit more data in the commit log
> instead?

The link in the LP report works for me, I can just click
straight through.
https://lore.kernel.org/lkml/CAK8P3a0HVu+x0T6+K3d0v1bvU-Pes0F0CSjqm5x=bxFgv5Y3mA@mail.gmail.com/

It's a syzkaller report that the kernel falls over if userspace
tries to access a non-existent 8250 UART, because it doesn't
expect the external abort.

> > Do we need to have the property machinery so that old
> > virt-5.2 etc retain the previous behaviour ?

Musing on this after sending the patch, I'm leaning towards
adding the property stuff, just to be on the safe side.

thanks
-- PMM

