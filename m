Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889705AE72B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:04:31 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXJe-0005CQ-Jz
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oVWXx-0007V8-If
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:15:19 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:45244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oVWXu-0007i4-3V
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:15:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A2BA61483
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 11:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF42C43144
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662462904;
 bh=nUiApGH0uSeFnVB+5ZbA7Jv4yxXlBaHcqrChLH2CGf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=llc9WQlAP1IS9IXHo86fpb6/V7P1FTaMovG0odfmY/jB/vrAYnWsAdRxYL3WHvw1k
 7AFgh5qWM3mwiFUZBzGvDT57pvFrLht8p+M3GxgnHi8zeHPvtv7OAYK9T/gNamKoTf
 wtYT539iAPFe2K3nkaToZe/pBUPRWRaXlB7dvzhB4j5bqDaXis/QTdZ+6Go4dOn27T
 zNTYVNGRodYBFM0Xl+RBp7dKAaHfp9KCFs99EcIkasyGgKuQZ4lql3HRZwIybFLwa0
 Du6iDfuRGEnj4Kqtwj0ejLuSkXS+5xLHA3vjCCxtBFfMMOQmrsjZVrJN+kJX8/ZAWz
 O3aooR41DwuKQ==
Received: by mail-lj1-f170.google.com with SMTP id k18so11844646lji.13
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 04:15:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Rm9FW1liKEQp8Kqhq3UWMijSxgtNZ06nO8L/XgNN52Fg/7zDv
 oH1K7Ym177EImvP+QzvEGTF/j5cSAK3+r7jlEvY=
X-Google-Smtp-Source: AA6agR5xo8xGUCBRF3h73DQFT2lZt+wlJmnF/5imnhig8n7uzrqTnnS6bIJYGUIe0oeLFp2LnkHoKI1kejv3+Nmrybw=
X-Received: by 2002:a05:651c:1a0e:b0:268:94ad:85f8 with SMTP id
 by14-20020a05651c1a0e00b0026894ad85f8mr7830514ljb.415.1662462902437; Tue, 06
 Sep 2022 04:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
 <20220906064500-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220906064500-mutt-send-email-mst@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 Sep 2022 13:14:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
Message-ID: <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
To: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

(cc Laszlo)

On Tue, 6 Sept 2022 at 12:45, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
> > On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > > > It's only safe to modify the setup_data pointer on newer kernels wh=
ere
> > > > the EFI stub loader will ignore it. So condition setting that offse=
t on
> > > > the newer boot protocol version. While we're at it, gate this on SE=
V too.
> > > > This depends on the kernel commit linked below going upstream.
> > > >
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Ja=
son@zx2c4.com/
> > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > >
> > > BTW what does it have to do with SEV?
> > > Is this because SEV is not going to trust the data to be random anywa=
y?
> >
> > Daniel (now CC'd) pointed out in one of the previous threads that this
> > breaks SEV, because the image hash changes.
> >
> > Jason
>
> Oh I see. I'd add a comment maybe and definitely mention this
> in the commit log.
>

This does raise the question (as I mentioned before) how things like
secure boot and measured boot are affected when combined with direct
kernel boot: AIUI, libvirt uses direct kernel boot at guest
installation time, and modifying setup_data will corrupt the image
signature.

