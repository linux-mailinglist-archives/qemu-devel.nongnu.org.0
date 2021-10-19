Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE37433448
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:03:28 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmtz-0002nE-S2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmpz-0007z0-It
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcmpx-0007iX-Mf
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634641157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KOsP7DuiZQNpdyts6MpTYzDdZ+be9mM1xlvzXACJ74Q=;
 b=MfhEtAUtS8+lunC2IJStZhReqhiTmuvhyrXuCXeTYYipOAY4VOhZyrV9Dr+8YhWqR5vdZx
 DvQlDz8UvsYY4Hju4lNq1WsjH1IuPmLI/tPPfjR5wmWecP3e0SAi4xYgCyrkCByTZ1He1f
 CEMSDxedJyaFCVCC2d8anxPorOCiYTI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-TsbXTiI9MO2KZEkpdW4x3g-1; Tue, 19 Oct 2021 06:59:15 -0400
X-MC-Unique: TsbXTiI9MO2KZEkpdW4x3g-1
Received: by mail-wm1-f71.google.com with SMTP id
 n9-20020a1c7209000000b0030da7d466b8so1009744wmc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KOsP7DuiZQNpdyts6MpTYzDdZ+be9mM1xlvzXACJ74Q=;
 b=7NbvBnSUBN11doCLr1syF9qf44ZOOFr6zY30Y8QjeLlrOCTdujqEojBxgKIczTHEZv
 gsvBSDx1ZzQ67NRr46E/FpDSa4BAuM9dtpqbEv1pNpTUhqJS6NWVw4IkOklYeicNtVTY
 OOIuHLWgiLkhoGRC2RfX25xXlAqxFKL7b3Izh/nOIavKwaNNP6rz+XwNYHfgrAv7sNUg
 eIcPgrE66PkbgCvigoqKy0dMl4me/Vxtn3Zmpj883HhUF7LTKVqVjRwsjCKW8nJgApXy
 G0N6qwLyvQjTKZxYd/4u4DFKXRqbM25caMFgfWxHiQX0gD6hwPGYZS7f9NCZpTRaxIAY
 bJQA==
X-Gm-Message-State: AOAM532MQRDMAD5PSw6vUx18L7v5vVv89AsgoW7iMdD3H27V4r+ayglC
 dKC+miSfcj9OSK1EYZi3z4qpfXA4FJKUByIDWJ6i7A4p3DYf9BFABzhRaEvXnpAjXAJn2d4MEWb
 LWPdK6QMVgBzPsZg=
X-Received: by 2002:adf:a390:: with SMTP id l16mr42667847wrb.104.1634641154768; 
 Tue, 19 Oct 2021 03:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJZL5+AZS/uCVQ7TDRoVdjr0JdobieEqZIMyFYEs2dX0UEeJa7LpaFYNxXh16G0eW5yKDo/g==
X-Received: by 2002:adf:a390:: with SMTP id l16mr42667816wrb.104.1634641154513; 
 Tue, 19 Oct 2021 03:59:14 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id j11sm1875368wmi.24.2021.10.19.03.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:59:14 -0700 (PDT)
Date: Tue, 19 Oct 2021 06:59:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211019065850-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
 <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
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
Cc: berrange@redhat.com, ehabkost@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, Jean-Louis Dupond <jean-louis@dupond.be>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:46:17AM +0100, Stefan Hajnoczi wrote:
> On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> > Forgot to CC maintainers.
> 
> Also CCing Jason Wang and Michael Tsirkin for VIRTIO.
> 
> Stefan

OMG
where all compat properties broken all the time?


> > 
> > On 12/10/2021 10:24, Jean-Louis Dupond wrote:
> > > hw_compat modes only take into account their base name.
> > > But if a device is created with (non)-transitional, then the compat
> > > values are not used, causing migrating issues.
> > > 
> > > This commit adds their (non)-transitional entries with the same settings
> > > as the base entry.
> > > 
> > > Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
> > > 
> > > Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> > > ---
> > >   include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 34 insertions(+)
> > > 
> > > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > > index 4ff19c714b..5726825c2d 100644
> > > --- a/include/hw/qdev-core.h
> > > +++ b/include/hw/qdev-core.h
> > > @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
> > >       bool optional;
> > >   } GlobalProperty;
> > > +
> > > +/**
> > > + * Helper to add (non)transitional compat properties
> > > + */
> > > +static inline void
> > > +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
> > > +{
> > > +    GlobalProperty *transitional = g_new0(typeof(*transitional), 1);
> > > +    transitional->driver = g_strdup_printf("%s-transitional", prop->driver);
> > > +    transitional->property = g_strdup(prop->property);
> > > +    transitional->value = g_strdup(prop->value);
> > > +    transitional->used = prop->used;
> > > +    transitional->optional = prop->optional;
> > > +    g_ptr_array_add(arr, (void *)transitional);
> > > +
> > > +    GlobalProperty *non_transitional = g_new0(typeof(*non_transitional), 1);
> > > +    non_transitional->driver = g_strdup_printf("%s-non-transitional", prop->driver);
> > > +    non_transitional->property = g_strdup(prop->property);
> > > +    non_transitional->value = g_strdup(prop->value);
> > > +    non_transitional->used = prop->used;
> > > +    non_transitional->optional = prop->optional;
> > > +    g_ptr_array_add(arr, (void *)non_transitional);
> > > +}
> > > +
> > >   static inline void
> > >   compat_props_add(GPtrArray *arr,
> > >                    GlobalProperty props[], size_t nelem)
> > > @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
> > >       int i;
> > >       for (i = 0; i < nelem; i++) {
> > >           g_ptr_array_add(arr, (void *)&props[i]);
> > > +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-net-pci") ||
> > > +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
> > > +            compat_props_add_transitional(arr, &props[i]);
> > > +        }
> > >       }
> > >   }
> > 



