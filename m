Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7488443DEE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:00:06 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBBl-0003IV-A9
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miBAD-0002YM-V7
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1miBA9-0001eI-TI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635926304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KKgFV1zv7Or/yCO4EpujhaVStPk/XbM96j6iW7BAXF8=;
 b=XFKOoQ6AI7EkrixgN5Wl1zY+b1p904WCwGKXkPbUoKAnbnBz5MoqBuqJSo5O/DQqalUP5t
 SgAsZ4PjhOBtZcsJsNqmr4fAD+RY7OxzLrqsJhTwLeRrmvf0lWPSz9X9P/Cbu8G3tMQl5c
 L59BMhJlinG/646QULZpXa7dRzo4vDY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-xPwkt-qqOz-UKyBLBHs-yw-1; Wed, 03 Nov 2021 03:58:22 -0400
X-MC-Unique: xPwkt-qqOz-UKyBLBHs-yw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so694869wmc.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 00:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KKgFV1zv7Or/yCO4EpujhaVStPk/XbM96j6iW7BAXF8=;
 b=7NAYB8lvt0ojmdLgtTEkjZkmWaZ80gYf0wopS6tgCGRN/WEV+pPyCO+c7WgtPqjNdh
 zUTxr9s8hgyN1CcY8RZqgNf9FBaqauSn1ptA+fo1SIwgyc5cKmJXoClGLRbmzKnFsyjr
 zNdlvA5kYzw0StGSigRolhc0WGxRSaou7Lg81DQZ4YYAOtC7ZbKip4/f04KtkiWbbHnr
 UmXY7AEJmkCzFyWH5k4ALOYrytj13Q9lKZshdZxvJilEHialWuG4/7fq5qS1WTROYxtu
 fywI7hPDqCBvzEv2KcQ2YLKETW5fkfnqyKYMj30Ni4QmcTYSHnLyXOe6L267AO4D3ncX
 eBIQ==
X-Gm-Message-State: AOAM533GfJZ4X2Bwdy4SpBgw+isAbc1Q83MFSfb+2z5kJAANyWsMmQrB
 QvrkDXVM/mDPGDFAnoy0W1GhnE7hoC7HZdxzJR8KQGMGegbuba8tg6lQt/d5+TvybTwM7r3V6hw
 NeSy0U9nRkODpM9c=
X-Received: by 2002:a5d:5385:: with SMTP id d5mr37128873wrv.132.1635926301570; 
 Wed, 03 Nov 2021 00:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyRClQ7erCvdzinrDe7BFlGtRJf4YqtQK6481/gzZyS3JMx+Qq+2hQm+11Ckkg7ciNFdKZvA==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr37128856wrv.132.1635926301367; 
 Wed, 03 Nov 2021 00:58:21 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id u14sm1203735wrt.49.2021.11.03.00.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 00:58:18 -0700 (PDT)
Date: Wed, 3 Nov 2021 03:58:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211103035804-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <20211101182532-mutt-send-email-mst@kernel.org>
 <61e4899c-82ad-fada-9f99-ab30cc03501c@dupond.be>
MIME-Version: 1.0
In-Reply-To: <61e4899c-82ad-fada-9f99-ab30cc03501c@dupond.be>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 08:51:42AM +0100, Jean-Louis Dupond wrote:
> On 1/11/2021 23:26, Michael S. Tsirkin wrote:
> > On Tue, Oct 12, 2021 at 10:24:28AM +0200, Jean-Louis Dupond wrote:
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
> > 
> > Jean-Louis, any chance you are going to address the comments
> > and post a new patch?
> > 
> Should'nt we just apply the patch from Eduardo?
> As this is a more elegant solution with the same result.

don't see it in queue. Repost?

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
> > > -- 
> > > 2.33.0
> > > 
> > > 
> > > 


