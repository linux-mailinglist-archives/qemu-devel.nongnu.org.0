Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6E45D557
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:21:38 +0100 (CET)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq94a-00060W-U7
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mq92c-0005De-0N
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:19:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mq92Z-0004Ru-Ib
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637824770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ahp98zngdgfwuMEqlaRNu+dLNucZb/CbY2LAAAOplMY=;
 b=BmO+aSoEj3laPAtmMSHJorzMDOoOHC3vi/3G1MoH7XkPeIQQh0Se8KCMwoI2qKOheI93B2
 03Wy7AbjiLyzuc9kV+cNXu8aL6pG3tCfMoMdlcNu2E006Wx0WzRPBJzZqvKck9850yyH75
 wx2rolgVU7P/6CtREIUxBisCaNVy+Kw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53--Qacp3dPNNiW6uHLPTtRdQ-1; Thu, 25 Nov 2021 02:19:29 -0500
X-MC-Unique: -Qacp3dPNNiW6uHLPTtRdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso4430691wma.6
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 23:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ahp98zngdgfwuMEqlaRNu+dLNucZb/CbY2LAAAOplMY=;
 b=Ma4sJ5XghIThsZj9Y/egBG81urMgNGeBHayrf8lqxUOVZIuKhn/p8S2p7bcqicrbq1
 uKr9WO2acJ0MA9ratk1T+qju/Ie1r9UeULNAlbr4jE1uYQw5kuc5OpCBypoErjdIJK+5
 PwPNp3kXfMxtZMy3tEsOsOyvYEdcQFVqVpIQP01/i+TG27Miy/y1Z1Lfz206VYYhDJId
 b2EfejnrmIYD7vF8AvS22w2zw9ljFnJlCPDTqluoZ/llrrLvDcH8p0/4U4Y62DvuJ98V
 AgYZZeWiziv2JDjdTjqi6GeXUrPlpwuvoLfb7Uta/s61hElZpoOUVZwI6bWuvjcx70Kj
 Iz6Q==
X-Gm-Message-State: AOAM530llbU3ZJqf4QhUE/C3c8BATIzIJBgk44SanVFKpaCSWkzfTdq2
 5OQ8168shzbVku7QM1DRdSB561CkUMv9ohxHPDrpM1dbAavsQS6OH5Q1yKOdo96dtytB9K/Ma7h
 sMo5xmbJOA5N1V5E=
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr4175787wrw.621.1637824768055; 
 Wed, 24 Nov 2021 23:19:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx30R776NB9B+KfHtrtjiuD7nRzTgY32tBZlgGercV8UaYhuUXPvfoXRlmV/jc1AtIHcp4XFQ==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr4175766wrw.621.1637824767862; 
 Wed, 24 Nov 2021 23:19:27 -0800 (PST)
Received: from redhat.com ([45.15.18.67])
 by smtp.gmail.com with ESMTPSA id z5sm9135804wmp.26.2021.11.24.23.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:19:27 -0800 (PST)
Date: Thu, 25 Nov 2021 02:19:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
Message-ID: <20211125021619-mutt-send-email-mst@kernel.org>
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <20210811085842.2511545-2-jean-philippe@linaro.org>
 <87tug0pv3a.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tug0pv3a.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 08:12:25AM +0100, Markus Armbruster wrote:
> Michael & Marcel, this patch fixes a bug that became a regression when
> the fix missed 6.1.  It's been stuck on the list since August.  Please
> have a look, and if it's good, get it merged.


Thanks for the reminder. Jean-Philippe, Cc maintainers
will help patches get merged in a timely manner in the future.

>  I just asked the arm/virt
> maintainer to do the same for PATCH 1.

Some questions below.

> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
> 
> > Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> > parameter definitions cannot use underscores, because keyval_dashify()
> > transforms them to dashes and the parser doesn't find the parameter.
> >
> > This affects option default_bus_bypass_iommu which was introduced in the
> > same release:
> >
> > $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> > qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found

I don't see this behaviour. What did I miss?


> > Rename the parameter to "default-bus-bypass-iommu". Passing
> > "default_bus_bypass_iommu" is still valid since the underscore are
> > transformed automatically.
> >
> > Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/i386/pc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index fb24f000e7..ce4756ad59 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1779,7 +1779,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
> >      object_class_property_add_bool(oc, "hpet",
> >          pc_machine_get_hpet, pc_machine_set_hpet);
> >  
> > -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> > +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
> >          pc_machine_get_default_bus_bypass_iommu,
> >          pc_machine_set_default_bus_bypass_iommu);
> 
> 
> 


