Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED0476EE3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:29:29 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxo0u-0003BW-AX
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxnzT-0001ad-Sy
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxnzS-0005i3-A7
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639650477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R3aSI+idnPiRDB0rnCAwylEE2obUKhipc8eJmYl99xs=;
 b=JVISKLD482pvLRhHQcddPqEawvk0EGvE3asTD0n08+sh/mLB4SADQkqNEcCbYZfNFlJ6ix
 nKwcPE9+PwyJY6+XP7gpVoX4Grl4CCFOhuMg7973z8P6xvIAbQa5oiwRkyK3Ba2iahl3zz
 dyKARKdY6YoMMvnWzQODJs8E76LDU/8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-ymOso4ABPzmP-WKcXUdnQA-1; Thu, 16 Dec 2021 05:27:56 -0500
X-MC-Unique: ymOso4ABPzmP-WKcXUdnQA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y9-20020aa7c249000000b003e7bf7a1579so22835095edo.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 02:27:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R3aSI+idnPiRDB0rnCAwylEE2obUKhipc8eJmYl99xs=;
 b=uN5mIoE0SIAOnB2euuCr0UCRjwZavUeDIO3MLbPhD/AuvdiWxz6vZzDo4YFqaYL9ib
 /zdNC8mvAIzccq5KCf7dvwBHvmJedXjLaLBdfAm4rPx/hpxTWi7fWuiieuqFwkJtXMpf
 QmCL47RDDFErU1C5xEky7/7LTwZSA906GUTxQ4EaqevwVGCmA4Q+qXRkeFHnI1SRDa3l
 xfCfzeSYtO4y6QNC3SB4vAZGB5K892VMsr4LdsKfzLH4h1LsZaxrUDw7CHoCr4WAu6Ds
 Pq9AAIkBc1T/QedVR/4/Yh/k1Sr0K06zWH9bIUt/QO5IVmUw/9bEbFI308kwFr0384Dw
 44DA==
X-Gm-Message-State: AOAM532ZiAfflRoGzl/l3pqENiYGZ+Cex6wZOzU6fN7bAbqxk2X9DbUn
 HjAQNvlP6ovAuLWwCDdImuGBj3AmgQQTuWC0T7z5/1eJ0Xy4klMDJCtVdOHYwbr9PVZuQV23bSf
 l8q+fq3OzqLIo+8w=
X-Received: by 2002:a05:6402:455:: with SMTP id
 p21mr19243907edw.384.1639650475065; 
 Thu, 16 Dec 2021 02:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5hlFiPrLbUavGmhSQvLCFd/gbARRRveRGJwAOlyyScmZyA51ht9iE3umGFmGjB+Orkl9F6w==
X-Received: by 2002:a05:6402:455:: with SMTP id
 p21mr19243890edw.384.1639650474811; 
 Thu, 16 Dec 2021 02:27:54 -0800 (PST)
Received: from redhat.com ([2.55.22.18])
 by smtp.gmail.com with ESMTPSA id h7sm2324495ede.40.2021.12.16.02.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 02:27:53 -0800 (PST)
Date: Thu, 16 Dec 2021 05:27:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20211216052734-mutt-send-email-mst@kernel.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <20211108083200-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211108083200-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On Mon, Nov 08, 2021 at 08:33:01AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 08, 2021 at 02:05:42PM +0100, BALATON Zoltan wrote:
> > When using ACPI on big endian machine (such as ppc/pegasos2 which has
> > a VT8231 south bridge with ACPI) writes to ACPI registers come out
> > byte swapped. This may be caused by a bug in memory subsystem but
> > until that is fixed setting the ACPI memory regions to native endian
> > makes it usable for big endian machines. This fixes ACPI shutdown with
> > pegasos2 when using the board firmware for now.
> > This could be reverted when the memory layer is fixed.
> > 
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> 
> Paolo, could you weight in on whether we can fix it properly
> in the memory core? I suspect it's not a good idea to switch
> to native without adding a bunch of byteswaps all
> over the place ...
> 
> > ---
> >  hw/acpi/core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> > index 1e004d0078..543e4a7875 100644
> > --- a/hw/acpi/core.c
> > +++ b/hw/acpi/core.c
> > @@ -461,7 +461,7 @@ static const MemoryRegionOps acpi_pm_evt_ops = {
> >      .impl.min_access_size = 2,
> >      .valid.min_access_size = 1,
> >      .valid.max_access_size = 2,
> > -    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> >  };
> >  
> >  void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> > @@ -531,7 +531,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops = {
> >      .impl.min_access_size = 4,
> >      .valid.min_access_size = 1,
> >      .valid.max_access_size = 4,
> > -    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> >  };
> >  
> >  void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> > @@ -608,7 +608,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
> >      .impl.min_access_size = 2,
> >      .valid.min_access_size = 1,
> >      .valid.max_access_size = 2,
> > -    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> >  };
> >  
> >  void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> > -- 
> > 2.30.2


