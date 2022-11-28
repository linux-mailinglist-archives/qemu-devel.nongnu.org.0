Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48063A61D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbPi-0005RM-4x; Mon, 28 Nov 2022 05:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozbPN-0005Pk-ST; Mon, 28 Nov 2022 05:30:45 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ozbPL-0007Lo-Ex; Mon, 28 Nov 2022 05:30:40 -0500
Received: by mail-qv1-xf33.google.com with SMTP id d2so2093622qvp.12;
 Mon, 28 Nov 2022 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HIYPM5WN/VZEe3M2N08bdFCIxAodQPToARtTSvgikmg=;
 b=CBBLFhdlHGjy33f0cqBjRSafvrvCBwwTm96DcDXZKrJooyOzmd21NjZ1d6ixfPnj3S
 s1nffH0WTiF+hq4VdTjd/Y2XtmgSehDCurvGhJVo4wowfefaDkUj2SEOl2IHSpGfC1FO
 O5DHEebqOMbry6+Ez6yKzYl1qmxX2hGEWT8coCuuuBihT2azqKLWXIcgqs1QWylKNnMf
 WwxZRobSCLE6tzuHc7iU0vBY8myd4q052JlFZUjTLP15tPs26cmHrqpaav58HF6V6tOV
 VZIj4JZGXT9n2qR6LGQpoxeyrRUUFv6akNroluMqX89qHc1iJZl7ypwgukbVmfRCRexg
 M9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIYPM5WN/VZEe3M2N08bdFCIxAodQPToARtTSvgikmg=;
 b=ZATKrY5Leg2OUIrphmNoSPRUdnBjvkTA5XhYWwefnZK4EnaEwmcGnWCzalv++y0w88
 FVmBxTtzubW7AgCSnUWiZwy7w1evLVZcpMumeEwaDRcOIHanR1ZtflNiLykk2U0ndvMb
 UIDEi1NIN6iO7qAL1Ucrz0tPWORu1NJy8NGq2oyQDFBo2CrHyJStKIqCD2kjBKla/uxw
 WGS38RsyJJ332fABYp009KbotPn/6+jFElAbEWrV+h8CXkrgV6oKgwi0jrw9/UW8KR0f
 41kSqvdsVwRKTMtBTx8qgA8HAIeuoyZbeowJ8cQPOy7YXLjimvWyhzF8+PpTIJ3jR1SL
 KlqA==
X-Gm-Message-State: ANoB5pm3udxMrb/+8lmcNT0ecW6dU905fEwfOCtC2DENrwfxrWTcF3+7
 shQ9A8+0KyL20jfxqtY6ALnpfxI9M387xS9/8rqaF/tQ99c=
X-Google-Smtp-Source: AA0mqf48r8BJvBXEJfgNkOF+IpyLNWBp5DiZY9ubi3YePYY0vTfPtQZWej3N2X9m0NHveApgiUMAyDj2G5bMNuhRdeg=
X-Received: by 2002:ad4:5808:0:b0:4c6:bcdd:3164 with SMTP id
 dd8-20020ad45808000000b004c6bcdd3164mr26506286qvb.12.1669631437339; Mon, 28
 Nov 2022 02:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20221127165753.30533-1-jim.shu@sifive.com>
In-Reply-To: <20221127165753.30533-1-jim.shu@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Nov 2022 18:30:25 +0800
Message-ID: <CAEUhbmXb-QZ8uoEd033D+4KHsDAZFMRtSrRj1X6LPx7+jrpxbw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 12:59 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> If the number of interrupt is not multiple of 32, PLIC will have
> out-of-bound access to source_priority array. Compute the number of
> interrupt in the last word to avoid this out-of-bound access of array.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/intc/sifive_plic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

