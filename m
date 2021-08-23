Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D93F4D71
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:25:56 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIBpj-0000dm-7D
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIBoQ-0007rn-GL
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:24:34 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIBoK-0004pc-Fg
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:24:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id cq23so26705668edb.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iyAYC9RN+9lBQIAbfVLcSBds/G54lZ6rxoaMkQ0DVAM=;
 b=IP3ggqsukFsyQvd085tX264U9mGoseI2K3ztdclDisPK/y1dCDdNCRIMktFymacNDN
 Z8u8IxrTQLs1maMEgCW32UGsx0nxVim0ZuegYhn/qlaw9k2Wo1GU7gUFOE5ZXPOkX0W2
 mscquJi1y9NOPeOw3f64+xkhCSWCSY4zk+IyNK5BUuDkSs6Wb192FONl3oZRvPpwHmDc
 XM5G2fwh/JQbF+nUf9cl3q6G4GN+PqMZURAg7YeO+P3Jwewg2m8P5nbr8+IwTLX3BNjg
 XRW7w5AcJP2taTVPfbLXmRNF8dzFoRuQzx11iBwNWqkPInNOTI+40FVrytylT2CmKiAS
 Veag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iyAYC9RN+9lBQIAbfVLcSBds/G54lZ6rxoaMkQ0DVAM=;
 b=NqWmd2z+VEZR6tuyIiDKnVB5tbmOwAwLino/H3pimR5dFDLa6mvO4k5s/1qprvGHW+
 PFr+jiHKgwJgtI9gXPTVfnYG+YST1gdU602jZI/9E6l+wcUvb8GMJFYpzIiqvIVgvMJn
 1Ht5MbOKpQWuBB9CzS+1sbVZQ1TN7gyrcA8Ym4CZ4poWuEOYfuU+My+xNTMHQCmDWHDk
 MdZsnirRWhgfl8kJBZt0sfbVkR60wifHIEKKhFM6h19dIzEWGA5yXS3PJ/kfXe4U4O+m
 hLGqJJCwvA83zwvupML03jJA8ghH/xcpIwsHtNxHmRRvGIQTipaLIj+0k+rPqWrYqFdY
 A1Dw==
X-Gm-Message-State: AOAM532IPW2nOLysVf1uEaXxEAm8zA4UhfLFQUBSvumliGpPlk32Nys2
 eezzfLjtal0tEom+OUwtwyRHHIAsx+hPNZ5fYLSZjg==
X-Google-Smtp-Source: ABdhPJzoPcoBK6IWJsYo0rLSA1C7+N2f/kE6l+HTOp1I3fcflrxGhX1ji1SbTaA5swHpI6Ub+NKugw44ut1cHOyMx2Q=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr26770811edp.146.1629732266936; 
 Mon, 23 Aug 2021 08:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 16:23:40 +0100
Message-ID: <CAFEAcA9AqV7BoyPVwuMUdcX2uHOCahPK2wZobOLpLqD3WM5FPQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 15:20, Changbin Du <changbin.du@gmail.com> wrote:
>
> To resolve the issue to debug switchable targets, this serias introduces
> basic infrastructure for gdbstub and enable support for ARM and RISC-V
> targets.

As I understand it, fixing this problem requires support
from gdb, not merely changes to QEMU. You would need to be
able to have QEMU tell gdb "the guest's endianness is now
little/big" and have gdb cope with that change.

> For example, now there is no problem to debug an big-enadian aarch64 target
> on x86 host.
>
>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

I don't feel like this is the right approach. QEMU already
knows the endianness of the guest at any point.

thanks
-- PMM

