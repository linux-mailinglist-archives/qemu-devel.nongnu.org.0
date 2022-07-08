Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912756B617
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:58:24 +0200 (CEST)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kkh-0001fc-0x
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org>)
 id 1o9kj7-0000yM-H7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:57:07 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:37680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org>)
 id 1o9kj5-0003Py-Jy
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:56:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 413186209D
 for <qemu-devel@nongnu.org>; Fri,  8 Jul 2022 09:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFAFC341C0
 for <qemu-devel@nongnu.org>; Fri,  8 Jul 2022 09:56:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FOxkhe1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657274190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KBThYpJRzgSzwAltGZiAXTNlEQjJH/rlZ3O2Wc5Mtk=;
 b=FOxkhe1Sot3X6TtXODMwr6VuF9tQ7ZxgzjkIB+3A9PNs+S42IEVLs3+LyvBUjBj9r7muwi
 mTArMe6AgVHNDC5c8iq6mugtLpU7Rqjpw9SOfKsAWDCvUZuI0kKvzJhJNTqaSliKZpP5Tm
 jSVV2MFuCVFgsDoXlKpht9XXgNo5SAM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1f8d40f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 8 Jul 2022 09:56:30 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id 190so3132932iou.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:56:30 -0700 (PDT)
X-Gm-Message-State: AJIora+Gi6n//IET6dAd0v7EKCQ06Xfq07O62DOtjiBAuuKiHjznpkOK
 +sS0J0VQ2WwtFEjE7KJf+mkkD1dSFUh/UaKydoE=
X-Google-Smtp-Source: AGRyM1tchVIKnpvh4MGtQeX85MY7xxcKaZUQdmCMGsQJ1/qgvAfjl+Q6QKqa7li90RLOCKhDKwHeeufFJyOsPk2ieJw=
X-Received: by 2002:a05:6638:2104:b0:33c:be1e:8d67 with SMTP id
 n4-20020a056638210400b0033cbe1e8d67mr1701350jaj.196.1657274190025; Fri, 08
 Jul 2022 02:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:16cc:0:0:0:0 with HTTP; Fri, 8 Jul 2022 02:56:29
 -0700 (PDT)
In-Reply-To: <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
 <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
 <YsYxM6gmJf7y/nJc@zx2c4.com>
 <CAKmqyKNUC+eiXLqqwSC3AjmqUtBc8p59mAHdumZ2oHiCT8aT0A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2022 11:56:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
Message-ID: <CAHmME9o1AaNHacHV8O0Ni+AHdYeQZ9xjt-ygc-wwU=Vu97juCQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

Hi Alistair,

On 7/8/22, Alistair Francis <alistair23@gmail.com> wrote:

>> > but I think that's just the way things go unfortunately.
>
> Hmm... That's a pain. So there is a bug in older kernels where they
> won't boot if we specify this?
>
> Can you point to the fixes?

Actually, in trying to reproduce this, I don't actually think this is
affected by those old random.c bugs.


>> As for your 5.8 issue, I've been trying to reproduce that to understand
>> more about it, but I'm unable to. I've been trying with
>> nommu_virt_defconfig using my patch ontop of qemu master. Maybe it's
>> possible in testing this out you were testing the wrong branch? Anyway,
>> it'd be nice to get this queued up...
>
> Hmm... you can't reproduce it?

No, I can't, and I'm now no longer convinced that there *is* a bug.
Can you try to repro again and send me detailed reproduction steps?

Thanks,
Jason

