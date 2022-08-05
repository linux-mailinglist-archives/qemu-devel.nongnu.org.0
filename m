Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8DB58AA00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:15:33 +0200 (CEST)
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvIg-00038U-Sb
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oJvCV-00066C-9u
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:09:08 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:60958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oJvCT-00081b-DL
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:09:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BFBCB827E7
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 11:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD08C433B5
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659697735;
 bh=ZcuouNC8ZXDndRo7t2WhXz91pYiZg16H4tHcWmF8PS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uMmxwp9koiNzLoat/TKcDdvo3RV5fBgkgMw4st/lxUIckFye1EVhhALH4lbJR2USq
 HpLsw5UyPqEYyluA4/Oq8gwibjA0ilVXWu9J/6raGLnGxMWh4jLrwp4pCy0R8ly88d
 d9doVs7FVtJk3Mm8z6I5yuUtlTGqbU5TYc563Sx7+tDaOu106I5fBj5h/aCUHz4E+N
 e7jkvR+94ywvucdOSinwpzDE+Ooua6V2hdimfSwH5dIefN6B1M2BysiDqQ8kyWNsGW
 rOxM8+5phDT1+TAyKgg5teMHUncgYf3HyADz8C44ZSd7SWOApOT4Kd4yojsJ6+00g9
 SWtd/ZCHN7ltA==
Received: by mail-oi1-f180.google.com with SMTP id t132so2321358oie.6
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:08:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo1ETvBvCMfy+QfjL0FhRln1/Web6tsEN7F/uNohlk7UJjKs5jrz
 ryDJ/33gDIHRHw3Pf/iZL5Y7hNepK9TWvOjcySs=
X-Google-Smtp-Source: AA6agR4KumACn6M4f/oVL9Nj6o4UHUDiWFXhYhiIosGm28Xoif/hJ249EGNnj+Fn+KFi+xjpgUnZcOG6ZeChWO4HymY=
X-Received: by 2002:a05:6808:16ac:b0:33b:32ce:edd8 with SMTP id
 bb44-20020a05680816ac00b0033b32ceedd8mr2758235oib.126.1659697734529; Fri, 05
 Aug 2022 04:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
In-Reply-To: <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 5 Aug 2022 13:08:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
Message-ID: <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org, 
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75; envelope-from=ardb@kernel.org;
 helo=ams.source.kernel.org
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

On Fri, 5 Aug 2022 at 10:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 8/5/22 01:04, Jason A. Donenfeld wrote:
> > +    /* Nothing else uses this part of the hardware mapped region */
> > +    setup_data_base = 0xfffff - 0x1000;
>
> Isn't this where the BIOS lives?  I don't think this works.
>
> Does it work to place setup_data at the end of the cmdline file instead
> of having it at the end of the kernel file?  This way the first item
> will be at 0x20000 + cmdline_size.
>

Does QEMU always allocate the command line statically like that?
AFAIK, OVMF never accesses that memory to read the command line, it
uses fw_cfg to copy it into a buffer it allocates itself. And I guess
that implies that this region could be clobbered by OVMF unless it is
told to preserve it.

