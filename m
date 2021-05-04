Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0C372B2D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:37:25 +0200 (CEST)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvEq-0001AI-KW
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remy.noel@blade-group.com>)
 id 1ldvBA-0006vT-A5
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:33:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remy.noel@blade-group.com>)
 id 1ldvB6-0002wl-Qj
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:33:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id l14so9455497wrx.5
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blade-group.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A2HThF2Gy8edKnplH+IXm3pNNoR+rlnVSogLENpASCM=;
 b=LOY0zsl3I4VcCWqwX9cDZK0QmcLu0+UB+2Zymsz1kW2CXmtYkCYCccdDj/gUCn6TKW
 naT5Emuk/dTpqqmA0U28hbthPHI/06QC32RRsSnQqRdpmuW2104HE8om6oBRu7E9FgSq
 VKIoY690ydmc4qdx23C7+HHg76eYGe9SJti9rtYNmaKTCcpgpD2wTRmmKyHpk/DuJJdQ
 TFNSCV7CEOZpPenReeqyivdUaiyQ+LTXOXWUuNJOqplfI2DGoKDZ/XR3aHwC4g5RXkC2
 HwfS9SpEq2X+aoEPOi8CyxHVEgtPoucatEJJYp3fCuR4FC8Q5aCbEvjxf9ATX4hWjbZo
 x7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A2HThF2Gy8edKnplH+IXm3pNNoR+rlnVSogLENpASCM=;
 b=lIXmqscnDP9PWfJqNkONqyWBIFPSPVW65lA9k++jr9cUexzM0wp6+7PLyBr0XGmJeR
 sG6o/ZYzc57LotDQlNJhnak2rov+6sRhlTnix/2ek81TkieifKTepNTsPgk9s3aaBLv2
 2y0ZLsWmSNG9vJbzq6u8lrAK2AMqsn4It7A74hHuS1SBMulBkh2rJ4I59IYBOgkT9KDi
 YyrzyWZeFtE2tab4YTYnXMNnVAmBDJtAa53a6loU9F9AoTEiGwJiq5BWs9Z7xoT3jXnr
 /BBPwiUR8lfVEh5Rtn6YKAcdirvj17zMctv8bjCGiSL1+X3uubpwh5xnYHyxqzRgKWTV
 TegQ==
X-Gm-Message-State: AOAM532JpMpslIIEOd9R4PcbnXm9+GDOmemAvswvfE7xCfRKgi9nwTZr
 iHi5TeKrjXNZ5KQg8AhP+Bba1A==
X-Google-Smtp-Source: ABdhPJyXbvooX1EmfjoGTVFcPD1Ffdo2leva7jtlLplnu90KOs52PL3w5T0VgrdTzvF+ktDZ5y+5BA==
X-Received: by 2002:adf:f70e:: with SMTP id r14mr32826178wrp.311.1620135209452; 
 Tue, 04 May 2021 06:33:29 -0700 (PDT)
Received: from gmail.com ([2001:41d0:fc88:4700:250:b6ff:fe1f:8e7])
 by smtp.gmail.com with ESMTPSA id j13sm21772123wrd.81.2021.05.04.06.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:33:28 -0700 (PDT)
Date: Tue, 4 May 2021 15:33:27 +0200
From: Remy Noel <remy.noel@blade-group.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 6/7] usb/xhci: sanity check packet size (CVE-2021-3527)
Message-ID: <20210504133327.wh4ncydrs5jvwhrh@gmail.com>
References: <20210504085317.207369-1-kraxel@redhat.com>
 <20210504085317.207369-7-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210504085317.207369-7-kraxel@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=remy.noel@blade-group.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello

On Tue, May 04, 2021 at 10:53:16AM +0200, Gerd Hoffmann wrote:
>Make sure the usb packet size is within the
>bounds of the endpoint configuration.
>
>Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>Message-Id: <20210503132915.2335822-5-kraxel@redhat.com>
>---
> hw/usb/hcd-xhci.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>index 46212b1e695a..7acfb8137bc9 100644
>--- a/hw/usb/hcd-xhci.c
>+++ b/hw/usb/hcd-xhci.c
>@@ -1568,6 +1568,11 @@ static int xhci_setup_packet(XHCITransfer *xfer)
>         qemu_sglist_destroy(&xfer->sgl);
>         return -1;
>     }
>+    if (xfer->packet.iov.size > ep->max_packet_size) {
>+        usb_packet_unmap(&xfer->packet, &xfer->sgl);
>+        qemu_sglist_destroy(&xfer->sgl);
>+        return -1;
>+    }
>     DPRINTF("xhci: setup packet pid 0x%x addr %d ep %d\n",
>             xfer->packet.pid, ep->dev->addr, ep->nr);
>     return 0;
>--
So im my user's case (using a usb-Display-port adapter) i managed to trigger
this error.
According to him. the his displays works without this patch (but i can see 
him sending usbredir packets of up to 9MB) but breaks without (which is 
expected.)
I have trouble understanding whether this can be considered an illegitimate 
xhci use case (i'm very unfamiliar with it), but i don't see any burst 
working if we drop any buffer chain bigger than a single endpoint packet 
size.

I'm strill struggling to emulate SuperSpeed Bulk transfers from the vm in 
order to have a reproducer though.

By the way, the call to qemu_sglist_destroy seems unnecessary to me since 
usb_packet_unmap calls it already.


Cheers

Remy

