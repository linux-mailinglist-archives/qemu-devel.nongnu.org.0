Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CF58AF4F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:59:10 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1bJ-0005FQ-73
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oK1Ys-0001jy-68
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:56:38 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:42772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oK1Yp-0000D5-Lf
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:56:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A582B829E1
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 17:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7462C43470
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659722191;
 bh=YhasxSDyI4slT9TaDXzSb4BbP4M3MtpH6v54pjBX2W4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PstLtCc5O0uC1T8DlHcMLjKrIwGn7gcy26nVcRpgqudjKrFCsZDjUVR2X6+tVqdqB
 Ps+FXsvAvzZ4tqy0ll7WE3iP/NwOn1BNy4mtAC1EN4GyMA50X5o4Zrh5RfwrSQH5+l
 Z+CnZlSj7GK/rZC1aRR0xp/sUs4U6TNreXanydGVytFmEqyqiv5oDE2xhvCkLhQC2h
 MgjVxY46U8uOwX7JaptfRb3FVLkmVmVjyyoEN3k4YK/IZRpTy3HIlgU7vTKzkDB33S
 GICQGcxWAITrq1sUcU32Ch5CyRwkUIyxpVHs/soQ9NkBZc+Na7lNg1ic7+8/G2bpoy
 +pQqgvJLbdcfw==
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so3679982fac.9
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:56:31 -0700 (PDT)
X-Gm-Message-State: ACgBeo1A1s2kkyx44/e50TKTg9APjmqzfNAcbkK2cyE5GGpWjM4drE78
 irLc/H2vmgEjr0KM6Oxp9vAOwWVIYKprPtQ/6vI=
X-Google-Smtp-Source: AA6agR6oRpwKgaz40rV0PVZGx2D8+KdCC17YSjJKY2v1+hdVsQkJwoCMtY/US6zKxUSkFVTk/Yo0Hjk0eePeoLuFw1k=
X-Received: by 2002:a05:6870:a90a:b0:10d:9e83:98a6 with SMTP id
 eq10-20020a056870a90a00b0010d9e8398a6mr6781986oab.228.1659722191032; Fri, 05
 Aug 2022 10:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
 <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
In-Reply-To: <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 5 Aug 2022 19:56:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEmsDjStijJciuWjmugqAm8yvX_qihyg1Uah=V56mg2Bg@mail.gmail.com>
Message-ID: <CAMj1kXEmsDjStijJciuWjmugqAm8yvX_qihyg1Uah=V56mg2Bg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>, 
 linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ardb@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 5 Aug 2022 at 19:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 8/5/22 13:08, Ard Biesheuvel wrote:
> >>
> >> Does it work to place setup_data at the end of the cmdline file instead
> >> of having it at the end of the kernel file?  This way the first item
> >> will be at 0x20000 + cmdline_size.
> >>
> > Does QEMU always allocate the command line statically like that?
> > AFAIK, OVMF never accesses that memory to read the command line, it
> > uses fw_cfg to copy it into a buffer it allocates itself. And I guess
> > that implies that this region could be clobbered by OVMF unless it is
> > told to preserve it.
>
> No it's not. :(  It also goes to gBS->AllocatePages in the end.
>
> At this point it seems to me that without extra changes the whole
> setup_data concept is dead on arrival for OVMF.  In principle there's no
> reason why the individual setup_data items couldn't include interior
> pointers, meaning that the setup_data _has_ to be at the address
> provided in fw_cfg by QEMU.
>

AIUI, the setup_data nodes are appended at the end, so they are not
covered by the setup_data fw_cfg file but the kernel one.

> One way to "fix" it would be for OVMF to overwrite the pointer to the
> head of the list, so that the kernel ignores the setup data provided by
> QEMU. Another way would be to put it in the command line fw_cfg blob and
> teach OVMF to use a fixed address for the command line.  Both are ugly,
> and both are also broken for new QEMU / old OVMF.
>

This is the 'pure EFI' boot path in OVMF, which means that the
firmware does not rely on definitions of struct bootparams or struct
setup_header at all. Introducing that dependency just for this is
something I'd really prefer to avoid.

> In any case, I don't think this should be fixed so close to the release.
>   We have two possibilities:
>
> 1) if we believe "build setup_data in QEMU" is a feasible design that
> only needs more yak shaving, we can keep the code in, but disabled by
> default, and sort it out in 7.2.
>

As I argued before, conflating the 'file' representation with the
'memory' representation like this is fundamentally flawed. fw_cfg
happily DMA's those files anywhere you like, so their contents should
not be position dependent like this.

So Jason's fix gets us halfway there, although we now pass information
to the kernel that is not covered by signatures or measurements, where
the setup_data pointer itself is. This means you can replace a single
SETUP_RNG_SEED node in memory with a whole set of SETUP_xxx nodes that
might be rigged to manipulate the boot in a way that measured boot
won't detect.

This is perhaps a bit of a stretch, and arguably only a problem if
secure or measured boot are enabled to begin with, in which case we
could impose additional policy on the use of setup_data. But still ...

> 2) if we go for an alternative design, it needs to be reverted.  For
> example the randomness could be in _another_ fw_cfg file, and the
> linuxboot DMA can patch it in the setup_data.
>
>
> With (2) the OVMF breakage would be limited to -dtb, which more or less
> nobody cares about, and we can just look the other way.
>
> Paolo

