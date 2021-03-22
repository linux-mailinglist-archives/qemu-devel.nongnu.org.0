Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D786E3437EA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:34:36 +0100 (CET)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOCGx-0007wP-4N
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOCFm-0007Qm-4d; Mon, 22 Mar 2021 00:33:22 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lOCFj-0007iM-CS; Mon, 22 Mar 2021 00:33:21 -0400
Received: by mail-yb1-xb30.google.com with SMTP id m132so5178232ybf.2;
 Sun, 21 Mar 2021 21:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f65l8yNDP1ohDUDDxrVnU732IaxQdoQQJFdp7/N5ENw=;
 b=DAw++8uYvLGWD8/rsaHJWo+UOM+b+lRR/egDvI2+LDDNV94c/U4lLg7FtmdDMsScoW
 fVyHevnZ1cSKhniSkmdCaTcouKrsEC1nJNvy0PpJKmU7FTOv9xVw5bFoR/tVR4Ssdk2N
 s6I1G/lu/1QbWA4HqRtMbkJseVjkHEi0RuxrOKnLVojzgoDmv7UAp/YJ15w4ZdbXqfjV
 tf+oRk3vIXbkjwjFqUwaHLklmSsVGfFwDX0bsAQumQK3doQBDYRhTxEzVt6ySUi+6olx
 b+g+aOHORcSey0XYwEryefJ47Nb5UdKL/7hKI+tj6UbA03wZVDpLC6oy7aYROJLv9r1U
 aZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f65l8yNDP1ohDUDDxrVnU732IaxQdoQQJFdp7/N5ENw=;
 b=Q332fy5FWSxZZxZR2yrO1a1CMPNEWDaq1tro1lnchwpT6gQ74KwccCxZeZiawj6bd0
 ZAEiQPpKDDf17dH3L09hBj2oZqeXF5486EUJwa4B99mWcIKLq5ostif/eqnIVomRZHD0
 Belv+L9a3iK8fM4Mb9hr0V3bD0H80CLvdcCzexhd26iqK3NoocisS95eGdo6RXDH8+JL
 hznFBaJoyhyW1rkrdfCwEKr5rYlwumPTWjVRmCsD6JrxYkA3VLxxUyGrISvljLJq0rS6
 HhsoZyj0eh2JE7TO5UZiEKcXIumY8pcEfhBoZ/rmZtrASQwL8eP7f/5bIoo54KLhopLn
 r2CA==
X-Gm-Message-State: AOAM530G8WBheWgjuqIfL0Scv8HXNGYZARq24/oxY3Lj9Gp9LhVer95/
 wDROt1txHAGD3Gjg6Ohxynz3xVmf9CfLRIYp8ns=
X-Google-Smtp-Source: ABdhPJzJtcxtocv2BriZPh8GTTrNaRdkNqLP0F/pLXNJAKjqKaanfA+nmVldVS6c3j+viSJN57fUfS+P53bPaOGf6n8=
X-Received: by 2002:a25:73d1:: with SMTP id
 o200mr23242242ybc.239.1616387597981; 
 Sun, 21 Mar 2021 21:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
 <YFgNZFAKjVhder2R@yekko.fritz.box>
In-Reply-To: <YFgNZFAKjVhder2R@yekko.fritz.box>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 12:33:06 +0800
Message-ID: <CAEUhbmV4=yz1Df9YDxsM1Evjd4dJA2rM8xoiSUvxEtOoL2z2xg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Mon, Mar 22, 2021 at 12:11 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Tue, Mar 16, 2021 at 04:15:05PM +0800, Bin Meng wrote:
> > As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> > min_frame_len should excluce CRC, so it should be 60 instead of 64.
>
> Sorry, your reasoning still isn't clear to me.  If qemu is not adding
> the CRC, what is?

No one is padding CRC in QEMU. QEMU network backends pass payload
without CRC in between.

> Will it always append a CRC after this padding is complete?

No.

Regards,
Bin

