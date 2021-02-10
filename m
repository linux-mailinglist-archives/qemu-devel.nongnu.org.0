Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2283315CAB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:57:01 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ekV-00031Z-WC
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9ehk-0002Nw-SX; Tue, 09 Feb 2021 20:54:08 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9ehh-0006Rr-SK; Tue, 09 Feb 2021 20:54:08 -0500
Received: by mail-yb1-xb35.google.com with SMTP id d184so467800ybf.1;
 Tue, 09 Feb 2021 17:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cN56BOJXhKP4P5wkFt04MVAoX9JXBhqBaRniiTmR/PA=;
 b=vhG6mevCUG74wlQ4tg6BJgRWw6FhqEgSDwTjSRvMS6Mg9sZG1rJhu0i1e4aEAVlkMk
 Si5SOpJDZvLi31SB4vZBCWh1R9p0KMKR4FzUkKijhkH4HPkh9ClUUn8x8C+jnmCMlPhY
 JyKYAgy0SGGhFH09dEpjuzlpLyttG8b96yWrsXw0tZ93HrLrt0x7HGnJETu92PMP8uSd
 f532mIWBS36TKq7cglaOqlvZfgeGHwAp8OzfQqnuljQkyvUee9gNRSCTJa7/OPvZHXhw
 AqNq0Y53oyWpX8QN6j29Z/6qnJXDfHWlKQ6xCCXfRqqdlr0OJnq/OKCYUSD0eqTQZ6eG
 ESwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cN56BOJXhKP4P5wkFt04MVAoX9JXBhqBaRniiTmR/PA=;
 b=hRy4cfqPxStzyiUYkRSJ6cjZy7Tb9eQs/a05VM09+cM9HFHyyi4fH84CGO7fQA3uWB
 7LhgkTkz8ZaunCVXwrUZyZme+kT8H9tSKFNcPc+coIQ0daAFPSs4uPVwUSi75pvrGT7C
 Mh0a5/7celfs6EQcsHgJdLKRPI0kDxuXD2rxdodECkViifMJIwF4BLJFgVvJVHwB6ToR
 1oa6O2/57t2wKlyu9JnxZQVUVdfFaVczK5vzf+HsiEmFC1RWgGFt1hnl50mj0MPaOC/I
 jTLX/mFqvn6pNLRBmp+zVg1nsjEy7F4PndpGVMdriiV/xbI+WnIMzykVGaGw+bAfRDcZ
 eONg==
X-Gm-Message-State: AOAM532SlDR6jMoVu2Zidy8FnIhQinZ0NXgskkvQ2JNLj3MLPUnjaFdU
 2ZqNwqkKb8FnsGtfN/x+zgvnvPt7TBzdSSWz7YU=
X-Google-Smtp-Source: ABdhPJz71dwh38ubH3g43Q/BeGIc9PmuLvfDrLIne7BhfJD2JmVU8fayQl0lN/sXHekLnkUNOZiQfQzQ+k2w4E0hVSE=
X-Received: by 2002:a25:3387:: with SMTP id z129mr1104209ybz.239.1612922044444; 
 Tue, 09 Feb 2021 17:54:04 -0800 (PST)
MIME-Version: 1.0
References: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
 <20210210014159.GE4450@yekko.fritz.box>
In-Reply-To: <20210210014159.GE4450@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 09:53:53 +0800
Message-ID: <CAEUhbmWeH5CDRodyYtYs-f0G-SUdksop4MRiHTocntbcWM3rmA@mail.gmail.com>
Subject: Re: [PATCH] target/ppc: Add E500 L2CSR0 write helper
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Wed, Feb 10, 2021 at 9:50 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Mon, Feb 08, 2021 at 05:40:58PM +0800, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > There are several bits in L2CSR0 (exists in the e500mc/e5500/e6500
> > core) that should be self-cleared when written:
> >
> > - L2FI  (L2 cache flash invalidate)
> > - L2FL  (L2 cache flush)
> > - L2LFC (L2 cache lock flash clear)
> >
> > Add a write helper to emulate this behavior.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> IIUC, these are essentially write-only bits - they have some side
> effect when written on real hardware, but won't ever be read back.  Is
> that correct?  Do you have a reference to hardware docs describing
> this behaviour?
>

Please see https://www.nxp.com/files-static/32bit/doc/ref_manual/EREFRM.pdf,
chapter 3.11.2

> I'm assuming that because we don't model the L2 cache, it's ok that
> your implementation just ignores writing these bits, rather than
> performing the cache operations requested?

Yes, guests may read back these bits to confirm the operation is done
by hardware after writing 1 to these bits.

>
> Is that still true for the flash clear operation?

Yes.

>
> > ---
> >
> >  target/ppc/cpu.h                |  6 ++++++
> >  target/ppc/translate_init.c.inc | 16 ++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >

Regards,
Bin

