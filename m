Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434A5F1FD1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 23:35:24 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oek8o-000775-MI
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 17:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org>)
 id 1oek6u-0005GT-Vk
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 17:33:24 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org>)
 id 1oek6s-0005Y3-SW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 17:33:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05223B80920
 for <qemu-devel@nongnu.org>; Sat,  1 Oct 2022 21:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B85C43470
 for <qemu-devel@nongnu.org>; Sat,  1 Oct 2022 21:33:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FSJ86M+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664659995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCqDv1qIFwr7qk8/RW2THguPKAV1YNvQXitrNSGz7kU=;
 b=FSJ86M+WD2yc0Qqr1ClwLFUL+VW0n4sczeYQ2YqBQpitH3KXmkm1uSAyl2tUVYnFpcsI1y
 GDZ6OykjH8lBhxpWiXW7L4k//jAYnrnEQ42/fJoPKDvNLy7zyR/PR71Konw2CREuw+z53A
 SWvF176NYZ9FY8f9SUFq6bonquEoMfY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3bcd48e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Sat, 1 Oct 2022 21:33:14 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id bj3so726027vkb.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 14:33:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf3lnaNysYcPiFryFvYnVDedsZddXNHwM5IRZi9zWo+Q/wKTcf3X
 pRB1qG7InGaaudpDfQIEgOB3gn0QGcjfdGGqVQw=
X-Google-Smtp-Source: AMsMyM5Mv8sWi6dBUIowC4RsM2XkofAO2tFoOSS7rOSGTSqTYo0FtLByU7KZ5favj08KanMCTfiOzRRbv2RnaW/7tNY=
X-Received: by 2002:a1f:24b:0:b0:3a3:ad4:a3b2 with SMTP id
 72-20020a1f024b000000b003a30ad4a3b2mr6854392vkc.13.1664659993213; 
 Sat, 01 Oct 2022 14:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140520.576374-1-Jason@zx2c4.com>
 <YziPyCqwl5KIE2cf@zx2c4.com> <20221001213204.3362db80@nbbrfq>
In-Reply-To: <20221001213204.3362db80@nbbrfq>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 1 Oct 2022 23:33:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9r9j5F7uS83sHk_9E5Y9vRzAxbcKMgZJ8me14RP11=o-A@mail.gmail.com>
Message-ID: <CAHmME9r9j5F7uS83sHk_9E5Y9vRzAxbcKMgZJ8me14RP11=o-A@mail.gmail.com>
Subject: Re: [PATCH qemu] mips/malta: pass RNG seed to to kernel via env var
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: f4bug@amsat.org, aurelien@aurel32.net, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=SdrU=2C=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Sat, Oct 1, 2022 at 9:32 PM Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
>
> On Sat, 1 Oct 2022 21:06:48 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> > On Fri, Sep 30, 2022 at 04:05:20PM +0200, Jason A. Donenfeld wrote:
> > > With the kernel patch linked below, Linux ingests a RNG seed
> > > passed from the hypervisor. So, pass this for the Malta platform, and
> > > reinitialize it on reboot too, so that it's always fresh.
> > >
> > > Link: https://lore.kernel.org/linux-mips/20220930140138.575751-1-Jason@zx2c4.com/
> >
> > The kernel side of this has now landed, so we can move ahead on the QEMU
> > side:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=056a68cea01edfa78b3474af1bfa39cc6bcc7bee
> >
>
> s/a RNG/an RNG/
>
> What about rngseed=""?
> len=min(4711,0)
> hex2bin(..0) will return false so ok.
> rndseed="0" is problably fine, but is it worthy and desired? 00, 0x0.
> Other than that, sounds plausible. IMHO.
> thanks,

Not sure I understand the substantive part of your message. You're
wondering whether it's okay to ingest length 1 (or one half?) inputs?
The kernel will take whatever the firmware gives it; that's by design.
The firmware in turn provides whatever it can, optimally 32 bytes as
QEMU does with this patch.

Maybe you could use some more words to describe what your thoughts are?

Jason

