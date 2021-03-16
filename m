Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720133CAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 02:41:18 +0100 (CET)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLyhx-00027I-4q
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 21:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLygd-0001X0-Ig; Mon, 15 Mar 2021 21:39:55 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLygc-0002Yw-12; Mon, 15 Mar 2021 21:39:55 -0400
Received: by mail-yb1-xb32.google.com with SMTP id u75so35159852ybi.10;
 Mon, 15 Mar 2021 18:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsIV/qjZQhQ3kCe9THkG/oB8EBNrJR2jDOkT3SpO/2s=;
 b=mdM2SHQSGP8oT8sxwXwAcO4Svlmuk56RBDqDlzZOy76eqa9w219BXGQ08EZtLVGuny
 xoL7IwFE8V32YcJCtc47ROVMmXTBCY2a9cCDaf/TdK6ZuBeFHiiTpYV7PLPIMYDOuDqY
 4nFTwW/teOEqtLAedBn37KvJ21HSpTNwvHYa/aFmXo31AoQBfIAica+PL3OKtdmNbpmQ
 4LcVYL2XDpim+05Ku7cNXhNq4lo1J95zQ3yi5WXB8L7ILZSprKIUnDABBEX3f4EkaFr6
 UsuCHNozJWY276rE3WybnCQkr+KQIctrRyEDP633xRcHSNIgCslAb3YhE3kVlAqY9/cC
 NAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsIV/qjZQhQ3kCe9THkG/oB8EBNrJR2jDOkT3SpO/2s=;
 b=UppwpDhciHar5LyFM3YNI3QIUV/6LWpiwY8Foq3w8b6RQ0/wTg0w0qNqriXug3JyGU
 DktwQ4hkUliZRwKw2ZS9Sp0ki8H5wJ8bRp0KVppkAEZvv43ItSHSz7SsCi6poU8gcFWq
 x24giRgoM6eBUeNzxyU285jBs8Td2pir1p8lDtQCwzVzhxbX9qT3qp5IQkeikQrhChx+
 JsADiqdzVeJjS53b0dWk7Bcxkte8A8NveAWuOw6qEe6EyOHiGHyPb9g6VqvznHBj+ZzZ
 YKouq7WtZMaHYbu+Dr19KoaxMG0LLN3w8aUliyKSAHh2WUUUhy75csOTTlj3zZvTg9jl
 49vw==
X-Gm-Message-State: AOAM532SmvKOcxdQvfP6j2mgG7MzgWqkQlfJ7z4HokYccM0bNtzsoVrw
 Fp2buOa1RomivfORipiqMqndAvzwq6K/xvLiLjU=
X-Google-Smtp-Source: ABdhPJwmxcr0RRdEzYOox8FUpp5a+lLFrbcrcP0m1pmyqErs2EuBQwwBG6TJR+9TntB0Q/qcCvMTWEYZy5dKDBFWENA=
X-Received: by 2002:a25:d08d:: with SMTP id h135mr3776021ybg.122.1615858790161; 
 Mon, 15 Mar 2021 18:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210306060152.7250-1-bmeng.cn@gmail.com>
 <CAEUhbmVQZpT1bXkmV==rXqaq5u+oqPd4fT5LROUCwGUhmx_XCA@mail.gmail.com>
In-Reply-To: <CAEUhbmVQZpT1bXkmV==rXqaq5u+oqPd4fT5LROUCwGUhmx_XCA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 16 Mar 2021 09:39:37 +0800
Message-ID: <CAEUhbmU3Q6pFgdOxzyoKSjAAarfaq9DBsH5JkKgpuM19EYPg+Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: m25p80: Support fast read for SST flashes
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 4:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Mar 6, 2021 at 2:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
> > the address bytes. Note only SPI mode is supported by SST flashes.
> >
> > [1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > ---
> >
> > Changes in v2:
> > - rebase on qemu/master
> >
> >  hw/block/m25p80.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> Ping?

Ping?

