Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFB39271C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 08:08:23 +0200 (CEST)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm9Bu-0004EM-9g
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 02:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lm9Ay-0003Xy-3Q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:07:24 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lm9Au-0005DB-Gg
 for qemu-devel@nongnu.org; Thu, 27 May 2021 02:07:23 -0400
Received: by mail-yb1-xb30.google.com with SMTP id e10so3936811ybb.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 23:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//lXY9LfCa0QBDPk6sQtzGYfxb7zjmdpirvBwO+OpAA=;
 b=WBtuS4Axd67ASNVcwlTRLsWDQ1GfvzpS6az/7b9RRv93anEjv2ssTPf/Y9RIo0SCgy
 iiK1IPWr3vh5/8F4eI5KiLTJYASbP4aWplCB8vo6j4/DyBmk9Cy4KJjim9bO8Ar4QCBd
 BpYq8bEqZ+UU/b7L54OZ7jlh1J4MEInJcdPJXDRowCs8QcNP3gjKlNME34MlsPEL3p9q
 PAB3d1nEmRedJ0BB5MJKDtgnFvGM9as7NNhFVFwnjPWAvCWTZR1sT9FIumCVViqIAAOy
 nbx9hsZv1sd2fz5jkI0MfaHBDe9QRm2FfGbDM+8+wB9ZfFXX1cyefTPEcje9DSyhI0RU
 3Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//lXY9LfCa0QBDPk6sQtzGYfxb7zjmdpirvBwO+OpAA=;
 b=I8t4cRP4H1Zdl9+0rxMv0ps3b/Dl5GiW/nTq8qL4JmVN+1LJSRGCFhaA30EZlViEHq
 UJLfQLVv3U+Jzy1S2asFP1Azr6heHeekFXFdG5cJNSoDwGOcUpx6zI5JbzV48jsxmjYL
 lNSG7vgIhdkScupCr1xibjNTlZ+gZZUImKJMaJgppdmBhtYzSsGY6VkdmF+Pnv6wzxBs
 eovoEJmor2eqUXkbveJDQl9KENrjWnOZvXry0BlRaQJ9un80wfP9lvIF827tFmuv4ulV
 JB9JqI95OvotqYAwcn6XR8yW/oHUOHip0DwIubWiL9aO+RFsI1fdTxciF7MSDxEir8Of
 L08A==
X-Gm-Message-State: AOAM530MxfiD0W8ds7Ep0jVA1QrHa/FXMKr8zUMYqsUUmL8HxOO/6dZP
 gvFPvyX8NOQiEL9RZZ+QwCUIQAKvd++8C5kROjI=
X-Google-Smtp-Source: ABdhPJyX/Pgvyk64hcip7RENff8dn2wOQpYKL//8OZQrZnhxL9Dxn3MxA+YUoB9cZBI1pzIcsx6A8a9xeReGuw6a2Bg=
X-Received: by 2002:a25:be09:: with SMTP id h9mr2601264ybk.239.1622095637707; 
 Wed, 26 May 2021 23:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
In-Reply-To: <20210521024224.2277634-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 27 May 2021 14:06:18 +0800
Message-ID: <CAEUhbmVBoy=sWVTdoTXrv=97uLP=4BRO4n1=TcsqjmSRh6yQBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only
 when told to
To: Gerd Hoffmann <kraxel@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 10:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Ruimei Yan <ruimei.yan@windriver.com>
>
> At present MSI / MSI-X interrupts are triggered regardless of the
> irq level. We should have checked the level to determine whether
> the interrupt needs to be delivered.
>
> The level check logic was present in early versions of the xhci
> model, but got dropped later by a rework of interrupt handling
> under commit 4c4abe7cc903 ("xhci: rework interrupt handling").
>
> Fixes: 4c4abe7cc903 ("xhci: rework interrupt handling")
> Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/usb/hcd-xhci-pci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Ping?

