Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0B5AE89B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:42:44 +0200 (CEST)
Received: from localhost ([::1]:41592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXud-0001bk-5G
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW40-0005kb-Go
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:44:18 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:52972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW3y-0001Wc-FV
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:44:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0810AB816E9
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C235C433C1
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:44:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I92v0Om/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662461048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xE0GuiCBZyZpTZHlkdbx9inomTHslIR/gBc0JUpscG0=;
 b=I92v0Om/Nvy3J7kH23wERmc6781+AkDv0uL2V8jRXJdq46Wi2KIYnKP8igVGR8EmiQQVJC
 c6HVvgIPHsI2Nswg5JI/FtbI6azEusd0pD072c1/CY+rqMjWdy/DwlQ7qB1mJMbxCnfLaV
 3jUGg857q0k68lXyPCgGfNkWa9E5lQg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7386f96
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 6 Sep 2022 10:44:07 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id k80so4858820ybk.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:44:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo0LEBM726gd8TBocFTJhkZP7GQ9f+CECbYm4zNMFJBNj9STXfKF
 bdoZSbKxy5gE1HQEBdmcovKltyVU5FcY2xkOpqQ=
X-Google-Smtp-Source: AA6agR6cbcJ5i3rMNgzNyIPiqFVFGYv48IkKvLQPX+oIUHJi7Dacd1HKlli/uudCkLqjibJCwwiXq4m4KQFhnDJN+Gw=
X-Received: by 2002:a25:be42:0:b0:695:e187:4e51 with SMTP id
 d2-20020a25be42000000b00695e1874e51mr36995203ybm.258.1662461046623; Tue, 06
 Sep 2022 03:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220906063954-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Sep 2022 12:43:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
Message-ID: <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > It's only safe to modify the setup_data pointer on newer kernels where
> > the EFI stub loader will ignore it. So condition setting that offset on
> > the newer boot protocol version. While we're at it, gate this on SEV to=
o.
> > This depends on the kernel commit linked below going upstream.
> >
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@=
zx2c4.com/
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> BTW what does it have to do with SEV?
> Is this because SEV is not going to trust the data to be random anyway?

Daniel (now CC'd) pointed out in one of the previous threads that this
breaks SEV, because the image hash changes.

Jason

