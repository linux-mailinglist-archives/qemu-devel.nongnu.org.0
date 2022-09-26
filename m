Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F25EAF4E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:11:42 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsZw-0001v5-UU
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocrbV-0006Mi-Lw
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:09:13 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocrbT-0005eL-7K
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:09:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B72B1B80AD9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 17:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3002AC433C1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 17:09:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="a9/BtV31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664212144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mMILdeMHxEpKlFchIgasxuEW8ZX4KifeK31b7eN5JZk=;
 b=a9/BtV31Sbf2IODg8eu00HAYtnzYNhHhmWf2BBKcvZx/YDnyhHnP5rNFgOc7MPQogXsKK7
 kQkQWLXMpGsmyBuAmTxFvgXFm5xdC5kr0tBmVE0IJfW+x5zUQ8BGsEPWpUcSyqJ48tw/q7
 JdElYWNytXCSsWjAwzPqk1GuUAy+x1s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 766aeaf5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 17:09:04 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id o123so7250166vsc.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:09:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf3j8ttUvxQJCEOCKrdcQ7oUT+fHsPVKUe5YcCkdumb/NS7qnocY
 uM0slyQxDbilsuB/P87RjDX72ONXpKn92FakQz4=
X-Google-Smtp-Source: AMsMyM5L0PVUjSyF6RE40bTkvdlht524RYcFzQxqjHcwTudCraGcRyTCTFVtUEl6x81e6iW4NqVlp5bKqnLt37OWHW4=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr7487910vsb.55.1664212143339; Mon, 26
 Sep 2022 10:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220922152847.3670513-1-Jason@zx2c4.com>
 <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
 <CABgObfbBMVnn29uwQETFUSCKQybzzHKRsL6EEq=-sK663dwxew@mail.gmail.com>
 <YzHQ8PnBS/FM3aEh@zx2c4.com>
 <CAFEAcA-Tg-mTqe4BwGxuETOkO0ntnUwqvda+-CQ2hjdZqHJ4aw@mail.gmail.com>
In-Reply-To: <CAFEAcA-Tg-mTqe4BwGxuETOkO0ntnUwqvda+-CQ2hjdZqHJ4aw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Sep 2022 19:08:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9pLfE0wcFcaT=wOWAnX8GgJW=L4tqixkz0AbBVoCfWttQ@mail.gmail.com>
Message-ID: <CAHmME9pLfE0wcFcaT=wOWAnX8GgJW=L4tqixkz0AbBVoCfWttQ@mail.gmail.com>
Subject: Re: [PATCH] x86: re-initialize RNG seed when selecting kernel
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
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

Hi Peter,

On Mon, Sep 26, 2022 at 7:05 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 26 Sept 2022 at 17:53, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On both x86 and dtb-based archs, the seed in memory is zeroed out by the
> > kernel after reading. So, as far as the guest is concerned, there's
> > forward secrecy. Except! Except if the guest has someway of
> > re-requesting that seed from the host. This patch prevents that from
> > happening through fw_cfg on x86. Somebody told me last week that device
> > tree archs don't use fw_cfg, so this won't be a problem there. I haven't
> > yet looked to verify that yet, though, or looked if there are other
> > mechanisms.
>
> I am leaping in here with no context, so I may well have
> the wrong end of the stick, but:
>
> "does this system have a fw_cfg device" and "does this system
> pass a device tree to the kernel" are orthogonal questions:
>
>  fw_cfg, no device tree: classic x86 pc; arm virt board when
>    booting UEFI firmware in the guest
>  fw_cfg, device tree: arm virt board booting a kernel directly
>  no fw_cfg, device tree: arm vexpress-a15 board (or any other
>    just-emulating-hardware machine type)
>  no fw_cfg, no device tree: arm sbsa-ref board (and probably
>    lots of non-arm architecture machines too)

Okay it sounds like I've got to look into this indeed (as my "yet" in
the previous message suggested). Specifically, the case relevant to
this discussion is device tree that goes through fw_cfg. I've got a
few other investigations I'd like to do over there anyway (looking
into how reboots work), so I'll send a series for that when I've got
things worked out.

For the time being, though, this x86 work here is independent of that.
But I suppose you can expect to hear from me not before long about
device tree things.

Jason

