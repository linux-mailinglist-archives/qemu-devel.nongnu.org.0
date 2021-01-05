Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1C2EA408
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:47:57 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwdK8-0006zs-HO
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdJ0-0006UO-P1; Mon, 04 Jan 2021 22:46:46 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwdIz-000416-Cm; Mon, 04 Jan 2021 22:46:46 -0500
Received: by mail-yb1-xb29.google.com with SMTP id w127so28038649ybw.8;
 Mon, 04 Jan 2021 19:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dUPGdxZvCEgiC/9IMlcZ/Gc7IJ9FzEygfxIAYVc6z5M=;
 b=NtTvDaNpb8P2hdVkBxQOah2L7m9HEOE6owwGVCao04jviN2y02rAR7f+Iie/2kJuei
 Y4oKmmoy9MS8ZBBabixCZ/5yEBYvCCIKB1E/s8taFRvzL4wVW14usVZQnFlJDE1jSxYR
 e1UDaZmOH4RnDszI9TZqDpajiZlPKsEz7MdWuwNAG0ZS6nsrcXVNP24ci6QN9lDi3QIx
 EThm7I6X8VdZxRonkBYeLc3+W4qe45fOl7Bno3Quy4A011hpBWkx3kDwq9dXJ2X229C2
 +JPxwqA5N0pSbmf3Yd9ZRhR7I49RIyt3YqX0tzYHkuAdQ0Euywhb7BewlLzmskJxp6kJ
 AqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dUPGdxZvCEgiC/9IMlcZ/Gc7IJ9FzEygfxIAYVc6z5M=;
 b=Md44iGCw5L9X7HimJhqDwBdEfP/xeIUgIV6w6oe6l1mXwhypSVbXAR9UEngpqepFPS
 wg15o9xp8ujzeMvwyaXnpGQFXofI4V5BPLp9vlTc0qxwPgEOF9XeSwR/7/T3WXFb0Ui9
 k8o3dUYB/cPEvKGgX1OZC3Zk1tMZFHbCwbb2hRkkjATZRAdhhqgEe6ou/E/TCY1qxYY7
 zprCg98Q5O1EfDabEqDdAiv5rH3xEMfsNu33SFxNh57ND8lPdgCFXb6HNPXtIDl2GP92
 okI0R03AA79FdEUY66A2PVu2/CiQPKb7qd1L3GkqbA+CjSmSB52LPWQb96UcnEJUqUBx
 oKYA==
X-Gm-Message-State: AOAM531TTUq5wyUjovQYaK1eueX+4zvPeOfeZOIEFoa1o0IjKyyp3mWq
 fSx8o+0/Si5UKvXzQNq7a7lqfHki69uYp2OU70s=
X-Google-Smtp-Source: ABdhPJwaWP15ou7D05mH8GzKN+ghnsDuTxpxEW82JH4UccviOFX/3fQdy6Hj2fGSXaSMRX78v5yhBmU7/tEILwcoHcs=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr104098127ybi.517.1609818403975; 
 Mon, 04 Jan 2021 19:46:43 -0800 (PST)
MIME-Version: 1.0
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:46:32 +0800
Message-ID: <CAEUhbmUNHqL-y2G1qt7hnYwXV-7a_Q7DeEpLztbpa9n4rs7oEg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
To: Alistair Francis <alistair.francis@wdc.com>, 
 Francisco Iglesias <frasse.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Tue, Dec 22, 2020 at 2:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> When write is disabled, the write to flash should be avoided
> in flash_write8().
>
> Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - new patch: honor write enable flag in flash write
>
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>

Who is going to pick up this series? Is it Alistair, or Peter?

Regards,
Bin

