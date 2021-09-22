Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B1414817
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:45:04 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0gQ-0006Ig-UN
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mT0d5-0004NI-KM; Wed, 22 Sep 2021 07:41:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mT0d0-0006rI-24; Wed, 22 Sep 2021 07:41:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E26F161156;
 Wed, 22 Sep 2021 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632310886;
 bh=oAi+OsMtAqSHKW/FLc9QCL2v7Sz76bM4o7/zM79ZI3E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fD9xrbiZDXqMHnU3sNdb8buOacMVMwcksK5ipEPGXpPE9npKf82XGPXheKnJf90OT
 ecP/hHQee7wYzk8e4WRagtKLvAJnWkSMc4xehcEsyGHTP5a8wnPwPXN/WOc7OsFa4F
 3HFPwJp6dMOCtZoWWhx2D+/Vw+ay1XSQkgdRPgIbPxHkZ6ODaJBqJNfoA/mjpn7C2q
 CGRiDQIPZG3kIO7noO2dCbgSoejt7vB6ahvT+TXNAT+FOT5zQf46lB2mHNcUv+HEVp
 ZOabnAUrF8KokLusb+DUOWTmHbmGriHFkxSru02ID5TwxBozgjidAK5htLTfuBQp4H
 0OYW0+7Fk3qSA==
Received: by mail-oi1-f180.google.com with SMTP id w19so3926293oik.10;
 Wed, 22 Sep 2021 04:41:26 -0700 (PDT)
X-Gm-Message-State: AOAM530ph47GYkVtEb2kNi5JsCgzspg00nnZGwiMS6ZEXuS6UoVu19Xm
 AoEPtaqMaMUt7UHkHmYaaRv3vjh5y7vttLzj21k=
X-Google-Smtp-Source: ABdhPJxabQ/iF4lQEHQR+uyIE641khOWvkZqIZKJQYVKQY2NL5BzjUJibt3IjC6KqBSOItiUCKaMZQmA5r/d3EKJz/Q=
X-Received: by 2002:aca:3114:: with SMTP id x20mr7684255oix.174.1632310886338; 
 Wed, 22 Sep 2021 04:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
 <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
In-Reply-To: <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Sep 2021 13:41:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
Message-ID: <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 18:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> > I'd argue that compliance with the architecture means that the
> > software should not clear RES1 bits
>
> Architecturally, RES1 means that "software
>  * Must not rely on the bit reading as 1.
>  * Must use an SBOP policy to write to the bit."
> (SBOP=="should be 1 or preserved", ie you can preserve the existing value,
> as in "read register, change some bits, write back", or you can write a 1.)
>

OVMF preserves the bit, and does not reason or care about its value.
So in this sense, it is compliant.

> > but I don't think we can blame it
> > for not touching bits that were in in invalid state upon entry.
>
> SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
> PAN feature. It's just not the value OVMF wants, so OVMF should
> be setting it to what it does want. Also, as the first thing to
> run after reset (ie firmware) OVMF absolutely is responsible for
> dealing with system registers which have UNKNOWN values out of
> reset.
>

Fair enough. But I'd still suggest fixing this at both ends.
> Put another way, if you want to argue that this is an "invalid
> state" you need to point to the specification that defines
> the valid state that OVMF should see when it is handed control.
>
> -- PMM

