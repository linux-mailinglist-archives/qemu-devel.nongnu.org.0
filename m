Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808D429E40
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:03:30 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBov-0001If-88
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maBn3-0000R6-Ar
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maBn1-0002iW-Id
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634022090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=915TpsrsmVYezSUkvJDaanmSGnPLJLB5c5vRPw7yvq8=;
 b=YWCDmVKIXPXRgIZ5ws49aZPy+Hp86niDPiuSnQfi34MqicSknTeZ7v/LoaJmGvcWoGdzu5
 PwS7PbbEKlniyF9R5U5i8pBdQ/BOFDh/y9CL7WnF9jVaSzK24aZbDbn1OJJzjdkeXYl7co
 HKONFo0rRTov8J5memk81HkBh49E3VI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-X65VVV0OM9-0h4ppZOC_KQ-1; Tue, 12 Oct 2021 03:01:29 -0400
X-MC-Unique: X65VVV0OM9-0h4ppZOC_KQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso18005922edt.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=915TpsrsmVYezSUkvJDaanmSGnPLJLB5c5vRPw7yvq8=;
 b=lKaWMPOz8KEC6OgcUEajDYvqydOwOJOF7v3cquYM+sEMmCSHcpp6iBsTbSAsqrt0Mp
 H2njqSHmhIe9jA+5MyA5XgY/CbVARe3S5yeOFA4pgPOlXIMifq8ksU4eaqfl9y59qlm6
 jEH3TgiDgajhNY8x16/wUD+YkxdvpErLwdoOsX6z6u3hdsKLlePucE1+iSHvkz1DzeSf
 lvihghTvRg405T+S8ItOX0bwtFcfNRKwKJv/PpRDrOV224ZqXbMfukUhJay6Tad26f2d
 5ho0zUGvZqAM6iAU4A1isTJWzyudAeufqrvBjFo40U/Sp/LZU8U2yWRvH0+eZaC5ipg8
 ts/A==
X-Gm-Message-State: AOAM531iUl2HvxSRyJYxi+wGAYQ6P9MeOSOtNEaUW/3oMx5ivQypGZFS
 QxtGN1GHQvB7aQ0YjV1Vk3TaHBAv12bKsNfg09KFAHP9cagMqJRX94zlyh1N9mubJZMSrHgzAKq
 aEn4USLY9QPEfv1M=
X-Received: by 2002:a05:6402:274c:: with SMTP id
 z12mr49563975edd.57.1634022088138; 
 Tue, 12 Oct 2021 00:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCIitHjk32+slwt998dVaicOUx1+DfeNVD9HB0Lrho6pUHNVz+b6KtoM+n7X6eJe12oohafw==
X-Received: by 2002:a05:6402:274c:: with SMTP id
 z12mr49563894edd.57.1634022087534; 
 Tue, 12 Oct 2021 00:01:27 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id w6sm1103518edt.12.2021.10.12.00.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 00:01:26 -0700 (PDT)
Date: Tue, 12 Oct 2021 03:01:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 6/6] pcie: expire pending delete
Message-ID: <20211012025611-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-7-kraxel@redhat.com>
 <20211011084310-mutt-send-email-mst@kernel.org>
 <20211012053034.faskn5y6b2hbbfys@sirius.home.kraxel.org>
 <20211012014515-mutt-send-email-mst@kernel.org>
 <20211012064445.ur4ihnuaftzn76wc@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211012064445.ur4ihnuaftzn76wc@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 08:44:45AM +0200, Gerd Hoffmann wrote:
> On Tue, Oct 12, 2021 at 01:46:35AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 12, 2021 at 07:30:34AM +0200, Gerd Hoffmann wrote:
> > > > > index f3ac04399969..477c8776aa27 100644
> > > > > --- a/hw/pci/pcie.c
> > > > > +++ b/hw/pci/pcie.c
> > > > > @@ -549,6 +549,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > > >      }
> > > > >  
> > > > >      dev->pending_deleted_event = true;
> > > > > +    dev->pending_deleted_expires_ms =
> > > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> > > > >  
> > > > >      /* In case user cancel the operation of multi-function hot-add,
> > > > >       * remove the function that is unexposed to guest individually,
> > > > 
> > > > 
> > > > Well this will be barely enough, right?
> > > > 
> > > > 	Once the Power
> > > > 	Indicator begins blinking, a 5-second abort interval exists during which a second depression of the
> > > > 	Attention Button cancels the operation.
> > > 
> > > Well, canceling the hot-plug is not supported in qemu right now (there
> > > is no qmp command for that).  I'm also not sure it makes sense in the
> > > first place for virtual machines.
> > 
> > Yes. However if you resend an attention button press within the
> > 5 second window, guest will think you cancelled hot-plug
> > and act accordingly.
> > It's a fundamentally racy algorithm :(
> 
> That's why re-sending an attention button press is blocked
> for 5 seconds.
> It's also blocked in case the guest blinks the power
> indicator (see patch #3).
> 
> Both together work well in my testing, I can flood a (linux) guest
> with device_del commands without bad side effects:
> 
> First device_del command sends attention button press.
> Then device_del is rejected because the 5 secs are not over yet.
> Then device_del is rejected because the indicator blinks.

Ah, I see. 5 secs is a lot so yea, most likely it's gonnu
be ok, worst case we'll wait another 5 seconds and
send again, right?

Worth checking with windows guests BTW, we saw lots of
races with these too.


> Then unplug completes (and qemu sends event).
> Then device_del fails because the device doesn't exist any more.
> 
> take care,
>   Gerd


