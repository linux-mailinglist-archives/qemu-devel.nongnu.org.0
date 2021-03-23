Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C608334613C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:18:17 +0100 (CET)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhrH-0004Lz-Km
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOhnP-0000vw-Dk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOhnM-000860-D5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616508847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKHl3BYkihWj6Z11AatLzVLcv7PoXVNc+NDp5FzqbNs=;
 b=dANtUc2bHBe8JlQlu8fglS5l8klzRcDKFrAXMfy3LkDUBcONm4BeKAd2xb3isWcQXCoUKC
 f9L2FvhRedfIjD6I5ibpTJyZ7AzGPFqSDUzoXNA8d6Fr6YuiYu9SdK4iFhm68a4XA0Maft
 K6bcS9orT4OeWB6cj3JYCRu5voCuSKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-QR60VSNINIm2TPgxz-y41A-1; Tue, 23 Mar 2021 10:14:03 -0400
X-MC-Unique: QR60VSNINIm2TPgxz-y41A-1
Received: by mail-wr1-f72.google.com with SMTP id z17so1156806wrv.23
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MKHl3BYkihWj6Z11AatLzVLcv7PoXVNc+NDp5FzqbNs=;
 b=VFbiGdGg5rcxoaplnNlMPPjJGVWIrSdOiK5/RTtIw19L+mgDag/TKiKJqIqNnd9ORZ
 zuuzDMP+vi2w1tBvfU09W063oT1yMhZSA3a0OYUib+9TEdyji0ysmkBx4VTq5jYQUiSW
 0FCyi+QfRzxemQ64BxdD0NleGdeDaL6yiS7p3KpcZmHmjTJS3Sr75lMsZ8TWY6Z7EpS4
 6sreSNSDctNDMNNXpjDPSXQi2IrvJAmb2WzTc9o0+2Uct1JebcYGty5RwN2l1CtqVBBY
 GtRwFGTkHKymG9tKeUMHz1Ck8udr5691wVe7acNUUVe0DEBr9+pkJCvgyGfZahwl0l7B
 Rk6g==
X-Gm-Message-State: AOAM530HQ+pMF8kdwKK89XZ6l9p4yFPoxjUkTnsLoZPSxgpJ79R3hV29
 vsciZoG5/srfOUsfq/X5zAxQw/FgyVl3XWxWsm3E6m6t/qrVxwmHHxPduwNdJeSvFa4GtHIG69r
 1sr+bLBLVhHFBQ/M=
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr4307326wrs.94.1616508842096;
 Tue, 23 Mar 2021 07:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh31xDhVCwICir08Vj8MupnZUKFan28gkL/1vlfoFTpGVGYnVDGsRdKQsq8ZuJLLVKTTWFtw==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr4307318wrs.94.1616508841965;
 Tue, 23 Mar 2021 07:14:01 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id x11sm3035693wme.9.2021.03.23.07.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:14:01 -0700 (PDT)
Date: Tue, 23 Mar 2021 10:13:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
Message-ID: <20210323101325-mutt-send-email-mst@kernel.org>
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
 <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
 <20210322185502-mutt-send-email-mst@kernel.org>
 <CAFEAcA-Kzt+y8r-6sms6Q6N3GHuDhpfc3cWL0gDoSej3bP5z-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Kzt+y8r-6sms6Q6N3GHuDhpfc3cWL0gDoSej3bP5z-A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 10:50:05AM +0000, Peter Maydell wrote:
> On Mon, 22 Mar 2021 at 22:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Mon, Mar 22, 2021 at 06:46:06PM +0000, Peter Maydell wrote:
> > > This happens because pm_update_sci() calls pci_irq_handler(),
> > > which calls pci_intx(pci_dev), which returns -1, which is not
> > > a valid interrupt number to call pci_irq_handler() with.
> > >
> > > Q: given that pci_irq_handler() says it must only be called with
> > > an irqnum in [0..3], shouldn't pci_set_irq() be a bit more
> > > cautious than to pull a byte directly out of PCI_INTERRUPT_PIN
> > > and assume it's valid? (Is this guest-writable, or is it read-only?)
> >
> > It's read-only.
> 
> Ah, so if a device model (a) doesn't set the value to a correct
> interrupt number and then (b) triggers an interrupt for itself,
> then that's a device model bug ? It might be worth assert()ing
> that the irqnum is valid, just to catch this kind of bug a bit
> more obviously.
> 
> thanks
> -- PMM

Sure, we can do this. Patch?

-- 
MST


