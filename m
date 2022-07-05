Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F4566086
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 03:11:17 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8X5w-0001H9-7q
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 21:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8X4C-0000ZT-PG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:09:28 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:56308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8X4B-0000Xj-0O
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 21:09:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7837661805
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 01:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D63C341C7
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 01:09:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FsK7DP57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656983362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzcxMdKKVB5MPbr08NS/+BDGtL7gxmGsmimRFoq7kSw=;
 b=FsK7DP57hFXraJN269nvX3gcrVGo0Io76cCdZsPys6X3WRJjhX1LyVWpaeN1rqBUFbMrTt
 6pyxnVew8AvatFpGUk9NB2zqiKrCFNZFYLnNh6sYiwzBVotiLTdgH2hIm6N1iT6qWAYRwY
 HgeieOS9f//1v+Nd64V8N+Jyf3buKP0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 02dcba55
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 5 Jul 2022 01:09:21 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id m13so9912403ioj.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 18:09:21 -0700 (PDT)
X-Gm-Message-State: AJIora+tmJk0vC4YpGxOHeCLCU4x5IuCH6L9JFnYbJ/Ea/z2g/mm+2ut
 OrXE1RZZ+0JXKCn1/i6gx6aAhZmppG0JmA/CBXg=
X-Google-Smtp-Source: AGRyM1uqNJqEscBLKapBUQgyIhwqMy+OcmJQQpkHwdta9vA/Ix8Xi6amS0mY5jcHcDWR6P0KH7HSyAnD5WuGjAFhQt0=
X-Received: by 2002:a5d:8582:0:b0:669:835f:48b0 with SMTP id
 f2-20020a5d8582000000b00669835f48b0mr16902071ioj.146.1656983360594; Mon, 04
 Jul 2022 18:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
In-Reply-To: <CAKmqyKMn+-FXacKrzB7FppQ5WEi-9h+-6w+Ev51j2Qoum4-QKw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2022 03:09:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
Message-ID: <CAHmME9rgMnAtPNDQ5hPrZ8ROd_Mgm4C+2PZioJ861HpcLfZL8Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org;
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

On Wed, Jun 29, 2022 at 4:09 AM Alistair Francis <alistair23@gmail.com> wrote:
> I have a Linux 5.8 test case that is failing due to this patch.

Before I started fixing things in random.c, there were a lot of early
boot bugs with the RNG in Linux. I backported the fixes for these to
all stable kernels. It's a bummer that risc-v got hit by these bugs,
but I think that's just the way things go unfortunately.

Jason

