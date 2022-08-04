Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20C589BAC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:26:18 +0200 (CEST)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZvc-0000u7-PJ
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZnx-0003Py-EJ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:18:25 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:35160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZnu-0008G5-Tb
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:18:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88ED8B8250B
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD74C43470
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:18:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CbPVy8dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659615488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vMn/hCMRgqyRF5OiL+CnB6rpk4e72FzWg7m17HZd/0=;
 b=CbPVy8dHdHHzk30wCQ3ZJPUsEVAQJ+zj/VMs6sqLidM8b/1gUqFf8eevd8sxcu0zb6Gres
 Eyc6gj1WDFpqqHYkeCXikoft/wCrWnPQcZI95nQMl5g6itK9qWCxM5SrZ5gXWbGVjDXXcu
 u55KdYzNpXsxAAhaqgveKk7Ter/FehU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7784cce1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 12:18:07 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-324ec5a9e97so114481297b3.7
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:18:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo2KJFxgZJL0DZc1923hxCiBwd4VVnqfCjHrDbUDE5Zud6sQ2Z/a
 j5rf0sL7Q27DbqAleksyaoaqSaHxlcHP81od8ks=
X-Google-Smtp-Source: AA6agR4/qEWxiWGUgHTJ0mtVsYhRZJ82Sv/FYZoI5TsQH65nMjnJ1Rt7GCdruhlbY3fMkJ9l4k8Jv/YoLTYOACxgiQw=
X-Received: by 2002:a81:59c4:0:b0:31f:4804:76ad with SMTP id
 n187-20020a8159c4000000b0031f480476admr1375391ywb.143.1659615486288; Thu, 04
 Aug 2022 05:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <YusVVLNbLgsk49PK@zx2c4.com>
 <20220804004411.1343158-1-Jason@zx2c4.com>
 <20220804030012-mutt-send-email-mst@kernel.org>
 <bfa5704d-755c-5a52-e7cc-bd9b34e5bb03@redhat.com>
 <YuuQb3D/YY1SiUqY@redhat.com> <Yuu1kX9CAqSUNNAj@zx2c4.com>
 <Yuu3ee1iB3IoLdZS@redhat.com>
 <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
In-Reply-To: <CAMj1kXFAz1ttRmt5_utReSC=TjdfmrgwbwSaAZTDnx6OPGuRRg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 14:17:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9pxrFpGWXiubxU9r2sDMV-P+QuDiZvw4OaSZvWOkDbyTA@mail.gmail.com>
Message-ID: <CAHmME9pxrFpGWXiubxU9r2sDMV-P+QuDiZvw4OaSZvWOkDbyTA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i386: place setup_data at fixed place in memory
To: Ard Biesheuvel <ardb@kernel.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Hi Ard,

On Thu, Aug 4, 2022 at 2:16 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 4 Aug 2022 at 14:11, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> >
> > On Thu, Aug 04, 2022 at 02:03:29PM +0200, Jason A. Donenfeld wrote:
> > > Hi Daniel,
> > >
> > > On Thu, Aug 04, 2022 at 10:25:36AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > Yep, and ultimately the inability to distinguish UEFI vs other firm=
ware
> > > > is arguably correct by design, as the QEMU <-> firmware interface i=
s
> > > > supposed to be arbitrarily pluggable for any firmware implementatio=
n
> > > > not  limited to merely UEFI + seabios.
> > >
> > > Indeed, I agree with this.
> > >
> > > >
> > > > > For now I suggest either reverting the original patch, or at leas=
t not
> > > > > enabling the knob by default for any machine types. In particular=
, when
> > > > > using MicroVM, the user must leave the knob disabled when direct =
booting
> > > > > a kernel on OVMF, and the user may or may not enable the knob whe=
n
> > > > > direct booting a kernel on SeaBIOS.
> > > >
> > > > Having it opt-in via a knob would defeat Jason's goal of having the=
 seed
> > > > available automatically.
> > >
> > > Yes, adding a knob is absolutely out of the question.
> > >
> > > It also doesn't actually solve the problem: this triggers when QEMU
> > > passes a DTB too. It's not just for the new RNG seed thing. This bug
> > > isn't new.
> >
> > In the other thread I also mentioned that this RNG Seed addition has
> > caused a bug with AMD SEV too, making boot measurement attestation
> > fail because the kernel blob passed to the firmware no longer matches
> > what the tenant expects, due to the injected seed.
> >
>
> I was actually expecting this to be an issue in the
> signing/attestation department as well, and you just confirmed my
> suspicion.
>
> But does this mean that populating the setup_data pointer is out of
> the question altogether? Or only that putting the setup_data linked
> list nodes inside the image is a problem?

If you look at the v2 patch, populating boot_param->setup_data winds
up being a fixed value. So even if that part was a problem (though I
don't think it is), it won't be with the v2 patch, since it's always
the same.

Jason

