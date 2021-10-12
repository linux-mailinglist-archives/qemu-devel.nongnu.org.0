Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DAA429D59
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:48:47 +0200 (CEST)
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAeb-0006xA-VS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maAci-00065d-NM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maAcf-0002ub-D0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634017602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3EaoEMrMXxra4tS8r1rDEHAvdiDDhbH4+K13J/dnk3k=;
 b=A72Ngjq/AtBy5CzhfSxpRW5/lIqiHM8BLBF6TiVDDJevI2K/JUULWEsUVmR7wne8HEhJJI
 /VQxryJR+3LSNMMYmKnbodeBFS9YFbN/z5PO6TFKhiB/SKyCYkACWBr5xXBjPztgazODz8
 emmchNm+pVPXW3en+i7jCqqt4ZjIh+s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-d-sAfHXbOlCQ6FjbnYh-zA-1; Tue, 12 Oct 2021 01:46:41 -0400
X-MC-Unique: d-sAfHXbOlCQ6FjbnYh-zA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso17825156edj.20
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 22:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3EaoEMrMXxra4tS8r1rDEHAvdiDDhbH4+K13J/dnk3k=;
 b=MaHh5MPCGld4SZ9NlaM2nXG5U+D140fhsvNSTW0dV5iUELzQsMxLMqQ/QjQACr+Fdl
 GPvUH+NVPoWQq7zTWE5hRcuvN5RHIP2FS5aIBTmdzbr1jQUixyZAgI8kedmVsy7+VKm0
 p5A+C1Qzjm1dQh/FKJRvmdvieUa2XkBfOzaobwgRwB47hlycNC/VgdixrtAc3Cefxs+5
 BfCNcqDn3/ne3P9cGKa+BIl092XeoDgNxd/zu9DwYmj3QrUwW2+kSrPSgTYZ8AlHyG6c
 16N3iE0BCP/uwIsNxXCfq8fApwB7Vi+ZiuBVIWjumyaZpj1OhAaikddOnmUWreNMP0+6
 t62Q==
X-Gm-Message-State: AOAM5320tpQBuR36Wn6XkeFrfiMQkhbjdZT9uILChtHDdVt4bfclltC8
 VvYyWCpPCNDPPEj44b3C4edkhSyeFhMAHgrSa0Ws4FS9RxNdfEDnNRyPo9wg9lfKZUX1n+mJ0xQ
 Y20cc4um86etoRCg=
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr48324070edq.87.1634017600063; 
 Mon, 11 Oct 2021 22:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxehnoIq3hwBkFeMqEF+LWhFitMMG6jND2nWAzukeT6HCfANUzr7PML78mJ13tErZvIXyF9+A==
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr48324055edq.87.1634017599840; 
 Mon, 11 Oct 2021 22:46:39 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id v6sm5705925edc.52.2021.10.11.22.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:46:39 -0700 (PDT)
Date: Tue, 12 Oct 2021 01:46:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 6/6] pcie: expire pending delete
Message-ID: <20211012014515-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-7-kraxel@redhat.com>
 <20211011084310-mutt-send-email-mst@kernel.org>
 <20211012053034.faskn5y6b2hbbfys@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211012053034.faskn5y6b2hbbfys@sirius.home.kraxel.org>
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

On Tue, Oct 12, 2021 at 07:30:34AM +0200, Gerd Hoffmann wrote:
> > > index f3ac04399969..477c8776aa27 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -549,6 +549,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >      }
> > >  
> > >      dev->pending_deleted_event = true;
> > > +    dev->pending_deleted_expires_ms =
> > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> > >  
> > >      /* In case user cancel the operation of multi-function hot-add,
> > >       * remove the function that is unexposed to guest individually,
> > 
> > 
> > Well this will be barely enough, right?
> > 
> > 	Once the Power
> > 	Indicator begins blinking, a 5-second abort interval exists during which a second depression of the
> > 	Attention Button cancels the operation.
> 
> Well, canceling the hot-plug is not supported in qemu right now (there
> is no qmp command for that).  I'm also not sure it makes sense in the
> first place for virtual machines.

Yes. However if you resend an attention button press within the
5 second window, guest will think you cancelled hot-plug
and act accordingly.
It's a fundamentally racy algorithm :(


> > So I guess it needs to be more. Problem is of course if guest is
> > busy because of interrupts and whatnot, it might not get to
> > handling that in time ...
> 
> See patch #3, that one should take care of a busy guest ...
> 
> take care,
>   Gerd


