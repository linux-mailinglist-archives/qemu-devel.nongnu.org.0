Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348805F4174
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:07:06 +0200 (CEST)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offlQ-0002Qk-RL
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org>)
 id 1offf8-00077O-8B
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:00:34 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org>)
 id 1offf6-0003M5-2z
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:00:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4256161349
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 11:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC44C433D7
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 11:00:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HBj5U5E9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664881226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=33xAjSTlT8yo7B4PB4F3fzcn/MxFN1GGOxhCh/Q94p4=;
 b=HBj5U5E9vRwTIpyIdjB6LQZNZsd4VVFPjsfA1vjFZUq51vv5fWbP0dWE9hkH38BVNRi5Nr
 XgM+IrjoNloPb6RS2Yw/TGPYOU4deTAOUQ++gzgR7kFMRyA3qRD9I/p5BC7gxK4Bwx7u0k
 UQ5LCZ7yoFy3vQ7ekaJsKC8Ku3UOOSA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6fd15345
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 4 Oct 2022 11:00:25 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id n186so8367069vsc.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 04:00:25 -0700 (PDT)
X-Gm-Message-State: ACrzQf12uZQWqHAHf4avwFqAYCkHEhqxrQWl0MVf/IFMjIKVqxQhkBi5
 Kjehn3Y1BNed4mfQosLx3kW1oI4B8ifQScSVS9g=
X-Google-Smtp-Source: AMsMyM7Qx26gj7qCWi9bt6IDbGEUxdlQa2pgmjhq9p7sTq7gDQtVkPEAq9VP92DDLO075vlsE4aMVjrWcciuq6acm+M=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr9183504vsb.55.1664881224459; Tue, 04
 Oct 2022 04:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
 <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
 <YzwM+KhUG0bg+P2e@zx2c4.com>
 <CAFEAcA9KsooNnYxiqQG-RHustSx0Q3-F8ibpQbXbwxDCA+2Fhg@mail.gmail.com>
 <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
In-Reply-To: <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Oct 2022 13:00:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9petsgk_2qpKqD3RKfDpQWKYGDJmWstuxn_hbo44yMHMQ@mail.gmail.com>
Message-ID: <CAHmME9petsgk_2qpKqD3RKfDpQWKYGDJmWstuxn_hbo44yMHMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=YHNL=2F=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Tue, Oct 4, 2022 at 12:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > So, as you can see, it works perfectly. Thus, setting this in QEMU
> > > follows *exactly* *the* *same* *pattern* as every other architecture
> > > that allows for this kind of mechanism. There's nothing weird or unusual
> > > or out of place happening here.
> >
> > I think the unusual thing here is that this patch isn't
> > "this facility is implemented by u-boot [commit whatever,
> > docs whatever], and here is the patch adding it to QEMU's
> > handling of the same interface". That is, for boards like
> > Malta the general expectation is that we're emulating
> > a piece of real hardware and the firmware/bootloader
> > that it would be running, so "this is a patch that
> > implements an interface that the real bootloader doesn't
> > have" is a bit odd.
>
> Except it's not different from other platforms that get bootloader
> seeds as such. A bootloader can easily pass this; QEMU most certainly
> should pass this. (I sincerely hope you're not arguing in favor of
> holding back progress in this area for yet another decade.)

Also, in case you've missed the actual context of this patch, it
happens for `-kernel ...`. So we're now strictly in the realm of QEMU
things. This is how things work on all platforms. If you use
`-kernel`, then QEMU will put things in the right place to directly
boot the kernel, or pass some prepared blob to an option ROM, or
whatever else. This isn't related to running `-bios u-boot.bin`,
except insofar as U-Boot can implement the same thing, as I've shown.

Jason

