Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39691589BBB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:34:59 +0200 (CEST)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJa42-0000fn-9U
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oJZmL-0001Zh-Fg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:16:41 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:47704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oJZmJ-00081M-Lq
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:16:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 446BA61783
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A956FC433B5
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659615397;
 bh=ylX5TvV3j6D/3PNgjjVFZ8XJIszfvNtpvYJyO6MWB74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MWzg0Wn9L+HRdl6ind7nuh5aMjSbZrMFxrqCRVCDRkWPNJIyQvo4SXN59gPm3NnCj
 IPm1YTAZ0az6yN3sB7+6lAEo72rfPeLYIcPZhF/zroCfty12tcHg+jLodXX4C8YUn3
 GNT9EbT+iGKGOuuRhems+rBoNlA/RrQClTa7EHqvsmVP98J7lpq2f061RUupoBF4sj
 PQehCfB/+3JZhIBsX7LK/yDIkG6jwUOFb4aq6uNqA+/6NtN5Ozrwt0zD3kgc0pEtkH
 0gwYgYMfFTGb0KW3yDCa/xLbVN4OV9Hd43cnYXALizlOw/KN6uBcxtJ1tXcvkNEYB+
 GcJTQDjdWh/dQ==
Received: by mail-oi1-f172.google.com with SMTP id v203so2337130oie.10
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:16:37 -0700 (PDT)
X-Gm-Message-State: ACgBeo3Z/C3m2xYjks9VWAUYdPJR+Qr9vJe+nb6pXmAIVYEjBsfEEpMJ
 GEpJZasuVeMXI16TaHLY6C3y6wGUMhSz5SUlnoU=
X-Google-Smtp-Source: AA6agR5imbDAqwKCycIGCGe8+Zb2VBwMHNw5iTGf+N0g6gDs/ql1UNJdZhCl7JyYPsETSPX6IXsE/0fz/UVoBvinsuE=
X-Received: by 2002:a05:6808:16ac:b0:33b:32ce:edd8 with SMTP id
 bb44-20020a05680816ac00b0033b32ceedd8mr708838oib.126.1659615396761; Thu, 04
 Aug 2022 05:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
In-Reply-To: <Yuu3ee1iB3IoLdZS@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 4 Aug 2022 14:16:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
Message-ID: <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Laszlo Ersek <lersek@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
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

On Thu, 4 Aug 2022 at 14:11, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Aug 04, 2022 at 02:03:29PM +0200, Jason A. Donenfeld wrote:
> > Hi Daniel,
> >
> > On Thu, Aug 04, 2022 at 10:25:36AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > Yep, and ultimately the inability to distinguish UEFI vs other firmwa=
re
> > > is arguably correct by design, as the QEMU <-> firmware interface is
> > > supposed to be arbitrarily pluggable for any firmware implementation
> > > not  limited to merely UEFI + seabios.
> >
> > Indeed, I agree with this.
> >
> > >
> > > > For now I suggest either reverting the original patch, or at least =
not
> > > > enabling the knob by default for any machine types. In particular, =
when
> > > > using MicroVM, the user must leave the knob disabled when direct bo=
oting
> > > > a kernel on OVMF, and the user may or may not enable the knob when
> > > > direct booting a kernel on SeaBIOS.
> > >
> > > Having it opt-in via a knob would defeat Jason's goal of having the s=
eed
> > > available automatically.
> >
> > Yes, adding a knob is absolutely out of the question.
> >
> > It also doesn't actually solve the problem: this triggers when QEMU
> > passes a DTB too. It's not just for the new RNG seed thing. This bug
> > isn't new.
>
> In the other thread I also mentioned that this RNG Seed addition has
> caused a bug with AMD SEV too, making boot measurement attestation
> fail because the kernel blob passed to the firmware no longer matches
> what the tenant expects, due to the injected seed.
>

I was actually expecting this to be an issue in the
signing/attestation department as well, and you just confirmed my
suspicion.

But does this mean that populating the setup_data pointer is out of
the question altogether? Or only that putting the setup_data linked
list nodes inside the image is a problem?

